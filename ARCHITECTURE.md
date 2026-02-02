# Architecture Document
**Project:** AI Budget Tracking App  
**Version:** 1.0.0  
**Status:** In Development

## 1. System Overview
This system is a comprehensive financial management platform designed to bridge the gap between high income and low net savings for students and professionals. It utilizes Generative AI (Gemini 3) to analyze spending patterns, visualize data, and suggest investment strategies to turn "Earnings" into "Wealth."

## 2. High-Level Architecture Diagram

```ascii
+---------------------+       +---------------------------+
|   Client Frontend   |       |      Security Layer       |
| (Flutter / Native)  |<----->| Google OAuth2 / Cognito   |
+----------+----------+       +-------------+-------------+
           |                                ^
           | HTTPS / JSON                   | Auth Token
           v                                | Validation
+-------------------------------------------+-------------+
|               AWS API GATEWAY                           |
+----------------------+----------------------------------+
                       |
        +--------------+------------------+
        |                                 |
        v                                 v
+-------+-------+                 +-------+-------+
|  Expense &    |                 |   AI Analysis |
|  Budget Svc   |                 |   Service     |
| (Spring Boot) |                 | (Spring Boot) |
+-------+-------+                 +-------+-------+
        |                             |      ^
        |        +---------+          |      |
        +------->|  Kafka  |<---------+      |
        |        |  (SQS)  |                 |
        |        +----+----+                 v
        |             |            +---------+---------+
        v             v            |  Google Gemini 3  |
+-------+-------+  +--+---+        |  (AI Studio)      |
|    AWS RDS    |  | Notif|        +-------------------+
|  (PostgreSQL) |  | Svc  |
+---------------+  +--+---+
                      |
                      v
               +------+------+
               |  Firebase   |
               |    (FCM)    |
               +-------------+

+---------------------------------------------------------+
|                    External Integrations                |
|                                                         |
|  [Razorpay/Stripe] <--- (Budget Svc)                    |
|  [AngelOne/Zerodha APIs] <--- (Invest Svc)              |
|                                                         |
+---------------------------------------------------------+
```

## 3. Component Breakdown

### 3.1 Client Layer (Frontend)
**Technology:** Flutter (Cross-platform Native).

**Responsibility:**
- User Interface based on Figma designs (Prachi).
- State management for real-time budget updates.
- Local storage for offline capability (synced when online).

### 3.2 API Gateway & Security
- **AWS API Gateway:** Single entry point for all client requests. Handles rate limiting and routing.
- **Auth:** Google OAuth2 exchanged for AWS Cognito tokens.
- **Secrets:** All API keys (Gemini, Razorpay, DB Credentials) are stored in AWS Secrets Manager, injected into containers at runtime.

### 3.3 Microservices (Backend - Spring Boot)
**Expense Service:**
- Handles CRUD for daily expenses.
- Calculates monthly burn rate (e.g., 50,000 / 6 = 8,300).

**Investment Service:**
- Manages Goals (e.g., "Buy a Car").
- Connects with Fintech APIs (AngelOne/Zerodha) to fetch market data.

**AI Analysis Service:**
- Interacts with Google AI Studio (Gemini 3).
- **Input:** JSON of last 30 days of transactions.
- **Output:** Actionable advice (e.g., "You spend 20% on dining out; cut this to 10% to invest ₹5k in Nifty 50").

### 3.4 Data Layer
- **AWS RDS (PostgreSQL):** Stores relational data (Users, Transactions, Wallets, Goals).
- **MongoDB:** Stores unstructured AI conversation history and raw API logs from banks.
- **Redis:** Caches the "User Dashboard" aggregation to reduce DB load.
- **S3:** Stores user uploaded bills/invoices.

### 3.5 Event-Driven Architecture
- **Kafka/SQS:** Decouples heavy processing.
- **Example:** User adds an expense -> Event `EXPENSE_ADDED` published -> AI Service consumes to update "Spending Pattern" -> Notification Service consumes to check if "Budget Exceeded."

## 4. Technology Stack Summary

| Layer | Technology |
| :--- | :--- |
| **Language** | Java 17+ |
| **Framework** | Spring Boot 3.x |
| **AI Engine** | Google Gemini 3 (via AI Studio) |
| **Database** | AWS RDS (Postgres), MongoDB Atlas |
| **Caching** | Redis |
| **Message Broker** | Apache Kafka / AWS SQS |
| **Containerization** | Docker, AWS ECS (Fargate) |
| **CI/CD** | Jenkins / GitHub Actions |
| **Mobile** | Flutter / Dart |

## 5. Deployment Strategy
- **Containerization:** All services are Dockerized.
- **Orchestration:** Deployed on AWS ECS (Fargate) for serverless container management.
- **Pipeline:**
    1. Code Commit (GitHub)
    2. Jenkins Build & Test
    3. Build Docker Image -> Push to ECR
    4. Update ECS Service Task Definition

## 6. Future Scope (Blockchain)
- **Dify Integration:** Potential integration for immutable ledger tracking of high-value asset purchases using private blockchain nodes.

# AI Budget Tracking App

**Version:** 1.0.0  
**Status:** In Development

## Phase 1: Implementation Roadmap
This roadmap breaks the development down into logical sprints to ensure dependencies are met (e.g., Backend before Frontend integration).

### Sprint 1: Foundation & Infrastructure (Weeks 1-2)
**DevOps (Rashil):**
- [ ] Set up AWS VPC, subnets, and Security Groups.
- [ ] Configure RDS (PostgreSQL/MySQL) for transactional data and MongoDB for unstructured logs/AI context.
- [ ] Set up ECR (Elastic Container Registry) for Docker images.
- [ ] Initialize Github repositories with branch protection rules.

**Backend (Rashil):**
- [ ] Initialize Spring Boot microservices skeleton.
- [ ] Configure Spring Security with Google OAuth2/AWS Cognito.
- [ ] Set up Flyway/Liquibase for database migrations.

### Sprint 2: Core Modules - Auth & Expenses (Weeks 3-4)
**Backend:**
- [ ] Implement Module 1 (Expenses): CRUD APIs for Income, Daily Expenses (Food, Travel, etc.).
- [ ] Integrate OCR (using Gemini Vision or Tesseract) to scan bills.
- [ ] Set up Redis for caching frequent requests (e.g., user profile, monthly budget limits).

**Frontend (Anish):**
- [ ] UI/UX (Prachi): Finalize screens for Login, Dashboard, and Add Expense.
- [ ] Implement Google Sign-In and JWT handling.
- [ ] Build the "Add Expense" form and Dashboard UI.

### Sprint 3: AI Integration & Analysis (Weeks 5-6)
**Backend:**
- [ ] Module 2 (Graph/Suggestions): Integrate Google AI Studio (Gemini 3).
- [ ] Prompt Engineering: Create system prompts to analyze JSON expense logs and return text-based advice.
- [ ] Implement Kafka/SQS producers for async analysis (so the user doesn't wait for AI to generate a report).

**Frontend:**
- [ ] Integrate Chart.js or Flutter charts for expense visualization.
- [ ] Build the "AI Advisor" chat interface.

### Sprint 4: Investments & Payments (Weeks 7-8)
**Backend:**
- [ ] Module 3 (Saving + Investing): Logic for "Recurring Revenue" suggestions.
- [ ] Integrate Razorpay/Stripe for subscription payments (if the app has a pro tier) or simulated wallet loading.
- [ ] Integration: Connect stub APIs for AngelOne/Zerodha (Mock response first, then real API keys via Secret Manager).

**Frontend:**
- [ ] Investment Dashboard showing "Projected Savings."
- [ ] Payment Gateway integration.

### Sprint 5: Notifications & Deployment (Weeks 9-10)
**Backend:**
- [ ] Set up Firebase Cloud Messaging (FCM) consumer service (listening to Kafka).
- [ ] Trigger alerts: "Budget Exceeded," "Investment Opportunity."

**DevOps:**
- [ ] Configure ECS (Elastic Container Service) tasks and services.
- [ ] Set up API Gateway routes.
- [ ] Final Production Deployment.

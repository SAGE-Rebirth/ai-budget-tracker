# AI Budget Tracking App

A comprehensive financial management platform designed to bridge the gap between high income and low net savings. This application utilizes Generative AI (Gemini 3) to analyze spending patterns, visualize data, and suggest investment strategies to turn "Earnings" into "Wealth."

## Table of Contents
- [Prerequisites](#prerequisites)
- [Setup & Installation](#setup--installation)
    - [Windows](#windows)
    - [Linux](#linux)
    - [macOS](#macos)
- [Get Started](#get-started)
- [APIs & Ports](#apis--ports)
- [API Utilities](#api-utilities)
- [Contributing](#contributing)

## Prerequisites
Before running the application, ensure you have the following installed:
- **Java Development Kit (JDK) 17+**
- **Docker & Docker Compose** (for containerization and local database setup)
- **Node.js & NPM** (if required for auxiliary scripts)
- **Flutter SDK** (for Client Frontend)
- **Git**

## Setup & Installation

### 1. Clone the Repository
```bash
git clone https://github.com/yourusername/budget-tracker-rashil.git
cd budget-tracker-rashil
```

### 2. Environment Configuration
Create a `.env` file in the root directory (or specific service directories) with necessary credentials.
```properties
# Example .env configuration
DB_USERNAME=postgres
DB_PASSWORD=password
JWT_SECRET=your_jwt_secret
GOOGLE_CLIENT_ID=your_google_id
GEMINI_API_KEY=your_gemini_key
```

### Windows
1. Ensure Docker Desktop is running.
2. Open PowerShell or Command Prompt as Administrator.
3. Verify Java installation: `java -version`
4. Run the setup scripts (if provided) or proceed to 'Get Started'.

### Linux
1. Ensure Docker daemon is active: `sudo systemctl start docker`
2. Verify Java installation: `java -version`
3. Grant execution permissions to build scripts: `chmod +x mvnw` (if using Maven wrapper).

### macOS
1. Ensure Docker Desktop is running.
2. Verify Java installation: `java -version`
3. Ensure you have the necessary permissions for file access.

## Get Started

### Method 1: Docker Compose (Recommended)
To start the entire ecosystem including databases and microservices:
```bash
docker-compose up --build
```

### Method 2: Manual Run
**Backend Services (Spring Boot):**
Navigate to each service directory and run:
```bash
./mvnw spring-boot:run
```

**Frontend (Flutter):**
```bash
cd mobile-app
flutter run
```

## APIs & Ports

| Service Name | Port | Description |
| :--- | :--- | :--- |
| **API Gateway** | `8080` | Entry point for all client requests |
| **Expense Service** | `8081` | CRUD for income and daily expenses |
| **Investment Service** | `8082` | Manages financial goals and market data |
| **AI Analysis Service** | `8083` | Interface with Google Gemini 3 |
| **Service Registry (Eureka)** | `8761` | Microservices discovery (Optional/If used) |
| **PostgreSQL** | `5432` | Relational Data |
| **MongoDB** | `27017` | Unstructured Data/Logs |
| **Redis** | `6379` | Caching |

> **Note:** Ports are configurable via `application.properties` or environment variables.

## API Utilities

### Swagger UI / OpenAPI
Each microservice exposes API documentation via Swagger. Access them locally via:
- **API Gateway:** `http://localhost:8080/swagger-ui.html`
- **Expense Service:** `http://localhost:8081/swagger-ui.html`
- **Investment Service:** `http://localhost:8082/swagger-ui.html`
- **AI Service:** `http://localhost:8083/swagger-ui.html`

### Postman Collection
A Postman collection is available in the `/docs` directory (or link to workspace) for testing API endpoints.

## Contributing
We welcome contributions! Please follow these steps:
1. **Fork** the repository.
2. Create a **Feature Branch** (`git checkout -b feature/AmazingFeature`).
3. **Commit** your changes (`git commit -m 'Add some AmazingFeature'`).
4. **Push** to the branch (`git push origin feature/AmazingFeature`).
5. Open a **Pull Request**.

Please ensure your code follows the project's coding standards and includes relevant tests.

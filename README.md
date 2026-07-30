# 🚀🚀 Employee Management System - End-to-End DevSecOps CI/CD Pipeline on AWS


<p align="center">

![Java](https://img.shields.io/badge/Java-21-orange?style=for-the-badge&logo=openjdk)
![Spring Boot](https://img.shields.io/badge/SpringBoot-4.1-green?style=for-the-badge&logo=springboot)
![Docker](https://img.shields.io/badge/Docker-Containerized-blue?style=for-the-badge&logo=docker)
![Jenkins](https://img.shields.io/badge/Jenkins-CI/CD-red?style=for-the-badge&logo=jenkins)
![AWS](https://img.shields.io/badge/AWS-EC2-orange?style=for-the-badge&logo=amazonaws)
![Prometheus](https://img.shields.io/badge/Prometheus-Monitoring-E6522C?style=for-the-badge&logo=prometheus)
![Grafana](https://img.shields.io/badge/Grafana-Dashboard-F46800?style=for-the-badge&logo=grafana)
![Trivy](https://img.shields.io/badge/Trivy-Security-blue?style=for-the-badge)
![OWASP](https://img.shields.io/badge/OWASP-DependencyCheck-black?style=for-the-badge)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)

</p>

## Architecture

![Banner](https://raw.githubusercontent.com/kshitijshri99/employee-management-devops/main/images/architecture.png)


## 📌 Overview

A production-style DevSecOps implementation of an Employee Management
System built with **Java 21, Spring Boot, Maven, Docker, Jenkins, AWS
EC2, Prometheus, Grafana, OWASP Dependency-Check and Trivy**.

The application exposes a REST API for managing employee records, backed
by an H2 in-memory database via Spring Data JPA, with a simple Thymeleaf
landing page and full observability through Actuator + Prometheus + Grafana.

## ✨ Features

- CRUD REST APIs for employee records (`/api/employees`)
- Server-side validation (Jakarta Bean Validation) on employee input
- Centralized exception handling (`GlobalExceptionHandler`, `ResourceNotFoundException`)
- H2 in-memory database with browser console (`/h2-console`)
- Thymeleaf landing page served at `/`
- Multi-stage Dockerized deployment
- CI/CD with Jenkins
- Security scanning (OWASP Dependency-Check + Trivy filesystem & image scans)
- Monitoring with Spring Boot Actuator
- Metrics collection using Prometheus
- Visualization using Grafana
- Deployment on AWS EC2

## 🏗️ Architecture

```text
Developer
   │
GitHub Repository
   │
Jenkins Pipeline
   │
Maven Build
   │
OWASP Dependency Check + Trivy Filesystem Scan
   │
Docker Image Build
   │
Trivy Docker Image Scan
   │
Docker Deployment
   │
AWS EC2 (Docker Container)
   │
Spring Boot + Actuator
   │
Prometheus
   │
Grafana Dashboard
```

## 🛠️ Tech Stack

| Category    | Technology                                                |
|-------------|------------------------------------------------------------|
| Language    | Java 21                                                     |
| Framework   | Spring Boot 4.1.0 (Web, Data JPA, Validation, Thymeleaf, Actuator) |
| Build       | Maven                                                        |
| Database    | H2 (in-memory)                                              |
| Container   | Docker (multi-stage build)                                  |
| CI/CD       | Jenkins                                                      |
| Security    | OWASP Dependency Check, Trivy                                |
| Monitoring  | Prometheus, Micrometer                                       |
| Visualization | Grafana                                                    |
| Cloud       | AWS EC2                                                      |

## 📂 Repository Structure

```text
employee-management-devops/
├── src/
│   ├── main/
│   │   ├── java/com/devops/employee/
│   │   │   ├── controller/
│   │   │   │   ├── EmployeeController.java   # REST CRUD endpoints
│   │   │   │   └── HomeController.java       # Serves Thymeleaf landing page
│   │   │   ├── entity/
│   │   │   │   └── Employee.java             # JPA entity + validation
│   │   │   ├── exception/
│   │   │   │   ├── GlobalExceptionHandler.java
│   │   │   │   └── ResourceNotFoundException.java
│   │   │   ├── repository/
│   │   │   │   └── EmployeeRepository.java
│   │   │   ├── service/
│   │   │   │   ├── EmployeeService.java
│   │   │   │   └── impl/EmployeeServiceImpl.java
│   │   │   └── EmployeeManagementApplication.java
│   │   └── resources/
│   │       ├── application.properties
│   │       └── templates/index.html
│   └── test/
│       └── java/com/devops/employee/EmployeeManagementApplicationTests.java
├── Dockerfile
├── Jenkinsfile
├── pom.xml
├── README.md
└── images/
```

## 🔌 REST API

Base path: `/api/employees`

| Method | Endpoint              | Description                    |
|--------|------------------------|--------------------------------|
| GET    | `/api/employees`       | List all employees             |
| GET    | `/api/employees/{id}`  | Get a single employee by ID    |
| POST   | `/api/employees`       | Create a new employee          |
| PUT    | `/api/employees/{id}`  | Update an existing employee    |
| DELETE | `/api/employees/{id}`  | Delete an employee              |

**Employee fields:** `firstName`, `lastName`, `email` (unique, validated), `department`, `salary` — all required and validated at the API layer, with errors surfaced through the global exception handler.

# 📸 Project Screenshots

---

## 📂 GitHub Repository

![GitHub Repository](https://raw.githubusercontent.com/kshitijshri99/employee-management-devops/main/images/github-repository.png)

---

## ⚙️ Jenkins CI/CD Pipeline

The `Jenkinsfile` automates the entire DevSecOps workflow with the following stages:

1. **Checkout** — pulls the `main` branch from GitHub
2. **Build Application** — `mvn clean package -DskipTests`
3. **OWASP Dependency Check** — scans dependencies for known CVEs
4. **Trivy Filesystem Scan** — scans the source tree for vulnerabilities
5. **Build Docker Image** — builds the `employee-management:1.0` image
6. **Trivy Docker Image Scan** — scans the built image for vulnerabilities
7. **Deploy Container** — stops any existing container, prunes unused images, and runs the new container on port `8080`
8. **Verify Deployment** — waits for startup and checks the app responds

Scan reports (`trivy-fs-report.txt`, `trivy-image-report.txt`, `dependency-check-report/`) are archived as Jenkins build artifacts on every run, and the workspace is cleaned afterward.

![Jenkins Pipeline](https://raw.githubusercontent.com/kshitijshri99/employee-management-devops/main/images/jenkins-pipeline.png)

---

## 🔒 OWASP Dependency Check

OWASP Dependency Check scans the Maven dependencies for publicly known vulnerabilities (CVEs) before deployment.

![OWASP Report](https://raw.githubusercontent.com/kshitijshri99/employee-management-devops/main/images/owasp-dependency-check.png)

---

## 🛡️ Trivy Security Scan

Trivy performs vulnerability scanning on both the application source code (filesystem scan) and the built Docker image before deployment.

![Trivy Scan](https://raw.githubusercontent.com/kshitijshri99/employee-management-devops/main/images/trivy-scan-report.png)

---

## 🐳 Docker Deployment

The application is built using a **multi-stage Dockerfile**:

- **Stage 1 (builder)** — `maven:3.9.9-eclipse-temurin-21`, downloads dependencies and packages the JAR
- **Stage 2 (runtime)** — `eclipse-temurin:21-jre`, copies only the built JAR and runs it

The image is built and deployed automatically by the Jenkins pipeline, exposing port `8080`.

![Docker](https://raw.githubusercontent.com/kshitijshri99/employee-management-devops/main/images/docker-containers.png)

---

## ☁️ AWS EC2 Deployment

The Docker container is hosted on an AWS EC2 Ubuntu instance.

![EC2](https://raw.githubusercontent.com/kshitijshri99/employee-management-devops/main/images/ec2-instance.png)

---

## 🌐 Employee Management Application

Landing page of the deployed Spring Boot application running on AWS.

![Application](https://raw.githubusercontent.com/kshitijshri99/employee-management-devops/main/images/spring-boot-app.png)

---

## 📊 Prometheus Monitoring

Prometheus continuously scrapes Spring Boot Actuator metrics exposed at `/actuator/prometheus`.

![Prometheus](https://raw.githubusercontent.com/kshitijshri99/employee-management-devops/main/images/promethus-target-page.png)

---

## 📈 Grafana Dashboard

Grafana visualizes JVM metrics, application health, CPU usage, memory utilization, HTTP requests, and other Prometheus metrics.

![Grafana Dashboard](https://raw.githubusercontent.com/kshitijshri99/employee-management-devops/main/images/grafana-dashboard.png)

## 🚀 Running Locally

```bash
git clone <repository>
cd employee-management-devops

# Build and run with Maven
./mvnw clean package
./mvnw spring-boot:run
```

The app starts on **http://localhost:8080**, with the H2 console available at **http://localhost:8080/h2-console** (JDBC URL: `jdbc:h2:mem:employee_db`, user: `sa`, no password).

## 🐳 Running with Docker

```bash
docker build -t employee-management:1.0 .
docker run -d -p 8080:8080 --name employee-management-container employee-management:1.0
```

## 📊 Monitoring

- `/actuator/prometheus` — Prometheus-formatted metrics endpoint
- `/actuator/health` — health checks with full details enabled
- Prometheus scrapes metrics from the actuator endpoint
- Grafana visualizes JVM, HTTP, memory, CPU, and application-level metrics (tagged `application=EmployeeManagement`)

## Project Outcomes

- Automated CI/CD using Jenkins
- Dockerized, multi-stage deployment
- AWS EC2 hosting
- Dependency vulnerability scanning (OWASP)
- Filesystem and container vulnerability scanning (Trivy)
- Monitoring with Prometheus
- Visualization using Grafana

## Skills Demonstrated

Java, Spring Boot, Spring Data JPA, Docker, Jenkins, AWS EC2, Maven, Prometheus, Grafana, OWASP, Trivy, Linux, Git, DevSecOps, CI/CD

## 🔒 Security

- OWASP Dependency Check
- Trivy Filesystem Scan
- Trivy Docker Image Scan

## 👨‍💻 Author

**Kshitij Shrivastava**

- GitHub: https://github.com/kshitijshri99
- LinkedIn: https://linkedin.com/in/kshitij-shrivastava-17551b172/

## 📄 License

This project is licensed under the **MIT License**. See the [LICENSE](LICENSE) file for details.

<div align="center">

### ⭐ If you found this project helpful, please consider giving it a star!

Made with ❤️ by **Kshitij Shrivastava**

</div>

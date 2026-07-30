# 🚀 Employee Management System -- DevSecOps Pipeline

![Banner](https://raw.githubusercontent.com/kshitijshri99/employee-management-devops/main/images/architecture.png)

## 📌 Overview

A production-style DevSecOps implementation of an Employee Management
System built with **Java 21, Spring Boot, Maven, Docker, Jenkins, AWS
EC2, Prometheus, Grafana, OWASP Dependency-Check and Trivy**.

## ✨ Features

-   CRUD REST APIs
-   Dockerized deployment
-   CI/CD with Jenkins
-   Security Scanning (OWASP + Trivy)
-   Monitoring with Spring Boot Actuator
-   Metrics collection using Prometheus
-   Visualization using Grafana
-   Deployment on AWS EC2

## 🏗️ Architecture

``` text
Developer
   │
GitHub Repository
   │
Jenkins Pipeline
   │
Maven Build
   │
OWASP + Trivy
   │
Docker Image
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

  Category     Technology
  ------------ -------------------------------
  Language     Java 21
  Framework    Spring Boot
  Build        Maven
  CI/CD        Jenkins
  Container    Docker
  Security     OWASP Dependency Check, Trivy
  Monitoring   Prometheus, Grafana
  Cloud        AWS EC2

## 📂 Repository Structure

``` text
employee-management-devops/
├── src/
├── Dockerfile
├── Jenkinsfile
├── pom.xml
├── README.md
└── images/
```

# 📸 Project Screenshots

---

## 📂 GitHub Repository

![GitHub Repository](https://raw.githubusercontent.com/kshitijshri99/employee-management-devops/main/images/github-repository.png)

---

## ⚙️ Jenkins CI/CD Pipeline

The Jenkins pipeline automates the entire DevSecOps workflow:

- Source Code Checkout
- Maven Build
- OWASP Dependency Check
- Trivy File System Scan
- Docker Image Build
- Trivy Docker Image Scan
- Docker Deployment
- Deployment Verification

![Jenkins Pipeline](https://raw.githubusercontent.com/kshitijshri99/employee-management-devops/main/images/jenkins-pipeline.png)

---

## 🔒 OWASP Dependency Check

OWASP Dependency Check scans the Maven dependencies for publicly known vulnerabilities (CVEs) before deployment.

![OWASP Report](https://raw.githubusercontent.com/kshitijshri99/employee-management-devops/main/images/owasp-dependency-check.png)

---

## 🛡️ Trivy Security Scan

Trivy performs vulnerability scanning on both the application source code and Docker image before deployment.

![Trivy Scan](https://raw.githubusercontent.com/kshitijshri99/employee-management-devops/main/images/trivy-scan-report.png)

---

## 🐳 Docker Deployment

The application is packaged as a Docker image and deployed automatically by the Jenkins pipeline.

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

Prometheus continuously scrapes Spring Boot Actuator metrics exposed by the application.

![Prometheus](https://raw.githubusercontent.com/kshitijshri99/employee-management-devops/main/images/promethus-target-page.png)

---

## 📈 Grafana Dashboard

Grafana visualizes JVM metrics, application health, CPU usage, memory utilization, HTTP requests, and other Prometheus metrics.

![Grafana Dashboard](https://raw.githubusercontent.com/kshitijshri99/employee-management-devops/main/images/grafana-dashboard.png)

## 🚀 Deployment

``` bash
git clone <repository>
mvn clean package
docker build -t employee-management:1.0 .
docker run -d -p 8080:8080 --name employee-management-container employee-management:1.0
```

## 📊 Monitoring

-   `/actuator/prometheus`
-   Prometheus scrapes metrics
-   Grafana visualizes JVM, HTTP, Memory, CPU and application metrics.

## Project Outcomes

- Automated CI/CD using Jenkins
- Dockerized deployment
- AWS EC2 hosting
- Dependency vulnerability scanning
- Container vulnerability scanning
- Monitoring with Prometheus
- Visualization using Grafana

## Skills Demonstrated

Java
Spring Boot
Docker
Jenkins
AWS EC2
Maven
Prometheus
Grafana
OWASP
Trivy
Linux
Git
DevSecOps
CI/CD

## 🔒 Security

-   OWASP Dependency Check
-   Trivy File System Scan
-   Trivy Docker Image Scan

## 👨‍💻 Author

**Kshitij Shrivastava**

If you found this project useful, consider giving it a ⭐.

# 🚀 Employee Management System -- DevSecOps Pipeline

![Banner](images/banner.png)

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

## 📸 Project Screenshots

### Promethus Target Page

![Promethus Target
Page](employee-management-devops/images/promethus-target-page.png)

### Docker Containers

![Docker
Containers](employee-management-devops/images/docker-containers.png)

### Ec2 Instance

![Ec2 Instance](employee-management-devops/images/ec2-instance.png)

### Spring Boot App

![Spring Boot
App](employee-management-devops/images/spring-boot-app.png)

### Owasp Dependency Check

![Owasp Dependency
Check](employee-management-devops/images/owasp-dependency-check.png)

### Github Repository

![Github
Repository](employee-management-devops/images/github-repository.png)

### Jenkins Pipeline

![Jenkins
Pipeline](employee-management-devops/images/jenkins-pipeline.png)

### Grafana Dashboard

![Grafana
Dashboard](employee-management-devops/images/grafana-dashboard.png)

### Trivy Scan Report

![Trivy Scan
Report](employee-management-devops/images/trivy-scan-report.png)

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

## 🔒 Security

-   OWASP Dependency Check
-   Trivy File System Scan
-   Trivy Docker Image Scan

## 👨‍💻 Author

**Kshitij Shrivastava**

If you found this project useful, consider giving it a ⭐.

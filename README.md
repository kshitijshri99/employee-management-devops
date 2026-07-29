# 🚀 Employee Management DevSecOps Pipeline

## Overview

A production-style DevSecOps project demonstrating Continuous
Integration, Continuous Delivery, security scanning, containerization,
and monitoring on AWS.

## Features

-   Spring Boot Employee Management Application
-   Dockerized deployment
-   Jenkins Declarative Pipeline
-   OWASP Dependency Check
-   Trivy File System & Image Scanning
-   Automated Docker Deployment
-   AWS EC2 Hosting
-   Spring Boot Actuator
-   Prometheus Monitoring
-   Grafana Dashboards

## Architecture

![Architecture](DevSecOps_Architecture.png)

## Tech Stack

  Category     Technology
  ------------ -------------------------------
  Backend      Spring Boot 4, Java 21
  Build        Maven
  Database     H2
  CI/CD        Jenkins
  Container    Docker
  Security     OWASP Dependency Check, Trivy
  Monitoring   Prometheus, Grafana
  Cloud        AWS EC2
  SCM          GitHub

## CI/CD Workflow

1.  Checkout source code
2.  Maven Build
3.  OWASP Dependency Check
4.  Trivy File System Scan
5.  Docker Image Build
6.  Trivy Image Scan
7.  Deploy Docker Container
8.  Verify Deployment
9.  Monitor with Prometheus & Grafana

## Screenshots

Place these images from the `jenkins-images/` folder:

-   GitHub Repository
-   Jenkins Pipeline
-   Spring Boot Application
-   OWASP Dependency Check
-   Trivy Scan Report
-   Docker Containers
-   Prometheus Targets
-   Grafana Dashboard
-   EC2 Instance

## Run Locally

``` bash
mvn clean package
docker build -t employee-management:1.0 .
docker run -d -p 8080:8080 employee-management:1.0
```

## Monitoring

Actuator:

    http://<EC2-IP>:8080/actuator

Prometheus:

    http://<EC2-IP>:9090

Grafana:

    http://<EC2-IP>:3000

## Security

-   OWASP Dependency Check
-   Trivy File System Scan
-   Trivy Docker Image Scan

## Future Improvements

-   SonarQube
-   Kubernetes
-   Helm
-   Terraform
-   Alertmanager
-   Node Exporter
-   cAdvisor

## Author

**Kshitij Shrivastava**

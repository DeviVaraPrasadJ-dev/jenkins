# Jenkins Examples for DevOps Engineers

This repository contains Java application examples demonstrating different Jenkins deployment strategies and CI/CD patterns.

## 📁 Projects Overview

### 🚀 **javaapp-pipeline/**
Complete CI/CD pipeline example with automated testing and deployment.
- **Type:** JAR with Jenkins Pipeline
- **Use Case:** Production-ready CI/CD automation
- **Features:** Automated testing, build, deploy with notifications
- **Port:** 5000

### 🏢 **javaapp-tomcat/**
Enterprise deployment example for servlet containers.
- **Type:** WAR for Tomcat
- **Use Case:** Enterprise application server deployment
- **Features:** Container-based deployment
- **Access:** `/artisantek-app/` context path

### ⚡ **javaapp-standalone/**
Simple standalone deployment example.
- **Type:** Executable JAR
- **Use Case:** Lightweight microservice deployment
- **Features:** Direct execution, minimal overhead
- **Port:** 5000

## 🛠️ Quick Start

```bash
# Clone and navigate
git clone <repo-url>
cd jenkins/<project-name>

# Build any project
mvn clean package

# Run standalone/pipeline projects
java -jar target/*.jar

# Deploy tomcat project
cp target/artisantek-app.war $TOMCAT_HOME/webapps/
```

## 🎯 Jenkins Use Cases

- **Pipeline Project:** Learn Jenkins declarative pipelines, automated testing, and deployment strategies
- **Tomcat Project:** Understand WAR deployment and application server integration
- **Standalone Project:** Practice simple build and deploy automation

## 📋 Prerequisites

- Java 21+
- Maven 3.6+
- Jenkins (for pipeline examples)
- Tomcat 9+ (for WAR deployment)

---
*Perfect for DevOps training, Jenkins job creation, and CI/CD pipeline examples.*Testing dev branch

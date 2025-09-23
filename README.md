# 🔐 Spring Boot Secured REST API

![Java](https://img.shields.io/badge/Java-17-blue)
![Spring Boot](https://img.shields.io/badge/Spring%20Boot-3.0-brightgreen)
![Spring Security](https://img.shields.io/badge/Spring%20Security-Basic%20Auth-orange)
![License](https://img.shields.io/badge/License-MIT-lightgrey)

This project demonstrates how to secure REST APIs using **Spring Security** with **HTTP Basic Authentication** and **role-based authorization**.  
It is the **Phase 1** of the [Spring Security Series](https://github.com/tomrist9/spring-security-series).

---

##  Features
- Secure REST endpoints with Spring Security
- HTTP Basic Authentication
- Role-based access control (Admin, User)
- Example endpoints for testing authorization
- In-memory and database-based authentication support

---

##  Tech Stack
- Java 17  
- Spring Boot 3  
- Spring Security  

---

## 📸 API Testing (Screenshots)

Below are some Postman screenshots showing the API in action:

- User Registration (`POST /register`)  
  ![Register Screenshot](docs/screenshots/register.png)

- Fetch Cards (secured endpoint, `GET /myCards`)  
  ![Cards Screenshot](docs/screenshots/myCards.png)


## 📂 Related Projects
This repository is part of the **Spring Security Series**:

- ✅ Phase 1: [Basic Secured REST API](https://github.com/tomrist9/spring-boot-secured-rest-api) *(this repo)*  
- ✅ Phase 2: [JWT Authentication Template](https://github.com/tomrist9/spring-boot-jwt-login-template)  
- ⏳ Phase 3: [OAuth2 Login Template](https://github.com/tomrist9/spring-boot-oauth2-login-template)  
- 🎁 Bonus: [Keycloak Integration Template](https://github.com/tomrist9/spring-boot-keycloak-template)  

---

## ▶️ How to Run
1. Clone the repository:
   ```bash
   git clone https://github.com/tomrist9/spring-boot-secured-rest-api.git


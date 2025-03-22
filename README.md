# **Project: Deployment of a 3-Tier Application on AWS EC2**

This project demonstrates the deployment of a 3-tier application using **Docker**, **Docker Compose**, and **AWS EC2**. The application was forked from the open-source repository **[krishnaacharyaa/wanderlust](https://github.com/krishnaacharyaa/wanderlust)** and successfully deployed live.

---

## **Steps Followed**

### 1. **Fork the Repository**
   - Forked the [krishnaacharyaa/wanderlust](https://github.com/krishnaacharyaa/wanderlust) repository to my GitHub account to work on the codebase.

### 2. **Set Up AWS EC2 Instances**
   - Launched an **AWS EC2 instance** to host the application.
   - Configured security groups to allow HTTP, HTTPS, and SSH traffic.

### 3. **Install Docker and Docker Compose**
   - Connected to the EC2 instance via SSH.
   - Installed **Docker** and **Docker Compose** on the EC2 instance using the following commands:
     ```bash
     sudo apt-get update
     sudo apt-get install docker.io
     sudo systemctl start docker
     sudo systemctl enable docker
     sudo curl -L "https://github.com/docker/compose/releases/download/v2.20.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
     sudo chmod +x /usr/local/bin/docker-compose
     ```

### 4. **Create Dockerfile**
   - Created a **Dockerfile** to containerize the application. Here’s an example:
     ```Dockerfile
     FROM node:14
     WORKDIR /app
     COPY . .
     RUN npm install
     EXPOSE 3000
     CMD ["npm", "start"]
     ```

### 5. **Create docker-compose.yml**
   - Created a **docker-compose.yml** file to define and run multi-container Docker applications. below given an example:
     ```yaml
     version: '3'
     services:
       frontend:
         build: ./frontend
         ports:
           - "3000:3000"
       backend:
         build: ./backend
         ports:
           - "5000:5000"
       database:
         image: mysql:5.7
         environment:
           MYSQL_ROOT_PASSWORD: root
           MYSQL_DATABASE: wanderlust
         ports:
           - "3306:3306"
     ```

### 6. **Build and Run the Application**
   - Built and started the application using Docker Compose:
     ```bash
     docker-compose up --build
     ```
   - Verified that the application was running live by accessing the EC2 instance’s public IP in a web browser.

---

## **Technologies Used**
- **AWS EC2:** For hosting the application.
- **Docker:** For containerizing the application.
- **Docker Compose:** For orchestrating multi-container deployment.
- **GitHub:** For version control and collaboration.

---

## **Challenges Faced**
1. **Docker Networking:** Initially faced issues with container communication, which was resolved by properly configuring the `docker-compose.yml` file.
2. **AWS Security Groups:** Learned to configure security groups to allow necessary traffic while maintaining security.
3. **Dockerfile Optimization:** Improved the Dockerfile to reduce image size and build time.

---

## **What I Learned**
- Gained hands-on experience with **Docker** and **Docker Compose**.
- Learned how to deploy applications on **AWS EC2**.
- Understood the importance of **containerization** and **orchestration** in modern DevOps practices.
- Improved problem-solving skills by troubleshooting deployment issues.

---

## **Future Improvements**
- Implement **CI/CD pipelines** using Jenkins or GitHub Actions.
- Use **Terraform** for Infrastructure as Code (IaC) to automate EC2 instance provisioning.
- Add **monitoring** using tools like Prometheus and Grafana.
- Implement **load balancing** using AWS Elastic Load Balancer (ELB).

---

## **How to Run This Project**
1. Fork the [krishnaacharyaa/wanderlust](https://github.com/krishnaacharyaa/wanderlust) repository.
2. Launch an AWS EC2 instance and install Docker and Docker Compose.
3. Clone the repository to the EC2 instance.
4. Create a `Dockerfile` and `docker-compose.yml` file.
5. Run `docker-compose up --build` to start the application.

---

## **Connect with Me**
- **GitHub:** [Ganeshmankoiri](https://github.com/Ganeshmankoiri)
- **LinkedIn:** [(LinkedIn)](https://www.linkedin.com/in/ganesh-man-koiri-b722aa229)
- **Email:** ganeshman1515@gmail.com

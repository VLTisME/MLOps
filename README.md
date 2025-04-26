# Introduction
This is a place for me to jot down all stuff about MLOps that I study

# This course has four parts, below is an overview for each part.

## MLOps1
### Objective
- Learn to build an end-to-end Machine Learning system—from packaging and deployment to production monitoring.
### Overview

| **Lesson**                          | **Content**                                                                                                                                              |
|------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------|
| Linux                              | Learn about the Linux environment, which is commonly used on servers you'll be working with.                                                             |
| Python                             | Learn how to write and understand code using Python — the main language for building ML systems.                                                         |
| Bash Scripting                     | Get familiar with command-line operations, interact with servers, and automate scripts using Cronjobs.                                                   |
| WebAPI                             | Instead of running scripts manually when data arrives, learn to send data via APIs and receive results programmatically.                                |
| Functional Testing                 | Build test files to ensure your code behaves as expected, is reliable, and is free of critical bugs.                                                     |
| Containerization & Orchestration I & II | Learn to package your code, environments, and dependencies using containers. Then, deploy across multiple machines using orchestration tools to take advantage of clusters. |
| CI/CD                              | Learn how to automate the entire process — from testing, packaging, to deploying your application — using Continuous Integration and Continuous Deployment pipelines. |
| Cloud Services                     | Deploy your system to cloud platforms so it's accessible to users over the internet. *(Note: You may need a VISA or debit card to use certain services.)* |
| Infrastructure as Code (IaC)       | Learn how to define and manage infrastructure (like clusters or networks) using code, instead of setting it up manually.                                 |
| Observable Systems                 | Learn how to monitor your system in production, track metrics, logs, and understand how it performs in real time.


## MLOps2

### Objective
- "Garbage in, garbage out..." right? Data is what will go in first so we have to manage it well.

### Overview
| Lesson                 | Content |
|--------------------------|----------|
| Data Architecture        | Learn the fundamentals of modern data architectures (Data Fabric, Data Mesh) and how to design systems like Data Warehouses, Data Lakes, and Lake Houses for large-scale data management and processing. |
| Source Systems           | Understand different types of data sources, explore how to capture changes from systems (CDC), and master key concepts of Kafka, including its architecture, offset management, partitioning, and rebalancing strategies. |
| Storage                  | Dive into various data storage technologies such as HDFS and object storage, learn about ACID properties, table partitioning techniques, and discover modern data table formats like Delta Lake, Iceberg, and Hudi. |
| Ingestion I: Batch        | Build a strong foundation in batch data ingestion by learning Spark’s architecture, its core components like DataFrame and RDD, and how to optimize large-scale data processing workflows effectively. |
| Ingestion II: Stream      | Get introduced to stream data ingestion concepts using Flink, learn about execution models, windowing, watermarks, and build real-time data pipelines with the Table API and Datastream API. |
| Pipeline Orchestration    | Master how to orchestrate complex workflows using Apache Airflow, understand how it schedules tasks beyond cronjobs, and manage data pipelines efficiently through its architecture and operators. |
| Feature Store            | Explore the concept of feature stores in machine learning systems, understand how to design feature views, and deploy platforms like Feast to manage features for model training and serving. Kinda like place to save features |


### Ouput
- Able to build a build a data storing, handling data system, feature, data pipeline.

## MLOps3

### Objective
- Deepdive into infrastructure

### Overview
| Lessons                               | Content |
|----------------------------------------|----------|
| High Performance Python               | Learn how to optimize Python code by using high-performance techniques like multiprocessing, multithreading, asynchronous programming, and efficient function design. |
| Fundamental of Software Architecture  | Understand the foundations of software architecture, including multi-tier structures, microservices, and various design styles that enable scalable and maintainable systems. |
| Model Development Following CRISP-ML(Q) | Explore the CRISP-ML(Q) methodology for structured model development, focusing on best practices for creating, validating, and maintaining machine learning solutions. |
| Training & Serving Design Patterns    | Master key design patterns for model training and serving, including techniques like caching, microbatching, serverless serving, and deployment optimization across different hardware accelerators. |
| Serverless Inference with KServe       | Learn how to build serverless model serving systems with KServe, understand the benefits of serverless vs. server-based architectures, and optimize deployments using Cloud Native Buildpacks. |
| High Density Model Serving with Model Mesh Architecture | Dive into high-density model serving using ModelMesh, and learn strategies to efficiently serve many models in Kubernetes environments with minimal resource usage. |
| Parallel Inference with KServe and RayServe | Discover how to integrate KServe and RayServe for parallel inference, optimizing resource management and scaling in machine learning serving systems. |
| Kubeflow                               | Explore the Kubeflow platform for building, deploying, and managing full machine learning pipelines, from data preprocessing to model deployment and monitoring. |
| ML System Design & MLOps               | Learn the principles of distributed systems, low-level system design, and how to architect complete machine learning systems that are production-ready and scalable. |


### Ouput
 

## MLOps4

### Objective

### Overview
| Lessons                                   | Content |
|--------------------------------------------|----------|
| Design Patterns                           | Master object-oriented programming and key Python design patterns (creational, behavioral, structural) to build scalable, maintainable codebases. |
| Data Transformation with dbt              | Learn data modeling and normalization, and apply dbt to perform powerful, modular transformations using SQL on modern data warehouses. |
| Data Validation with Great Expectations and Deequ | Build robust data validation pipelines, detect anomalies, and ensure data quality using Great Expectations and Deequ frameworks. |
| DataHub (metadata platform) & Data Governance | Understand metadata management and data governance fundamentals; learn to set up and use DataHub for managing data assets. |
| Distributed Training on Kubernetes        | Deep dive into strategies for distributed model training on Kubernetes, covering data vs. model parallelism and multi-worker setups. |
| Database Manipulation with ORM             | Learn database management using ORM tools, mastering techniques for data manipulation and smooth database migrations. |
| Git & Gitflow                              | Advance your Git skills by mastering workflows (like Gitflow) and commands like cherry-pick, rebase, squash, and stash. |
| API Gateway & NGINX                        | Learn how to use API Gateway and NGINX for load balancing, traffic management, authentication, and rate limiting in ML systems. |
| gRPC                                       | Explore gRPC protocol basics, including pros and cons over other communication protocols, and learn to build efficient, scalable services. |
| LLMOps                                     | Discover LLMOps architecture, learn retrieval-augmented generation (RAG), fine-tuning methods, and how to serve LLM models effectively with vector databases. |


### Output

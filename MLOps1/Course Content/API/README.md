# 1. Introduction  

## 1.1 What is an API?  

An **API**, or **Application Programming Interface**, is a powerful tool that defines a set of **methods** and **protocols** for software applications to communicate with each other. APIs make it possible for different software systems to work together by providing a consistent contract for how to request and exchange data.  

- **Key Concepts:**  
  - **Methods:** Defined ways to interact with the API.  
  - **Protocols:** Rules and standards for communication.  
  - **Communication:** APIs serve as bridges, enabling different applications, possibly written in different languages, to share information.  

> **Summary:**  
> An API acts like a remote function. Using an API is similar to interacting with a feature or service that is located in another place, often on another server or even across the internet.  

### Example Workflow  

1. A client sends a **request** to the API.  
2. The API processes the request and returns a **response** with data or status.  

This workflow streamlines and standardizes interactions across diverse systems.  

---  

## 1.2 Objectives of the Lecture  

- Understand how APIs enable and simplify communication between different systems or applications.  
- Explore various popular API architecture styles, including:  
  - **REST (Representational State Transfer)**  
  - **gRPC**  
  - **WebSocket**  
- Learn practical API implementation through a modern framework (**FastAPI**), emphasizing hands-on learning.  
- Discuss techniques for testing APIs and optimizing their performance for real-world deployment.  

---  

# 2. Key Takeaways  

1. **APIs are foundational** for software interactions, enabling the efficient exchange of data and commands between systems.  
2. **REST APIs** are the most popular due to their simplicity and scalability. However, alternatives like **gRPC** and **WebSocket** serve more specialized use cases.  
3. **FastAPI** is highlighted as a contemporary, high-performance framework for building APIs rapidly and efficiently.  
4. **Testing and performance tuning** are essential steps in ensuring that APIs are reliable, maintainable, and production-ready.  

---  

# 3. Content Summary  

## 3.1 How APIs Work  

APIs function as a central hub that connects multiple applications, allowing them to send and receive information seamlessly.  

[![image.png](https://i.postimg.cc/Kvbc322X/image.png)](https://postimg.cc/JtTCSS0K)

*Figure: Example of "How APIs Work". Application A and Application B exchange data through an API, which manages and standardizes their communication.*  

APIs operate through a cycle of **requests** and **responses**:  

1. **Client Request:** Initiated by the client (for example, a web application or a mobile app), which sends a query or command to the API.  
2. **API Processing:** The API receives the request and processes it according to the defined methods and protocols.  
3. **Response:** The API sends the resulting data or status message back to the client, completing the interaction.  

This request-response cycle makes APIs the backbone of modern software architectures, promoting modularity and reusability.  

---
## 3.2 API Protocols and Methods  

### 3.2.1 Protocols  

Protocols establish the rules and standards for communication between clients and APIs. They ensure that different systems can reliably exchange data—even if they’re built using different technologies.  

- **Examples of API protocols:**  
  - **HTTP/1**  
  - **HTTP/2**  
  - **HTTP/3**  

These protocols provide the foundation for most web APIs in use today.  

---  

### 3.2.2 Methods (HTTP Verbs)  

HTTP methods (also known as verbs) represent standardized ways to interact with resources through APIs:  

- **GET:** Retrieve data from a server.  
- **POST:** Create a new resource.  
- **PUT:** Update an existing resource.  
- **DELETE:** Remove a resource.  

**Visualization:**  
[![image.png](https://i.postimg.cc/L6yd4K43/image.png)](https://postimg.cc/vc62XKV4)
**Source**: atatus.com

---  

## 3.3 API Architecture Styles  

API architecture styles define the structured approach for how APIs are designed and how they manage interactions. Here are some of the most popular styles:  

### 3.3.1 REST API  

REST (Representational State Transfer) APIs use standard HTTP methods and status codes for communication. They are easy to learn, platform-independent, and widely used in the industry.  

- **Features:**  
  - Simple, stateless communication  
  - Utilizes URLs to represent resources  
  - Highly scalable and widely adopted  

- **Examples:**  
  - Google Maps API  
  - YouTube API  
  - Twitter API  

[![image.png](https://i.postimg.cc/5NzKHXVg/image.png)](https://postimg.cc/dLqjptDZ)
**Source**: Unknown

---  

### 3.3.2 gRPC  

gRPC is built on HTTP/2 and uses binary data transfer (via Protocol Buffers) instead of text-based formats like JSON or XML.  

- **Why use gRPC?**  
  - **Significantly faster** data transmission due to binary format  
  - Supports streaming, bi-directional communication  
  - Excellent for microservices and high-performance applications  

[![image.png](https://i.postimg.cc/vHXgtzbZ/image.png)](https://postimg.cc/xcJ10LXw)
**Source**: marutitech.com

---  

### 3.3.3 WebSocket  

WebSocket enables real-time, bidirectional communication using HTTP upgrades. It is much faster than REST for live data transfer, making it ideal for use cases like messaging, gaming, and live dashboards.  

- **Benefits:**  
  - Real-time data delivery  
  - Persistent connection  
  - Great for scenarios needing instant updates  

[![image.png](https://i.postimg.cc/BZKBpRVQ/image.png)](https://postimg.cc/grGhktpf)
**Source**: Pubnub.com


## 3.4 REST API  

REST APIs use standard HTTP methods and are built on stateless communication. Every request from a client to a server must contain all the information needed to understand and process the request, making REST APIs highly scalable and distributed.  

**Common use cases include:**  

1. **GET Requests:**  
   Retrieve data from a server (e.g., fetching user/profile information).  

2. **POST Requests:**  
   Send data to be processed by the server (e.g., submitting forms, creating new records).  

**Visualization:**  
![REST API Illustration](https://www.redhat.com/cms/managed-files/styles/wysiwyg_full_width/s3/restapi-architecture-diagram.png)  

---  

## 3.5 FastAPI Basics and Examples  

### 3.5.1 Why Use FastAPI?  

FastAPI is a modern, high-performance Python web framework for building APIs.  
- **High Performance:** Comparable to Node.js and Go.  
- **Easy to Learn:** Clean, Pythonic syntax with type hints.  
- **Automatic Interactive Docs:** Instantly provides Swagger UI for API testing and documentation.  

**Visualization:**  
![FastAPI Logo](https://fastapi.tiangolo.com/img/logo-margin/logo-teal.png)  

---  

### 3.5.2 Example Code  

Here’s a simple yet complete example to get started with FastAPI:  

```python  
from fastapi import FastAPI  

app = FastAPI()  

@app.post("/hello")  
async def create_greeting(name: str):  
    return {"message": f"Hello, {name}!"}


**How it works:**
- Defines a POST endpoint /hello that accepts a name parameter and returns a greeting as JSON.
- The async def allows for asynchronous processing, improving performance.

**Run with:**
```bash
uvicorn main:app --host 0.0.0.0 --port 8000  
```

**Access the interactive Swagger UI at:**
http://127.0.0.1:8000/docs

**Swagger UI Example:**
![Image](https://fastapi.tiangolo.com/img/index/index-01-swagger-ui-simple.png)



## 3.6 Software Testing  
Testing ensures your APIs are correct, robust, and perform reliably under various conditions.  
Here are some key types of software testing applied to APIs:  

---  

### 3.6.1 Types of Testing  

1. **Functional Testing:**  
    Ensures APIs meet functional requirements by validating each endpoint's responses and error handling.  

2. **Non-Functional Testing:**  
    Focuses on aspects like performance, reliability, scalability, and security.  

3. **Load Testing:**  
    Uses tools like Locust to simulate concurrent requests to measure and analyze API performance under stress.  

---  

## 3.7 Using Locust for Load Testing  

[Locust](https://locust.io/) is an open-source tool for running load tests against your API,  
allowing you to simulate many users making requests concurrently.  

---  

### 3.7.1 Setup  

#### Step 1: Install Locust  

```bash  
pip install locust  
```  

---  

#### Step 2: Create a `locustfile.py` for stress testing  

```python  
from locust import HttpUser, task, between  

class WebsiteUser(HttpUser):  
    wait_time = between(1, 5)  

    @task  
    def create_item(self):  
        data = {"name": "Item 1", "price": 9.99}  
        self.client.post("/items/", json=data)  
```  

- This script defines a simulated user making POST requests to the `/items/` endpoint,  
  creating new items, and waiting 1–5 seconds between requests.  

---  

#### Step 3: Run your FastAPI application  

Start your FastAPI app in another terminal window:  

```bash  
uvicorn main:app --host 0.0.0.0 --port 8000  
```  

---  

#### Step 4: Start Locust  

```bash  
locust  
```  

---  

#### Step 5: Open the Locust web interface  

Visit [http://localhost:8089](http://localhost:8089), enter the number of total users to simulate and spawn rate, and then start the test.  
You will be able to observe the performance of your API under different loads,  
including metrics like requests per second, average response times, and failures.


## 3.8 Improving API Performance  

Modern APIs require careful optimization to meet demanding performance and scalability requirements. The following diagram illustrates a typical architecture with several optimization strategies:  

![API Performance Architecture Example](insert-diagram-link-here)  

*Figure 2: Example of "Improve API performance"*  

### Strategies:  

- **Implement caching** for repeated responses:  
  Store outputs for identical requests in a cache layer to reduce unnecessary computation and latency.  

- **Reduce input data size:**  
  Optimize and validate incoming requests to minimize the amount of data processed and transferred, improving response time.  

- **Optimize logging with asynchronous methods:**  
  Use background or async loggers to ensure that saving logs (e.g., predictions or errors) does not block the main processing path.  

- **Use autoscaling solutions** (e.g., Kubernetes):  
  Automatically scale your API server instances up and down to efficiently handle variable traffic loads without service degradation.  

- **Leverage shared cache for predictions:**  
  Before making an expensive prediction or computation, check if the result is already available in cache to speed up responses.  

- **Async logging and batch log storage:**  
  Use asynchronous calls for logging to external services or batch important events to reduce resource contention and data loss during spikes.  

---  

## 4 Conclusion  

APIs enable seamless communication between systems, forming the foundation of modern web applications.  
By understanding protocols, architecture styles, and frameworks like FastAPI, developers can design scalable and efficient APIs.  
Thorough testing and proactive performance optimization ensure that APIs remain reliable, robust, and ready for real-world use cases in demanding environments.  

---  

## 5 References and Additional Resources  

### 5.1 References  

- [HTTP Status Codes](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status)  
- [FastAPI Documentation](https://fastapi.tiangolo.com/)  

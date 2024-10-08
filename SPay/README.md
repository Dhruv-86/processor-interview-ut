# SPay - Transaction Processor

SPay is a Spring Boot application that processes file uploads, handles account details, bad transactions, and card collections. The project also allows resetting the system state. It is built using JSP for views and integrates with a backend transaction service.

## Table of Contents
- [Installation](#installation)
- [Running the Project](#running-the-project)
- [File Upload](#file-upload)
- [Account Details](#account-details)
- [Bad Transactions](#bad-transactions)
- [Collections](#collections)
- [Reset System](#reset-system)
- [Technologies Used](#technologies-used)
- [Contributors](#contributors)

## Installation

### Prerequisites
Make sure you have the following installed:
- **JDK 17** or higher
- **Maven 3.6** or higher
- **IntelliJ IDEA** (Recommended)
- **Tomcat Server** (Optional if you want to deploy the WAR file)

### Steps to Set Up the Project:

1. Install the Maven dependencies:
    - IntelliJ should automatically detect and download the dependencies based on the `pom.xml` file.
    - You can also manually install them by running:
      ```bash
      mvn clean install
      ```

2. **Run the project** using IntelliJ:
    - Go to the main application class `SPayApplication.java` and click the **Run** button to start the Spring Boot server.

### Packaging and Deploying the Application (WAR):
- You can package the application into a WAR file using:
  ```bash
  mvn clean package
  ```
- The generated WAR file can be deployed on a Tomcat server.

## Running the Project

Once you have installed the project, you can run the application:

1. Start the Spring Boot server:
    - The application will start on `localhost:8080` by default.

2. Access the main upload page by navigating to:
    - [http://localhost:8080/](http://localhost:8080/)

## Endpoints

### File Upload
The application allows you to upload multiple files, which will be processed and stored temporarily.

- **Endpoint**: `/upload`
- **Method**: `POST`
- **Description**: Accepts multiple files and processes them using the `TransactionService`.
- **How to Use**: Go to the main page, select files, and click "Upload."

### Account Details
View details of accounts processed in the system.

- **Endpoint**: `/accountDetails`
- **Method**: `GET`
- **Description**: Displays all the account details available in the system.
- **How to Use**: Navigate to [http://localhost:8080/accountDetails](http://localhost:8080/accountDetails) to view the list of accounts.

### Bad Transactions
View details of transactions that failed or encountered issues.

- **Endpoint**: `/badTransaction`
- **Method**: `GET`
- **Description**: Displays all the bad transactions in the system.
- **How to Use**: Navigate to [http://localhost:8080/badTransaction](http://localhost:8080/badTransaction) to view bad transactions.

### Collections
View card collections processed in the system.

- **Endpoint**: `/collections`
- **Method**: `GET`
- **Description**: Displays all the cards in the collections list.
- **How to Use**: Navigate to [http://localhost:8080/collections](http://localhost:8080/collections) to view the card collections.

### Reset System
Reset the system to its initial state.

- **Endpoint**: `/reset`
- **Method**: `GET`
- **Description**: Resets the state of the system, including accounts, bad transactions, and collections.
- **How to Use**: Navigate to [http://localhost:8080/reset](http://localhost:8080/reset) to reset the system.

## Technologies Used

- **Java 17**: The core programming language.
- **Spring Boot 3.3.4**: Framework used for building the backend.
- **JSP (Jakarta Servlet)**: Used for building the frontend views.
- **Maven**: Dependency management and build tool.
- **Tomcat**: Embedded server for running the web application.
- **Commons FileUpload**: Library for handling file uploads.
- **Apache Commons CSV**: Library for parsing and handling CSV data.

## Contributors

- **Dhruv Ronak Patel** (Developer)



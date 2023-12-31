## courrierChallenge
This is a repo for a small project aimed at tallying the amounts to be received from delivery personnel. The information is sent to a queue in AmazonMQ of the RabbitMQ type. There will be 2 REST endpoints for querying the values. This is the beginning of the project, and as it grows and becomes clearer, this description will be updated.


## Infrastruture as code.
I created some scripts using Terraform to provide a minimum infrastructure in AWS to start the project.
The infrastructure is composed by:
- AmazonMQ. It is a managed message broker service for RabbitMQ at the Cloud.
- DynamoDB: I selected this database for the facility to use. It's managed by AWS and is a free tier.
- VPC: I use the terraform to create VPC, Secutiry Group, and Subnet.
- Next steps are creating IaC for:
      ALB, Application Load Ballancer,
      ASG, Auto Scale Group.
- To run de terraform scripts you need to install the terraform in your machine and configure the AWS CLI.
- To run the scripts you need to run the following commands:
``` terraform init ```
``` terraform plan ```
``` terraform apply ```
- To destroy the infrastructure you need to run the following command:
``` terraform destroy ```
- The scripts are in the folder terraform.
- To connect to amazon you need to create a user in IAM and configure the AWS CLI.
- To connect to AmazonMQ you need to create a user in IAM and configure the AWS CLI.
- To connect to DynamoDB you need to create a user in IAM and configure the AWS CLI.

## Publisher
  I created a little project using springboot to populate the three queues in AmazonMQ. 
  Each queue is for a event Delivery, Adjustment and Bonus.
  [courrierPublisher](https://github.com/peryclesjr/courrierPublisher)
  - To run the project you need to configure the application.properties with the information of your AmazonMQ.
    - The project is a maven project and you need to run the following command in terminal:
    ``` mvn clean install ```
  - To run the project you need to run the following command in terminal:
    ``` mvn spring-boot:run ```
  - The project is running in the port 8080.
  - The project has 1 endpoints:
    - /delivery
 

## Consumer Courrier Message
  I created this project to show how to consume a queue in AmazonMq using the RabbitMQ engine 
  and then saving the information in AWS DynamoDB. This project uses Spring Boot and AWS SDK.
[ConsumerCourrierMessage](https://github.com/peryclesjr/consumerCourrierMessages)
 - To run the project you need to configure the application.properties with the information of your AmazonMQ.
 - The project is a maven project and you need to run the following command in terminal:
    ``` mvn clean install ```
 - To run the project you need to run the following command in terminal:
    ``` mvn spring-boot:run ```
 - The project is running in the port 8089.

## Courrier Statement
  I created this project to expose the information saved in DynamoDB. 
Using the rest APIS.This project uses Spring Boot and AWS SDK.
[CourrierStatement](https://github.com/peryclesjr/courrierStatement)
- To run the project you need to configure the application.properties with the information of your AmazonMQ.
 - The project is a maven project and you need to run the following command in terminal:
    ``` gradle clean build ```
 - To run the project you need to run the following command in terminal:
    ``` gradle bootRun ```
 - The project is running in the port 8090.
 - The project has 2 endpoints:
    - /complete-statement
    - /summarize-statement    




## Design System 
![image](https://github.com/peryclesjr/courrierChallenge/blob/main/skipthedishes_courrierChallenge%20(1).jpg)


  

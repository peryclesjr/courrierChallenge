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

## Publisher
  I created a little project using springboot to populate the three queues in AmazonMQ. 
  Each queue is for a event Delivery, Adjustment and Bonus.
  [courrierPublisher](https://github.com/peryclesjr/courrierPublisher)

## Consumer Courrier Message
  I created this project to show how to consume a queue in AmazonMq using the RabbitMQ engine 
  and then saving the information in AWS DynamoDB. This project uses Spring Boot and AWS SDK.
[ConsumerCourrierMessage](https://github.com/peryclesjr/consumerCourrierMessages)


## Design System 
![image](https://github.com/peryclesjr/courrierChallenge/blob/main/skipthedishes_courrierChallenge%20(1).jpg)


  

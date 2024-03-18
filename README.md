# Bid Manager

A sample Ruby on Rails project

## Prerequisites

Before you begin, ensure you have met the following requirements:

- **Docker**: The project is containerized with Docker. You need Docker and Docker Compose installed on your machine to build and run the application. For installation instructions, visit [Docker's official website](https://www.docker.com/get-started).

## Installation & Running the Application

Follow these steps to get your application up and running:

```bash
# Clone the repository
git clone https://github.com/tonyayoub/bid_manager.git
cd bid_manager

# Build the Docker images
docker-compose build

# Start the application
docker-compose up

# To run the containers in detached mode (in the background):
docker-compose up -d

# To stop the application:
docker-compose down


# 👮 Auth-API

## Table of Contents

- [👮 Auth-API](#-auth-api)
  - [Table of Contents](#table-of-contents)
  - [About ](#about-)
  - [Getting Started ](#getting-started-)
    - [Prerequisites](#prerequisites)
    - [Installing](#installing)
  - [Usage ](#usage-)
  - [Testing ](#testing-)

## About <a name = "about"></a>

The aim of this project is to showcase my skills in developing Rails API.

## Getting Started <a name = "getting_started"></a>

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

What things you need to run the project.

- Docker
- docker-compose

The technologies involved in this project.

- Docker (27.2.0)
- docker-compose (2.29.2)
- Postgres (16.X)
- Ruby (3.3.5)
- Rails (7.2.1)

### Installing

A step by step series of examples that tell you how to get a development env running.

Clone this repository
```bash
git clone git@github.com:gabrielmbarboza/auth-api.git
```

Replaces or create new files from files with the `.sample` removing the extension and then replace the environment variables in **.env** directory.

```bash
cp app.sample app
```

```bash
cp database.sample database
```

```dbash
docker compose run --rm auth_api bin/rails db:migrate
```

or use only the task `db:setup`.

```bash
docker compose run --rm auth_api bin/rails db:setup
```

## Usage <a name = "usage"></a>

Using Docker and docker-compose, just run the following command.

```bash
docker compose up
```

Endpoint for logging in and receiving the token

```bash
POST http://0.0.0.0:3000/login HTTP/1.1
content-type: application/json

{
    "email": "jane@example.com",
    "password": "123"
}
```

Endpoint to get the auth information

```bash
GET http://0.0.0.0:3000/users HTTP/1.1
content-type: application/json
Authorization: Bearer paste_your_token_here
```

## Testing <a name = "testing"></a>

Use the following command to run all the tests.

```bash
docker compose run --rm auth_api bin/rails test ./test
```

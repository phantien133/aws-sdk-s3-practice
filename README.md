## Prerequisites
- Ruby 2.3.x
- Rails 5.2.x
- PostgreSQL 9.6.6

## Infrastructure
- AWS
  - EC2
  - RDS
## How to run app in development
### Prerequisites
- Docker
- Docker Compose
(Install guide in [here](https://docs.docker.com/compose/install/))
### Edit environment
- Change master.key from config/master.key
- Edit environment with editor same config/credentials.yml.sample file
```
EDITOR=vi rails credentials:edit
```

##### Prerequisites

The setups steps expect following tools installed on the system.

- Github
- Ruby [3.1.2](https://github.com/organization/project-name/blob/master/.ruby-version#L1)
- Rails [7.0.6](https://github.com/organization/project-name/blob/master/Gemfile#L12)

##### 1. Check out the repository

```bash
git clone git@github.com:paymaan73/railsAndDocker.git
```

##### 2. Create database.yml file

Copy the sample database.yml file and edit the database configuration as required.

```bash
docker compose build
docker compose up
```

##### 3. Create and setup the database

Run the following commands to create and setup the database.

```
docker exec -it my_application rails db:migrate
```

And now you can visit the site with the URL http://localhost:8080

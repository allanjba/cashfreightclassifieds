# README



Things you may want to cover:

* Database Migrations

If there are changes to the database, after a pull request, run this code in the terminal inside the project's folder:
```
rails db:migrate
```

* Database Password

Create a file inside the config folder `application.yml`
*The file database.yml was modified and it is necessary for production*.

Inside the file, you can set the password for development:
```
    development:
        DB_PASSWORD: YourPassword
```

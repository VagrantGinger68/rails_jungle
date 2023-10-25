# Jungle

A mini e-commerce application built with Rails 6.1 for purposes of teaching Rails by example.

## Explaination of project
We were given a mostly complete Ruby on Rails project that needed some bugs fixed and features implemented. This was to simulate a real world on the job experience. We were given tasks to complete and a week deadline, there was also minimal guidance during this time. This project helped me become more adaptable by having us learn a new language while fixing the app. Below are screenshots of some of the features that I implemented into the project. 

## Screenshots

Admin Dashboard
![Admin Dashboard](https://github.com/VagrantGinger68/rails_jungle/blob/master/docs/Screenshot%202023-10-25%20at%203.05.45%E2%80%AFPM.png?raw=true)

Admin Categories
![Admin Categories](https://github.com/VagrantGinger68/rails_jungle/blob/master/docs/Screenshot%202023-10-25%20at%203.05.59%E2%80%AFPM.png?raw=true)

Admin Create Category View
![Admin Create Category View](https://github.com/VagrantGinger68/rails_jungle/blob/master/docs/Screenshot%202023-10-25%20at%203.06.34%E2%80%AFPM.png?raw=true)

Account Registration Page
![Account Registration Page](https://github.com/VagrantGinger68/rails_jungle/blob/master/docs/Screenshot%202023-10-25%20at%203.06.18%E2%80%AFPM.png?raw=true)

Order Details View
![Order Details View](https://github.com/VagrantGinger68/rails_jungle/blob/master/docs/Screenshot%202023-10-25%20at%203.09.30%E2%80%AFPM.png?raw=true)




## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rails db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe

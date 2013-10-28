# General

# Set up
````bash
rake db:create
rake db:migrate
rake db:test:prepare

rails s

````

# Running Tests
Run can run all the tests in the suite with:
````bash
rake
````
or run just the ingtegration tests with:
````bash
rspec spec/integration
````

or a single test:
````bash
rspec spec/integration/application_spec.rb
````

# Update single attribute from console..
````bash  
set t to desired TeacherRecommendation
t.email="desired_email"
t.update_attribute('email',t.email)
````

# Open and close system for submitting applications
Production:
````bash
heroku config:set REGISTRATION_OPEN='true' --app pgsapplication
heroku config:set REGISTRATION_OPEN='false' --app pgsapplication
````
Staging:
````bash
heroku config:set REGISTRATION_OPEN='true' --app application-staging
heroku config:set REGISTRATION_OPEN='false' --app application-staging
````
Development:
````bash
export REGISTRATION_OPEN='true'
export REGISTRATION_OPEN='false'
````

# Drop staging database
Find Database Name
````bash
heroku addons --app application-staging | grep POSTGRES
````
Drop Database
````bash
heroku pg:reset HEROKU_POSTGRESQL_ORANGE --confirm application-staging
````
Migrate
````bash
heroku run rake db:migrate --app application-staging
````
Seed
````bash
heroku run rake db:seed --app application-staging
````
Populate w/ fake data
````bash
heroku run rake db:populate --app application-staging
````
Challenge: Rolodex
As a developer, I have been tasked with creating and testing a database model that will be used in a rolodex application. I want to ensure that the database behaves as expected and the necessary actions can be performed on the database instances.

--GENERAL STEPS
--1. Set up App
        Set Up
        $ rails new dog_app -d postgresql -T
        $ cd dog_app
        $ rails db:create
        $ rails server
--2. Create db or database
    $ rails db:create
--3. Generate model
$ rails generate model Dog name:string breed:string age:integer


--4. Migrate

Create a new Rails app named 'active_reacord_challenges'

Create the database. The output in the terminal should look like this:
Created database 'rolodex_development'
Created database 'rolodex_test'
Generate a Person model with a first_name, last_name, and phone. All fields should be strings.
Run a migration to set up the database.
Open up Rails console.
Actions

Add five family members into the Person table in the Rails console.
Retrieve all the items in the database.
Add yourself to the Person table.
Retrieve all the entries that have the same last_name as you.
Update the phone number of the last entry in the database.
Retrieve the first_name of the third Person in the database.
Stretch Challenges

Update all the family members with the same last_name as you, to have the same phone number as you.

Remove all family members that do not have your last_name.
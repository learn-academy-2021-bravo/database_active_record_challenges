
<!-- As a developer, I have been tasked with creating and testing a database model that will be used in a rolodex application. I want to ensure that the database behaves as expected and the necessary actions can be performed on the database instances.

Set Up

Create a new Rails app named 'rolodex'.
Create the database. The output in the terminal should look like this:
Created database 'rolodex_development'
Created database 'rolodex_test'
Generate a Person model  with a first_name, last_name, and phone. -->

$ rails generate model Person first_name:string last_name:string 
phone:string

  <!-- All fields should be strings.
Run a migration to set up the database.
Open up Rails console.
Actions -->

<!-- Add five family members into the Person table in the Rails console. -->
3.0.0 :004 > Person.create first_name:"Diego", last_name:"Hernandez", phone:"760
-545-6777"
  TRANSACTION (0.8ms)  BEGIN
  Person Create (7.9ms)  INSERT INTO "people" ("first_name", "last_name", "phone", "created_at", "updated_at") VALUES ($1, $2, $3, $4, $5) RETURNING "id"  [["first_name", "Diego"], ["last_name", "Hernandez"], ["phone", "760-545-6777"], ["created_at", "2021-06-03 23:32:21.276867"], ["updated_at", "2021-06-03 23:32:21.276867"]]
  TRANSACTION (1.5ms)  COMMIT

  Person.create first_name:"Austin", last_name:"Walker", phone:"480-6
65-7889"



<!-- Retrieve all the items in the database. -->
Person.all
  Person Load (25.9ms)  SELECT "people".* FROM "people" /* loading for inspect */ LIMIT $1  [["LIMIT", 11]]
 => #<ActiveRecord::Relation [#<Person id: 1, first_name: "Diego", last_name: "Hernandez", phone: "760-545-6777", created_at: "2021-06-03 23:32:21.276867000 +0000", updated_at: "2021-06-03 23:32:21.276867000 +0000">, #<Person id: 2, first_name: "Vivean", last_name: "Hannah", phone: "619-554-5555", created_at: "2021-06-03 23:37:20.416758000 +0000", updated_at: "2021-06-03 23:37:20.416758000 +0000">, #<Person id: 3, first_name: "Kevin", last_name: "Burgin", phone: "619-989-6778", created_at: "2021-06-03 23:39:43.318969000 +0000", updated_at: "2021-06-03 23:39:43.318969000 +0000">, #<Person id: 4, first_name: "Chris", last_name: "Sullivan", phone: "580-768-4444", created_at: "2021-06-03 23:42:46.468376000 +0000", updated_at: "2021-06-03 23:42:46.468376000 +0000">, #<Person id: 5, first_name: "Austin", last_name: "Walker", phone: "480-665-7889", created_at: "2021-06-03 23:44:57.761110000 +0000", updated_at: "2021-06-03 23:44:57.761110000 +0000">]> 
3.0.0 :013 > 

<!-- Add yourself to the Person table. -->
3.0.0 :014 > Person.create first_name:"Guillermo", last_name:"Garcia", phone:"61
9-395-3593"

<!-- Retrieve all the entries that have the same last_name as you. -->

<!-- Update the phone number of the last entry in the database. -->

<!-- Retrieve the first_name of the third Person in the database.
Stretch Challenges -->

<!-- Update all the family members with the same last_name as you, to have the same phone number as you.
Remove all family members that do not have your last_name. --> --> -->
Favorite Movies Challenge
Setup
    --cd into main branch
    --create branch
    --touch .md file
    --cd back into desktop and create app
    --place wokrflow steps into .md file as well if desired
Create a new Rails application called 'favorite_movies'.

    1. $ rails new migrations_challenge -d         postgresql -T
    2. $ cd migrations_challenge

Create the database
    $ rails db:create

Generate a Movie model with a title attribute and a category attribute
    $ rails generate model title:string category:text


Challenges
Add five entries to the database via the Rails console
$ rails server (seperate console)
$ rails c
$ rails db:create

Create a migration to add a new column to the database called movie_length

$ rails generate migration add_columns_to_list


Update the values of the five existing attributes to include a movie_length value
Generate a migration to rename the column 'category' to 'genre'
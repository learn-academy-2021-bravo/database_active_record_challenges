step 1
$ rails new movie -d postgresql -T

step 2
$ cd movie

step 3
$ rails db:create

step 4 creating a model / table with column name and datatype
$ rails g model Film movie_name:string movie_director:string movie_time:float

step 5 this will bring the data in that we just created / update my database
$ rails db:migrate

<!-- Challenges

Add five entries to the database via the Rails console
Create a migration to add a new column to the database called movie_length
Update the values of the five existing attributes to include a movie_length value
Generate a migration to rename the column 'category' to 'genre' -->

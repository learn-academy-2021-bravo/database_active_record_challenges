step 1 
$ rails new movie -d postgresql -T

step 2
$ cd movie

step 3 
$ rails db:create

step 4 creating a model / table with column name and datatype 
$ rails g model Movie movie_name:string movie_director:string movie_time:float 

step 5 this will bring the data in that we just created / update my database
$ rails db:migrate



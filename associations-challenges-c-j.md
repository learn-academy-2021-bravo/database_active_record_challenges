Banking Challenge

Setup
    --cd into main branch
    $ cd main

    --create branch
    $ git checkout -b associations-c-j

    --touch .md file
    touch associations-challenges-c-j.md

    --cd back into desktop and create app
    code ..
    cd desktop
Create a new rails application and database
    % rails new banking_app -d postgresql -T

Create a model for owner
    $ rails g model Owner name:string address:string

An owner has a name and address, and can have multiple credit cards

    app/models/owner
    added has_many :credits

    app/model/credit 
    added belong_to :owner

Create a model for credit card
    $ rails g model Credit number:string expiration_date:string owner_id:integer

A credit card has a number, an expiration date, and an owner

    owner = Owner.position
    owner.credits.create number:'', expiration_date:'', owner_id:integer

Challenges
Create three owners and save them in the database

    owner.create name:'name', address:'string'

    
Create a credit card in the database for each owner
    owner = Owner.position
    owner.credits.create number:'', expiration_date:'', owner_id:integer

Add two more credit cards to one of the owners
    owner = Owner.position
    owner.credits.create number:'', expiration_date:'', owner_id:integer

Stretch Challenge
Add a credit limit to each card
$ rails g migration AddCreditLimit

    went into migration and added credit_limit column, then migrated
    Credit.update(id, :credit_limit => 'string')

Find the total credit extended to the owner with multiple credit cards
assigned harry to variable -> harry = Owner.third

mapped over object to find credit_limit, changed string to integer with to_i

added integers together with.sum
harry.credits.map {|value| value.credit_limit.to
_i}.sum
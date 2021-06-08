<!-- Setup

Create a new rails application and database
Create a model for owner
An owner has a name and address, and can have multiple credit cards
Create a model for credit card
A credit card has a number, an expiration date, and an owner

Challenges
Create three owners and save them in the database
Create a credit card in the database for each owner
Add two more credit cards to one of the owners
Stretch Challenge

Add a credit limit to each card
Find the total credit extended to the owner with multiple credit cards -->

Step 1

<!-- Create a new rails application and database -->

    $ rails new banking -d postgresql -T
    $ cd my_app
    $ rails db:create

Step 2

<!-- Create a model for owner -->

    $ rails generate model Owner name:string address:string
    $ rails db:migrate

Step 3

<!-- Create a model for credit card -->

    $ rails generate model CreditCard credit_number:string expiration_date:string owner_id:integer
    $ rails db:migrate

Step 4

- setting up the assocations

app/models/owners.rb

```ruby
class Owner < ApplicationRecord
    has_many :credit_cards
end
```

app/models/credit_card.rb

```ruby
class CreditCard < ApplicationRecord
    belongs_to :owner
end
```

Step 5

- went into rails console
  $ rails c

```
Owner.all
<!-- empty list -->
#<ActiveRecord::Relation []>
```

```
CreditCard.all
<!-- empty list -->
#<ActiveRecord::Relation []>
```

Step 6

<!-- Create three owners and save them in the database -->

    $ Owner.create name: "Vivean Hanna", address: "123 lane fire ave, san diego ca 92312"
    $ Owner.create name: "Shazeen Fabius", address: "345 fire lane san diego ca 23412"
    $ Owner.create name: "Betty Grove", address: "987 grove lane san diego ca 23424"

<!-- Create a credit card in the database for each owner -->

    Target onwer 1
    $ owner1 = Owner.find 1
    $ owner1.credit_cards.create credit_number: "222244456667777", expiration_date: "12/30/2030"

    $ owner2 = Owner.find 2
    $ owner2.credit_cards.create credit_number: "4355645675767657567", expiration_date: "03/06/2021"

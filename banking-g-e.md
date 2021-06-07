<!-- Create a new rails application and database -->
Create new Rails App:
rails new banking_app -d postgresql -T
cd banking_app
rails db:create
rails server
<!-- Create a model for ownerAn owner has a name and address, and can have multiple credit cards -->
rails g model Owner name:string address:string credit_card:string
rails db:migrate
<!-- Create a model for credit cardA credit card has a number, an expiration date, and an owner -->
rails g model CreditCard number:string expiration_date:string owner_id:integer
rails db:migrate
<!-- Create three owners and save them in the database -->
Owner.create name:"Bob", address:"1234 candy st", credit_card:""
Owner.create name:"Joe", address:"1234 1st ave", credit_card:""
Owner.create name:"Janice", address:"1234 30th st", credit_card:""
<!-- Create a credit card in the database for each owner -->
bob = Owner.find 1
bob.credit_cards.create number:"4756454", expiration_date:"4/20"
joe = Owner.find 2
joe.credit_cards.create number:"464564665", expiration_date:"5/20"
janice = Owner.find 3
janice.credit_cards.create number:"4857498574968", expiration_date:"6/20"
<!-- Add two more credit cards to one of the owners -->
bob.credit_cards.create number:"86787868", expiration_date:"3/20"
bob.credit_cards.create number:"756768877", expiration_date:"1/20"

<!--
Challenges

You have been tasked to set up an Account model for a your company. The application must be secure and tested.

As a developer, I need to generate a model called Account that has a username, a password, and an email.
As a developer, I need username, password, and email to be required.
As a developer, I need every username to be at least 5 characters long.
As a developer, I need each username to be unique.
As a developer, I need each password to be at least 6 characters long.
As a developer, I need each password to be unique.
As a developer, I want my Account model to have many associated Addresses.
As a developer, I want Address to have street_number, street_name, city, state, and zip attributes.
As a developer, I want to validate the presence of all fields on Address.
 -->

Step 1
$ rails new validation-challenge -d postgresql -T  
$ cd validation-challenge
$ rails db:create

step 2
bundle add rspec-rails
rails generate rspec:install

Step 3
$ rails g model Account username:string password:string email:string
$ rails db:migrate

Step 4
spec/models/account_spec.rb

```ruby
RSpec.describe Account, type: :model do
  it "not valid without username" do
    account = Account.create password: "password123", email: "email@email.com"
    expect(account.errors[:username]).to_not be_empty
  end

end
```

failing

step 5
app/models/account.rb

```ruby
class Account < ApplicationRecord
    validates :username, presence: true
end
```

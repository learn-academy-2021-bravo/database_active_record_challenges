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
    it "not valid without password" do
    account = Account.create username: "username", email: "email@email.com"
    expect(account.errors[:password]).to_not be_empty
  end
   it "not valid without email" do
    account = Account.create username: "username", password: "password123"
    expect(account.errors[:email]).to_not be_empty
  end
end

```

failing

step 5
app/models/account.rb

```ruby
class Account < ApplicationRecord
    validates :username, :password, :email, presence: true
end
```

step 6

<!-- As a developer, I need every username to be at least 5 characters long. -->

```ruby
  it "not valid if username is less than 5 characters" do
    account = Account.create username: "username", password: "password123", email:"email@email.com"
    expect(account.errors[:username]).to_not be_empty
  end
# Added validation to username length
  class Account < ApplicationRecord
    validates :username, :password, :email, presence: true
    validates :username, length: { minimum: 5 }
end
```

<!-- As a developer, I need each username to be unique. -->

```ruby
it "not valid if username is not unique" do
    Account.create username: "username", password: "password123", email:"email@email.com"
    account = Account.create username: "username", password: "password123", email:"email@email.com"
    expect(account.errors[:username]).to_not be_empty
  end

  class Account < ApplicationRecord
    validates :username, :password, :email, presence: true
    validates :username, length: { minimum: 5 }
    validates :username, uniqueness: true
end
```

<!-- As a developer, I need each password to be at least 6 characters long.
As a developer, I need each password to be unique. -->

```ruby
it "not valid if password is less than 6 characters" do
    account = Account.create username: "user", password: "pass", email:"email@email.com"
    expect(account.errors[:password]).to_not be_empty
  end

  it "not valid if password is not unique" do
    Account.create username: "username", password: "password123", email:"email@email.com"
    account = Account.create username: "username", password: "password123", email:"email@email.com"
    expect(account.errors[:password]).to_not be_empty
  end

  class Account < ApplicationRecord
    validates :username, :password, :email, presence: true
    validates :username, length: { minimum: 5 }
    validates :username, uniqueness: true
    validates :password, length: { minimum: 6 }
    validates :password, uniqueness: true
end
```

step 7

<!-- As a developer, I want my Account model to have many associated Addresses.
As a developer, I want Address to have street_number, street_name, city, state, and zip attributes.
As a developer, I want to validate the presence of all fields on Address. -->

$ rails g model Address street_number:integer street_name:string city:string
$ rails db:migrate

we broke the whole app
we tried to destrol Address model
we forgot to add account_id whe we generated the Address model

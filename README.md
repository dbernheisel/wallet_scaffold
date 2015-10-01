# Simple Checkbook

## Description
This is a simple practice application that simulates transactions, accounts, and entities (customers). This was built by first scaffolding the models/controllers/views, and then editing them to my liking. There is no JBuilder/JSON interface; it's only HTML.

ERD: https://www.lucidchart.com/documents/view/189a7898-8bc2-445b-8711-91b9cbcf7f0e

## Usage
1. Clone my repository
2. Run `bundle install`
3. Run `rake db:migrate`
4. Run `rails s`
5. Navigate to the localhost address, typically `http://localhost:3000`

## TODO
- [x] Scaffold Transactions (movements), Accounts, and Entity (customers)
- [x] Create dashboard (entity#show)
- [ ] Update this readme
- [ ] Write tests (unfortunately didn't do TDD)

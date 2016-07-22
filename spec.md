# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
  I <3 Sinatra?
- [x] Use ActiveRecord for storing information in a database
  I am using ActiveRecord for model associations.
- [x] Include more than one model class (list of model class names e.g. User, Post, Category)
  There are users, comments, dinners, dishes, reservations (a join table between users and dinners), and dinner_dishes (a join table between dinners and dishes).
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Posts)
  User has many reservations, dinner has many dinner_dishes, dishes has many comments, etc.
- [x] Include user accounts
  There is a user class with secure passwords and emails.
- [x] Ensure that users can't modify content created by other users
  The Controllers check that logged in users match the owners of the content before making any changes to the DB.
- [x] Include user input validations
  Users must submit their email in _@_._ form. Passwords, emails, cannot be blank.
- [x] Display validation failures to user with error message (example form URL e.g. /posts/new)
  Using flash messages to tell users when they are not logged in or when they are trying to edit someone elses content.
- [X] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message

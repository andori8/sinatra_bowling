# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
- [x] Use ActiveRecord for storing information in a database
#Used methods from ActiveRecord such as create, save, and update to save information into databse.
- [x] Include more than one model class (list of model class names e.g. User, Post, Category)
#Ball and User are the two model classes used
- [x] Include at least one has_many relationship on your User model (x has_many y, e.g. User has_many Posts)
#User has_many Balls
- [x] Include at least one belongs_to relationship on another model (x belongs_to y, e.g. Post belongs_to User)
#Ball belongs to User
- [x] Include user accounts
#Made possible through the use of sessions
- [x] Ensure that users can't modify content created by other users
#Created a logged_in? and current_user helper methods to distinguish between users
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
#BallsController meets CRUD criteria
- [x] Include user input validations
#has_secure_password and #empty? used to validate inputs.
- [x] Display validation failures to user with error message (example form URL e.g. /posts/new)
#rack flash used for error messages
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message

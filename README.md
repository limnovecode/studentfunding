[![Code Climate](https://codeclimate.com/github/limnovecode/studentfunding/badges/gpa.svg)](https://codeclimate.com/github/limnovecode/studentfunding) [![Build Status](https://travis-ci.org/limnovecode/studentfunding.svg?branch=master)](https://travis-ci.org/limnovecode/studentfunding)

# Student Funding
A basic ruby on rails 4.2 application for a Heroku Deployment.

### Setup

rails g admin:scaffold_controller Administrator slug:string email:string password_digest:string authentication_token:string reset_password_token:string reset_password_sent_at:datetime sudo:boolean --prefix_name=adminboard --parent_controller=adminboard

rails g model Administrator slug:string email:string password_digest:string authentication_token:string reset_password_token:string reset_password_sent_at:datetime sudo:boolean


###############

bin/rails g admin:scaffold_controller School title:string description:text active:boolean --prefix_name=adminboard --parent_controller=adminboard

bin/rails g model School title:string description:text active:boolean

---------------------------------

bin/rails g admin:scaffold_controller Store title:string description:text active:boolean --prefix_name=adminboard --parent_controller=adminboard

bin/rails g model Store title:string description:text active:boolean

---------------------------------

bin/rails g admin:scaffold_controller Receipt school:references store:references reference:integer amount:decimal purchased:date status:string --prefix_name=schoolboard --parent_controller=schoolboard

bin/rails g model Receipt school:references store:references reference:integer amount:decimal purchased:date status:string

###############

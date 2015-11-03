[![Code Climate](https://codeclimate.com/github/limnovecode/studentfunding/badges/gpa.svg)](https://codeclimate.com/github/limnovecode/studentfunding) [![Build Status](https://travis-ci.org/limnovecode/studentfunding.svg?branch=master)](https://travis-ci.org/limnovecode/studentfunding)

# Student Funding
A basic ruby on rails 4.2 application for a Heroku Deployment.

### Setup

rails g admin:scaffold_controller Administrator slug:string email:string password_digest:string authentication_token:string reset_password_token:string reset_password_sent_at:datetime sudo:boolean --prefix_name=adminboard --parent_controller=adminboard

rails g model Administrator slug:string email:string password_digest:string authentication_token:string reset_password_token:string reset_password_sent_at:datetime sudo:boolean

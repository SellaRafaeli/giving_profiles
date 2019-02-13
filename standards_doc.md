# STANDARDS DOC

# DEPENDENCIES

Rails

Bundler

rbenv

ruby version: ruby 2.6.1p33 (2019-01-30 revision 66950) [x86_64-darwin15]

Homebrew

postgresql

Bootstrap

# HOW TO INSTALL DEPENDENCIES  

# Install rails on your mac system
Adding rails to your computer: https://www.dropbox.com/s/n9vxbzk47t8abq7/Mac%20Setup.pdf?dl=0

### Make sure you have homebrew installed

if not install it [here](https://brew.sh/)

First step install postgresql
~~~~
brew install postgresql
~~~~
~~~~
brew tap homebrew/services
~~~~
You are going to need postgresql up and running
~~~~
brew services start postgresql
~~~~
~~~~
brew install rbenv
~~~~
~~~~
brew upgrade rbenv ruby-build
~~~~
~~~~
rbenv init
~~~~
If you have not already, go in to the 'giving_profiles' folder
~~~~
cd giving_profiles
~~~~
Check your ruby version
~~~~
ruby -v
~~~~
for this project you will need 2.6.1, if its not the proper version try
~~~~
export PATH="$HOME/.rbenv/shims:$PATH"
~~~~
~~~~
rbenv install 2.6.1
~~~~

# HOW TO SET UP THIS SITE FOR YOUR COMPUTER
In the folder where you cloned the project:
1. `bundle`
2. `rails db:create`
3. `rails db:migrate`
4. `rails db:seed`
5. `rails server` or simply `rails s`

# HOW TO START
1. CD into cloned project file
2. rails s
  _be sure that you are on the correct version of ruby. Otherwise you will need to run `export PATH="$HOME/.rbenv/shims:$PATH"`_
3. enter localhost:3000 into the browser

# Git Workflow
**Address with group**

# Best Practices
**Address with group**

# Style guide
Please refer to Zeplin board

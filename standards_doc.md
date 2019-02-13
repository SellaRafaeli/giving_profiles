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
Adding rails to your computer: https://www.dropbox.com/s/n9vxbzk47t8abq7/Mac%20Setup.pdf?dl=0

`brew install postgresql`

`brew tap homebrew/services`

`brew services start postgresql`

`brew install rbenv`

if you have rbenv installed `brew upgrade rbenv ruby-build` (edited)

`rbenv init`

`cd` into repository

`ruby -v`

`rbenv install 2.6.1`

if ruby defaults to old version on Mac: `export PATH="$HOME/.rbenv/shims:$PATH"`

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

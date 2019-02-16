# STANDARDS DOC

# DEPENDENCIES

* Rails v5.2.2
* Bundler
* Ruby 2.6.1
* [Homebrew](https://brew.sh/) 
	* postgresql
	* Suggested: rbenv or rvm
* Bootstrap

# HOW TO INSTALL DEPENDENCIES  

## Install rails on your mac system
Adding rails to your computer: [Mac Setup.pdf](https://www.dropbox.com/s/n9vxbzk47t8abq7/Mac%20Setup.pdf?dl=0)

### Once Homebrew is installed

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

### Set Ruby local version for 'giving_profiles' project
~~~~
cd giving_profiles
~~~~
Check your ruby version
~~~~
ruby -v
~~~~
For this project you will need 2.6.1, if its not the listed version 
~~~~
export PATH="$HOME/.rbenv/shims:$PATH"
~~~~
~~~~
rbenv install 2.6.1
~~~~
~~~~
rbenv local 2.6.1
~~~~

# FIRST TIME RUNNING THE APPLICATION
Within the `giving_profiles` directory:
1. `bundle`
1. `touch giving_profiles/config/database.yml`
1. `rails db:create`
1. `rails db:migrate`
1. `rails db:seed`
1. `rails server` or simply `rails s`

# HOW TO START THE SERVER
~~~~
cd giving_profiles
~~~~
~~~~
rails s
~~~~
  _be sure that you are on the correct version of ruby. Otherwise you will need to run `export PATH="$HOME/.rbenv/shims:$PATH"`_

Enter `localhost:3000` into the browser.


# Git Workflow
1. Create a new branch when you work on features. 
2. Keep your branch up to date: `git fetch --all` followed by `git rebase origin/master`.
3. When you have completed your feature, [create a pull request](https://help.github.com/articles/creating-a-pull-request/).


# Best Practices
* Tests are important. Higher test coverage 85%. We strive to this because it is an open source project, and mostly created by junior developers. 
* Code Coverage
* Pair programming is encouraged. 
   *  A.S.K. Feedback (actionable, specific, kind)
   *  Check in with your partner
   *  50/50 driving and navigating. 
* Choose technologies that are popular and easy to implement and teach. 


# Style guide
* Please refer to [Zeplin board](zpl.io/aXwdmyx). Message team for access.
* Follow [AirBNB Style Guide](https://github.com/airbnb/ruby)

[![Build Status](https://travis-ci.org/the-guitarman/ruby_doc_slack_bot.svg?branch=master)](https://travis-ci.org/the-guitarman/ruby_doc_slack_bot)
[![Code Climate](https://codeclimate.com/github/the-guitarman/ruby_doc_slack_bot/badges/gpa.svg)](https://codeclimate.com/github/the-guitarman/ruby_doc_slack_bot)
[![Built with Spacemacs](https://cdn.rawgit.com/syl20bnr/spacemacs/442d025779da2f62fc86c2082703697714db6514/assets/spacemacs-badge.svg)](http://github.com/syl20bnr/spacemacs)

# Ruby Doc - Slack Bot

This is a slack bot client test project. You can send it the name of a ruby class, module or method and it will answer you with some documentation details. 

## Installation

This project assumes a running and up to date rvm (ruby version manager). Therefore please have a look to [rvm.io](http://rvm.io/)

At first, you need to install the ruby interpreter. Please open a terminal window and type in.

`rvm install ruby-2.3.0`

Now, clone the project from github:

`git clone git@github.com:the-guitarman/ruby_doc_slack_bot.git`

Next, enter the project directory. You need to trust the `.rvmrc` settings. This creates the rvm gemset.

`cd ruby_doc_slack_bot`

In the next step you need to install the bundler gem. 

`gem install bundler`

With the bundler in place you can now install the needed ruby gems within the previous created gemset. Please type: 

`bundle install`

In the last installation step you generate the ri documentation which the bot will use. 

`rvm docs generate-ri`

### Gems used by this project

[slack-ruby-client](https://rubygems.org/gems/slack-ruby-client)

This gem is new but it has a lot of users and the last update is a month ago only. It implements a slack client only. Nothing more is needed. 

## Usage

### Start the bot

To run the bot you need a slack api token. Therefore create a new slack [bot](https://slack.com/services/new/bot), note the api token and provide it as an environment variable:

`SLACK_API_TOKEN=<your-token-goes-here> ruby bot.rb`

The will greet with the words "Successfully connected." in your terminal window.

### Ask the bot

At the moment there are some few commands.

Send `bot hi` and it will geet you.

Send the name of a ruby class, module or method name and it will send you an answer from the ri docs. (Example: `Array#first` or `Hash#map`)

### Stop the bot

To stop the bot press:

`ctrl + c`

## Tests

### Prepare test run

`bundle install --binstubs`

To run the tests at your local machine you may need to prepare it before.

### Run it

`bin/rspec --format doc``

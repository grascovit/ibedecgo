[![Build Status](https://travis-ci.org/grascovit/ibedecgo.svg?branch=master)](https://travis-ci.org/grascovit/ibedecgo)
[![Code Climate](https://codeclimate.com/github/grascovit/ibedecgo/badges/gpa.svg)](https://codeclimate.com/github/grascovit/ibedecgo)
[![codecov](https://codecov.io/gh/grascovit/ibedecgo/branch/develop/graph/badge.svg)](https://codecov.io/gh/grascovit/ibedecgo)

# IBEDEC-GO

#### Setup
To run the app, follow the steps below:
```shell
bundle install
bundle exec figaro install
```
Create a PostgreSQL user named `ibedecgo` like this:
```shell
sudo -u postgres createuser -s ibedecgo
sudo -u postgres psql
\password ibedecgo
\q
```
The `figaro` gem (installed on the first step) will generate the unversioned file `config/application.yml`. Copy and paste the content from `config/application.yml.example` to `config/application.yml` and fill in the data needed.

After this, execute the following steps:
```shell
rake db:create
rake db:migrate
```
Finally, run the app:
```shell
rails s
```

#### Tests and coverage
Run the tests using:
```shell
bundle exec rspec
```
You can check the coverage for the project opening the `coverage/index.html` generated every time you run the RSpec.

#### Commit
Before pushing a commit, be sure to run the Rubocop and the tests:
```shell
rubocop
bundle exec rspec
```
# Test-driving Your Rails Infrastructure with Chef

Managing your infrastructure with configuration management tools like Chef melds the practices of development and operations together. This workshop will focus on a development practice - Test Driven Development - and how that method can be applied to managing your Rails infrastructure and deployments. You will learn how to: Analyze your application and define your infrastructure needs (databases, load balancers, etc.), define unique infrastructure requirements for Rails applications (i.e. asset pipeline), capture your requirements in tests using Test Kitchen, ServerSpec, and other frameworks.

This workshop is being offered at [RailsConf 2015](http://railsconf.com/).

## Why are we here?

During the workshop we will provide an introduction to Infrastructure as Code and to [Chef](http://chef.io).

Participants of the workshop will complete hands-on labs that will practice test-driven infrastructure code development.

Our goal is to build the infrastructure required to run a [basic Rails application](https://github.com/nellshamrell/widgetworld).

## Infrastructure Requirements

The various requirements for our infrastructure include:

* A linux-based operating system - Ubuntu 12.04
* Ruby
* An application server - [Phusion Passenger for Apache](https://www.phusionpassenger.com/)
* A relational database management system - [PostgreSQL Database](http://www.postgresql.org/)
* A Rails application - [Widget World](https://github.com/nellshamrell/widgetworld)


### Ruby

Our application will use Ruby 2.2.2.  We have created a debian package that targets our operating system (Ubuntu 12.04).  The package was built with [FPM](https://rubygems.org/gems/fpm/versions/1.3.3) using the `build_ruby.sh` script in this repository.  

The following steps were taken to build the package:

1. Provision an Ubuntu 12.04 instance on Amazon's EC2 using ami-00615068
1. Run the `build_ruby.sh` script on that instance
1. Publish the resulting debian package to s3 at - [https://s3.amazonaws.com/chef-railsconf-2015/ruby-2.2.2_amd64.deb]( https://s3.amazonaws.com/chef-railsconf-2015/ruby-2.2.2_amd64.deb)

The sha256sum of the published package is `6ea925b1b610a722375971100951866ce0c182b5d47bf714debd0d0b95d9f6d`





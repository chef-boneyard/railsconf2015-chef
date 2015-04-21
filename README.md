# Test-driving Your Rails Infrastructure with Chef

Managing your infrastructure with configuration management tools like Chef melds the practices of development and operations together. This workshop will focus on a development practice - Test Driven Development - and how that method can be applied to managing your Rails infrastructure and deployments. You will learn how to: Analyze your application and define your infrastructure needs (databases, load balancers, etc.), define unique infrastructure requirements for Rails applications (i.e. asset pipeline), capture your requirements in tests using Test Kitchen, ServerSpec, and other frameworks.

This workshop is being offered at [RailsConf 2015](http://railsconf.com/).

## Why are we here?

During the workshop we will provide an introduction to Infrastructure as Code and to [Chef](http://chef.io).

Participants of the workshop will complete hands-on labs that will practice test-driven infrastructure code development.

Our goal is to build the infrastructure required to run a [basic Rails application](https://github.com/nellshamrell/widgetworld).

**NOTE**:  While we will be following a test-driven approach and the end result should work, we won't necessarily be following all of the best-practices for everything we build.

## This Repository

The master branch is where we start.  There are many other branches here that build on one another working toward a working example.

* [master](https://github.com/chef/railsconf2015-chef)
* [labs/widget_world_ruby](https://github.com/chef/railsconf2015-chef/tree/labs/widget_world_ruby) - a cookbook to install Ruby 2.2.2
* [labs/widget_world_apache](https://github.com/chef/railsconf2015-chef/tree/labs/widget_world_apache) - a cookbook to install Apache
* [labs/widget_world_passenger](https://github.com/chef/railsconf2015-chef/tree/labs/widget_world_passenger) - a cookbook for managing Passenger
* [labs/widget_world_postgres](https://github.com/chef/railsconf2015-chef/tree/labs/widget_world_postgres) - a cookbook for PostgreSQL
* [labs/widget_world_application](https://github.com/chef/railsconf2015-chef/tree/labs/widget_world_application) - the fully deployed application
* [labs/foodcritic](https://github.com/chef/railsconf2015-chef/tree/labs/foodcritic) - Fix a foodcritic violation or two

## Infrastructure Requirements

The various requirements for our infrastructure include:

* A linux-based operating system - Ubuntu 12.04
* Ruby
* An application server - [Phusion Passenger for Apache](https://www.phusionpassenger.com/)
* A relational database management system (RDBMS) - [PostgreSQL Database](http://www.postgresql.org/)
* A Rails application - [Widget World](https://github.com/nellshamrell/widgetworld)

#### Ruby

Our application will use Ruby 2.2.2.  We have created a debian package that targets our operating system (Ubuntu 12.04).  The package was built with [FPM](https://rubygems.org/gems/fpm/versions/1.3.3) using the [build_ruby.sh](build_ruby.sh) script in this repository.

The following steps were taken to build the package:

1. Provision an Ubuntu 12.04 instance on Amazon's EC2 using ami-00615068
1. Run the `build_ruby.sh` script on that instance
1. Publish the resulting debian package to s3 at - [https://s3.amazonaws.com/chef-railsconf-2015/ruby-2.2.2_amd64.deb]( https://s3.amazonaws.com/chef-railsconf-2015/ruby-2.2.2_amd64.deb)

Build a [Widget World Ruby Cookbook](ruby_cookbook.md).

#### Application Server

Our application will use [Phusion Passenger for Apache](https://www.phusionpassenger.com/).  There may be other applications within our company that require Apache, but not Passenger.  We will manage both components in individual cookbooks.

Build the following cookbooks:

* [Widget World Apache Cookbook](apache_cookbook.md)
* [Widget World Passenger Cookbook](passenger_cookbook.md)

#### RDBMS

Our application will use [PostgreSQL](http://www.postgresql.org/) version 9.1.

Build a [Widget World PostgreSQL Cookbook](postgres_cookbook.md).

#### Rails Application

Our Rails Application is [available on GitHub](https://github.com/nellshamrell/widgetworld/releases).  Deploy the [initial release (v 0.0.1)](https://github.com/nellshamrell/widgetworld/releases) of this application.  This is the most advanced cookbook we'll create.

Build a [Widget World Application Cookbook](application_cookbook.md)

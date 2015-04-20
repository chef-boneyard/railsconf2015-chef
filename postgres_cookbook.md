# Widget World Database Cookbook

#### Cookbook name

widget_world_postgres

#### Expected results

* PostgreSQL version 9.1 is running

#### Important details

* This cookbook **cannot** be easily tested on the provided workstation.  Digital Ocean is a great alternative.
* Converging the node a second time should not update any resources.

#### Documentation and Hints

* The default package manager configured with the operating system should provide PostgreSQL version 9.1.
* [PostgreSQL install instructions for Ubuntu](https://help.ubuntu.com/community/PostgreSQL)
* [Chef Resource Reference](http://docs.chef.io/resources.html)
  * [execute resource](http://docs.chef.io/resource_execute.html)
  * [package resource](http://docs.chef.io/resource_package.html)
  * [template resource](http://docs.chef.io/resource_template.html)
* [Documentation for including recipes](https://docs.chef.io/recipes.html#include-recipes)

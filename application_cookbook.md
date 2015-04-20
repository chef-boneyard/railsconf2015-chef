# Widget World Application Cookbook

#### Cookbook name
widget_world_application

#### Expected results

* An http request shows the home page of the application
* An application user (named 'deploy') can edit the files for the application
* The deploy user has sudo access
* The database includes an application user (named 'widgetworld')

#### Important details

* Order of execution matters for some parts of setting up a Rails application.  Consider more than just the end state as when writing the recipes.
* Converging the node a second time should not update any resources.

#### Documentation and Hints

* [Chef Resource Reference](http://docs.chef.io/resources.html)
  * [Resource notifications](http://docs.chef.io/resources.html#notifications)
  * [Guard attributes](http://docs.chef.io/resources.html#guards)
  * [Sensitive attribute](http://docs.chef.io/resources.html#attributes)
  * [directory resource](http://docs.chef.io/resource_directory.html)
  * [execute resource](http://docs.chef.io/resource_execute.html)
  * [gem_package resource](http://docs.chef.io/resource_gem_package.html)
  * [group resource](http://docs.chef.io/resource_group.html)
  * [link](http://docs.chef.io/resource_link.html)
  * [package resource](http://docs.chef.io/resource_package.html)
  * [remote_file resource](http://docs.chef.io/resource_remote_file.html)
  * [template resource](http://docs.chef.io/resource_template.html)
  * [user resource](http://docs.chef.io/resource_user.html)
* [Documentation for including recipes](https://docs.chef.io/recipes.html#include-recipes)

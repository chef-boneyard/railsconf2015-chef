# Widget World Passenger Cookbook

#### Cookbook name
widget_world_passenger

#### Expected results

* Phusion Passenger version 5.0.6 is installed.

#### Important details

* Converging the node a second time should not update any resources.

#### Documentation and Hints

* Phusion documentation on [installing or upgrading passenger on Debian or Ubuntu](https://www.phusionpassenger.com/documentation/Users%20guide%20Apache.html#install_on_debian_ubuntu).
* When you write this recipe, think carefully about the *desired state* of the system, not the step-by-step installation process outlined in the docs.
* The [apt cookbook](https://supermarket.chef.io/cookbooks/apt) on the [Supermarket](https://supermarket.chef.io) includes a resource to help manage apt repositories.
* `passenger -v` will show you the version of Passenger that is installed.
* [Chef Resource Reference](http://docs.chef.io/resources.html)

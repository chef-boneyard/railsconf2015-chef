# Widget World Ruby Cookbook

#### Cookbook name
widget_world_ruby

#### Expected results

* ruby 2.2.2 is installed

#### Important details

* A ruby-2.2.2 debian package is available at [https://s3.amazonaws.com/chef-railsconf-2015/ruby-2.2.2_amd64.deb]( https://s3.amazonaws.com/chef-railsconf-2015/ruby-2.2.2_amd64.deb)
* The sha256sum of that package is `6ea925b1b610a722375971100951866ce0c182b5d47bf714debd0d0b95d9f6d`
* This cookbook can be built and tested on the provided workstation.
* Converging the node a second time should not update any resources.

#### Documentation and Hints

* [Chef Resource Reference](http://docs.chef.io/resources.html)
  * [dpkg_package resource](http://docs.chef.io/resource_dpkg_package.html)
  * [package resource](http://docs.chef.io/resource_package.html)
  * [remote_file resource](http://docs.chef.io/resource_remote_file.html)

# Unidom Contact Roadmap 联系方式领域模型引擎路线图

## v0.1
1. Contact Subscription model & migration (20010301000000)
2. Email Address model & migration (20010302000000)

## v0.2
1. Improved the Contact Subscription model to include the Model Extension concern
2. Improved the Email Address model to include the Model Extension concern

## v0.3
1. Improved the Contact Subscription model to add the .``subscribe`` method
2. Improved the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v0.5

## v0.3.1
1. Improved the Contact Subscription model to enhance the keyword arguments of the .``subscribe`` method

## v0.4
1. Improve the Contact Subscription model to add the #``subscribe!`` method
2. Improve the Contact Subscription model to deprecate the #``subscribe`` method
3. Improve the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v0.9

## v1.0
1. Improve the Contact Subscription model to support the Keyword Arguments
2. Improve the Contact Subscription model to remove the deprecated methods

## v1.0.1
1. Improve the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.0

## v1.1
1. As Contact concern
2. As Subscriber concern
3. Improve the Email Address model to include the As Contact concern

## v1.2
1. As Email Address Subscriber concern
2. Improve the As Contact concern to add the #``is_subscribed_as_contact!`` method
3. Improve the As Subscriber concern to add the #``subscribe_contact!`` method

## v1.3
1. Improve the As Contact concern to add the #``is_subscribed_as_contact?`` method
2. Improve the As Contact concern for the #``is_subscribed_as_contact!`` method
3. Improve the As Subscriber concern to add the #``subscribe_contact?`` method
4. Improve the As Subscriber concern for the #``subscribe_contact!`` method
5. Improve the Contact Subscription model for the .``subscribe!`` method

## v1.3.1
1. Improve the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.6

## v1.3.2
1. Improve the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.7

## v1.3.3
1. Improve the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.7.1

## v1.3.4
1. Improve the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.8
2. Improve the Engine class to include the Engine Extension concern

## v1.3.5
1. Improve the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.9
2. Improve the models to support the namespace neglecting

## v1.4
1. Models RSpec examples manifest
2. Types RSpec examples manifest
3. Validators RSpec examples manifest

## v1.4.1
1. Improve the Contact Subscription spec for the validations on the #``name`` attribute
2. Improve the Email Address spec for the validations on the #``full_address`` attribute
3. Improve the Email Address model for the ``before_validation`` callback

## v1.4.2
1. Improve the Contact Subscription spec for the ``belongs_to :contact, polymorphic: true`` macro
2. Improve the Email Address spec for the ``full_address_is`` scope, the ``local_part_is`` scope, & the ``domain_part_is`` scope

## v1.4.3
1. Improve the Contact Subscription spec for the ``contact_is`` scope

## v1.4.4
1. As Contact shared examples
2. As Subscriber shared examples
3. RSpec shared examples manifest
4. Improve the Email Address spec for the As Contact concern

## v1.4.5
1. Improve the Contact Subscription spec for the validations on the #``name`` attribute
2. Improve the Email Address spec for the validations on the #``personalized_name`` attribute

## v1.4.6
1. Improve the Ruby Gem Specification to depend on the unidom-common v1.10
2. Improve the Contact Subscription migration & the Email Address migration for the #opened_at column, & the #closed_at column

## v1.5
1. Landline Phone Number model & migration
2. As Landline Phone Number Subscriber concern

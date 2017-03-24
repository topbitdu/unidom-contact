# Unidom Contact 联系方式领域模型引擎

[![Documentation](http://img.shields.io/badge/docs-rdoc.info-blue.svg)](http://www.rubydoc.info/gems/unidom-contact/frames)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](http://opensource.org/licenses/MIT)

[![Gem Version](https://badge.fury.io/rb/unidom-contact.svg)](https://badge.fury.io/rb/unidom-contact)
[![Dependency Status](https://gemnasium.com/badges/github.com/topbitdu/unidom-contact.svg)](https://gemnasium.com/github.com/topbitdu/unidom-contact)

Unidom (UNIfied Domain Object Model) is a series of domain model engines. The Contact domain model engine includes Contact Subscription and Email Address models.
Unidom (统一领域对象模型)是一系列的领域模型引擎。联系方式领域模型引擎包括联系方式订阅和电子邮箱地址的模型。



## Recent Update

Check out the [Road Map](ROADMAP.md) to find out what's the next.
Check out the [Change Log](CHANGELOG.md) to find out what's new.



## Usage in Gemfile

```ruby
gem 'unidom-contact'
```



## Run the Database Migration

```shell
rake db:migrate
```
The migration versions start with 200103.



## Call the Model

```ruby
contact      = Unidom::Contact::China::MobilePhoneNumber.phone_number_is('13912345678').valid_at.alive.first_or_create!
subscriber   = Unidom::Party::Person.create! name: 'John'
subscription = Unidom::Contact::ContactSubscription.subscribe! contact: contact, subscriber: subscriber, name: 'John Mobile', primary: true, grade: 0, priority: 0, opened_at: Time.now
# or
subscription = Unidom::Contact::ContactSubscription.subscribe! contact: contact, subscriber: subscriber
# Associate the subscriber & the contact

Unidom::Contact::ContactSubscription.subscribed_by(subscriber).valid_at.alive
# Get a list of all contact subscriptions of subscriber

Unidom::Contact::ContactSubscription.contact_is(contact).valid_at.alive
# Get a list of all contact subscriptions of contact

Unidom::Contact::EmailAddress.full_address_is('topbit.du@gmail.com').first
# Find the Email Address

```



## Include the Concerns

```ruby
include Unidom::Contact::Concerns::AsContact
include Unidom::Contact::Concerns::AsSubscriber
include Unidom::Contact::Concerns::AsEmailAddressSubscriber
```

### As Contact concern

The As Contact concern do the following tasks for the includer automatically:

1. Define the has_many :contact_subscriptions macro as: ``has_many :contact_subscriptions, class_name: 'Unidom::Contact::ContactSubscription', as: :contact``

2. Define the #is_subscribed_as_contact! method as: ``is_subscribed_as_contact!(by: nil, at: Time.now, name: by.try(:name), primary: true)``

3. Define the #is_subscribed_as_contact? method as: ``is_subscribed_as_contact?(by: nil, at: Time.now, primary: true)``

### As Subscriber concern

The As Subscriber concern do the following tasks for the includer automatically:

1. Define the has_many :contact_subscriptions macro as: ``has_many :contact_subscriptions, class_name: 'Unidom::Contact::ContactSubscription', as: :subscriber``

2. Define the #subscribe_contact! method as: ``subscribe_contact!(contact, at: Time.now, name: nil, primary: true)``

3. Define the #subscribe_contact? method as: ``subscribe_contact?(contact, at: Time.now, primary: true)``

### As Email Address Subscriber concern

The As Email Address Subscriber concern do the following tasks for the includer automatically:

1. Include the As Subscriber concern

2. Define the has_many :email_addresses macro as: ``has_many :email_addresses, through: :contact_subscriptions, source: :contact, source_type: 'Unidom::Contact::EmailAddress'``



## Disable the Model & Migration

If you only need the app components other than models, the migrations should be neglected, and the models should not be loaded.
```ruby
# config/initializers/unidom.rb
Unidom::Common.configure do |options|

  options[:neglected_namespaces] = %w{
    Unidom::Contact
  }

end
```



## RSpec examples

### RSpec example manifest (run automatically)

```ruby
# spec/models/unidom_spec.rb
require 'unidom/contact/models_rspec'

# spec/types/unidom_spec.rb
require 'unidom/contact/types_rspec'

# spec/validators/unidom_spec.rb
require 'unidom/contact/validators_rspec'
```

### RSpec shared examples (to be integrated)

```ruby
# lib/unidom.rb
def initialize_unidom

  Unidom::Party::Person.class_eval do
    include Unidom::Contact::Concerns::AsSubscriber
  end

  #Unidom::Contact::EmailAddress.class_eval do
  #  include Unidom::Contact::Concerns::AsContact
  #end

end

# spec/rails_helper.rb
require 'unidom'
initialize_unidom

# spec/support/unidom_rspec_shared_examples.rb
require 'unidom/contact/rspec_shared_examples'

# spec/models/unidom/party/person_spec.rb
describe Unidom::Party::Person do

  model_attribtues = {
    name: 'Tim'
  }

  it_behaves_like 'Unidom::Contact::Concerns::AsSubscriber', model_attribtues

end

# spec/models/unidom/contact/email_address_spec.rb
describe Unidom::Position::Post do

  model_attributes = {
      personalized_name: 'Tim Jason',
      full_address:      'tim.jason@company.com'
    }

  it_behaves_like 'Unidom::Contact::Concerns::AsContact', model_attributes

end
```

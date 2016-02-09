# Unidom Contact 联系方式领域模型引擎

[![License](https://img.shields.io/badge/license-MIT-green.svg)](http://opensource.org/licenses/MIT)
[![Gem Version](https://badge.fury.io/rb/unidom-contact.svg)](https://badge.fury.io/rb/unidom-contact)

Unidom (UNIfied Domain Object Model) is a series of domain model engines. The Contact domain model engine includes Contact Subscription and Email Address models.
Unidom (统一领域对象模型)是一系列的领域模型引擎。联系方式领域模型引擎包括联系方式订阅和电子邮箱地址的模型。

## Usage in Gemfile:
```ruby
gem 'unidom-contact'
```

## Run the Database Migration:
```shell
rake db:migrate
```

## Call the Model:
```ruby
Unidom::Contact::ContactSubscription.subscribed_by(subscriber).valid_at.alive.first
Unidom::Contact::EmailAddress.full_address_is('topbit.du@gmail.com').first
```

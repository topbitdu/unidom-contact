module Unidom::Contact::Concerns::AsSubscriber

  extend ActiveSupport::Concern

  included do |includer|

    has_many :contact_subscriptions, class_name: 'Unidom::Contact::ContactSubscription', as: :subscriber

    def subscribe_contact!(contact, at: Time.now, name: nil)

      raise ArgumentError.new('The contact argument is required.') if contact.blank?
      raise ArgumentError.new('The at argument is required.'     ) if at.blank?

      contact_subscriptions.create! contact: contact, opened_at: at, name: name||self.name

    end

  end

end

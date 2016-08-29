module Unidom::Contact::Concerns::AsContact

  extend ActiveSupport::Concern

  included do |includer|

    has_many :contact_subscriptions, class_name: 'Unidom::Contact::ContactSubscription', as: :contact

    def is_subscribed_as_contact!(by: nil, at: Time.now, name: by.try(:name))

      raise ArgumentError.new('The by argument is required.') if by.blank?
      raise ArgumentError.new('The at argument is required.') if at.blank?

      contact_subscriptions.create! subscriber: by, opened_at: at, name: name

    end

  end

end

module Unidom::Contact::Concerns::AsContact

  extend ActiveSupport::Concern

  included do |includer|

    has_many :contact_subscriptions, class_name: 'Unidom::Contact::ContactSubscription', as: :contact

    def is_subscribed_as_contact!(by: nil, at: Time.now, name: by.try(:name), primary: true)

      raise ArgumentError.new('The by argument is required.') if by.blank?
      raise ArgumentError.new('The at argument is required.') if at.blank?

      contact_subscriptions.subscribed_by(by).valid_at(now: at).alive.first_or_create! name: name, elemental: primary, opened_at: at

    end

    def is_subscribed_as_contact?(by: nil, at: Time.now, primary: true)

      raise ArgumentError.new('The by argument is required.') if by.blank?
      raise ArgumentError.new('The at argument is required.') if at.blank?

      contact_subscriptions.subscribed_by(by).valid_at(now: at).alive.primary(primary).exists?

    end

  end

end

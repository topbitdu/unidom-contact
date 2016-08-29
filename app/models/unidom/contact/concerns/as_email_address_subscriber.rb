module Unidom::Contact::Concerns::AsEmailAddressSubscriber

  extend ActiveSupport::Concern

  include Unidom::Contact::Concerns::AsSubscriber

  included do |includer|

    has_many :email_addresses, through: :contact_subscriptions, source: :contact, source_type: 'Unidom::Contact::EmailAddress'

  end

end

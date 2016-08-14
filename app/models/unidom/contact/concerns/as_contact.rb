module Unidom::Contact::Concerns::AsContact

  extend ActiveSupport::Concern

  included do |includer|

    has_many :contact_subscriptions, class_name: 'Unidom::Contact::ContactSubscription', as: :contact

  end

end

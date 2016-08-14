module Unidom::Contact::Concerns::AsSubscriber

  extend ActiveSupport::Concern

  included do |includer|

    has_many :contact_subscriptions, class_name: 'Unidom::Contact::ContactSubscription', as: :subscriber

  end

end

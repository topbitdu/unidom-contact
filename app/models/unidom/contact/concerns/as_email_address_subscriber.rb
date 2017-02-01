##
# As Email Address Subscriber 是 e-Mail 联系人的领域逻辑关注点。

module Unidom::Contact::Concerns::AsEmailAddressSubscriber

  extend ActiveSupport::Concern

  include Unidom::Contact::Concerns::AsSubscriber

  included do |includer|

    has_many :email_addresses, through: :contact_subscriptions, source: :contact, source_type: 'Unidom::Contact::EmailAddress'

  end

end

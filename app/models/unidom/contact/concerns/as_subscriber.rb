##
# As Subscriber 是联系人的领域逻辑关注点。

module Unidom::Contact::Concerns::AsSubscriber

  extend ActiveSupport::Concern

  included do |includer|

    has_many :contact_subscriptions, class_name: 'Unidom::Contact::ContactSubscription', as: :subscriber

    ##
    # 将当前参与者与指定的联系方式 contact 关联起来。 at 是关联时间，缺省为当前时间。 name 是联系方式的备注。 primary 是主要联系标志。
    # 如： current_person.subscribe_contact! phone_number, at: Time.now, name: '私人手机号码', primary: true
    def subscribe_contact!(contact, at: Time.now, name: nil, primary: true)

      raise ArgumentError.new('The contact argument is required.') if contact.blank?
      raise ArgumentError.new('The at argument is required.'     ) if at.blank?

      contact_subscriptions.contact_is(contact).valid_at(now: at).alive.first_or_create! name: name||self.name, elemental: primary, opened_at: at

    end

    def subscribe_contact?(contact, at: Time.now, primary: true)

      raise ArgumentError.new('The contact argument is required.') if contact.blank?
      raise ArgumentError.new('The at argument is required.'     ) if at.blank?

      contact_subscriptions.contact_is(contact).valid_at(now: at).alive.primary(primary).exists?

    end

  end

end

##
# As Contact 是联系方式的领域逻辑关注点。

module Unidom::Contact::Concerns::AsContact

  extend ActiveSupport::Concern

  included do |includer|

    has_many :contact_subscriptions, class_name: 'Unidom::Contact::ContactSubscription', as: :contact

    ##
    # 将当前联系方式与指定的参与者 by 关联起来。 at 是关联时间，缺省为当前时间。 name 是联系方式的备注。 primary 是主要联系标志。
    # 如： phone_number.is_subscribed_as_contact! by: current_person, at: Time.now, name: '私人手机号码', primary: true
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

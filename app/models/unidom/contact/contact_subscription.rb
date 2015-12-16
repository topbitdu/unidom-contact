# Contact Subscription 是联系方式和参与者之间的关联关系。

class Unidom::Contact::ContactSubscription < ActiveRecord::Base

  self.table_name = 'unidom_contact_subscriptions'

  validates :name,     presence: true, length:       { in: 2..self.columns_hash['name'].limit }
  validates :grade,    presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 1000 }
  validates :priority, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 1000 }

  belongs_to :contact,    polymorphic: true
  belongs_to :subscriber, polymorphic: true

  scope :contact_is,    ->(contact)    { where contact:    contact    }
  scope :subscribed_by, ->(subscriber) { where subscriber: subscriber }

end

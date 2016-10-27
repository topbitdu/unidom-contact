# Contact Subscription 是联系方式和参与者之间的关联关系。

class Unidom::Contact::ContactSubscription < Unidom::Contact::ApplicationRecord

  self.table_name = 'unidom_contact_subscriptions'

  include Unidom::Common::Concerns::ModelExtension

  validates :name,     presence: true, length:       { in: 2..self.columns_hash['name'].limit }
  validates :grade,    presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 1000 }
  validates :priority, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 1000 }

  belongs_to :contact,    polymorphic: true
  belongs_to :subscriber, polymorphic: true

  scope :contact_is,    ->(contact)    { where contact:    contact    }
  scope :subscribed_by, ->(subscriber) { where subscriber: subscriber }

  def self.subscribe!(contact: nil, subscriber: nil, name: subscriber.try(:name), primary: true, grade: 0, priority: 0, opened_at: Time.now)
    contact_is(contact).subscribed_by(subscriber).valid_at(now: opened_at).alive.first_or_create! name: name, elemental: primary, grade: grade, priority: priority, opened_at: opened_at
  end

end

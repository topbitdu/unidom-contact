shared_examples 'Unidom::Contact::Concerns::AsSubscriber' do |model_attributes|

  context do

    contact_subscription_1_attribtues = {
        contact_id:   SecureRandom.uuid,
        contact_type: 'Unidom::Contact::Contact::Mock',
        name:         'Name #1',
        grade:        5,
        priority:     2
      }

    contact_subscription_2_attribtues = {
        contact_id:   SecureRandom.uuid,
        contact_type: 'Unidom::Contact::Contact::Mock',
        name:         'Name #2',
        grade:        2,
        priority:     4
      }

    it_behaves_like 'has_many', model_attributes, :contact_subscriptions, Unidom::Contact::ContactSubscription, [ contact_subscription_1_attribtues, contact_subscription_2_attribtues ]

  end

end

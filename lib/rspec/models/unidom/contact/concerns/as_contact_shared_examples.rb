shared_examples 'Unidom::Contact::Concerns::AsContact' do |model_attributes|

  context do

    contact_subscription_1_attribtues = {
        subscriber_id:   SecureRandom.uuid,
        subscriber_type: 'Unidom::Contact::Subscriber::Mock',
        name:            'Name #1',
        grade:           5,
        priority:        2
      }

    contact_subscription_2_attribtues = {
        subscriber_id:   SecureRandom.uuid,
        subscriber_type: 'Unidom::Contact::Subscriber::Mock',
        name:            'Name #2',
        grade:           2,
        priority:        4
      }

    it_behaves_like 'has_many', model_attributes, :contact_subscriptions, Unidom::Contact::ContactSubscription, [ contact_subscription_1_attribtues, contact_subscription_2_attribtues ]

  end

end

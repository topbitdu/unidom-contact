describe Unidom::Contact::ContactSubscription, type: :model do

  before :each do
  end

  after :each do
  end

  context do

    model_attributes = {
      contact_id:      SecureRandom.uuid,
      contact_type:    'Unidom::Contact::Contact::Mock',
      subscriber_id:   SecureRandom.uuid,
      subscriber_type: 'Unidom::Contact::Subscriber::Mock',
      name:            'Home'
    }

    it_behaves_like 'Unidom::Common::Concerns::ModelExtension', model_attributes

  end

end

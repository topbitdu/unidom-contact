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

    name_max_length = described_class.columns_hash['name'].limit

    it_behaves_like 'Unidom::Common::Concerns::ModelExtension', model_attributes

    it_behaves_like 'validates', model_attributes, :name,
      {             } => 0,
      { name: nil   } => 2,
      { name: ''    } => 2,
      { name: 'A'   } => 1,
      { name: 'Al'  } => 0,
      { name: 'Bob' } => 0,
      { name: 'A'*(name_max_length-1)  } => 0,
      { name: 'A'*name_max_length      } => 0,
      { name: 'A'*(name_max_length+1)  } => 1

    email_address_attributes = {
      personalized_name: 'Tim Jason',
      full_address:      'tim.jason@company.com'
    }

    it_behaves_like 'belongs_to', model_attributes, :contact, Unidom::Contact::EmailAddress, email_address_attributes

    it_behaves_like 'polymorphic scope', model_attributes, :contact_is, :contact, [ Unidom::Contact::EmailAddress ]

  end

end

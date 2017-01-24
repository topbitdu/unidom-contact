describe Unidom::Contact::EmailAddress, type: :model do

  before :each do
  end

  after :each do
  end

  context do

    model_attributes = {
      personalized_name: 'Tim Jason',
      full_address:      'tim.jason@company.com'
    }

    it_behaves_like 'Unidom::Common::Concerns::ModelExtension', model_attributes

  end

end

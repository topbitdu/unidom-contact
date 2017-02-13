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

    full_address_max_length = described_class.columns_hash['full_address'].limit

    it_behaves_like 'validates', model_attributes, :full_address,
      {                               } => 0,
      { full_address: nil             } => 2,
      { full_address: ''              } => 2,
      { full_address: 'l'             } => 1,
      { full_address: 'l@'            } => 1,
      { full_address: 'l@d'           } => 1,
      { full_address: 'l@us'          } => 0,
      { full_address: 'l@com'         } => 0,
      { full_address: 'l@jobs'        } => 0,
      { full_address: 'l@jobs.com.cn' } => 0,
      { full_address: "l@#{'c'*(full_address_max_length-6)}.de" } => 0,
      { full_address: "l@#{'c'*(full_address_max_length-5)}.de" } => 0,
      { full_address: "l@#{'c'*(full_address_max_length-4)}.de" } => 1

  end

end

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
    it_behaves_like 'Unidom::Contact::Concerns::AsContact',     model_attributes

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

    personalized_name_max_length = described_class.columns_hash['personalized_name'].limit
    it_behaves_like 'validates', model_attributes, :personalized_name,
      {                                    } => 0,
      { personalized_name: nil             } => 0,
      { personalized_name: ''              } => 0,
      { personalized_name: 'l'             } => 0,
      { personalized_name: 'l@'            } => 0,
      { personalized_name: 'l@d'           } => 0,
      { personalized_name: 'l@us'          } => 0,
      { personalized_name: 'l@com'         } => 0,
      { personalized_name: 'l@jobs'        } => 0,
      { personalized_name: 'l@jobs.com.cn' } => 0,
      { personalized_name: 'c'*(personalized_name_max_length-1) } => 0,
      { personalized_name: 'c'*personalized_name_max_length     } => 0,
      { personalized_name: 'c'*(personalized_name_max_length+1) } => 1

    it_behaves_like 'scope', :full_address_is, [
      { attributes_collection: [ model_attributes                                                 ], count_diff: 1, args: [ model_attributes[:full_address] ] },
      { attributes_collection: [ model_attributes                                                 ], count_diff: 0, args: [ 'tom.king@corporation.com'      ] },
      { attributes_collection: [ model_attributes.merge(full_address: 'tom.king@corporation.com') ], count_diff: 0, args: [ model_attributes[:full_address] ] },
      { attributes_collection: [ model_attributes.merge(full_address: 'tom.king@corporation.com') ], count_diff: 1, args: [ 'tom.king@corporation.com'      ] }
    ]

    it_behaves_like 'scope', :local_part_is, [
      { attributes_collection: [ model_attributes                                                 ], count_diff: 1, args: [ 'tim.jason' ] },
      { attributes_collection: [ model_attributes                                                 ], count_diff: 0, args: [ 'tom.king'  ] },
      { attributes_collection: [ model_attributes.merge(full_address: 'tom.king@corporation.com') ], count_diff: 0, args: [ 'tim.jason' ] },
      { attributes_collection: [ model_attributes.merge(full_address: 'tom.king@corporation.com') ], count_diff: 1, args: [ 'tom.king'  ] }
    ]

    it_behaves_like 'scope', :domain_part_is, [
      { attributes_collection: [ model_attributes                                                 ], count_diff: 1, args: [ 'company.com'     ] },
      { attributes_collection: [ model_attributes                                                 ], count_diff: 0, args: [ 'corporation.com' ] },
      { attributes_collection: [ model_attributes.merge(full_address: 'tom.king@corporation.com') ], count_diff: 0, args: [ 'company.com'     ] },
      { attributes_collection: [ model_attributes.merge(full_address: 'tom.king@corporation.com') ], count_diff: 1, args: [ 'corporation.com' ] }
    ]

  end

end

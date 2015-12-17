class CreateUnidomEmailAddresses < ActiveRecord::Migration

  def change

    create_table :unidom_email_addresses, id: :uuid do |t|

      # http://www.rfc-editor.org/errata_search.php?rfc=3696&eid=1690
      t.string :personalized_name, null: false, default: '', limit: 254
      t.string :full_address,      null: false, default: '', limit: 254
      t.string :local_part,        null: false, default: '', limit: 64
      t.string :domain_part,       null: false, default: '', limit: 255

      t.boolean :verified,  null: false, default: false

      t.column   :state, 'char(1)', null: false, default: 'C'
      t.datetime :opened_at,        null: false, default: ::Time.utc(1970)
      t.datetime :closed_at,        null: false, default: ::Time.utc(3000)
      t.boolean  :defunct,          null: false, default: false
      t.jsonb    :notation,         null: false, default: {}

      t.timestamps null: false

    end

    add_index :unidom_email_addresses, :full_address, unique: true
    add_index :unidom_email_addresses, :local_part
    add_index :unidom_email_addresses, :domain_part

  end

end

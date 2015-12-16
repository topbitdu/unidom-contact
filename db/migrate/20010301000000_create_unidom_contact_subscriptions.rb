class CreateUnidomContactSubscriptions < ActiveRecord::Migration

  def change

    create_table :unidom_contact_subscriptions, id: :uuid do |t|

      t.references :contact,    type: :uuid, null: false,
        polymorphic: { null: false, default: '', limit: 200 }
      t.references :subscriber, type: :uuid, null: false,
        polymorphic: { null: false, default: '', limit: 200 }

      t.string  :name,     null: false, default: '', limit: 32
      t.text    :description

      t.boolean :verified,  null: false, default: false
      t.boolean :elemental, null: false, default: false

      t.integer :grade,    null: false, default: 0
      t.integer :priority, null: false, default: 0

      t.column   :state, 'char(1)', null: false, default: 'C'
      t.datetime :opened_at,        null: false, default: ::Time.utc(1970)
      t.datetime :closed_at,        null: false, default: ::Time.utc(3000)
      t.boolean  :defunct,          null: false, default: false
      t.jsonb    :notation,         null: false, default: {}

      t.timestamps null: false

    end

    add_index :unidom_contact_subscriptions, :contact_id
    add_index :unidom_contact_subscriptions, :subscriber_id

  end

end

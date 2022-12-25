class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|

      t.string :organization_name,null: false
      t.string :contact_number,null: false
      t.string :contact_postcode
      t.string :contact_address
      t.boolean :contact_status,null: false,default: true
      t.string :counterparty_post
      t.string :counterparty_name
      t.integer :employees
      t.string :website
      t.string :remarks


      t.timestamps
    end
  end
end

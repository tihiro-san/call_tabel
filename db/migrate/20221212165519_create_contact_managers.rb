class CreateContactManagers < ActiveRecord::Migration[6.1]
  def change
    create_table :contact_managers do |t|
      
      t.integer :user_id, null:false
      t.integer :contact_id, null:false
      t.timestamps
    end
  end
end

class CreateValuatuons < ActiveRecord::Migration[6.1]
  def change
    create_table :valuatuons do |t|
      
      t.integer :grade, null:false
      t.integer :rank_content, null:false
      
      
      t.timestamps
    end
  end
end

class CreateValuatuons < ActiveRecord::Migration[6.1]
  def change
    create_table :valuatuons do |t|
      
      t.integer :grade, default:0,null:false,limit:1
      t.string :rank_content, null:false
      
      
      t.timestamps
    end
  end
end

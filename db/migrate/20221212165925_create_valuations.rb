class CreateValuations < ActiveRecord::Migration[6.1]
  def change
    create_table :valuations do |t|
      
      t.integer :grade, default:0,null:false,limit:1
      t.string :rank_content, null:false
      
      
      t.timestamps
    end
  end
end

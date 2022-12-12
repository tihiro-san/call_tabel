class CreateCallHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :call_histories do |t|

      t.integer :user_id, null:false
      t.integer :cintact_id, null:false
      t.integer :valuation_id, null:false
      t.string :content, null:false
      t.datetime :date_and_time, null:false

      t.timestamps
    end
  end
end

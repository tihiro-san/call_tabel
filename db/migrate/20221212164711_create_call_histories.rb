class CreateCallHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :call_histories do |t|

      t.integer :user_id, null:false
      t.integer :cintact_id, null:false
      t.integer :valuation_id
      t.string :content
      t.datetime :date_and_time

      t.timestamps
    end
  end
end

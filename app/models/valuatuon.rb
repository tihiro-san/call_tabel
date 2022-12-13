class Valuatuon < ApplicationRecord
  
  has_many :call_histories, dependent: :destroy
  
end

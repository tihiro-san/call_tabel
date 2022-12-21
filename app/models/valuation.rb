class Valuation < ApplicationRecord
  
  has_many :call_histories, dependent: :destroy
  
  
  enum grades: { a: 0, b: 1, c: 2, d: 3, e: 4, f: 5, g: 6 }
  
end

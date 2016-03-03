class Budget < ActiveRecord::Base
  belongs_to :income
  belongs_to :expense
end

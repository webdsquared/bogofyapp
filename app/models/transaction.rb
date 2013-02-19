class Transaction < ActiveRecord::Base
  attr_accessible :date, :spent, :saved
end

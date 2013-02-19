class Item < ActiveRecord::Base
  attr_accessible :completed, :list_id, :name

  belongs_to :list
end

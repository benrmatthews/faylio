class Tag < ActiveRecord::Base
  has_many :taggings
  has_many :fails, through: :taggings
end
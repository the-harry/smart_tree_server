class Tree < ApplicationRecord
  belongs_to :garden
  has_many :prunes
end

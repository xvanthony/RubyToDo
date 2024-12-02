class Tag < ApplicationRecord
  has_and_belongs_to_many :todos
  validates :name, presence: true, uniqueness: true
end

class Todo < ApplicationRecord
  has_and_belongs_to_many :tags
  validates :title, presence: true
  include PrioritySortable

  validates :priority, inclusion: { in: ["High", "Medium", "Low"], allow_nil: false }

  include Filterable
  before_save :normalize_priority

  private

  def normalize_priority
    self.priority = priority.capitalize if priority.present?
  end
end

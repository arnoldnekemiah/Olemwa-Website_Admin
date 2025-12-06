class LeadershipProfile < ApplicationRecord
  has_one_attached :photo
  
  validates :name, presence: true
  validates :role, presence: true
  
  scope :by_position, -> { order(position_order: :asc) }
  
  after_initialize :set_defaults, if: :new_record?
  
  private
  
  def set_defaults
    self.position_order ||= 0
  end
end

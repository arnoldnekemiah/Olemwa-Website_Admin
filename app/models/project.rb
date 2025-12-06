class Project < ApplicationRecord
  has_one_attached :cover_image
  
  enum :status, { ongoing: 0, completed: 1 }
  
  validates :title, presence: true
  validates :status, presence: true
  
  scope :published, -> { where(published: true) }
  scope :by_status, ->(status) { where(status: status) }
  
  after_initialize :set_defaults, if: :new_record?
  
  private
  
  def set_defaults
    self.status ||= :ongoing
    self.published ||= false
  end
end

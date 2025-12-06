class Event < ApplicationRecord
  enum :status, { upcoming: 0, ongoing: 1, completed: 2 }
  
  validates :title, presence: true
  validates :event_date, presence: true
  validates :status, presence: true
  
  scope :upcoming, -> { where(status: :upcoming).where('event_date >= ?', Time.current) }
  scope :by_date, -> { order(event_date: :asc) }
  
  after_initialize :set_defaults, if: :new_record?
  
  private
  
  def set_defaults
    self.status ||= :upcoming
  end
end

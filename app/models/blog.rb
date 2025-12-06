class Blog < ApplicationRecord
  belongs_to :admin
  has_one_attached :cover_image
  
  enum :status, { draft: 0, published: 1 }
  
  validates :title, presence: true
  validates :slug, presence: true, uniqueness: true
  validates :status, presence: true
  
  scope :published, -> { where(status: :published) }
  scope :recent, -> { order(published_at: :desc) }
  
  before_validation :generate_slug, if: :title_changed?
  after_initialize :set_defaults, if: :new_record?
  
  private
  
  def generate_slug
    self.slug = title.parameterize if title.present?
  end
  
  def set_defaults
    self.status ||= :draft
  end
end

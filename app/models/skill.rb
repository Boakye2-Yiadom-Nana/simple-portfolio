class Skill < ApplicationRecord
  belongs_to :category
  belongs_to :user, optional: true
  has_one_attached :image

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :level, presence: true, inclusion: { in: 1..10 }
  validates :description, presence: true, length: { minimum: 10 }
  validate :acceptable_image 
  

  scope :by_level, ->(level) { where(level: level) }
  scope :high_skills, -> { where('level >= ?', 8) }
  scope :learning_skills, -> { where('level < ?', 6) }

  private

  def acceptable_image
    return unless image.attached?

    unless image.blob.byte_size <= 5.megabyte
        errors.add(:image, "is too big (should be at most 5MB)")
    end

    acceptable_types = ["image/jpeg", "image/png", "image/gif"]
    unless acceptable_types.include?(image.blob.content_type)
        errors.add(:image, "must be a JPEG, PNG, or GIF")
    end
   end   
end
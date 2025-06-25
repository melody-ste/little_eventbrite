class Event < ApplicationRecord
  belongs_to :admin, class_name: "User"

  has_many :attendances, dependent: :destroy
  has_many :participants, through: :attendances, source: :user
  has_one_attached :photo
  
  validate :start_date_cannot_be_in_the_past
  validate :duration_multiple_of_five
  validate :photo_presence

  validates :start_date, presence: true
  validates :duration, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :title, presence: true, length: { in: 5..140 }
  validates :description, presence: true, length: { in: 20..1000 }
  validates :price, presence: true, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 1000 }
  validates :location, presence: true


  private

  def start_date_cannot_be_in_the_past
    if start_date.present? && start_date < Time.now
      errors.add(:start_date, "ne peut pas être dans le passé")
    end
  end

  def duration_multiple_of_five
    if duration.present? && duration % 5 != 0
      errors.add(:duration, "doit être un multiple de 5")
    end
  end

  def photo_presence
    errors.add(:photo, "doit être ajoutée") unless photo.attached?
  end

end

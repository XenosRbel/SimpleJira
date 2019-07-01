class Project < ApplicationRecord
  belongs_to :team
  has_many :posts
  has_many :tasks

  validates :start_date, :name, :end_date, :summary, presence: true
  validate :end_date_after_start_date

  private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date <= start_date
      errors.add(:end_date, 'must be after the start date')
    end
  end
end

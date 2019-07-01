class Task < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :project

  validates :status, :title, :comments, :content, :start_date, :due_date,
            :estimation, presence: true
  validate :due_date_after_start_date

  enum status: [:'To do', :Open, :Closed, :'In progress', :Reopened, :Resolved]
  enum estimation: %i[Highest High Medium Low Lowest]

  private

  def due_date_after_start_date
    return if due_date.blank? || start_date.blank?

    if due_date <= start_date
      errors.add(:due_date, 'must be after the start date')
    end
  end
end

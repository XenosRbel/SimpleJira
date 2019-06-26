class Task < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :project, optional: true
  enum status: [:'To do', :Open, :Closed, :'In progress', :Reopened, :Resolved]
  enum estimation: %i[Highest High Medium Low Lowest]
end

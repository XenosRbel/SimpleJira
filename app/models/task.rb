class Task < ApplicationRecord
  belongs_to :user
  enum status: [:'To do', :Open, :Closed, :'In progress', :Reopened, :Resolved]
  enum estimation: %i[Highest High Medium Low Lowest]
end

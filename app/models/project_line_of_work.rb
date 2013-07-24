class ProjectLineOfWork < ActiveRecord::Base
  belongs_to :project
  belongs_to :line_of_work
  # attr_accessible :title, :body
end

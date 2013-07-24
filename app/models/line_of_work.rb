class LineOfWork < ActiveRecord::Base
  has_many :project_line_of_works
  has_many :projects, through: :project_line_of_works, dependent: :nullify
  attr_accessible :content, :popup_content, :title
end

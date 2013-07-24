class Project < ActiveRecord::Base
  has_many :project_line_of_works
  has_many :line_of_works, through: :project_line_of_works

  convert_options_prefix = "-background transparent -compose Copy -gravity center -extent"
  has_attached_file :image, :styles => { :big => "255x160^", :medium => "186x80^", :thumb => "100x100>" },
                    :convert_options => { :medium => "#{convert_options_prefix} 186x80",
                                          :big => "#{convert_options_prefix} 255x160"}

  attr_accessible :general, :line_of_work_ids, :title, :content, :image

  after_save :break_other_general, :if => -> project { project.general }

  validates :image, :attachment_presence => true, :length => { :minimum => 1 }


  def self.get_general
    where(:general => true).last
  end

private

  def break_other_general
    self.class.where('id != ?', id).update_all(general: false)
  end


end

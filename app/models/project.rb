class Project < ActiveRecord::Base
  belongs_to :line_of_work

  has_attached_file :image, :styles => { :big => "255x160^", :medium => "186x80^", :thumb => "100x100>" },
                    :convert_options => { :medium => " -gravity center -extent '186x80'",
                                          :big => " -compose Copy -gravity center -extent '255x160'"}

  attr_accessible :general, :line_of_work_id, :title, :content, :image

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

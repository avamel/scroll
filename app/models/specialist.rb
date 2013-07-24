class Specialist < ActiveRecord::Base

  attr_accessible :content, :name, :position, :avatar
  convert_options_prefix = "-background transparent -compose Copy -gravity center -extent"
  has_attached_file :avatar, :styles => { :medium => "155x185>", :thumb => "100x100>" },
                    :convert_options => { :medium => "#{convert_options_prefix} 50x50"}
end

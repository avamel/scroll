module ApplicationHelper
  def get_bg name
    SectionBackground.find_by_section_name(name).try(:image)
  end

  def get_block key
    StaticBlock.find_by_identity_key key
  end
end

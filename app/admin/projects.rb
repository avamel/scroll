ActiveAdmin.register Project do

  index do
    column :id
    column :title
    column(:line_of_works) { |project| raw project.line_of_works.map { |x| link_to x.title, admin_line_of_work_path(x.id) }.join(', ') }
    column :general
    column :image, sortable: :image_file_name do |project|
      image_tag project.image.url(:thumb)
    end
    column :created_at
    default_actions
  end

  show do |project|
    panel "Project" do
      attributes_table do
        row :title
        row :line_of_works do
          raw project.line_of_works.map { |x| link_to x.title, admin_line_of_work_path(x.id) }.join(', ')
        end
        row :content
        row :general
      end
    end
    div :class => "panel" do
      h3 "Images"
      if project.image
        div :class => "panel_contents" do
          div :class => "attributes_table" do
            table do
              tr do
                th do
                end
              end
              tbody do
                tr do
                  td do
                    image_tag project.image.url(:medium)
                  end
                end
              end
            end
          end
        end
      else
        h3 "No images available"
      end
    end
  end

  form do |f|
    f.inputs "Project details" do
      f.input :line_of_works, as: :check_boxes
      f.input :title
      f.input :content, as: :ckeditor
      f.input :general
      if f.object.image.present?
        f.input :image, as: :file, :hint => f.template.image_tag(f.object.image.url(:thumb)), :input_html => {:value => f.object.image.url(:thumb)}
      else
        f.input :image, as: :file
      end
    end
    f.buttons
  end
end

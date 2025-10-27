ActiveAdmin.register Customer do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :full_name, :phone_number, :email, :notes, :image
  filter :full_name
  filter :email
  filter :phone_number
  filter :notes

  # filter :image_attached, as: :boolean, label: "Has Image?"  # Rails 6+ ActiveStorage

  #
  # or
  #
  # permit_params do
  #   permitted = [:full_name, :phone_number, :email, :notes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

 form do |f|
    f.inputs do
      f.input :full_name
      f.input :email
      f.input :phone_number
      f.input :notes
      f.input :image, as: :file  # allows file upload
    end
    f.actions
  end

  show do
    attributes_table do
      row :full_name
      row :email
      row :phone_number
      row :notes
      row :image do |customer|
        if customer.image.attached?
          image_tag url_for(customer.image), height: '100'
        end
      end
    end
  end
end

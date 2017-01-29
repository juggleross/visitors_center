ActiveAdmin.register User do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
  permit_params :role_id, :email, :id, :username
  show do
    attributes_table do
      row :id
      row :email
      row :username
      row :role_id
    end
    active_admin_comments
  end


   index do
      column :id
      column :email
      column :username
      column :role_id
      actions
    end
end

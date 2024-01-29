ActiveAdmin.register Post do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  filter :created_at
  permit_params :content, :user_id, :image, photos: []
  #
  # or
  #
  # permit_params do
  #   permitted = [:content, :user_id]
    # permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  index do
    selectable_column
    id_column
    column :content
   
    column :created_at
    column :user
    column :image do |post|
      image_tag(post.image, height: '50')
    end
     column :photos do |post|
      safe_join(post.photos.map { |photo| image_tag(photo, height: '50') }, tag('br'))
    end
    actions
  end
  form do |f|
    f.inputs do
      f.input :content
      f.input :user_id, as: :select, collection: User.all.map { |user| [user.name, user.id] }, include_blank: 'Select User'
      f.input :image, as: :file 
      f.input :photos, as: :file, input_html: { multiple: true }
    end
    f.actions
  end
  

  
end

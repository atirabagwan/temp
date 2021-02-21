ActiveAdmin.register TestCase do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :input, :output, :marks, :problem_id, :created_by_id, :updated_by_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:input, :output, :marks, :problem_id, :created_by_id, :updated_by_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  index do
    selectable_column
    id_column
    column :input
    column :output
    column :marks
    column :problem_id
    column :created_by_id
    column :updated_by_id

    actions
  end


  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :input
      f.input :output
      f.input :marks
      f.input :problem_id
      f.input :created_by_id, :as => :select, :collection => User.all.collect {
                              |user| [user.name, user.id] }
      f.input :updated_by_id, :as => :select, :collection => User.all.collect {
                              |user| [user.name, user.id] }
      
    end
    f.actions
  end
  
end

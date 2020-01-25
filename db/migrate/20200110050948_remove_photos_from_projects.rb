class RemovePhotosFromProjects < ActiveRecord::Migration[5.2]
  def change
    rename_column :courses, :photos, :image
  end
end

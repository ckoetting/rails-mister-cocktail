class RemoveImageAttribute < ActiveRecord::Migration[6.0]
  def change
    remove_column :cocktails, :image
  end
end

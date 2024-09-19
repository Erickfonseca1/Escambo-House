class AddCategoryToServices < ActiveRecord::Migration[7.2]
  def change
    add_column :services, :category, :string
  end
end

class AddDescriptionToExchanges < ActiveRecord::Migration[7.2]
  def change
    add_column :exchanges, :description, :text
  end
end

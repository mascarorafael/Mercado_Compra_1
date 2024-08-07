class AddDescriptionToProducts < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :description, :text
    add_column :products, :send_type, :string
    add_column :products, :condition_description, :string
  end
end

class AddNameToBalls < ActiveRecord::Migration
  def change
    add_column :balls, :name, :string
  end
end

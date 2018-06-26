class CreateBalls < ActiveRecord::Migration
  def change
    create_table :balls do |t|
      t.string :brand
      t.string :color
      t.integer :weight
      t.string :coverstock
      t.date :release_date
      t.integer :user_id
    end
  end
end

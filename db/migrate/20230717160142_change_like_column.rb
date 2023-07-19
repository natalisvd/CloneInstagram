class ChangeLikeColumn < ActiveRecord::Migration[7.0]
  def change
    remove_index :likes, [:user_id, :post_id], unique: true
    add_reference :likes, :likeable, polymorphic: true
    remove_reference :likes, :post , null: false, foreign_key: true
    add_index :likes, [:user_id, :likeable_id, :likeable_type], unique: true
  end
end

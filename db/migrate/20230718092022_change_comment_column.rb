class ChangeCommentColumn < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :commentable, polymorphic: true
    remove_reference :comments, :post ,foreign_key: true
    add_index :comments, [ :commentable_id, :commentable_type]

  end
end


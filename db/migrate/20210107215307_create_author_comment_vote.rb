class CreateAuthorCommentVote < ActiveRecord::Migration[6.1]
  def change
    create_table :author_comment_votes do |t|
      t.references :author
      t.references :comment
      t.boolean :positive
      t.timestamps
    end
  end
end

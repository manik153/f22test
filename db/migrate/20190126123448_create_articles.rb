class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :description
      t.string :link
      t.integer :views, default: 0
      t.text :upvote_user_ids
      t.text :downvote_user_ids
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

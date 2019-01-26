class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :content
      t.references :user, foreign_key: true
      t.string :reply_type
      t.integer :reply_id
      t.text :helpful_user_ids

      t.timestamps
    end
  end
end

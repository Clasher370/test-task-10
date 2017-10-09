class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :body
      t.integer :author_id, index: true, foreing_key: true
      t.datetime :published_at

      t.timestamps
    end
  end
end

class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :body
      t.references :posts, index: true, foreing_key: true
      t.datetime :published_at

      t.timestamps
    end
  end
end

class CreatePostSubs < ActiveRecord::Migration[5.1]
  def change
    create_table :posts_subs do |t|
      t.belongs_to :sub, index: true
      t.belongs_to :post, index: true
      t.timestamps
    end
  end
end

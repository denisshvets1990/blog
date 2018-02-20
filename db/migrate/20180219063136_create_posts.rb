class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :user, index: true
      t.references :post_ip, index: true
      t.string :title
      t.text :description
      t.decimal :rating, precision: 3, scale: 2, default: 0, index: true

      t.timestamps null: false
    end
  end
end

class CreatePostIps < ActiveRecord::Migration
  def change
    create_table :post_ips do |t|
      t.references :post, index: true
      t.inet :ip
      t.integer :users_count, default: 0, index: true

      t.timestamps null: false
    end
  end
end

class CreatePostIpUsers < ActiveRecord::Migration
  def change
    create_table :post_ip_users do |t|
      t.references :post_ip, index: true
      t.references :user, index: true

      t.timestamps null: false
    end
  end
end

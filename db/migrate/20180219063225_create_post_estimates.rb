class CreatePostEstimates < ActiveRecord::Migration
  def change
    create_table :post_estimates do |t|
      t.references :post, index: true
      t.integer :estimate

      t.timestamps null: false
    end
  end
end

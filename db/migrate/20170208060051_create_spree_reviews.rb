class CreateSpreeReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :spree_reviews do |t|
      t.belongs_to :product
      t.belongs_to :user
      t.string :name
      t.integer :rating
      t.text :review
      t.boolean :approved, default: false

      t.timestamps
    end
  end
end

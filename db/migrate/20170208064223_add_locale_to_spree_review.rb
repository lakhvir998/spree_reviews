class AddLocaleToSpreeReview < ActiveRecord::Migration[5.0]
  def change
    add_column :spree_reviews, :locale, :string, default: 'en'
  end
end

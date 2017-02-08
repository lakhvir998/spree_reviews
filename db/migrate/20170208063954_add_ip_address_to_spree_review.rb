class AddIpAddressToSpreeReview < ActiveRecord::Migration[5.0]
  def change
    add_column :spree_reviews, :ip_address, :string
  end
end

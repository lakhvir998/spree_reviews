class Spree::Review < ApplicationRecord
  belongs_to :product, touch: true
  belongs_to :user, class_name: Spree.user_class.to_s

  after_save :recalculate_product_rating, if: :approved?
  after_destroy :recalculate_product_rating

  validates :name, :review, presence: true
  validates :rating, numericality: {
      only_integer: true,
      greater_than_or_equal_to: 1,
      less_than_or_equal_to: 5,
      message: Spree.t(:you_must_enter_value_for_rating)
  }

  default_scope { order('spree_reviews.created_at DESC') }

  scope :localized, ->(lc) { where('spree_reviews.locale = ?', lc) }
  scope :most_recent_first, -> { order('spree_reviews.created_at DESC') }
  scope :oldest_first, -> { reorder('spree_reviews.created_at ASC') }
  scope :preview, -> { limit(Spree::Reviews::Config[:preview_size]).oldest_first }
  scope :approved, -> { where(approved: true) }
  scope :not_approved, -> { where(approved: false) }
  scope :default_approval_filter, -> { Spree::Reviews::Config[:include_unapproved_reviews] ? all : approved }

  def recalculate_product_rating
    product.recalculate_rating if product.present?
  end
end

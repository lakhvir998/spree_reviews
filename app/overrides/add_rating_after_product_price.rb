Deface::Override.new(
    virtual_path: 'spree/products/index',
    name: 'add_rating_after_product_price',
    insert_bottom: '[data-hook="product_rating"]',
    partial: 'spree/shared/rating'
)
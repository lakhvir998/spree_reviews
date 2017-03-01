Deface::Override.new(
    virtual_path: 'spree/products/index',
    name: 'add_rating_after_inside_product_rating',
    insert_bottom: '[data-hook="product_rating"]',
    partial: 'spree/shared/rating'
)
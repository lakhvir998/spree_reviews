Deface::Override.new(
    virtual_path: 'spree/products/show',
    name: 'add_rating_after_inside_cart_form',
    insert_bottom: '[data-hook="cart_form"]',
    partial: 'spree/shared/rating'
)
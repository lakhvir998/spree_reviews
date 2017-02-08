require 'spree_core'
require 'spree_reviews/engine'
require 'spree_reviews/version'

module Spree
  module Reviews
    module_function

    def config(*)
      yield(Spree::Reviews::Config)
    end
  end
end
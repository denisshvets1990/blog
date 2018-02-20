class Post::TopRatingQuery
  include ActiveModel::Validations

  validates :quantity, presence: true, numericality: { only_integer: true }
  attr_reader :collection, :quantity, :page

  def initialize(params:)
    @quantity = params[:quantity]
    @page = params[:page].to_i > 0 ? params[:page] : 1
  end

  def perform
    return errors unless valid?
    fetch_posts
    apply_by_quantity
    apply_paginate
    collection
  end

  private

  def fetch_posts
    @collection = Post.order(rating: :desc)
  end

  def apply_by_quantity
    @collection = collection.limit(quantity)
  end

  def apply_paginate
    @collection = collection.page(page).per(formatted_per)
  end

  def formatted_per
    quantity.to_i < 50 ? quantity : 50
  end
end
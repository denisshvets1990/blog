class PostEstimate::CreatorService
  include ActiveModel::Validations

  validates :post_id, presence: true, numericality: { only_integer: true }
  validates :estimate, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }

  attr_reader :post_id, :estimate, :post

  def initialize(params:)
    @post_id = params[:post_id]
    @estimate = params[:estimate]
  end

  def perform
    return errors unless valid?
    fetch_post
    create_post_estimate
    change_post_rating
    post
  end

  private

  def fetch_post
    @post = Post.find(post_id)
  end

  def create_post_estimate
    post.estimates.create(estimate: estimate)
  end

  def change_post_rating
    post.rating = post.decorate.calculate_rating
    post.save
  end
end

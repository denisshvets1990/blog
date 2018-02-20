class PostDecorator < Draper::Decorator
  decorates Post
  delegate_all

  def calculate_rating
    estimates.sum(:estimate).to_f / estimates.count
  end
end
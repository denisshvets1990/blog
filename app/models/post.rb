class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :post_ip, class_name: 'Post::Ip', inverse_of: false
  has_many :estimates, class_name: 'Post::Estimate', dependent: :destroy, inverse_of: false
end

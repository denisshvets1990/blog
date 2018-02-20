class Post::Ip < ActiveRecord::Base
  has_many :post_ip_users, class_name: 'PostIp::User', dependent: :destroy, inverse_of: :post_ip, foreign_key: :post_ip_id
  has_many :users, through: :post_ip_users

  scope :more_one_user, -> { where('users_count > 1') }
end

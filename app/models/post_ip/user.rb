class PostIp::User < ActiveRecord::Base
  self.table_name = 'post_ip_users'

  belongs_to :user
  belongs_to :post_ip, class_name: 'Post::Ip', counter_cache: true, inverse_of: :post_ip_users, foreign_key: :post_ip_id
end

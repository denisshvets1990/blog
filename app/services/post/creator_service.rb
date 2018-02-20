class Post::CreatorService
  include ActiveModel::Validations

  validates :login, :title, presence: true, length: { maximum: 250 }
  validates :description, presence: true

  attr_reader :login, :title, :description, :user, :post, :post_ip, :ip

  def initialize(params:, ip:)
    @login = params[:login]
    @title = params[:title]
    @description = params[:description]
    @ip = ip
  end

  def perform
    return errors unless valid?
    fetch_user
    fetch_post_ip
    create_post
    create_post_ip_users
    post
  end

  private

  def fetch_user
    @user = User.find_or_create_by(login: login)
  end

  def fetch_post_ip
    @post_ip = Post::Ip.find_or_create_by(ip: ip)
  end

  def create_post
    @post = user.posts.create(\
      title: title,
      description: description,
      post_ip_id: post_ip.id
    )
    @post.save
  end

  def create_post_ip_users
    return if post_ip.post_ip_users.where(user_id: user.id).present?
    post_ip.post_ip_users.create(user_id: user.id)
  end
end

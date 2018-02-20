class PostIp::DifferentUsersQuery
  attr_reader :collection, :page

  def initialize(params:)
    @page = params[:page].to_i > 0 ? params[:page] : 1
  end

  def perform
    fetch_post_ips
    apply_paginate
    collection
  end

  private

  def fetch_post_ips
    @collection = Post::Ip.more_one_user
  end

  def apply_paginate
    @collection = collection.page(page).per(50)
  end
end
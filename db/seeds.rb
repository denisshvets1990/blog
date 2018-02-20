(1..200000).each do |number|
  params = {
    login: "test_login_#{number/2000}",
    title: "Post title #{number}",
    description: "Post description #{number}"
  }

  post = ::Post::CreatorService.new(
    params: params,
    ip: "188.162.64.#{100 + number / 4000}"
  ).perform

  if number % 1000 == 0
    (1..2).each do |e|
      ::PostEstimate::CreatorService.new(
        params: { post_id: post.id, estimate: rand(1..5)}
      ).perform
    end
  end
  p number
end

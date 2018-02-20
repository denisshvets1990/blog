class Api::V1::Posts < Grape::API
  namespace :posts do
    desc 'Create Post'
    post do
      status 200
      result = ::Post::CreatorService.new(
        params: params,
        ip: env['REMOTE_ADDR']
      ).perform

      check_by_validation_errors(result)
      present(result, with: Entities::Post)
    end

    desc 'Get top N posts by rating'
    get '/top-rating' do
      result = ::Post::TopRatingQuery.new(params: params).perform
      check_by_validation_errors(result)
      present(result, with: Entities::Post)
    end
  end
end
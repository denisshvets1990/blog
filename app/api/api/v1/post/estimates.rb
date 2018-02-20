class Api::V1::Post::Estimates < Grape::API
  namespace :post do
    namespace :estimates do
      desc 'Create post estimation'
      post do
        status 200
        result = ::PostEstimate::CreatorService.new(params: params).perform

        check_by_validation_errors(result)
        present(result, with: Entities::Post)
      end
    end
  end
end
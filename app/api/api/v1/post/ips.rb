class Api::V1::Post::Ips < Grape::API
  namespace :post do
    namespace :ips do
      desc 'List ips where users posted more one post'
      get do
        result = ::PostIp::DifferentUsersQuery.new(params: params).perform
        present(result, with: Entities::PostIp)
      end
    end
  end
end
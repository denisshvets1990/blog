class Api::V1 < Grape::API
  mount Api::V1::Posts
  mount Api::V1::Post::Estimates
  mount Api::V1::Post::Ips
end
class Entities::PostIp < Grape::Entity
  expose :ip do |e|
    e.ip.to_s
  end
  expose :users, using: Entities::User
end
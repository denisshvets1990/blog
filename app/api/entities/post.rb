class Entities::Post < Grape::Entity
  expose :id
  expose :title
  expose :description
  expose :rating
end
class ApplicationAPI < Grape::API
  helpers Grape::PaginationHelper
  helpers Grape::ActiveModelHelper

  format :json
  default_error_status 400

  rescue_from ActiveRecord::RecordNotFound do |e|
    error!([e.message], 404)
  end

  mount Api::V1
end

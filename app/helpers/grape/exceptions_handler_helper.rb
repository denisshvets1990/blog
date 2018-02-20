module Grape::ExceptionsHandlerHelper
  extend ActiveSupport::Concern

  included do
    # rescue_from ActiveRecord::RecordNotFound do |e|
    #  error!([e.message], 404)
    # end
  end
end
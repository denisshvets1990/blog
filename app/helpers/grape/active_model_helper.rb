module Grape::ActiveModelHelper
  extend Grape::API::Helpers

  def check_by_validation_errors(result)
    return unless result.is_a?(ActiveModel::Errors)
    message = result.messages.map { |attr, msg| "#{attr} #{msg.first}" }
    error!(message, 422)
  end
end
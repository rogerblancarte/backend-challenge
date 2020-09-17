module ExceptionHandler
  extend ActiveSupport::Concern

  # ActiveRecord throws an exception when it can't find
  # a record, and we'd rather just return a normal status response 404 response
  included do
    rescue_from ActiveRecord::RecordNotFound do |e|
      json_response({ message: e.message }, :not_found)
    end

    rescue_from ActiveRecord::RecordInvalid do |e|
      json_response({ message: e.message }, :unprocessable_entity)
    end
  end
end

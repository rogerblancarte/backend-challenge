module Response
  # easier responses from our controllers with more info
  def json_response(object, status = :ok)
    render json: object, status: status
  end
end

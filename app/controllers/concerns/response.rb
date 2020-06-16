module Response
  def json_response(object, status = :ok)
    render json: object, status: status
  end

  def get_data(user_data)
    user = { id: user_data.id, firstName: user_data.first_name,
             lastName: user_data.last_name, email: user_data.email }

    token = JsonWebToken.encode(user: user)

    time = Time.now + 24.hours.to_i

    { token: token, exp: time.strftime('%m-%d-%Y %H:%M') }
  end
end

def authenticated_header
  user = create(:user)
  token = Knock::AuthToken.new(payload: { sub: user.id }).token
  {
      'Authorization': "Bearer #{token}"
  }
end

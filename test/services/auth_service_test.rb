require "test_helper"

class AuthServiceTest < ActiveSupport::TestCase
  def setup
    @user = users(:user_one)
  end

  test "Should be success when loggin in" do
    token = AuthService.new(email: @user.email, password: 123456).call
    assert_not_empty(token)
    assert token.size == 116
    assert_equal(JsonWebToken.decode(token)[0]['user_id'], @user.id)
  end

  test "Should not be success when loggin in, email doesn't exists" do
    token = AuthService.new(email: 'another@email.com', password: 123456).call
    assert_nil(token)
  end

  test "Should not be success when loggin in, incorrect password" do
    token = AuthService.new(email: @user.email, password: 123).call
    assert_nil(token)
  end
end
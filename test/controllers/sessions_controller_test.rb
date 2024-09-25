require "test_helper"

class SessionControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:user_one)
  end

  test "Should be success when loggin in" do
    post login_url, params: { email: @user.email, password: 123456 }

    token = JSON.parse(@response.body)["token"]
    assert_not_empty(token)
    assert token.size == 116
    assert_equal(JsonWebToken.decode(token)[0]['user_id'], @user.id)
  end

  test "Should not be success when loggin in, email doesn't exists" do
    post login_url, params: { email: "another@email.com", password: 123456 }

    error = JSON.parse(@response.body)["error"]
    assert_match(/Invalid credentials/, error)
    assert_equal @response.status, 401
  end

  test "Should not be success when loggin in, incorrect password" do
    post login_url, params: { email: @user.email, password: 123 }

    error = JSON.parse(@response.body)["error"]
    assert_match(/Invalid credentials/, error)
    assert_equal @response.status, 401
  end
end
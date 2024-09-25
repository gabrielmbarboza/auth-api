require "test_helper"

class JsonWebTokenTest < ActiveSupport::TestCase
  def setup
    @user = users(:user_one)
  end
  
  test "should encode the payload" do
    payload = { user_id: @user.id }
    token = JsonWebToken.encode(payload)
    
    assert_not_empty token
    assert token.size == 116
  end

  test "should raise an exception, the payload is invalid" do
    payload = nil
    assert_raises(StandardError){ JsonWebToken.encode(payload) }

    payload = ''
    error = assert_raises(StandardError){ JsonWebToken.encode(payload) }

    assert_equal("The payload must be a hash", error.message)
  end
  
  test "should decode the token" do
    payload = { user_id: @user.id }
    token = JsonWebToken.encode(payload)
  
    decoded_token = JsonWebToken.decode(token)

    assert_equal(decoded_token[0]['user_id'],  @user.id)
  end

  test "should return an empty array, the token is expired" do
    payload = { user_id: @user.id }
    token = JsonWebToken.encode(payload, exp: Time.now.to_i - 60)
  
    decoded_token = JsonWebToken.decode(token)
    assert_empty(decoded_token)
  end

  test "should return an empty array, the token is invalid" do
    decoded_token = JsonWebToken.decode(nil)
    assert_empty(decoded_token)

    decoded_token = JsonWebToken.decode('')
    assert_empty(decoded_token)

    decoded_token = JsonWebToken.decode({})
    assert_empty(decoded_token)
  end
end
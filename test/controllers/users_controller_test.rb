require "test_helper"
require_relative '../helpers/authorization_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  include AuthorizationHelper

  def setup
    @user = users(:user_one)
    test_user = { email: @user.email, password: '123456' }
    @auth_token = auth_tokens_for_user(test_user)
  end

  test "should get index" do
    get api_v1_users_url, headers: { 'Authorization' => @auth_token }
    assert_response :success

    users = JSON.parse(@response.body)
    assert_equal(users.size, 1)
  end

  test "should not get index, the token is invalid" do
    get api_v1_users_url, headers: { 'Authorization' => 'invalid_token' }
    assert_response 401

    error = JSON.parse(@response.body)

    assert_match /This token is invalid/, error["message"]
    assert_match /unauthorized/, error["status"]
  end

  test "should not get index, the header is nil" do
    get api_v1_users_url, headers: { 'Authorization' => nil }
    assert_response 401

    error = JSON.parse(@response.body)

    assert_match /The Authorization header is not present/, error["message"]
    assert_match /unauthorized/, error["status"]
  end

  test "should not get index, the header doesn't exist" do
    get api_v1_users_url
    assert_response 401

    error = JSON.parse(@response.body)

    assert_match /The Authorization header is not present/, error["message"]
    assert_match /unauthorized/, error["status"]
  end

  test "should not get index, the token is expired" do
    payload = { user_id: @user.id }
    token = JsonWebToken.encode(payload, exp: Time.now.to_i - 60)

    get api_v1_users_url, headers: { 'Authorization' => "Baerer #{token}" }
    assert_response 401

    error = JSON.parse(@response.body)

    assert_match /This token is invalid/, error["message"]
    assert_match /unauthorized/, error["status"]
  end
end

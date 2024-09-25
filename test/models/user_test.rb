require "test_helper"

class UserTest < ActiveSupport::TestCase
  self.use_transactional_tests = true

  def setup
    @user = users(:user_one)
  end

  test "should create a valid user" do
    assert @user.persisted?
  end

  test "should not save a user, name is blank" do
    @user.username = ""

    assert_not @user.valid?
    assert_raises(ActiveRecord::RecordInvalid) { @user.save! }
  end

  test "should not save a user, name is nil" do
    @user.username = nil

    assert_not @user.valid?
    assert_raises(ActiveRecord::RecordInvalid) { @user.save! }
  end

  test "should not save a user, email is blank" do
    @user.email = ""

    assert_not @user.valid?
    assert_raises(ActiveRecord::RecordInvalid) { @user.save! }
  end

  test "should not save a user, email is nil" do
    @user.email = nil

    assert_not @user.valid?
    assert_raises(ActiveRecord::RecordInvalid) { @user.save! }
  end

  test "should not save a user, password is nil" do
    @user.password = nil

    assert_not @user.valid?
    assert_raises(ActiveRecord::RecordInvalid) { @user.save! }
  end

  test "should not save a user, password and password_confirmation must be same" do
    @user.password = '123'
    @user.password_confirmation = '321'

    assert_not @user.valid?
    assert_raises(ActiveRecord::RecordInvalid) { @user.save! }
  end
end

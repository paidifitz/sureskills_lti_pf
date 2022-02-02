require "test_helper"

class PlatformKeysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @platform_key = platform_keys(:one)
  end

  test "should get index" do
    get platform_keys_url
    assert_response :success
  end

  test "should get new" do
    get new_platform_key_url
    assert_response :success
  end

  test "should create platform_key" do
    assert_difference('PlatformKey.count') do
      post platform_keys_url, params: { platform_key: { deployment_id: @platform_key.deployment_id, name: @platform_key.name, platform_id: @platform_key.platform_id } }
    end

    assert_redirected_to platform_key_url(PlatformKey.last)
  end

  test "should show platform_key" do
    get platform_key_url(@platform_key)
    assert_response :success
  end

  test "should get edit" do
    get edit_platform_key_url(@platform_key)
    assert_response :success
  end

  test "should update platform_key" do
    patch platform_key_url(@platform_key), params: { platform_key: { deployment_id: @platform_key.deployment_id, name: @platform_key.name, platform_id: @platform_key.platform_id } }
    assert_redirected_to platform_key_url(@platform_key)
  end

  test "should destroy platform_key" do
    assert_difference('PlatformKey.count', -1) do
      delete platform_key_url(@platform_key)
    end

    assert_redirected_to platform_keys_url
  end
end

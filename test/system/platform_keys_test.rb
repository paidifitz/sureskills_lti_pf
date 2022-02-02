require "application_system_test_case"

class PlatformKeysTest < ApplicationSystemTestCase
  setup do
    @platform_key = platform_keys(:one)
  end

  test "visiting the index" do
    visit platform_keys_url
    assert_selector "h1", text: "Platform Keys"
  end

  test "creating a Platform key" do
    visit platform_keys_url
    click_on "New Platform Key"

    fill_in "Deployment", with: @platform_key.deployment_id
    fill_in "Name", with: @platform_key.name
    fill_in "Platform", with: @platform_key.platform_id
    click_on "Create Platform key"

    assert_text "Platform key was successfully created"
    click_on "Back"
  end

  test "updating a Platform key" do
    visit platform_keys_url
    click_on "Edit", match: :first

    fill_in "Deployment", with: @platform_key.deployment_id
    fill_in "Name", with: @platform_key.name
    fill_in "Platform", with: @platform_key.platform_id
    click_on "Update Platform key"

    assert_text "Platform key was successfully updated"
    click_on "Back"
  end

  test "destroying a Platform key" do
    visit platform_keys_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Platform key was successfully destroyed"
  end
end

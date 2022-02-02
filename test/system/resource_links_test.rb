require "application_system_test_case"

class ResourceLinksTest < ApplicationSystemTestCase
  setup do
    @resource_link = resource_links(:one)
  end

  test "visiting the index" do
    visit resource_links_url
    assert_selector "h1", text: "Resource Links"
  end

  test "creating a Resource link" do
    visit resource_links_url
    click_on "New Resource Link"

    fill_in "Description", with: @resource_link.description
    fill_in "Login url", with: @resource_link.login_url
    fill_in "Platform", with: @resource_link.platform_id
    fill_in "Role", with: @resource_link.role
    fill_in "Title", with: @resource_link.title
    fill_in "Tool link url", with: @resource_link.tool_link_url
    click_on "Create Resource link"

    assert_text "Resource link was successfully created"
    click_on "Back"
  end

  test "updating a Resource link" do
    visit resource_links_url
    click_on "Edit", match: :first

    fill_in "Description", with: @resource_link.description
    fill_in "Login url", with: @resource_link.login_url
    fill_in "Platform", with: @resource_link.platform_id
    fill_in "Role", with: @resource_link.role
    fill_in "Title", with: @resource_link.title
    fill_in "Tool link url", with: @resource_link.tool_link_url
    click_on "Update Resource link"

    assert_text "Resource link was successfully updated"
    click_on "Back"
  end

  test "destroying a Resource link" do
    visit resource_links_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Resource link was successfully destroyed"
  end
end

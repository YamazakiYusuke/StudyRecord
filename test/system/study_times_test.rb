require "application_system_test_case"

class StudyTimesTest < ApplicationSystemTestCase
  setup do
    @study_time = study_times(:one)
  end

  test "visiting the index" do
    visit study_times_url
    assert_selector "h1", text: "Study Times"
  end

  test "creating a Study time" do
    visit study_times_url
    click_on "New Study Time"

    fill_in "Date", with: @study_time.date
    fill_in "End", with: @study_time.end
    fill_in "comment", with: @study_time.comment
    fill_in "Start", with: @study_time.start
    fill_in "Time length", with: @study_time.time_length
    click_on "Create Study time"

    assert_text "Study time was successfully created"
    click_on "Back"
  end

  test "updating a Study time" do
    visit study_times_url
    click_on "Edit", match: :first

    fill_in "Date", with: @study_time.date
    fill_in "End", with: @study_time.end
    fill_in "comment", with: @study_time.comment
    fill_in "Start", with: @study_time.start
    fill_in "Time length", with: @study_time.time_length
    click_on "Update Study time"

    assert_text "Study time was successfully updated"
    click_on "Back"
  end

  test "destroying a Study time" do
    visit study_times_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Study time was successfully destroyed"
  end
end

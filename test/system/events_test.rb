require "application_system_test_case"

class EventsTest < ApplicationSystemTestCase
  setup do
    @event = events(:one)
  end

  test "visiting the index" do
    visit events_url
    assert_selector "h1", text: "Events"
  end

  test "should create event" do
    visit events_url
    click_on "New event"

    fill_in "Admin", with: @event.admin_id
    fill_in "Description", with: @event.description
    fill_in "Duration", with: @event.duration
    fill_in "Location", with: @event.location
    fill_in "Price", with: @event.price
    fill_in "Start date", with: @event.start_date
    fill_in "Title", with: @event.title
    click_on "Create Event"

    assert_text "Event was successfully created"
    click_on "Back"
  end

  test "should update Event" do
    visit event_url(@event)
    click_on "Edit this event", match: :first

    fill_in "Admin", with: @event.admin_id
    fill_in "Description", with: @event.description
    fill_in "Duration", with: @event.duration
    fill_in "Location", with: @event.location
    fill_in "Price", with: @event.price
    fill_in "Start date", with: @event.start_date.to_s
    fill_in "Title", with: @event.title
    click_on "Update Event"

    assert_text "Event was successfully updated"
    click_on "Back"
  end

  test "should destroy Event" do
    visit event_url(@event)
    click_on "Destroy this event", match: :first

    assert_text "Event was successfully destroyed"
  end
end

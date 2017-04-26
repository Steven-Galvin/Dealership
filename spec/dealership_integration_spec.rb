require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the dealership path', {:type =>:feature}) do
  it('allows user to enter dealership name') do
    visit('/')
    click_on('Add New Dealership')
    fill_in("name", :with => "Bob's Cars")
    click_button('Add Dealership')
    expect(page).to have_content("Bob's Cars")
  end

  it('allows user to see dealership list') do
    visit('/')
    click_on('See Dealership List')
    expect(page).to have_content("Dealerships")
  end

  it('allows user to see vehicles listed for each dealership') do
    visit('/dealerships')
    click_on("Bob's Cars")
    expect(page).to have_content("Here are all the cars in this dealership")
  end

  it('allows user to add a new vehicle') do
    visit('/dealership/1')
    click_on("Add a new vehicle")
    fill_in("make", :with => "Toyota")
    fill_in("model", :with => "Camry")
    fill_in("year", :with => "1998")
    click_on('Add Vehicle')
    expect(page).to have_content("Success!")
  end



end

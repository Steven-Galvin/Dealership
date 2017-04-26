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



end

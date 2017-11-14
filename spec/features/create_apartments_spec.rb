require 'rails_helper'

RSpec.feature "CreateApartments", type: :feature do
  context "Landing page" do
    Steps "Visiting landing page" do
      Given "I visit localhost 3000" do
        visit "/"
      end
      Then "I see the listing for apartments." do
        expect(page).to have_content("Apartments")
      end
      Then "I can click on link to New Apartment page" do
        click_link('New Apartment')
        expect(page).to have_content('New Apartment')
      end
    end
  end

  context "Create Apartment Page" do
    Steps "Creating apartment" do
      Given "I fill out form" do
        visit "/"
        click_link('New Apartment')
        fill_in 'apartment[address_1]', :with => '123 gregg way'
        fill_in('apartment[address_2]', :with => 'unit 36')
        fill_in('apartment_city', :with => 'San Diego')
        fill_in('apartment_postal', :with => '92101')
        fill_in('apartment_state', :with => 'CA')
        fill_in('apartment_country', :with => 'USA')
        fill_in('apartment_contact_info', :with => '888-888-8888')
        fill_in('apartment_bm_name', :with => 'Greg')
        fill_in('apartment_bm_phone', :with => '777-777-7777')
        fill_in('apartment_bm_hours', :with => '2-4pm')
        click_button('Create Apartment')
      end
      Then "I expect to see the apartment info" do
        expect(page).to have_content("Apartment was successfully created.")
        expect(page).to have_content('Address 1: 123 gregg way')
        expect(page).to have_content('Address 2: unit 36')
        expect(page).to have_content('City: San Diego')
        expect(page).to have_content('Postal: 92101')
        expect(page).to have_content('State: CA')
        expect(page).to have_content('Country: USA')
        expect(page).to have_content('Contact info: 888-888-8888')
        expect(page).to have_content('Bm name: Greg')
        expect(page).to have_content('Bm phone: 777-777-7777')
        expect(page).to have_content('Bm hours: 2-4pm')
      end
    end
  end
  context "See updated index page" do
    Steps "See updated apartment listing" do
      Given "I fill out form" do
        visit "/"
        click_link('New Apartment')
        fill_in 'apartment[address_1]', :with => '123 gregg way'
        fill_in('apartment[address_2]', :with => 'unit 36')
        fill_in('apartment_city', :with => 'San Diego')
        fill_in('apartment_postal', :with => '92101')
        fill_in('apartment_state', :with => 'CA')
        fill_in('apartment_country', :with => 'USA')
        fill_in('apartment_contact_info', :with => '888-888-8888')
        fill_in('apartment_bm_name', :with => 'Greg')
        fill_in('apartment_bm_phone', :with => '777-777-7777')
        fill_in('apartment_bm_hours', :with => '2-4pm')
        click_button('Create Apartment')
      end
      Then "I can go back to the apartment listings and see my new apartment listing there" do
        click_link('Back')
        expect(page).to have_content("Apartments")
        expect(page).to have_content('123 gregg way')
        expect(page).to have_content('unit 36')
        expect(page).to have_content('San Diego')
        expect(page).to have_content('92101')
        expect(page).to have_content('CA')
        expect(page).to have_content('USA')
        expect(page).to have_content('888-888-8888')
        expect(page).to have_content('Greg')
        expect(page).to have_content('777-777-7777')
        expect(page).to have_content('2-4pm')
      end
      Then "I can go back to localhost:3000 and see updated listings" do
        visit '/'
        expect(page).to have_content("Apartments")
        expect(page).to have_content('123 gregg way')
        expect(page).to have_content('unit 36')
        expect(page).to have_content('San Diego')
        expect(page).to have_content('92101')
        expect(page).to have_content('CA')
        expect(page).to have_content('USA')
        expect(page).to have_content('888-888-8888')
        expect(page).to have_content('Greg')
        expect(page).to have_content('777-777-7777')
        expect(page).to have_content('2-4pm')
      end
    end
  end
end

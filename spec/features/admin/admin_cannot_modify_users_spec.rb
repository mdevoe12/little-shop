RSpec.feature "Admin edits the user" do
  scenario "Admin can edit their own account" do
    # As a logged in Admin
    user = create(:user, role: "admin")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    # I can modify my account data
    visit admin_dashboard_path

    click_link("Edit Thine Account")

    expect(current_path).to eq(edit_account_path)

    fill_in "user[username]", with: "Gandalf"
    fill_in "user[password]", with: "BananaGandalf"
    fill_in "user[password_confirmation]", with: "BananaGandalf"
    click_button "Changeth Thine Account"

    expect(current_path).to eq(admin_dashboard_path)

    expect(page).to have_content("Admin Dashboard")
    expect(page).to have_content("Logged in as Gandalf")
  end









  xscenario "Cannot modify any other users account" do

        # As a logged in Admin
        # But I cannot modify any other user's account data
  end


end

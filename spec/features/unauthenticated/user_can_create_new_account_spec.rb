RSpec.feature "User can create new account" do
  scenario "user createth new account" do
    create_list(:item, 3)

    visit(root_path)

    expect(page).to have_link("Login")

    click_link("Login")

    expect(current_path).to eq(login_path)

    click_link("Createth Thine Account")

    fill_in "user[username]", with: "Bilbo"
    fill_in "user[password]", with: "aragorn123"
    fill_in "user[password_confirmation]", with: "aragorn123"
    fill_in "user[full_name]", with: "Aragorn Elessar"
    fill_in "user[address]", with: "City of Gondor"

    click_button("Signeth Thou Up")

    expect(current_path).to eq(dashboard_path)

    expect(page).to have_content("Logged in as Bilbo")

    expect(page).to have_content("Bilbo's Hobbit Hole")

    expect(page).to_not have_link("Login")

    expect(page).to have_link("Logout")
  end

  scenario "user enters unavailable username" do
    create_list(:item, 3)
    user = create(:user, username: "sauron")

    visit(root_path)

    expect(page).to have_link("Login")

    click_link("Login")

    expect(current_path).to eq(login_path)

    click_link("Createth Thine Account")

    fill_in "user[username]", with: "sauron"
    fill_in "user[password]", with: "Bilbo123"
    fill_in "user[password_confirmation]", with: "Bilbo123"
    fill_in "user[full_name]", with: "Aragorn Elessar"
    fill_in "user[address]", with: "City of Gondor"


    click_button("Signeth Thou Up")

    expect(page).to have_content("Username doth taken or passwordeth no valid, please retryith")
    expect(page).to_not have_content("Signed in as sauron")
  end

  scenario "user enters invalid password" do
    create_list(:item, 3)

    visit(root_path)

    expect(page).to have_link("Login")

    click_link("Login")

    expect(current_path).to eq(login_path)

    click_link("Createth Thine Account")

    fill_in "user[username]", with: "gandalf"
    fill_in "user[password]", with: ""
    fill_in "user[password_confirmation]", with: ""
    fill_in "user[full_name]", with: "Aragorn Elessar"
    fill_in "user[address]", with: "City of Gondor"


    click_button("Signeth Thou Up")

    expect(page).to have_content("Username doth taken or passwordeth no valid, please retryith")
    expect(page).to_not have_content("Signed in as sauron")
  end

  scenario "user enters incorrect password confirmation" do
    create_list(:item, 3)

    visit(root_path)

    expect(page).to have_link("Login")

    click_link("Login")

    expect(current_path).to eq(login_path)

    click_link("Createth Thine Account")

    fill_in "user[username]", with: "frodo"
    fill_in "user[password]", with: "Bilbo123"
    fill_in "user[password_confirmation]", with: "not bilbo123"
    fill_in "user[full_name]", with: "Aragorn Elessar"
    fill_in "user[address]", with: "City of Gondor"


    click_button("Signeth Thou Up")

    expect(page).to have_content("Username doth taken or passwordeth no valid, please retryith")
    expect(page).to_not have_content("Signed in as sauron")
  end
end

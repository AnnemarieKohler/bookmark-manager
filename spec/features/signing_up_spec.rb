feature 'Signing up' do
  scenario 'can register as a new user' do
    expect { sign_up }.to change{User.count}.by 1
    expect(page).to have_content("Welcome, Anne")
    expect(User.first.email).to eq("anne@catsrule.com")
  end
end

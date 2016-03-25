feature 'Email field' do
  scenario 'cannot be blank' do
    expect { sign_up(email: nil) }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('We need your email address')
  end

  scenario 'can\'t sign up with an invalid formatted email address' do
    expect { sign_up(email: "anne-anne.berlin") }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Please make sure to enter your email address in the right format')
  end
end

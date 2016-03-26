feature 'Sign out' do
  let(:user) do
    User.create(username: 'Anne',
                email: 'anne@catsrule.com',
                password: 'cat',
                password_confirmation: 'cat')
  end

  scenario 'can sign out of session' do
    sign_in(user.email, user.password)
    sign_out
    # expect(user).to be_nil
    # expect(current_path).to eq 'sessions/new'
    expect(page).to have_content('Thanks for your visit. Have a good day!')
    expect(page).not_to have_content('Welcome, Anne')
  end
end

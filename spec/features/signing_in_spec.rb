feature 'Sign in' do
  let(:user) do
    User.create(username: 'Anne',
                email: 'anne@catsrule.com',
                password: 'cat',
                password_confirmation: 'cat')
  end

  scenario 'can sign in' do
    sign_in(user.email, user.password)
    expect(current_path).to eq('/links')
    expect(page).to have_content "Welcome, #{user.username}"
  end

end

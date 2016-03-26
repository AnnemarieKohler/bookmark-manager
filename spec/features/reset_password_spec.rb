feature 'Reset password' do
  before do
    sign_up
    Capybara.reset!
  end
  let(:user) { User.first }
  scenario 'can click reset password link' do
    visit '/sessions/new'
    click_link 'Reset password'
    expect(page).to have_content('Please enter your email address')
  end
  scenario 'can fill out reset password form to receive token' do
    reset_password
    expect(page).to have_content "Thanks, Please check your inbox for the link."
  end

  scenario 'assigned a reset token to the user when they recover' do
    expect{ reset_password }.to change{ user.password_token }
  end
end

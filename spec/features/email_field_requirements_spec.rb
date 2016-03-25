feature 'Email field' do
  scenario 'cannot be blank' do
    expect { sign_up(email: '') }.not_to change(User, :count)
  end

  # scenario 'has to be a valid email format' do
  #
  # end
end

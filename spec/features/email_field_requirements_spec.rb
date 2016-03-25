feature 'Email field' do
  scenario 'cannot be blank' do
    expect { sign_up(email: '') }.not_to change(User, :count)
  end

  scenario 'can\'t sign up with an invalid formatted email address' do
    expect { sign_up(email: "anne-anne.berlin") }.not_to change(User, :count)
  end
end

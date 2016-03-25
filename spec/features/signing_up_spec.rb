feature 'Signing up' do
  scenario 'can register as a new user' do
    expect { sign_up }.to change{User.count}.by 1
    expect(page).to have_content("Welcome, Anne")
    expect(User.first.email).to eq("anne@catsrule.com")
  end

  scenario 'cannot sign up if email is already registered' do
    expect { sign_up(email: 'one@abc.de') }.to change(User, :count)
    expect { sign_up(email: 'one@abc.de') }.to_not change(User, :count)
    expect(page).to have_content('Email address is already registered')
  end
end

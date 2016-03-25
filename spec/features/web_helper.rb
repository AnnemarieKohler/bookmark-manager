def create_link
  visit ('/links/new')
  fill_in :url, with: 'www.google.com'
  fill_in :title, with: 'Google'
  fill_in :tags, with: 'searchengine'
  click_button 'Create Link'
end

def sign_up(username: 'Anne',
            email: 'anne@catsrule.com',
            password: 'cat',
            password_confirmation: 'cat')
  visit('/users/new')
  fill_in :username, with: username
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button "Submit"
end

def sign_in(email, password)
  visit '/sessions/new'
  fill_in :email, with: email
  fill_in :password, with: password
  click_button 'Sign in'
end

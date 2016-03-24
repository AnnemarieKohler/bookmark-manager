def create_link
  visit ('/links/new')
  fill_in :url, with: 'www.google.com'
  fill_in :title, with: 'Google'
  fill_in :tags, with: 'searchengine'
  click_button 'Create Link'
end

def sign_up(password_confirmation: 'cat')
  visit('/users/new')
  fill_in :username, with: 'Anne'
  fill_in :email, with: 'anne@catsrule.com'
  fill_in :password, with: 'cat'
  fill_in :password_confirmation, with: password_confirmation
  click_button "Submit"
end

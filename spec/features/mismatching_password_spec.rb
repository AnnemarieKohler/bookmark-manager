 feature 'Mismatching password' do
   scenario 'I cannot sign up with a mismatching password' do
     expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
   end

   def sign_up(password_confirmation: 'cat')
     visit('/users/new')
     fill_in :username, with: 'Anne'
     fill_in :email, with: 'anne@catsrule.com'
     fill_in :password, with: 'cat'
     fill_in :password_confirmation, with: password_confirmation
     click_button "Submit"
   end
 end

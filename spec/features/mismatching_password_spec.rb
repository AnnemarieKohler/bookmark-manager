 feature 'Mismatching password' do
   scenario 'I cannot sign up with a mismatching password' do
     expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
   end
 end

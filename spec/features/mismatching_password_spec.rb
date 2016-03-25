 feature 'Mismatching password' do
   scenario 'User can\'t sign up' do
     expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
     expect(current_path).to eq '/users'
     expect(page).to have_content 'Password and confirmation password do not match'
   end
 end

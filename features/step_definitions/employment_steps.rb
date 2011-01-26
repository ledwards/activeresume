Given /^I have a current employment record$/ do
  Factory.create(:employment, :user_id => @user.id)
end

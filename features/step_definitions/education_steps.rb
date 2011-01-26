Given /^I have a current education record$/ do
  Factory.create(:education, :user_id => @user.id)
end

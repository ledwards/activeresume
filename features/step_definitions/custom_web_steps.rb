When /^I attach the file at "([^"]*)" to "([^"]*)"$/ do |path, field|
  attach_file(field, path)
end

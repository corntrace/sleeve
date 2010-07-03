Transform /^(.+)\[(.+)\]$/ do |type, label|
  begin
    fetch_from_sleeve_pocket(label)
    # push_into_sleeve_pocket(type, label)
  rescue NameError => e
    raise "The model \"#{type.classify}\" is not defined. Please check your spelling or add a new model."
  end
end

# used in Background
Given /^Code, CodeGroup and Comment AR models and User, HotDog class exist$/ do
  load File.dirname(__FILE__)+"/models.rb"
end
Given /^I have loaded Sleeve$/ do
  %w{Sleeve Code CodeGroup Comment User HotDog}.each do |klass|
    defined?(klass.constantize).should_not be_nil
  end
end


# used in Scenario(creating simple code models)
Given /^I have a following (.+) exists?$/ do |model, table|
  table.hashes.each do |fields|
    push_into_sleeve_pocket model.singularize.classify.constantize.create(fields)
  end
end
Then /^I should access a code via (code\[(.+)\])$/ do |code, label|
  code.should == fetch_from_sleeve_pocket(label)
end


# used in Scenario(transform single attribute model)
Given /^I have a ((.+)\[.+\]) exist$/ do |user, type|
  user.should be_instance_of type.classify.constantize
end
Then /^I could access ((.+)\[(.+)\]) from sleeve pocket$/ do |user, type, username|
  user.should == fetch_from_sleeve_pocket(username)
end



Given /^I have a following code groups exist$/ do |table|
  # table is a Cucumber::Ast::Table
  pending # express the regexp above with the code you wish you had
end

Then /^I should access objects through the object pool$/ do
  pending # express the regexp above with the code you wish you had
end

require 'spec_helper'

describe User do
	
  # This block is run before each test and creates a hash having valid attributes
  before(:each) do
    @attr = {
      :name => "Pierre Lasante",
      :email => "plasante@email.com"
    }
  end

  it "should create a new instance given valid attributes" do
    User.create!(@attr)
  end
  
  it "should require a name" do
  	# We invalidate the :name attribute
  	no_name_user = User.new(@attr.merge(:name => ""))
  	no_name_user.should_not be_valid
  end
  
  it "should require an email address" do
  	# We invalidate the :email attribute
  	no_email_user = User.new(@attr.merge(:email => ""))
  	no_email_user.should_not be_valid
  end
  
  it "should reject names that are too long" do
  	long_name = 'a' * 51
  	long_name_user = User.new(@attr.merge(:name => long_name))
  	long_name_user.should_not be_valid
  end
  
  it "should accept valid email addresses" do
  	addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
  	addresses.each do |address|
  	  valid_email_user = User.new(@attr.merge(:emaill => address))
  	  valid_email_user.should be_valid
  	end
  end
  
  it "should reject invalid email addresses" do
  	addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
  	addresses.each do |address|
  	  invalid_email_user = User.new(@attr.merge(:email => address))
  	  invalid_email_user.should_not be_valid
  	end
  end
  
  it "should reject duplicate email addresses" do
  	# Put a valid user in the database
  	User.create!(@attr)
  	user_with_duplicate_email = User.new(@attr)
  	user_with_duplicate_email.should_not be_valid
  end
end

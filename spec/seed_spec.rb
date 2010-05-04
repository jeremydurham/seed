require 'rubygems'
require 'spec'
require 'active_record'
require 'seed'

class User < ActiveRecord::Base
  validates_presence_of :email
end

describe Seed do
  before do
    ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => ":memory:")
    load File.join(File.dirname(__FILE__), 'db', 'schema.rb')
  end
  
  describe "planting a seed" do    
    it "should raise a RuntimeError when trying to overwrite a seed" do
      User.seed(:first, :email => 'test@testing.com')
      lambda do
        User.seed(:first, :email => 'testing@test.com')
      end.should raise_error(RuntimeError)
    end
    
    it "should create a new seed given valid attributes" do
      lambda do
        User.seed(:tester, :email => 'test@testing.com')
      end.should change(User, :count).by(1)
    end
    
    describe "given a block" do
      it "should create a new seed" do
        lambda do
          User.seed(:block_user) do |user|
            user.email = 'test@test.com'
          end
        end.should change(User, :count).by(1)
      end
    end    
  end
  
  describe "retrieving a seed" do
    it "should raise a RuntimeError when trying to retrieve an invalid seed" do
      lambda do
        User.seed(:invalid_user)
      end.should raise_error(RuntimeError)
    end
    
    it "should return a seed" do
      @user = User.seed(:new_user, :email => 'newuser@test.com')
      @user.should == User.seed(:new_user)
    end
  end
end
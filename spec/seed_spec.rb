require 'rubygems'
require 'spec'
require 'active_record'
require 'seed'

class User < ActiveRecord::Base
  has_many :user_roles
  has_many :users, :through => :user_roles
  
  validates_presence_of :email
  
  attr_protected :roles
end

class Role < ActiveRecord::Base
  has_many :user_roles
  has_many :users, :through => :user_roles
end

class UserRole < ActiveRecord::Base
  belongs_to :role
  belongs_to :user
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
          Role.seed(:system_administrator) do |role|
            role.name = 'System Administrator'
            role.role = 'system_administrator'
          end
        end.should change(Role, :count).by(1)
      end
      
      it "should set a protected attribute" do
        User.seed(:user_with_role) do |user|
          user.email = 'user_with_role@example.com'
          user.roles = [Role.seed(:system_administrator)]
        end
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
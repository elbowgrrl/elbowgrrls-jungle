require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe "Validations" do
  
    before(:each) do
      @user = User.new(
        name: "Irma Gurd",
        email: "irma@irmagurd.com",
        password: "1234",
        password_confirmation: "1234"
      )
    end  

    it "is valid with all fields and matching passwords" do
      expect(@user.save).to eq true
    end  

    it "is not valid when passwords do not match" do
      @user.password_confirmation = "12334"
      expect(@user.save).to eq false
    end

    it "is not valid when email is missing" do
      @user.email = nil
      expect(@user.save).to eq false
    end  

    it "is not valid with name missing" do
      @user.name = nil
      expect(@user.save).to eq false
    end  

    it "is valid with mixed case email" do
      @user.save
      @user2 = User.new(
        name: "Irma Gurd",
        email: "iRMa@irmagurd.cOM",
        password: "1234",
        password_confirmation: "1234"
      )
      expect(@user2.save).to eq false
    end  

    it "is not valid with a password less than three characters" do
    @user.password_confirmation = "2"
    @user.password = "2"
    expect(@user.save).to eq false 
    end

  end  

  describe ".authenticate_with_credentials" do

    before(:each) do
      @user = User.new(
        name: "Irma Gurd",
        email: "irma@irmagurd.com",
        password: "1234",
        password_confirmation: "1234"
      )
    end 

    context "a valid email and password are provided" do

      it "returns a user" do
        @user.save
        expect(User.authenticate_with_credentials("irma@irmagurd.com", "1234")).to eq @user
      end 
    end 

    context "a valid email" do

      it "returns a user if the email has spaces" do
        @user.save
        expect(User.authenticate_with_credentials("   irma@irmagurd.com", "1234")).to eq @user
      end 

      it "returns a user if the email is mixed case" do
        @user.save
        expect(User.authenticate_with_credentials("irMa@irmagUrd.com", "1234")).to eq @user
      end  
    end 

  end  

end




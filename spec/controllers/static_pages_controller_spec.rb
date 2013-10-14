require 'spec_helper'

describe StaticPagesController do

  describe "GET 'home'" do
    it "returns http success" do
      get 'home'
      response.should be_success
    end
  end

  describe "GET 'help'" do
    it "returns http success" do
      get 'help'
      response.should be_success
    end
  end

  describe "GET 'about'" do
    it "returns http success" do
      get 'about'
      response.should be_success
    end
  end

  describe "GET 'contact'" do
    it "returns http success" do
      get 'contact'
      response.should be_success
    end
  end

  describe "GET 'manifesto'" do
    it "returns http success" do
      get 'manifesto'
      response.should be_success
    end
  end

  describe "GET 'faqs'" do
    it "returns http success" do
      get 'faqs'
      response.should be_success
    end
  end

  describe "GET 'support'" do
    it "returns http success" do
      get 'support'
      response.should be_success
    end
  end

  describe "GET 'terms'" do
    it "returns http success" do
      get 'terms'
      response.should be_success
    end
  end

  describe "GET 'privacy'" do
    it "returns http success" do
      get 'privacy'
      response.should be_success
    end
  end

  describe "GET 'security'" do
    it "returns http success" do
      get 'security'
      response.should be_success
    end
  end

end

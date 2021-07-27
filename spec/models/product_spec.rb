require 'rails_helper'

RSpec.describe Product, type: :model do

  describe "Validations" do

    before(:each) do
      @category = Category.new(name: "Toy")
      @product  = @category.products.new(
        name: "Han Solo Figurine",
        price_cents: 10000,
        quantity: 7
      )
    end  

    it "is valid with all fields" do
      expect(@product.save).to eq true
    end  

    it "fails with a blank name field" do
      @product.name = nil
      @product.save
      expect(@product.save).to eq false
      expect(@product.errors.messages[:name]).to eq ["can't be blank"]
    end 

    it "fails with a blank price field" do
      @product.price_cents = nil
      @product.save
      expect(@product.save).to eq false
    end  

    it "fails with a blank quantity" do
      @product.quantity = nil
      @product.save
      expect(@product.save).to eq false
    end  

    it "fails with a blank category" do
      @product.category = nil
      @product.save
      expect(@product.save).to eq false
    end  

  end


end




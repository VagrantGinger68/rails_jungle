require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "saves a product when all four fields are set" do
      @category = Category.new(name: 'New Category')
      @product = Product.new(name: 'New Product', price_cents: 50, quantity: 2, category: @category)
      expect(@product.save).to eq true
    end

    it "must include a name" do
      @category = Category.new(name: 'New Category')
      @product = Product.new(name: nil, price_cents: 336, quantity: 16, category: @category)
      expect(@product.save).to eq false
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it "must include a price" do
      @category = Category.new(name: 'New Category')
      @product = Product.new(name: 'New Product', price_cents: nil, quantity: 7, category: @category)
      expect(@product.save).to eq false
      expect(@product.errors.full_messages).to include("Price cents is not a number", "Price is not a number", "Price can't be blank")
    end

    it "must include a quantity" do
      @category = Category.new(name: 'New Category')
      @product = Product.new(name: 'New Product', price_cents: 556.99, quantity: nil, category: @category)
      expect(@product.save).to eq false
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it "must include a category" do
      @category = Category.new(name: 'New Category')
      @product = Product.new(name: 'New Product', price_cents: 556.99, quantity: 200, category: nil)
      expect(@product.save).to eq false
      expect(@product.errors.full_messages).to include("Category must exist", "Category can't be blank")
    end

  end
end

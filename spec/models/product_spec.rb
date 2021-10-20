require 'rails_helper'

RSpec.describe Product, type: :model do
  
  describe 'Validations' do
    it 'validates product' do
      category = Category.create!
      product = Product.create!(name: 'John', price: nil, quantity: 5, category: category)

      expect(product).to be_valid
    end

    it 'validates product name' do
      category = Category.create!
      product = Product.new(name: nil, price: 10, quantity: 5, category: category)

      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include("Name can't be blank")
    end

    it 'validates product price' do
      category = Category.create!
      product = Product.new(name: 'Neil', price: nil, quantity: 5, category: category)
      
      expect(product.price).to be_zero
      # expect(product.errors.full_messages).to include("Price can't be blank")
    end

    it 'validates product quantity' do
      category = Category.create!
      product = Product.new(name: 'Paul', price: 10, quantity: nil, category: category)

      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'validates product category' do
      product = Product.new(name: 'Sarah', price: 10, quantity: 5, category: nil)

      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
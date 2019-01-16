require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  subject(:cake) { Dessert.new("cake", 2, :chef)}

  describe "#initialize" do
    it "sets a type" do
      expect(cake.type).to eq("cake")
    end

    it "sets a quantity" do
      expect(cake.quantity).to eq(2)
    end

    it "starts ingredients as an empty array" do
      expect(cake.ingredients).to eq([])
    end
    

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("cake", "vanila", :chef)}.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      cake.add_ingredient("butter")
      expect(cake.ingredients).to include("butter")
    end
  end
  
  describe "#mix!" do
    it "shuffles the ingredient array" do 
      ingredients_test = ["chocolate", "essence", "sugar", "flour"]
      
      ingredients_test.each { |ing| cake.add_ingredient(ing) unless cake.ingredients.include?(ing) }
      expect(cake.ingredients).to eq(ingredients_test)
      
      cake.mix!
      expect(cake.ingredients.sort).to eq(ingredients_test.sort)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      cake.eat(1)
      expect(cake.quantity).to eq(1)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { cake.eat(12) }.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("")
      expect(cake.serve).to include(chef.name.titleize)
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in"
  end
end

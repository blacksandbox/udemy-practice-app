require "test_helper"

class RecipeTest < ActiveSupport::TestCase
  
  #set up
  def setup
    @nonTest_chef = Chef.create(chefname: "Kifer", email: "king2@gmail.com")
    @recipe = @nonTest_chef.recipes.new(name: "Kiefer Soup", summary: "Soup made out of Kiefer", description: "1. Take Kiefer, 2. Put him in boiling hot water, 3.Ignore blood curdling scream for 20 minutes, 4. Done")
  end
  
  #tests!
  test "recipe name must be present" do
    @recipe.name =""
    assert_not @recipe.valid?
  end
  
  test "recipe must have chef_id associated" do
    @recipe.chef_id = nil
    assert_not @recipe.valid?
  end
  
  test "recipe name must be between 5-100 characters" do
    @recipe.name = "bird"
    errorTooShort = @recipe.valid?
    @recipe.name = "a"*101
    errorTooLong = @recipe.valid?
    
    assert_not errorTooLong and errorTooShort
  end
  
  test "recipe summary must be present" do
    @recipe.summary = ""
    errorNoSummary = @recipe.valid?
    @recipe.summary = "1"
    errorTooShort = @recipe.valid?
    @recipe.summary = "b"*151
    errorTooLong = @recipe.valid?
    
    assert_not errorNoSummary and errorTooShort and errorTooLong
  end
  
end
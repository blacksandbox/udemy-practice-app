require "test_helper"

class ChefTest < ActiveSupport::TestCase
  def setup
    @chef = Chef.create(chefname: "Eight", email: "8.eigen@gmail.com") #saved into sandbox!
    
    #you are not testing recipe here
    #@recipe = @chef.recipes.build(name: "Earth bite", summary: "Intake of mineral from Earth", description: "1. Soil around vegetation are moist, 2. take a big bite along with vegetation")
    
  end
  
  #only writing down unique test
  
  test "email should be unique" do
    dup_chef = @chef.dup
    
    dup_chef.email = @chef.email.upcase
    @chef.save #in order to check for duplicate, this must exist in sandbox-db
    
    assert_not dup_chef.valid?
  end
end
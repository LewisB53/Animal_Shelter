require ("minitest/autorun")
require("minitest/rg")
require_relative("../models/animal")

class TestAnimal < Minitest::Test

  def setup
    @animal1 = Animal.new({
  'name' => "Skip",
  'age' => 6,
  'admission_date'=> "11/01/2017",
  'adoptable' => true
  })
  end


  def test_create_animal
    assert_equal(Animal, @animal1.class)
  end

 def test_can_return_hash
    assert_equal("Skip", @animal1.name)
 end

end
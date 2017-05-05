require ("minitest/autorun")
require("minitest/rg")
require_relative("../models/animal")

class TestAnimal < Minitest::Test

  def setup
    @animal1 = Animal.new("hash_goes_here")
  end


  def test_create_animal
    assert_equal(Animal, @animal1.class)
  end


end
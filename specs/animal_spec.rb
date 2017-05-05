require ("minitest/autorun")
require("minitest/rg")
require_relative("../models/animal")

class TestAnimal < Minitest::Test

  def setup
    @animal1 = Animal.new("Skip", 6, "11/01/2017", true)
  end



end
require ("minitest/autorun")
require("minitest/rg")
require_relative("../models/owner")

class TestAnimal < Minitest::Test

  def setup
    @owner1 = Owner.new({"name" => "Lewis"})
  end


end
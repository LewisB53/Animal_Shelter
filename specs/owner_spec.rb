require ("minitest/autorun")
require("minitest/rg")
require_relative("../models/owner")

class TestOwner < Minitest::Test

  def setup
    @owner1 = Owner.new({"name" => "Lewis"})
  end

  def test_create_owner
    assert_equal(Owner, @owner1.class)
  end

  def test_can_return_hash
     assert_equal("Lewis", @owner1.name)
  end

end
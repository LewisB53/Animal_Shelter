require_relative("../models/animal.rb")
require_relative("../models/owner.rb")
require('pry-byebug')
require_relative('./sqlrunner.rb')

animal1 = Animal.new({
  'name' => "Skip",
  'age' => 6,
  'admission_date'=> "11/01/2017",
  'adoptable' => true
  })

binding.pry
nil
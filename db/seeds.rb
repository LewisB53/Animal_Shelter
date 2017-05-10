require_relative("../models/owner.rb")
require_relative("../models/animal.rb")
require_relative('./sqlrunner.rb')
require('pry-byebug')


owner1 = Owner.new({
  'name' => "Shelter"
  })
owner1.save

animal1 = Animal.new({
  'name' => "Skip",
  'age' => 6,
  'admission_date'=> "11/01/2017",
  'adoptable' => false,
  'owner_id' => owner1.id
  })

animal1.save

binding.pry
nil
class Animal
  attr_reader :id
  attr_accessor :name, :age, :admission_date, :adoptable

  def initialize(params)
    @id = params ['id'].to_i
    @name = params ['name']
    @age = parmas ['age'].to_i
    @admission_date = params ['admission_date']
    @adoptable = params ['adoptable']
  end




end
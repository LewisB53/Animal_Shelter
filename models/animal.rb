class Animal
  attr_reader :id
  attr_accessor :name, :age, :admission_date, :adoptable

  def initialize(params)
    @id = params['id'].to_i
    @name = params['name']
    @age = params['age'].to_i
    @admission_date = params['admission_date']
    @adoptable = params['adoptable']
  end

  def save()
    sql = "INSERT INTO animals 
        (name, age, admission_date, adoptable)
        VALUES 
        ('#{@name}', '#{@age}','#{@admission_date}', '#{@adoptable}')
        RETURNING id;"
    animal_data = SqlRunner.run(sql)
    @id = animal_data.first()['id'].to_i
  end

  def self.all()
    sql = "
    SELECT * FROM animals;
    "
    result = SqlRunner.run(sql)
    animal_hash = result.map { |an_animal| Animal.new(an_animal) }
    return animal_hash
  end

end
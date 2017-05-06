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
    saved_animal = SqlRunner.run(sql)
    @id = saved_animal.first()['id'].to_i
  end

  def self.all()
    sql = "
    SELECT * FROM animals;
    "
    result = SqlRunner.run(sql)
    list = result.map { |an_animal| Animal.new(an_animal) }
    return list
  end

 def update()
   sql = "
   UPDATE animals SET (
     name,
     age,
     admission_date,
     adoptable
   ) = (
     '#{@name}',
     '#{@age}',
     '#{@admission_date}',
     #{@adoptable} )
   WHERE id = #{@id}"
   updated = SqlRunner.run(sql)
   return updated
 end

end
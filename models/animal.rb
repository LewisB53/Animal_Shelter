class Animal
  attr_reader :id
  attr_accessor :name, :age, :admission_date, :adoptable, :owner_id

  def initialize(params)
    @id = params['id'].to_i
    @name = params['name']
    @age = params['age'].to_i
    @admission_date = params['admission_date'].to_s
    # @adoptable_string = params['adoptable'].to_s
    @adoptable = params['adoptable']
    @owner_id = params['owner_id'].to_i if params['owner_id'].to_i
  end

  def save()
    sql = "INSERT INTO animals 
    (name, age, admission_date, adoptable, owner_id)
    VALUES 
    ('#{@name}', '#{@age}','#{@admission_date}', #{@adoptable}, '#{@owner_id}')
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
   sql = "UPDATE animals SET (
   name,
   age,
   admission_date,
   adoptable,
   owner_id)
   = (
   '#{@name}',
   '#{@age}',
   '#{@admission_date}',
   #{@adoptable},
   #{@owner_id} 
   )
   WHERE id = #{@id};"
   updated = SqlRunner.run(sql)
   return updated
 end

 def self.owned()
   sql = "SELECT * FROM animals WHERE owner_id > 0"
   animals = SqlRunner.run(sql)
   result = self.map_items(sql)
   return result
 end


 def self.map_items(sql)
   animals = SqlRunner.run(sql)
   result = animals.map { |an_animal| Animal.new( an_animal ) }
   return result
 end

 def owner()
   sql = "SELECT * FROM owners WHERE id = #{ @owner_id }"
   owner = SqlRunner.run( sql )
   result = Owner.new( owner.first )
   return result
 end

end
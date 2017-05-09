class Owner
  attr_reader :id
  attr_accessor :name

  def initialize(params)
    @id = params['id'].to_i
    @name = params['name']
  end

  def save()
    sql = "INSERT INTO owners 
    (name)
    VALUES 
    ('#{@name}')
    RETURNING id;"
    saved_owner = SqlRunner.run(sql)
    @id = saved_owner.first()['id'].to_i
  end

   def update()
    sql = "UPDATE owners SET (name) = ('#{@name}')
    WHERE id = #{@id};"
    updated = SqlRunner.run(sql)
    return updated
  end

  def self.all()
    sql = "
    SELECT * FROM owners;
    "
    result = SqlRunner.run(sql)
    owner_list = result.map { |an_owner| Owner.new(an_owner) }
    return owner_list
  end

  def animal
    sql = "SELECT * FROM animals a
          WHERE a.owner_id = #{@id}"
    result = SqlRunner.run( sql )
   animal_list = result.map { |an_animal| Animal.new(an_animal) }
   return animal_list
  end


end
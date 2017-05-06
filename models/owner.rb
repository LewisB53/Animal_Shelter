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


end
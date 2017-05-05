class Owner
  attr_reader :id
  attr_accessor :name

  def initialize(params)
    @id = params['id'].to_i
    @name = params['name']
  end




end
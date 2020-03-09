class Pokemon
  
  attr_accessor :name, :type, :db, :id
  
  def initialize (name:, type:, db:, id:)
    @name = name
    @type = type
    @db = db
    @id = id
  end
  
  def self.save(name, type, db)
    sql = <<-SQL
      INSERT INTO pokemon (name, type) VALUES (?, ?)
    SQL
    
    db.execute(sql, [name, type])
    
  end
  
   def self.find(id_num, db)
    new_pokemon = db.execute("SELECT *FROM pokemon WHERE id=?", id_num).flatten
    
    Pokemon.new(id: new_pokemon[0], name: new_pokemon[1], type: new_pokemon[2], db: db)
  end

end
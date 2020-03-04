class Pokemon
  attr_accessor :name, :type, :db
  attr_reader :id

  
  def initialize(id:nil, name:, type:, db:)
    @id = id
    @name = name 
    @type = type
    @db = db
  end 
  
  def self.save(name, type, db)
    sql = <<-SQL
        INSERT INTO pokemon (name, type)
        VALUES (?, ?)
       SQL
       db.execute(sql, name, type)
       @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
  end
  
  def self.find(id, db)
    sql = "SELECT * FROM pokemon WHERE id = ? LIMIT 1"
    db_pokemon = db.execute(sql,id).flatten
    new_pokemon = Pokemon.new(id:db_pokemon[0], name:db_pokemon[1], type:db_pokemon[2], db:db)
    
  end 
  
end

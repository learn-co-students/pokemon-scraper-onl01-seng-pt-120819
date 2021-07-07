require 'pry'
class Pokemon
    attr_accessor :id, :name, :type, :db
    def initialize(id:, name:, type:, db:)
        @name = name
        @type = type
        @db = db
        @id = id
    end

    def self.save(name, type, db)    
    
        db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
    end

    def self.find(number, db)
    # binding.pry
         sql = <<-SQL 
         SELECT * 
         FROM pokemon
         WHERE id = ?  
         SQL
        
        result = db.execute(sql, number)[0] 
        Pokemon.new(id: result[0], name: result[1], type: result[2], db: db)
        # binding.pry
    end
end

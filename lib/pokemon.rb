class Pokemon
    attr_accessor :id, :name, :type, :db 

    def initialize(id:, name:, type:, db:) #is initialized with keyword arguments of id, name, type and db
        @id, @name, @type, @db = id, name, type, db
    end

    def self.save(name, type, db) #saves an instance of a pokemon with the correct id
        db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
    end

    def self.find(id_number, db) #finds a pokemon from the database by their id number and returns a new Pokemon object
        pokemon_info = db.execute("SELECT * FROM pokemon WHERE id = ?", id_number).flatten

        self.new(id: pokemon_info[0], name: pokemon_info[1], type: pokemon_info[2], db: db)
    end
end

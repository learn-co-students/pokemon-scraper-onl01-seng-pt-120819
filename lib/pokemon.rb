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
        sql = "INSERT INTO pokemon(name, type) VALUES (?,?)"
        db.execute(sql, name, type)
        @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
    end

    def self.find(id, db)
        sql = "SELECT * FROM pokemon WHERE id = ? LIMIT 1"
        database_pokemon = db.execute(sql,id).flatten
        new_instance = Pokemon.new(id:database_pokemon[0], name:database_pokemon[1], type:database_pokemon[2], db:db)
    end
end


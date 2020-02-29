class Pokemon

    attr_accessor :name, :type, :db 
    attr_reader :id 

    def initialize(id:, name:, type:, db:)
        @id = id
        @name = name
        @type = type 
        @db = db 
    end

    def self.save(name, type, db)
        sql = "INSERT INTO pokemon (name, type)
              VALUES (?, ?)"
        db.execute(sql, name, type)
        @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
    end

    def self.find(id, db)
        sql = "SELECT * FROM pokemon WHERE id = ?"
        returned_row = db.execute(sql, id)[0]
        self.new(returned_row[0], returned_row[1], returned_row[2], db)
    end
end

class Pokemon
      attr_accessor :id, :name, :type, :db
      
      def initialize (id:, name:, type:, db:)
          @id = id 
          @name = name
          @type = type
          @db = db 
      end 
      
      def self.save(name, type, db) 
          sql = "INSERT INTO pokemon (name, type)
                VALUES (?,?) "
                db.execute(sql, [name, type])
                @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
      end 
      
      def self.find(id, db)
          find_pokemon = db.execute("SELECT * FROM pokemon WHERE id=?", id).first
          Pokemon.new(id: find_pokemon[0], name: find_pokemon[1], type: find_pokemon[2], db: db )
      end


end

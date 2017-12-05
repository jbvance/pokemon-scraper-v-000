require 'pry'
class Pokemon
  attr_accessor :id, :name, :type, :db, :hp
  def initialize(id:, name:, type:, hp: nil, db:)
      @id, @name, @type, @db, @hp = id, name, type,  db, hp
  end

    def self.save(name, type, db)
       db.execute("INSERT INTO Pokemon (name, type) VALUES (?, ?)",name, type)
    end

    def self.find(id, db)
      found = db.execute("SELECT * FROM pokemon WHERE id=?", id).flatten
      Pokemon.new(id: found[0], name: found[1], type: found[2], db: db)
    end

    def alter_hp(updated_hp, db)
      db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", updated_hp, self.id)
    end
end

class Pokemon
  attr_accessor :id, :name, :type, :db
  def initialize(id:, name:, type:, hp: nil, db:)
      @id, @name, @type, @db = id, name, type,  db
  end

    def self.save(name, type, db)
       db.execute("INSERT INTO Pokemon (name, type) VALUES (?, ?)",name, type)
    end
end

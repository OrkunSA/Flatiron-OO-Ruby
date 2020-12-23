class Rick
    attr_accessor :name, :status, :origin, :location
    @@all = []
    def initialize(name, status, origin)
        @name, @status, @origin = name, status, origin
        @@all << self
    end

    def self.all
        @@all
    end

    def self.all_names
        self.all.map{|rick| rick.name}
    end

    def self.find_by_index(index)
        all[index]
    end
end
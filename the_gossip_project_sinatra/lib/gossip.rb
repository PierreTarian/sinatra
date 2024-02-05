require 'csv'

class Gossip

  attr_accessor :author, :content
  def initialize(author, content)
    @author = author
    @content = content
  end

  def save
      CSV.open("./db/gossip.csv", "ab") do |csv|
        csv << [@author, @content]
      end
    end

    def self.all
      all_gossips = []
      CSV.read("./db/gossip.csv").each do |csv_line|
  
      all_gossips << Gossip.new(csv_line[0], csv_line[1])
      end
    return all_gossips
    end
    
    def self.find(id)
      return self.all[id]
    end

    def self.update(id,update)
      position = id.to_i
      gossips = self.all
      CSV.open("./db/gossip.csv", "w") do |csv|
        gossips.each.with_index do |i| 
          if position == gossips.index(i)
            csv << [i.author, update]
          else
            csv << [i.author, i.content]
          end
        end
      end
  
    end
 end


  
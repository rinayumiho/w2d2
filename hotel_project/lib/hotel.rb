require_relative "room"

class Hotel
  attr_reader :rooms

  def initialize(name, hash)
    @name = name
    @rooms = Hash.new
    hash.each { |k, v| @rooms[k] = Room.new(v) }
  end

  def name
    arr = @name.split.map { |w| w.capitalize }
    arr.join(" ")
  end

  def room_exists?(name)
    @rooms.key?(name)
  end

  def check_in(person, name)
    if !room_exists?(name)
      puts "sorry, room does not exist"
      return
    end
    if @rooms[name].add_occupant(person)
      puts "check in successful"
    else
      puts "sorry, room is full"
    end
  end

  def has_vacancy?
    @rooms.values.any? { |v| !v.full? }
  end

  def list_rooms
    @rooms.each { |k, v| puts k + ":" + v.available_space.to_s }
  end
end

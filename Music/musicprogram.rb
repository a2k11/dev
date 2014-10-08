require 'csv'

class MusicDatabase
attr_reader :file
  def initialize(filename)
    @file = filename
  end

  def organize
    
    music_collection = []
    previous_artist = ""

    CSV.foreach(file, headers:true) do |row|
      music_collection << Song.new(row["Artist"],row["Name"])
    end

    music_collection.each do |name_and_song|
      if name_and_song.artist == previous_artist
        name_and_song.song_list
      else
        previous_artist = name_and_song.artist
        name_and_song.intro_list
      end
    end
end

class Song
attr_reader :artist, :song
  def initialize (artist_name, song_name)
    @artist = artist_name
    @title = song_name
  end
  def intro_list
    @old_artist = @artist
    puts ""
    puts "Query: #{@artist}"
    puts ""
    puts "*" * (13 + @artist.length)
    puts "* Songs by #{@artist} *"
    puts "*" * (13 + @artist.length)
    puts ""
    puts "#{@title}"
  end
  def song_list
    puts "#{@title}"
  end
end
end

adam = MusicDatabase.new("music.csv")
adam.organize


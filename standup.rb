#!/usr/bin/ruby
songs = File.open(File.join(File.dirname(__FILE__), "Standupfile")).readlines.each{|song|song.chomp! }
random_song = songs[rand(songs.size)]

play_time = ARGV[0].to_i || 10
xvfb = Process.fork do
    exec "Xvfb :99 -ac"
end

browser = Process.fork do
    exec "firefox --display=:99 #{random_song}"
end
sleep play_time
Process.kill "TERM", browser
Process.kill "TERM", xvfb

#!/usr/bin/ruby
songs = File.open(File.join(File.dirname(__FILE__), "Standupfile")).readlines.each{|song|song.chomp! }

play_time = ARGV[0].to_i || 10
xvfb = spawn "Xvfb :99 -ac"
browser = spawn "DISPLAY=:99 chromium-browser #{songs.sample}"

sleep play_time
Process.kill "TERM", browser
sleep 5 #wait for browser to quit
Process.kill "TERM", xvfb

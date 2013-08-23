require "socket"

server = "chat.freenode.net"
port = "6667"
nick = "CalmingManatee"
channel = "#bitmaker"
msg_prefix = "privmsg #bitmaker :"
looking_for_sad = ["sad", "down", "blue", "unhappy"]
looking_for_angry = ["angry", "cranky", "not happy", "grouchy"]
looking_for_frust = ["frustrated", "frustration", "difficult", "hard", "frustrating"]

#words that indicate: sadness, anger, frustration

irc_server = TCPSocket.open(server, port)

irc_server.puts "USER bcalmingmanatee 0 * BCalmingManatee"
irc_server.puts "NICK #{nick}"
irc_server.puts "JOIN #{channel}"
#irc_server.puts "PRIVMSG #{channel} :Hello from IRB Bot"

# Hello, Bot!
until irc_server.eof? do
  msg = irc_server.gets.downcase
  puts msg

  needs_sad_manatee = false
  looking_for_sad.each do |g|
	needs_sad_manatee = true if msg.include? g
  end

  needs_angry_manatee = false
  looking_for_angry.each do |r|
  needs_angry_manatee = true if msg.include? r
  end

  needs_frust_manatee = false
  looking_for_frust.each do |r|
  needs_frust_manatee = true if msg.include? r
  end

  if msg.include? msg_prefix and needs_sad_manatee
  	response = ["Don't be sad! http://x11.xanga.com/17be1bf658332282231726/m224957988.jpg", "I feel your pain. http://24.media.tumblr.com/tumblr_m5m6wjAQl61qg1y0ro1_500.jpg", "You need to believe this: http://calmingmanatee.com/img/manatee.jpg", "Who are you listening to? http://3.bp.blogspot.com/-Q2Ksf5x4ymU/T8VwSN_XPiI/AAAAAAAAByI/up3PB7KwRo8/s1600/Screen+Shot+2012-05-28+at+7.31.33+PM.png"].choice
  	irc_server.puts "PRIVMSG #{channel} :#{response}"
  end

  if msg.include? msg_prefix and needs_angry_manatee
    response = ["Just take it one day at a time: http://24.media.tumblr.com/tumblr_mdet4cKMP71rqw39zo1_400.jpg", "Don't let 'em get you down: http://k44.kn3.net/3530A5D53.jpg", "Maybe you need a break: http://25.media.tumblr.com/tumblr_m8w88lY7a01rxqd36o1_1280.jpg", "Sometimes, you need a shark, not a manatee: http://24.media.tumblr.com/tumblr_mb714tBjWy1qenxaxo1_1280.jpg"].choice
    irc_server.puts "PRIVMSG #{channel} :#{response}"
  end

  if msg.include? msg_prefix and needs_frust_manatee
    response = ["I think you need to hear this: http://31.media.tumblr.com/tumblr_m4xk0yeUb61rxqd36o1_500.jpg", "Your hard work deserves a reward: http://25.media.tumblr.com/tumblr_m5f8umlmFm1qe70jlo6_400.jpg", "A message from your friends: http://i1062.photobucket.com/albums/t489/nettles10/tumblr_m5ul2i3Pxl1rxqd36o1_500.jpg", "Pull up a chair. http://www.thelondonegotist.com/sites/www.thelondonegotist.com/files/images/manatee13.img_assist_custom-480x322.jpg"].choice
    irc_server.puts "PRIVMSG #{channel} :#{response}"
  end
end
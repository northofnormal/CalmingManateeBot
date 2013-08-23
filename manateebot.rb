require "socket"

server = "chat.freenode.net"
port = "6667"
nick = "CalmingManatee"
channel = "#bitmaker"
msg_prefix = "privmsg #bitmaker :"
looking_for = ["sad", "down", "blue", "unhappy"]

#words that indicate: sadness, anger, frustration

irc_server = TCPSocket.open(server, port)

irc_server.puts "USER bhellobot 0 * BHelloBot"
irc_server.puts "NICK #{nick}"
irc_server.puts "JOIN #{channel}"
#irc_server.puts "PRIVMSG #{channel} :Hello from IRB Bot"

# Hello, Bot!
until irc_server.eof? do
  msg = irc_server.gets.downcase
  puts msg

  needs_a_manatee = false
  looking_for.each do |g|
	needs_a_manatee = true if msg.include? g
  #Change this line ^ to return three different manatees
  #Then, expand your manatees
  end

  if msg.include? msg_prefix and needs_a_manatee
  	response = ["Don't be sad! http://bit.ly/SAyNka", "I feel your pain. http://bit.ly/1d9z8GV", "You need to believe this: http://bit.ly/16ufPBu" ].choice
  	irc_server.puts "PRIVMSG #{channel} :#{response}"
  end

end
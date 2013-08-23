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
  	response = ["Don't be sad! http://bit.ly/SAyNka", "I feel your pain. http://bit.ly/1d9z8GV", "You need to believe this: http://bit.ly/16ufPBu", "Who are you listening to? http://bit.ly/1f7ybdS" ].sample
  	irc_server.puts "PRIVMSG #{channel} :#{response}"
  end

end

#angry manatees: ["Just take it one day at a time: http://bit.ly/14pJmx5", "Don't let 'em get you down: http://bit.ly/13WTee1", "Maybe you need a break: http://25.media.tumblr.com/tumblr_m8w88lY7a01rxqd36o1_1280.jpg", "Sometimes, you need a shark, not a manatee: http://bit.ly/1f7xT6N"]

#frustrated manatees: ["I think you need to hear this: http://bit.ly/153I6vo", "Your hard work deserves a reward: http://bit.ly/15ebfr9", "A message from your friends: http://bit.ly/178ZFyL", "Pull up a chair. http://bit.ly/18PeYvU"]
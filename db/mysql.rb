def connect_mysql
  $mysql = Mysql2::Client.new(:host => 'localhost', :username => 'root', :database => 'my-db')
  puts "Connected MySQL".green
end

#connect_mysql rescue puts "Could not connect Mysql".red
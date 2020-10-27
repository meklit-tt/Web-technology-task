# Use the pg library
require 'pg'
# PG::connect(dbname: "goya")により、rubyからgoyaDBに接続し
# Store the connection information in a variable named connection
connection = PG::connect(dbname: "goya")
connection.internal_encoding = "UTF-8"
begin
  #Manipulate PostgreSQL using  # connection variable
  # .exec "select weight, give_for from crops;" in goyaDB
#  Execute  # SQL statement directly and store the result in the result variable
  result = connection.exec("select date, self-consumption, give_for from crops;")
  # Process each fetched line
  result.each do |record|
      # Take each line and output it on the terminal with puts
      puts "ゴーヤの大きさ：#{record["self-consumption"]}　売った相手：#{record["give_for"]}"
  end
ensure
  #Finally, .finish disconnects the connection to the database
  connection.finish
end

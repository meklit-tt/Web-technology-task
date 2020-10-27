# Start the CGI program that receives and returns the data
require 'cgi'
cgi = CGI.new
# After receiving the data, return a response in HTML format
cgi.out("type" => "text/html", "charset" => "UTF-8") {
  # 受け取ったデータcgi['input']で取り出し、ローカル変数に代入する
  # Get information from the landmark'input'
  get = cgi['input']
  #Return response in HTML
  "<html>
    <body>
      <p>The received character string is as follows</p>
      <p>string：#{get}</p>
    </body>
  </html>"
}

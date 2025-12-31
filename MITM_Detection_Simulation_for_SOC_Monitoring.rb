require "time"  # Imports the Time library to generate timestamps

logs = [  # Array containing simulated MITM-related security events
  "ARP table changed unexpectedly",                    # Possible ARP spoofing
  "Multiple MAC addresses responding for same IP",     # Network impersonation indicator
  "TLS certificate mismatch detected",                 # SSL interception indicator
  "Session token reused from different IP",            # Session hijacking behavior
  "Unusual outbound traffic through unknown gateway"   # Traffic redirection/exfiltration
]

def timestamp  # Defines a method to generate a timestamp
  Time.now.utc.iso8601  # Returns the current UTC time in ISO 8601 format
end

puts "SOC monitoring started"          # Indicates SOC monitoring has begun
puts "Listening for network anomalies" # Shows system is observing network activity
puts "-" * 40                          # Prints a visual separator

logs.each do |event|  # Iterates through each simulated log entry
  sleep(1)            # Delays output to simulate real-time event generation
  puts "[#{timestamp}] #{event}"  # Prints timestamped security event
end

puts "-" * 40                          # Prints another separator
puts "Potential MITM activity detected" # SOC conclusion based on indicators
puts "Incident forwarded for investigation" # Escalation to IR team
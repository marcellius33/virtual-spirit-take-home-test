require 'digest'
require 'find'

def scan_files(path)
    file_content_hashes = Hash.new { |hash, key| hash[key] = { count: 0, content: "" } }

    # Find all files in the args path
    Find.find(path) do |file|
        next if File.directory?(file)

        # Convert content to hash
        file_content = File.read(file)
        file_content_hash = Digest::SHA256.hexdigest(file_content)

        # Store the content and increment the count for this hash
        if file_content_hashes[file_content_hash][:count] == 0
            file_content_hashes[file_content_hash][:content] = file_content
        end
        file_content_hashes[file_content_hash][:count] += 1
    end

    file_content_hashes
end

def most_frequent_content(file_content_hashes)
    most_frequent_entry = file_content_hashes.max_by { |_, value| value[:count] }
    most_frequent_entry ? [most_frequent_entry[1][:content], most_frequent_entry[1][:count]] : nil
end

if ARGV.empty?
    puts "Enter path"
    exit
end

path = ARGV[0]

unless Dir.exist?(path)
    puts "Invalid path: #{path}"
    exit
end

# Scan files and count
file_content_hashes = scan_files(path)

# Solution of problem
most_frequent_content_entry = most_frequent_content(file_content_hashes)

if most_frequent_content_entry
    content, count = most_frequent_content_entry
    puts "#{content} #{count}"
  else
    puts "No files found in the specified path."
  end



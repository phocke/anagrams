class Anagram < ActiveRecord::Base

  validates :word, presence: true, uniqueness: true

  class << self
    def handle_upload(file)
      anagrams_file = file
      
      begin
        uploaded_file_name = Rails.root.join('public', 'uploads', anagrams_file.original_filename)
        
        File.open(uploaded_file_name, 'w') do |file|
          file.write(anagrams_file.read)
        end

        create_multiple(uploaded_file_name)

        return true
      rescue
        return false
      end
    end

    def create_multiple(file_name)
      File.open(file_name, 'r') do |file|
        while (line = file.gets)
          word = line.chomp
          next unless Anagram.create word: word, sorted_word: word.sorted          
        end
      end      
    end

  end


end

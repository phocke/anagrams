class Anagram < ActiveRecord::Base

  def self.handle_upload(file)
    anagrams_file = file
    
    puts anagrams_file.inspect
    begin
      File.open(Rails.root.join('public', 'uploads', anagrams_file.original_filename), 'w') do |file|
        file.write(anagrams_file.read)
      end
      return true
    rescue
      return false
    end
  end

end

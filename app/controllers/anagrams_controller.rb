class AnagramsController < ApplicationController

  def index
  end

  def search
    @anagrams = Anagram.find_all_by_sorted_word params[:anagram][:word].sorted
    render json: {
        dateTime: Time.now.strftime("%Y-%m-%d %H:%M:%S"),
        anagramsLength: @anagrams.length,
        word: params[:anagram][:word],
        anagrams: @anagrams.collect(&:word).join(', ')
      }
  end

  def upload
    before = Time.now
    anagrams_file = params[:anagrams][:anagrams_file]

    if Anagram.handle_upload(anagrams_file)
      time = (1000 * (Time.now - before) ).to_i
      
      flash[:notice] = "#{anagrams_file.original_filename} loaded in #{time} ms"
      redirect_to anagrams_path
    else
      flash[:notice] = "Something's wrog with your file"
      render action: "new" 
    end
  end

end

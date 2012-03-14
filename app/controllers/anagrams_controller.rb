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
    anagrams_file = params[:anagrams].try(:[], :anagrams_file)

    if Anagram.handle_upload(anagrams_file)
      time = (1000 * (Time.now - before) ).to_i
      
      flash[:notice] = "#{anagrams_file.original_filename} loaded in #{time} ms"
    else
      flash[:notice] = "Something's wrong with your file (perhaps encoding or it's just blank)" 
    end
    redirect_to anagrams_path
  end

end

class AnagramsController < ApplicationController

  def index
    @anagrams = Anagram.all
  end

  def search
    @anagrams = Anagram.find_all_by_sorted_word params[:anagram][:word].sorted
    render json: {
        dateTime: DateTime.now,
        anagramsLength: @anagrams.length,
        word: params[:anagram][:word],
        time: 0,
        anagrams: @anagrams.collect(&:word).join(', ')
      }
  end

  def upload
    if Anagram.handle_upload(params[:anagrams][:anagrams_file])
      flash[:notice] = "Anagrams created"
      redirect_to anagrams_path
    else
      flash[:notice] = "Something's wrog with your file"
      render action: "new" 
    end
  end

end

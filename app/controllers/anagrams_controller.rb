class AnagramsController < ApplicationController

  def index
    @anagrams = Anagram.all
  end

  def show
    @anagram = Anagram.find(params[:id])
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

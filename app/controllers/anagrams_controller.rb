class AnagramsController < ApplicationController

  def index
    @anagrams = Anagram.all
  end

  def show
    @anagram = Anagram.find(params[:id])
  end

  def new
    @anagrams = Anagram.new
  end

  def create
    @anagrams = handle_file(params[:anagram])

    if @anagrams.save
      flash[:notice] = "Anagrams created"
      render action: "index"
    else
      render action: "new" 
    end
  end

  private

  def handle_file(params)

  end
end

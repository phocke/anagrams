class AnagramsController < ApplicationController
  # GET /anagrams
  # GET /anagrams.json
  def index
    @anagrams = Anagram.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @anagrams }
    end
  end

  # GET /anagrams/1
  # GET /anagrams/1.json
  def show
    @anagram = Anagram.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @anagram }
    end
  end

  # GET /anagrams/new
  # GET /anagrams/new.json
  def new
    @anagram = Anagram.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @anagram }
    end
  end

  # GET /anagrams/1/edit
  def edit
    @anagram = Anagram.find(params[:id])
  end

  # POST /anagrams
  # POST /anagrams.json
  def create
    @anagram = Anagram.new(params[:anagram])

    respond_to do |format|
      if @anagram.save
        format.html { redirect_to @anagram, notice: 'Anagram was successfully created.' }
        format.json { render json: @anagram, status: :created, location: @anagram }
      else
        format.html { render action: "new" }
        format.json { render json: @anagram.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /anagrams/1
  # PUT /anagrams/1.json
  def update
    @anagram = Anagram.find(params[:id])

    respond_to do |format|
      if @anagram.update_attributes(params[:anagram])
        format.html { redirect_to @anagram, notice: 'Anagram was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @anagram.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /anagrams/1
  # DELETE /anagrams/1.json
  def destroy
    @anagram = Anagram.find(params[:id])
    @anagram.destroy

    respond_to do |format|
      format.html { redirect_to anagrams_url }
      format.json { head :no_content }
    end
  end
end

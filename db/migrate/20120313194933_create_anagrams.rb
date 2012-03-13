class CreateAnagrams < ActiveRecord::Migration
  def change
    create_table :anagrams do |t|
      t.string :word
      t.string :sorted_word

      t.timestamps
    end
  end
end

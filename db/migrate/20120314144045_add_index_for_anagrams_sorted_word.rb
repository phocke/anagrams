class AddIndexForAnagramsSortedWord < ActiveRecord::Migration
  def up
    add_index :anagrams, :sorted_word
  end

  def down
    remove_index :anagrams, :sorted_word
  end
end

# Anagrams appliaction

This is just a simple application for finding [anagrams](http://en.wikipedia.org/wiki/Anagram)  
It's definitely not bulletproof, nor complete, but it works, and finds anagrams for you.  

## Performance

There are two very simple optimizations I've used:  

- search anagrams by their letters sorted alphabetically  
  ```
    (bat -> abt , tab -> abt, tender -> deenrt, love -> elov)
  ```

- add index on sorted_word column (which stores the words transformed as above)  


## Time counting

There are two approaches to count time of requests  

- **File uploads**  I don't actually measure request times - all I'm doing is count how long it takes to parse the text file and insert the words to the database. In case I wanted to really get the time of the entire request I'd write a rack middleware for that. For now though I've decided to stick with the Simplest Thing That Could Work™.  

- **Finding anagrams**  Here I'm using javascript to count the actual request times. It's easy to do here, since I'm using AJAX.  


## How to run it?

    rake db:setup
    rails s
    open browser and type in "localhost:3000" in your address bar
    upload dictionary file

## Gotchas

  Files should be encoded it UTF-8. Application fails(gracefully) with latin encoding. Perhaphs with others as well ...  
  Application uses Ruby MRI 1.9.2-p290
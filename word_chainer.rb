class WordChainer

    def initialize(dictionary)
        @dictionary = dictionary
    end

    def adjacent_words(word)
        array = []
        @dictionary.each do |other_word|
            if other_word.length == word.length
                count = 0
                word.each_char.with_index do |char,index|
                    count += 1 if char != other_word[index]
                end
                array << other_word if count == 1
            end
        end
        array
    end

    def run(source,target)
        @all_seen_words = [source]
        @current_words = [source]
        while @current_words.length > 0
            new_current_words = []
            @current_words.each do |current_word|
                adj_words = adjacent_words(current_word)
                adj_words.each do |word|
                    if !@all_seen_words.include?(word)
                        new_current_words << word
                        @all_seen_words << word
                    end
                end
            end
            p new_current_words
            @current_words = new_current_words
        end

        @all_seen_words.include?(target)
    end

end

dict = WordChainer.new(['cat','can','cats','bat','man']) #add 'cat' for harder case
p dict.run('cat', 'men')
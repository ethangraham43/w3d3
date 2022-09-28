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
        
    end

end

dict = WordChainer.new(['can','cats','bat','man','men']) #add 'cat' for harder case
p dict.adjacent_words('cat')
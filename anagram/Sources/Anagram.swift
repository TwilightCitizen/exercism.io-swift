//Solution goes in Sources

typealias Word        = String
typealias Words       = [ Word ]

struct Anagram {
    private let _word:  Word
    
    init( word: Word ) {
        _word  = word
    }
    
    func match( _ words: Words ) -> Words {
        return words.filter { $0.lowercased() != _word.lowercased() }
                    .filter { $0.lowercased().sorted()  == _word.lowercased().sorted() }
    }
}

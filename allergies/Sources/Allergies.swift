//Solution goes in Sources

typealias Score = UInt
typealias Name  = String

enum Allergen: Score {
    case eggs         =   1
    case peanuts      =   2
    case shellfish    =   4
    case strawberries =   8
    case tomatoes     =  16
    case chocolate    =  32
    case pollen       =  64
    case cats         = 128
}

struct Allergies {
    private let _score: Score
    
    init( _ score: Score ) {
        _score = score
    }
    
    func hasAllergy( _ allergen: Allergen ) -> Bool {
        return _score & allergen.rawValue != 0
    }
}

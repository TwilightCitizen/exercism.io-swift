struct NumberClassifier {
    enum Classification { case perfect, abundant, deficient }
    
    let classification:  Classification
    
    init( number: Int ) {
        switch ( ( 1..<number ).filter { number % $0 == 0 }.reduce( 0, + ) ) {
        case number:             classification = .perfect
        case ( number + 1 )... : classification = .abundant
        default:                 classification = .deficient
        }
    }
}

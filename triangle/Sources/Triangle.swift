//Solution goes in Sources

//import Foundation

enum Triangle: String {
    case Equilateral, Isosceles, Scalene, ErrorKind
    
    var kind: String { return self.rawValue }
    
    init( _ sides: Double... ) {
        let s = sides.sorted()
        
        switch true {
            case s[ 0 ] <= 0
               , s[ 0 ] + s[ 1 ] <= s[ 2 ]:
                self = .ErrorKind
            case s[ 0 ] == s[ 2 ]:
                self = .Equilateral
            case s[ 0 ] == s[ 1 ]
                , s[ 1 ] == s[ 2 ]:
                self = .Isosceles
            default:
                self = .Scalene
        }
    }
}


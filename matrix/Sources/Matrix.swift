typealias Serialized = String
typealias Cell       = Int
typealias File       = [ Cell ]
typealias Matrix     = [ File ]

extension Array where Iterator.Element == Array< Int > {
    init( _ matrix: Matrix ) {
        self = matrix
    }
    
    init( _ serialization: Serialized ) {
        self = Matrix.deserialize( from: serialization )
    }
    
    var rows:    Matrix { return self }
    var columns: Matrix { return self.transposed() }
    
    static func deserialize( from serialization: Serialized ) -> Matrix {
        return serialization.split(separator: "\n")
                            .map { $0.split(separator: " " ) }
                            .map { $0.map { Int( $0 )! } }
    }
    
    func serialize() -> Serialized {
        return self.map { $0.map { String( $0 ) } }
                   .map { $0.joined( separator: " " ) }
                   .joined( separator: "\n" )
    }
    
    func transposed() -> Matrix {
        return self[ 0 ].enumerated()
                        .map { ( index, file ) in
                            self.map { $0[ index ] } }
    }
}

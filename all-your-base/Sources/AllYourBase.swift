enum BaseError: Error {
    case negativeDigit, invalidPositiveDigit, invalidInputBase, invalidOutputBase
}

struct Base {
    static func outputDigits( inputBase: Int, inputDigits: [ Int ], outputBase: Int ) throws -> [ Int ] {
        
        if inputBase  < 2                                     { throw BaseError.invalidInputBase }
        if outputBase < 2                                     { throw BaseError.invalidOutputBase }
        if inputDigits.contains( where: { $0 < 0 } )          { throw BaseError.negativeDigit }
        if inputDigits.contains( where: { $0 >= inputBase } ) { throw BaseError.invalidPositiveDigit }
        
        return inputDigits.toBase( of: inputBase ).toBase( of: outputBase )
    }
}

extension Array where Iterator.Element == Int {
    func toBase( of base: Int ) -> Int {
        return self.reversed().enumerated().map { $0.element * base.toPower( of: $0.offset ) }.reduce( 0 ) { $0 + $1 }
    }
}

extension Int {
    func toBase( of base: Int, with numSoFar: [ Int ] = [] ) -> [ Int ] {
        return self == 0 ? numSoFar : ( self / base ).toBase( of: base, with: [ self % base ] + numSoFar )
    }
    
    func toPower( of power: Int ) -> Int {
        return power == 0 ? 1 : power == 1 ? self : self * self.toPower( of: power - 1 )
    }
}

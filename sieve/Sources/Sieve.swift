//Then, ye declarative solution

import Foundation

struct Sieve {
    private let limit: Int
    
    init( _ limit: Int ) {
        self.limit = limit
    }
    
    var primes:   [ Int ] {
        let range: [ Int ] = Array( 2...limit )
        let comps: [ Int ] = range.map { m in range.map { n in m * n } }.flatMap{ $0 }
        
        return Array( Set( range ).subtracting( Set ( comps ) ) ).sorted()
    }
}

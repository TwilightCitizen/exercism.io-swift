//Solution goes in Sources

func compute( _ original: String, against mutated: String ) -> Int? {
    if original == mutated{
        return 0
    }
    
    if original.count != mutated.count {
        return nil  // Duh!
    }
    
    return ( 0..<original.count ).map {
        Array( original )[ $0 ] != Array( mutated )[ $0 ]
    }.filter{ $0 == true }.count
}

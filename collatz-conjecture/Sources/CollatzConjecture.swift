enum CollatzError: Error { case notANaturalNumber }

func steps( _ n: Int, _ s: Int = 0 ) throws -> Int {
    if n < 1 { throw CollatzError.notANaturalNumber }
    
    return ( n == 1 ) ? s : ( n % 2 == 0 ) ? try steps( n / 2, s + 1 ) : try steps( n * 3  + 1, s + 1 )
}

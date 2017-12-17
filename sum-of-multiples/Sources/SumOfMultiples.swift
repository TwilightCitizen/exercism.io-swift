//Solution goes in Sources

// This was probably the funnest problem I've done so far, other than
// the unimplemented Spiral Matrix.  I initially started with a bunch
// of for loops, but refactored it to Set operations, filters, and
// reductions.  These have lended greater clarity, brevity, and speed.

func toLimit( _ limit: Int, inMultiples: [ Int ] ) -> Int {
    // Return zero right away for certain silly inputs
    if limit - 1 < 1 || inMultiples == [] || inMultiples == [ 0 ] { return 0 }
    
    // Set of the range of numbers to check against the multiples, 1 thru
    // 1 less than the limit.
    var multiplesToCheck = Set( 1...( limit - 1 ) )
    
    // Set of multiples we're going to check against the previous set.
    // This removes multiples that cannot be in the previous set, such
    // as numbers greater than limit - 1, or zero.
    let multiplesOf      = Set( inMultiples ).intersection( multiplesToCheck )

    // Set of numbers from the previous range that are multiples of the
    // provided multiples.  If the multiples are in there, they're most
    // assuredly a multiple of themselves.
    var multiplesToSum   = multiplesToCheck.intersection( multiplesOf )
    
    // No need to recheck the obvious, so subtract them out.
    multiplesToCheck     = multiplesToCheck.subtracting( multiplesOf )
    
    // Find all the multiples.  Ha!  This could basically be a for/in loop,
    // but I wanted to go all the way with map/filter/reduce.  Shorthand
    // access to outer argument via something like $$0 would have been nice.
    _ = multiplesOf.map { mO in  // Is there a non-returning map function?
        multiplesToSum   = multiplesToSum.union( multiplesToCheck.filter { $0 % mO == 0 } )
    }

    // Return the sum.  Tada!
    return( multiplesToSum.reduce( 0, + ) )
}
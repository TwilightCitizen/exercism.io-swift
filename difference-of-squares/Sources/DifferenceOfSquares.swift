//Solution goes in Sources

class Squares {
    let squareOfSums:        Int
    let sumOfSquares:        Int
    let differenceOfSquares: Int
    
    // Never even used the 'let from: Int = 1' in the previous iteration.
    // Refactored it to be an optional argument to the initializer,
    // defaulting to 1.
    
    init( _ to: Int, _ from: Int = 1 ) {

        
        // As it turns out, while Swift does offer map/reduce to do this--as I suspected
        // in my previous iteration--there's actually, a nicer, faster, mathier way.
        // Go, go, Gadget...  Calculus!
        
        sumOfSquares = to * ( to + from ) * ( 2*to + from ) / 6
        
        // Using pow() in my previous iteration was overkill.  Faster now.
        
        let n: Int = to * ( to + from ) / 2
        squareOfSums = n * n  // Thanks, Gauss!
        
        differenceOfSquares = squareOfSums - sumOfSquares
    }
}

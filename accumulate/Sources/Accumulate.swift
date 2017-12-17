//Solution goes in Sources

// And...  I was right.  Apparently cannot mutate elements in place,
// but return a whole new array.  It would be interesting to see
// if I can rewrite this with an inout parameter simply overwrite
// the elements of the Array in place.

import Foundation

extension Array {
    func accumulate< T >( _ fn: ( Element ) -> T ) -> [ T ] {
        var newArray = [ T ]()

        for i in self {
            newArray.append( fn( i ) )
        }

        return newArray
    }
}


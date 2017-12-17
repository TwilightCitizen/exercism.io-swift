//Solution goes in Sources

// better names for simple types
typealias Size   =     Int
typealias List   =   [ Int ]
typealias Chunks = [ [ Int ] ]

// sub/superList operators
infix operator ⊂
infix operator ⊃

// list classifications
enum ListClass {
    case equal
    case unequal
    case sublist
    case superlist
}

// classifies lists as one of the above
func classifier( listOne: List
               , listTwo: List ) -> ListClass {
    
    // all cases are rather simple now
    switch true {
        case listOne == listTwo:
            return .equal
        case listOne ⊂  listTwo:
            return .sublist
        case listOne ⊃  listTwo:
            return .superlist
        default:
            return .unequal
    }
}

// because we can't say `extension List` :(
extension Array where Iterator.Element == Int {
    
    // needle `Size` through
    var size: Size {
        return self.count
    }
    
    // sublist operator
    static func ⊂ ( lhs: List
                  , rhs: List ) -> Bool {
        
        // just defer to existing function
        return lhs.isSubList( of: rhs )
    }
    
    // superlist operator
    static func ⊃ ( lhs: List
                  , rhs: List ) -> Bool {
        
        // and, defer here, too
        return lhs.isSuperList( of: rhs )
    }
    
    // sublist is just one list somewhere in the other
    func isSubList( of otherList: List ) -> Bool {
        
        // bigger list can't be sublist of smaller list
        if self.size > otherList.size {
            return false
        }

        // check self-sized chunks of it for equality
        for chunk in otherList.chunked( by: self.size ) {
            
            // yay, matching chunk
            if self == chunk {
                return true
            }
        }
        
        // doh, all that work for nothing
        return false
    }
    
    // superList is just an opposite case of sublist
    func isSuperList( of otherList: List ) -> Bool {
        return otherList.isSubList( of: self )
    }
    
    // chunking a list is not tied to sublist checks
    func chunked( by size: Size ) -> Chunks {
        
        // accumulator for chunks
        var chunks = Chunks()
        
        //  by-sized chunks of bigger list
        for ( i, _ ) in self.enumerated() {
            
            // don't run past the end
            if i + size > self.size {
                break
            }
            
            // yay, a chunk
            chunks.append( Array( self[ i..<( i + size ) ] ) )
        }
        
        // mmm, chunks
        return chunks
    }
}

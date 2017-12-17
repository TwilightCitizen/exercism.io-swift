//Solution goes in Sources

import Foundation

extension Sequence {
    func keep( _ iterFunc: ( Element ) -> Bool ) -> [ Element ] {
        var kept: [ Element ] = []
        
        for elem in self {
            if iterFunc( elem ) {
                kept.append( elem )
            }
        }
        
        return kept
    }
    
    func discard( _ iterFunc: ( Element ) -> Bool ) -> [ Element ] {
        return self.keep( { it -> Bool in !iterFunc( it ) } )
    }
}

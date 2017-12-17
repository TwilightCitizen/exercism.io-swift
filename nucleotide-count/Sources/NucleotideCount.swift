//Solution goes in Sources

import Foundation

let nucleotides: String = "ATCG"

class DNA {
    let strand: String
    
    init?( strand: String ) {
        
        guard !( strand.characters
                    .map{ nucleotides.contains( $0 ) }
                        .contains( false ) )
        else {
            return nil
        }
        
        self.strand = strand
    }
    
    func counts() -> [ String: Int ] {
        return Dictionary( uniqueKeysWithValues:
                    nucleotides.characters
                        .map{ ( String( $0 ), count( $0 ) ) } )
    }
    
    func count( _ nucleotide: Character ) -> Int {
        return strand.filter{ $0 == nucleotide }.count
    }
}

//Solution goes in Sources

class Nucleotide {
    // Dictionary of DNA to RNA translations
    private let dnaToRna: [ String: String ] = [ "G": "C", "C": "G", "T": "A", "A": "U" ]
    // Empty array for DNA string conversion
    private var dnaArray = [ Character ]()
    
    // Errors for Nucleotide to throw around with wreckless abandon
    private enum nucleotideError : Error {
        case badNucleotide( encountered: String )
        case noNucleotide
    }
    
    init( _ dnaString: String ) throws {
        // Tests don't cover it, but users could pass a zero-length DNA string
        guard dnaString != "" else {
            // Doh!  No DNA!
            throw nucleotideError.noNucleotide
        }
        
        // Convert DNA string to an array of individually addressable characters
        dnaArray = Array( dnaString )
    }
    
    func complementOfDNA() throws -> String {
        // Iterate the DNA character array
        for ( idx, val ) in dnaArray.enumerated() {
            // Can't index the array in a guard for some reason, so trans is a temp
            // Also, can't address a string dictionary with characters
            guard let trans = dnaToRna[ String( val ) ] else {
                // Doh! Invalid DNA!
                throw nucleotideError.badNucleotide( encountered: String( val ) )
            }
            
            // Phew!  It worked. Convert back to character and overwrite DNA with RNA
            dnaArray[ idx ] = Character( trans )
        }
        
        // Send it back as the string it arrived
        return( String( dnaArray ))
    }
}

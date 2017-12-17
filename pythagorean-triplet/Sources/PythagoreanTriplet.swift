struct Triplet {
    private let a: Int, b: Int, c: Int
    
    init( _ x: Int... ) { a = x[ 0 ]; b = x[ 1 ]; c = x[ 2 ] }
    
    var sum:           Int  { return a + b + c }
    var product:       Int  { return a * b * c }
    var isPythagorean: Bool { return a * a + b * b == c * c }
    
    static func fromWhere( _ min: Int = 1, maxFactor max: Int, sum: Int = 0 ) -> [ Triplet ] {
        let r  = min...max
        let ts = r.reduce( [] ) { z, a in z + r.reduce( [] ) { z, b in z + r.map{ c in Triplet( a, b, c ) } } }
                  .filter { t in sum == 0 ? t.isPythagorean : t.isPythagorean && t.sum == sum }
        let s  = ts.sorted { ( l, r ) in l.product < r.product }
        
        return s.dropFirst().reduce( [ s.first! ] ) { z, v in z.last!.product == v.product ? z : z + [ v ] }
    }
}

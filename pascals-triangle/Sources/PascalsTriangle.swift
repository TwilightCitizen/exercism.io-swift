typealias PascalsTriangle = [[Int]]

extension Array where Iterator.Element == [Int] {
    init(_ deep: Int) {
        let prev = { PascalsTriangle(deep - 1).rows }
        self = deep == 1 ? [[1]] : { prev() + [([0] + prev().last! + [0]).pairs.map{ $0.reduce(0){ $0 + $1 } }] }()
    }
    
    var rows: PascalsTriangle { return self }
}

extension Array where Iterator.Element == Int {
    var pairs: ArraySlice<[Int]> { return self.indices.map{ $0 + 1 > self.count - 1 ? [] : [self[$0], self[$0 + 1]] }.dropLast() }
}

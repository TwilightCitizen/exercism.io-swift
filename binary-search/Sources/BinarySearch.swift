//Solution goes in Sources

enum BinarySearchError: Error {
    case unsorted
}

struct BinarySearch {
    private let _list: [ Int ]
    
    var list: [ Int ] {
        return _list
    }
    
    var middle: Int {
        return _list.count / 2
    }
    
    init( _ list: [ Int ] ) throws {
        if list != list.sorted() {
            throw BinarySearchError.unsorted
        }
        
        _list = list
    }
    
    func searchFor( _ num: Int ) -> Int? {
        return _searchFor( num, within: _list[ 0... ] )
    }
    
    private func _searchFor( _      num:  Int
                           , within list: ArraySlice< Int > ) -> Int? {
        if list.count == 0 {
            return nil
        }
        
        let pivot: Int = list.startIndex + list.count / 2
        let comp:  Int = list[ pivot ]
        
        switch comp {
            case ...( num - 1 ):
                return _searchFor( num, within: list[    ( pivot + 1 )... ] )
            case ( num + 1 )...:
                return _searchFor( num, within: list[ ...( pivot - 1 )    ] )
            default: // case num:
                return pivot
        }
    }
}

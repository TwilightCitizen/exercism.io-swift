//Solution goes in Sources

func flattenArray< T, U >( _ ary: [ T ] ) -> [ U ] {
    func flatten( _ flat: [ U ], _ elem: T ) -> [ U ] {
        if let item   = elem as?   U   { return flat + [ item ] }
        if let ary    = elem as? [ U ] { return flat + ary }
        if let subAry = elem as? [ T ] { return flat + flattenArray( subAry ) }
        
        return flat
    }
    
    return ary.reduce( [ U ](), flatten )
}

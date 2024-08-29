foreign {
    func area(point: CPointer<Rect>): Int64
    func malloc(size: UIntNative): CPointer<Int8>
    func free(ptr: CPointer<Int8>): Unit
}

@C
struct Rect {
    var x: Int64 = 0
    var y: Int64 = 0
    var w: Int64 = 0
    var h: Int64 = 0

    init(x: Int64, y: Int64, w: Int64, h: Int64) {
        this.x = x
        this.y = y
        this.w = w
        this.h = h
    }
}

func testCLib() {
    let p = unsafe { malloc(32) }
    let pRect = CPointer<Rect>(p)
    unsafe { pRect.write(Rect(0, 0, 32, 48)) }
    unsafe {
        let rectArea = area(pRect)
        println("Area is ${rectArea}")
    }
}

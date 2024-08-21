from std import collection.*
from std import random.*
from std import math.*

import macros.*

// This is a single-line comment

/* Block comments
  /* can be nested */
 */

// ------------
// 1. Basicis
// ------------

// The Gravitational constant
const G = 6.674e-11

/* This is a constant function which calculates the gravitational acceleration of a given planet.
 * A constant function can be evaluated during compilation.
 */
const func gravity(mass: Float64, radius: Float64): Float64 {
    G * mass / radius ** 2
}

// The Earth's gravitational acceleration
const g = gravity(5.972e24, 6.378e6)

// Macros
func testMacros() {
    // https://learn.microsoft.com/en-us/dotnet/csharp/linq/
    let scores = [97, 92, 81, 60]
    @LINQ(from s in scores where s > 80 select s)
}

func testConcurrency() {
    const M = 20000
    const N = 16
    func task(): Int64 {
        var n: Int64 = 0
        let random = Random()
        for (_ in 0..M) {
            let x = random.nextFloat64()
            let y = random.nextFloat64()
            if ((x - 0.5) ** 2 + (y - 0.5) ** 2 < 0.25) {
                n++
            }
        }
        return n
    }

    let futures = ArrayList<Future<Int64>>()
    for (_ in 0..N) {
        futures.append(spawn { task() })
    }
    var n = 0
    for (future in futures) {
        n += future.get()
    }
    var pi = Float64(n) / Float64(M * N) * 4.0
    println("Pi = ${pi}, deviation: ${abs(Float64.PI - pi)}")

    func add(a: Int64, b: Int64): Int64 {
        a + b
    }
    let sum = fold(0, add)
    let retrieve = map({f: Future<Int64> => f.get()})
    // n = sum(retrieve(futures))
    n = futures |> retrieve |> sum // pipeline or flow

    pi = Float64(n) / Float64(M * N) * 4.0
    println("Pi = ${pi}, deviation: ${abs(Float64.PI - pi)}")
}

main() {
    let immutableVairable = 1
    var mutableVariable = "This's a variable"
    mutableVariable = "which is mutable"

    // -------------
    // Built-in types
    //
    let x = 127i8 // Int8
    let y = 256 // Infered to be Int64
    var z = 0xFFu8 // Unsigned Int8
    println("${x} ${y} ${z}")

    testConcurrency()

    testMacros()
}

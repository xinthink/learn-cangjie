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
}

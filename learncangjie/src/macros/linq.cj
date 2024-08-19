macro package macros

from std import ast.*

public macro LINQ(input: Tokens): Tokens {
    let field = input[1]
    let table = input[3]
    let condition = input[5..8]
    return quote(
        for ($field in $table where $condition) {
            println($field)
        }
    )
}

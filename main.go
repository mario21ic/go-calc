package main

import (
    "fmt"

    "github.com/mario21ic/go-calc/lib"
)

func Cuadrado(x int) int {
    return x * x
}

func main() {
    //fmts.Println("hello world") // only for lint test

    // TODO
    fmt.Println("### Go Calc ###")
    lib.PrintHola()

    a := 6
    b := 3

    suma := lib.Sumar(a, b)
    fmt.Println("suma: ", suma)

    resta := lib.Restar(a, b)
    fmt.Println("resta: ", resta)

    multi := lib.Multiplicar(a, b)
    fmt.Println("multiplicacion: ", multi)

    div := lib.Dividir(a, b)
    fmt.Println("division: ", div)

    square := Cuadrado(a)
    fmt.Println("cuadrado: ", square)
}

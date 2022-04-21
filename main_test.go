package main

import (
    "testing"
)

func TestCuadrado(t *testing.T) {
    result := Cuadrado(6)
    expected := 36

    if result!=expected {
            t.Errorf("expected '%d' but got '%d'", expected, result)
    }
}

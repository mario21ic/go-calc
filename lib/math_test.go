package lib

import (
    "fmt"
    "testing"

    "github.com/mario21ic/go-calc/lib"
)

func TestSumar(t *testing.T) {
    result := lib.Sumar(6, 3)
    expected := 9

    if result!=expected {
            t.Errorf("expected '%d' but got '%d'", expected, result)
    }
}

func TestSumarVarios(t *testing.T) {
	var tests = []struct {
		a int
		b int
		want int
	}{
		{0, 3, 3},
		{2, 3, 5},
		{-2, 2, 0},
	}
	for _, tt := range tests {
		testname := fmt.Sprintf("a: %d b: %d", tt.a, tt.b)
		t.Run(testname, func(t *testing.T) {
			ans := lib.Sumar(tt.a, tt.b)
			if ans != tt.want {
				t.Errorf("got %d, want %d", ans, tt.want)
			}
		})
	}
}

func TestRestar(t *testing.T) {
    result := lib.Restar(6, 3)
    expected := 3

    if result!=expected {
            t.Errorf("expected '%d' but got '%d'", expected, result)
    }
}

func TestDividir(t *testing.T) {
    result := lib.Dividir(6, 3)
    expected := 2

    if result!=expected {
            t.Errorf("expected '%d' but got '%d'", expected, result)
    }
}

func TestMultiplicar(t *testing.T) {
    result := lib.Multiplicar(6, 3)
    expected := 18

    if result!=expected {
            t.Errorf("expected '%d' but got '%d'", expected, result)
    }
}


package main

import (
	"fmt"
	"strconv"
)

func main() {
	// Mango
	result := fib()
	for i := 0; i < 10; i++ {
		fmt.Print(strconv.Itoa(result()) + " ")
	}
	fmt.Println("abc def gbi jkl")

}
func fib() func() int {
	first, second := 0, 1
	return func() int {
		ret := first
		first, second = second, first+second
		return ret
	}
}

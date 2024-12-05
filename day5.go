//go:build ignore
package main

import (
	"bufio"
	"container/list"
	"fmt"
	"os"
	"strconv"
	"strings"
)

func main() {
	fn := "input/5.in"
	if len(os.Args) >= 2 {
		fn = os.Args[1]
	}

	file, err := os.Open(fn)
	if err != nil {
		fmt.Println("Could not open the file!")
		return
	}
	defer file.Close()

	scanner := bufio.NewScanner(file)
	var data string

	for scanner.Scan() {
		data += scanner.Text() + "\n"
	}

	if err := scanner.Err(); err != nil {
		fmt.Println("Error reading file:", err)
		return
	}

	ss := strings.Split(strings.TrimSpace(data), "\n\n")
	if len(ss) != 2 {
		fmt.Println("Invalid input format")
		return
	}

	edge := ss[0]
	q := ss[1]

	m := make(map[int]map[int]struct{})
	n := make(map[int]map[int]struct{})

	for _, l := range strings.Split(strings.TrimSpace(edge), "\n") {
		p := strings.Split(l, "|")
		a, _ := strconv.Atoi(p[0])
		b, _ := strconv.Atoi(p[1])

		if _, exists := m[a]; !exists {
			m[a] = make(map[int]struct{})
		}
		if _, exists := n[b]; !exists {
			n[b] = make(map[int]struct{})
		}

		m[a][b] = struct{}{}
		n[b][a] = struct{}{}
	}

	p1 := 0
	p2 := 0

	for _, qq := range strings.Split(strings.TrimSpace(q), "\n") {
		vv := []int{}
		for _, v := range strings.Split(qq, ",") {
			num, _ := strconv.Atoi(v)
			vv = append(vv, num)
		}

		ok := true
		for i, a := range vv {
			for j, b := range vv {
				if i < j {
					if _, exists := m[b][a]; exists {
						ok = false
						break
					}
				}
			}
			if !ok {
				break
			}
		}

		if ok {
			p1 += vv[len(vv)/2]
		} else {
			kk := make(map[int]int)
			for _, v := range vv {
				kk[v] = 0
				for dep := range n[v] {
					if contains(vv, dep) {
						kk[v]++
					}
				}
			}

			queue := list.New()
			for _, v := range vv {
				if kk[v] == 0 {
					queue.PushBack(v)
				}
			}

			dd := []int{}
			for queue.Len() > 0 {
				curr := queue.Remove(queue.Front()).(int)
				dd = append(dd, curr)

				for dep := range m[curr] {
					if _, ok := kk[dep]; ok {
						kk[dep]--
						if kk[dep] == 0 {
							queue.PushBack(dep)
						}
					}
				}
			}

			if len(dd) > 0 {
				p2 += dd[len(dd)/2]
			}
		}
	}

	fmt.Println(p1)
	fmt.Println(p2)
}

func contains(arr []int, x int) bool {
	for _, v := range arr {
		if v == x {
			return true
		}
	}
	return false
}

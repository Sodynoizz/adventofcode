import fs from "fs"

function ms(arr) {
  if (arr.length <= 1) return arr
  const mid = Math.floor(arr.length / 2)
  const l = ms(arr.slice(0, mid))
  const r = ms(arr.slice(mid))

  return merge(l, r)
}

function merge(l, r) {
  let res = []
  let i = 0, j = 0

  while (i < l.length && j < r.length) {
    if (l[i] < r[j]) {
      res.push(l[i])
      i++ 
    } else {
      res.push(r[j])
      j++
    }
  }

  return res.concat(l.slice(i)).concat(r.slice(j))
}

function isIncorDec(arr) {
  const orig = arr.join(",")
  const asc = ms(arr).join(",")
  const desc = ms(arr).reverse().join(",")

  return orig == asc || orig == desc
}

function isSafe(arr) {
  const incOrdec = isIncorDec(arr)
  let ok = true

  for (let i = 0; i < arr.length - 1; i++) {
    const diff = Math.abs(arr[i] - arr[i + 1])
    if (diff < 1 || diff > 3) {
      ok = false
      break
    }
  }

  return incOrdec && ok
}

fs.readFile("input/2.in", "utf8", (err, data) => {
  if (err) {
    console.error("Could not open the file!")
    return
  }

  const lines = data.split("\n")
  let p1 = 0
  let p2 = 0

  lines.forEach((line) => {
    const arr = line
      .trim()
      .split(" ")
      .map((num) => parseInt(num, 10))

    // part 1
    if (isSafe(arr)) p1++

    // part 2
    let safe = false
    for (let j = 0; j < arr.length; j++) {
      const arr2 = arr.slice(0, j).concat(arr.slice(j + 1))
      if (isSafe(arr2)) safe = true
    }

    if (safe) p2++
  })

  console.log(p1)
  console.log(p2)
})

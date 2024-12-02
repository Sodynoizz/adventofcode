import fs from "fs"

function isSafe(arr) {
  const incOrdec =
    arr.join(",") ===
      arr
        .slice()
        .sort((a, b) => a - b)
        .join(",") ||
    arr.join(",") ===
      arr
        .slice()
        .sort((a, b) => b - a)
        .join(",")

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

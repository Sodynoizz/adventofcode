require "set"

def solve(d, ss=false)
  a = []
  sp = []
  f = []
  id = 0
  pos = 0

  d.chars.each_with_index do |c, i|
    if i.even?
      if ss
        a << [pos, c.to_i, id]
      end

      c.to_i.times do
        f << id
        a << [pos, 1, id] unless ss
        pos += 1
      end
      id += 1
    else
      sp << [pos, c.to_i]
      c.to_i.times do
        f << nil
        pos += 1
      end
    end
  end

  a.reverse.each do |pos, sz, id|
    sp.each_with_index do |(pp, s), i|
      if pp < pos && sz <= s
        sz.times do |k|
          raise "Mismatch" unless f[pos + k] == id
          f[pos + k] = nil
          f[pp + k] = id
        end

        sp[i] = [pp + sz, s - sz]
        break
      end
    end
  end

  ans = 0
  f.each_with_index do |i, j|
    ans += j * i if i
  end
  ans
end

fn = "input/9.in"
d = File.read(fn).strip

puts solve(d) # part 1
puts solve(d, true) # part 2

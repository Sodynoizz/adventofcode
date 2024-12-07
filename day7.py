class Solution():
  def __init__(self, fn):
    self.fn = fn
    self.p1: int = 0
    self.p2: int = 0
  
  def check(self, n, m, cc=False):
    # sourcery skip: assign-if-exp, boolean-if-exp-identity, reintroduce-else
    if len(m) == 1:
      return m[0] == n
    if self.check(n, [m[0] + m[1]] + m[2:], cc):
      return True
    if self.check(n, [m[0] * m[1]] + m[2:], cc):
      return True
    if cc and self.check(n, [int(str(m[0]) + str(m[1]))] + m[2:], cc):
      return True
    
    return False
    
  def solve(self):
    data = open(self.fn).read().strip()
    for line in data.strip().split('\n'):
      n, m = line.split(":")
      m = [int(i) for i in m.strip().split()]
      
      if self.check(int(n), m):
        self.p1 += int(n)
      
      if self.check(int(n), m, True):
        self.p2 += int(n)
        
    print(self.p1, self.p2)
        
sol = Solution("input/7.in")
sol.solve()
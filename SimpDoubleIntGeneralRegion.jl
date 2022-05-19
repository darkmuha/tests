function CheckWhere(curr, last)
  if (curr == 1 || curr == last)
    return 1
  elseif (curr % 2 == 0)
    return 4
  else
    return 2
  end
end

function SimpDoubleIntGeneralRegion(f, a, b, g1, g2, n)
  h = (b - a) / n
  k = (g2(b) - g1(a)) / n
  if !(n % 2 == 0)
    display("Entered odd number of iterations")
    return
  end
  println("getting volume...")

  n += 1
  sum = 0

  for i in 1:n
    # check where checks which iteration it is 
    # and assigns it to this pattern 1, 4, 2, 4, 2, ... , 2, 4, 1
    p = CheckWhere(i, n)
    # println(p)
    for j in 1:n
      q = CheckWhere(j, n)
      # println(p)
      sum += p * q * f(g1(a) + (j - 1) * k, a + (i - 1) * h)
    end
  end
  Isum = h * k / 9 * sum
  return Isum
end

f = (x, y) -> 3 * x^2 + y^2
g1 = y -> y^2 - 3
g2 = y -> y + 3
a = -2
b = 3
n = 100
g2(b) - g1(a)
SimpDoubleIntGeneralRegion(f, a, b, g1, g2, n)
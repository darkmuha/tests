function SimpDoubleIntGeneralRegion(f, a, b, g1, g2, m, n)
  if !(n % 2 == 0 && m % 2 == 0)
    display("Entered odd number of iterations")
    return
  end
  println("getting volume...")

  h = (b - a) / n
  p1 = 0
  p2 = 0
  p3 = 0

  for i in 0:n
    x = a + i * h
    HX = (g2(x) - g1(x)) / m
    q1 = f(x, g1(x)) + f(x, g2(x))
    q2 = 0
    q3 = 0

    for j in 1:m-1
      y = g1(x) + j * HX
      Q = f(x, y)
      if (j % 2 == 0)
        q2 += Q
      else
        q3 += Q
      end
    end
    L = (q1 + 2 * q2 + 4 * q3) * HX / 3
    if (i == 0 || i == n)
      p1 += L
    elseif (i % 2 == 0)
      p2 += L
    else
      p3 += L
    end
  end

  return h * (p1 + 2 * p2 + 4 * p3) / 3
end

# f = (x, y) -> log(x * y)
# g1 = x -> 1
# g2 = x -> x
# a = 1
# b = ℯ
# n = 8
# m = 4
f = (x, y) -> cos(y)
g1 = x -> 0
g2 = x -> x
a = 0
b = pi
n = 6
m = 6

SimpDoubleIntGeneralRegion(f, a, b, g1, g2, m, n)
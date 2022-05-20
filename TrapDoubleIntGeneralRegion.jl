function TrapDoubleIntGeneralRegion(f, a, b, g1, g2, m, n)
  h1 = (b - a) / n
  j1 = 0
  j2 = 0

  for i in 0:n
    x = a + i * h1
    h2 = (g2(x) - g1(x)) / m
    K1 = f(x, g1(x)) + f(x, g2(x))
    K2 = 0

    for j in 1:m-1
      y = g1(x) + j * h2
      Q = f(x, y)
      K2 += Q
    end

    L = (K1 + 2 * K2) * h2 / 2

    if (i == 0 || i == n)
      j1 += L
    else
      j2 += L
    end
  end

  return h1 * (j1 + 2 * j2) / 2
end

f = (x, y) -> cos(y)
g1 = x -> 0
g2 = x -> x
a = 0
b = pi
n = 100
m = 100
# f = (x, y) -> log(x * y)
# g1 = x -> 1
# g2 = x -> x
# a = 1
# b = ℯ
# n = 4
# m = 8

TrapDoubleIntGeneralRegion(f, a, b, g1, g2, m, n)
function SimpDoubleIntGeneralRegion(f, a, b, g1, g2, m, n)

  h = (b - 1) / n
  j1 = 0
  j2 = 0
  j3 = 0
  n += 1
  for i in 1:n
    x = a + (i - 1) * h
    HX = (g2(x) - g1(x) / m)
    K1 = f(x, g1(x)) + f(x, g2(x))
    K2 = 0
    K3 = 0

    for j in 2:m-1
      y = g1(x) + j * HX
      Q = f(x, y)
      if (j % 2 == 0)
        K2 += Q
      else
        K3 += Q
      end
    end
    L = (K1 + 2 * K2 + 4 * K3) * HX / 3
    if (i == 0 || i == n)
      j1 += L
    elseif (i % 2 == 0)
      j2 += L
    else
      j3 += L
    end
  end
  J = h * (J1 + 2 * J2 + 4 * J3) / 3
  return J
end

f = (x, y) -> 3 * x^2 + y^2
g1 = y -> y^2 - 3
g2 = y -> y + 3
a = -2
b = 3
n = 100
m = 100

SimpDoubleIntGeneralRegion(f, a, b, g1, g2, m, n)
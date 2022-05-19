function CheckWhere(curr, last)
  if (curr == 1 || curr == last)
    return 1
  else
    return 2
  end
end

function TrapDoubleInt(f, a, b, c, d, n1, n2)
  println("getting volume...")
  h1 = (b - a) / n1
  h2 = (d - c) / n2
  n1 += 1
  n2 += 1
  sum = 0

  for i in 1:n1
    # CheckWhere checks which iteration it is 
    # and assigns it to this pattern 1, 2, 2, 2, ... , 2, 1
    p = CheckWhere(i, n1)
    # println(p)
    for j in 1:n2
      q = CheckWhere(j, n2)
      # println(p)
      sum += p * q * f(c + (j - 1) * h2, a + (i - 1) * h1)
    end
  end
  Isum = (h1 * h2 / 4) * sum
  return Isum
end

f = (x, y) -> ℯ^(x + y)
# b and a are for the outer integeral (y in this case)
b, a = [
  1,
  0
]
# n1 for outer integeral
n1 = 100

# d and c are for the inner integeral (x in this case)
d, c = [
  1,
  0
]
# n2 for inner integeral
n2 = 100

TrapDoubleInt(f, a, b, c, d, n1, n2)
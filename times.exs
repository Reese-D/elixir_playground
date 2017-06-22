defmodule Times do
  def double(n) do
    n * 2
  end

  #simple exercises triple and quadruple functions
  def triple(n) do
    double(n) + n
  end

  def quadruple(n) do
    triple(n) + n
  end
end

defmodule Exercises do
  def of(0), do: 1
  def of(n) when n > 0 do #guard
    n * of(n-1)
  end

  def sum(1), do: 1
  def sum(n), do: n + sum(n-1)

  def gcd(x,0), do: x
  def gcd(x,y), do: gcd(y, rem(x,y))

  #takes a number and a range and tries to find it by pivoting on the halway point
  def chop(actual, range) do
    halfway = div(range.last() - range.first(), 2) + range.first()
    IO.puts halfway
    case Enum.count(range) do
      1 -> range.first()
      y -> case halfway do
	     h when actual > h	-> chop(actual, (h+1)..range.last())
	     h			-> chop(actual, range.first()..h)
	   end
    end
  end
end

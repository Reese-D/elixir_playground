defmodule MyList do
  #chapter 7 exercises

  #sum without an accumulator
  def sum([head | tail]),	do: head + sum(tail)
  def sum([]),			do: 0

  #write a mapsum function that takes a list and a function. It applies the function to each element of the list and the sums the result
  def mapsum([head | tail], func), do: func.(head) + mapsum(tail, func)
  def mapsum([], _func), do: 0

  #write a max(list) that returns the element with the maximum value in the list
  def maxlist(list = [head | _]), do: _maxlist(list, head)
  
  defp _maxlist( [head | tail], max ) do
    case head > max do
      true	-> _maxlist(tail, head)
      false	-> _maxlist(tail, max)
    end
  end
  
  defp _maxlist([], max), do: max

  #write a caesar(list,n) function that adds n to each list element,wrapping if the addition results in a character greater than z
  def caesar([head | tail], n) do
    if n + head > 'z' do
	   [n + head - 'z' | caesar(tail, n)]
	   else
	     [n + head | caesar(tail, n)]
    end
  end

  def caesar([], _n), do: []

  #write a function MyList.span(from, to) that returns a list of the numbers from 'from' up to 'to'
  def span(from, to) when from >= to, do: [to]
  def span(from, to), do: [from | span(from+1, to)]

end
    

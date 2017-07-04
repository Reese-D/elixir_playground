defmodule Mystrings do

  def capitalize_sentences(str) do
    if String.length(str) >= 3 do
      {head, rest} = String.next_codepoint(str)
      {second, rest} = String.next_codepoint(rest)
      _capitalize_sentences(String.upcase(head), second, rest)
    else
      str
    end
  end

  defp _capitalize_sentences(head,second,""), do: head <> second <> ""
  
  defp _capitalize_sentences(head, second, rest) do
    {newHead, newRest} = String.next_codepoint(rest)
    if(head == "." and second == " ") do
      head <> _capitalize_sentences(second, String.upcase(newHead), newRest)
    else
      head <> _capitalize_sentences(second, newHead, newRest)
    end
  end
  

  def capitalize_better(str) do
    _capitalize_better(String.split(str, ". "))
  end

  defp _capitalize_better([head | []]), do: capitalize_first_letter(head)
  defp _capitalize_better([head | tail]), do: capitalize_first_letter(head) <> ". " <> _capitalize_better(tail)

  defp capitalize_first_letter(str) do
    {head, rest} = String.next_codepoint(str)
    String.upcase(head) <> rest
  end
  
end      

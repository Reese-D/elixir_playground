sum = fn(a,b) -> a + b end
sum.(1,2) #dot is necessary as this is an anonymous function call

greet = fn -> IO.puts "Hello" end
greet.() #can't omit parenthesis

f1 = fn a, b -> a * b end #can omit parenthesis

f2 = fn -> 99 end #no parameters

## parameters are not assigned, but instead use matching. Much like in the example {a, b} = {1, 2}
swap = fn {a, b} -> {b, a} end
swap.({8, 6}) # {6, 8}


#very simple exercises

list_concat = fn [a, b], [c, d] -> [a, b, c, d] end
sum = fn a, b, c -> a + b + c end
pair_tuple_to_list = fn {a, b} -> [a, b] end

#one function multiple bodies
handle_open = fn
  {:ok, file} -> "Read data: #{IO.read(file, :line)}" #string interpolation
  {_, error} -> "Error: #{:file.format_error(error)}"
end

#File.open will return a tuple that looks something like this {:ok, #PID<0.85.0>}, and therefore can match our function definition
handle_open.(File.open("./hello.exs")) #reads it out
handle_open.(File.open("nonexistent")) # "Error: no such file or directory"

#:file.format_error -- comes from erlang module
#File.open -- comes from elixir module


#simple exercise using only language features covered so far
#http://c2.com/cgi/wiki?FizzBuzzTest
fizz = fn #the name Fizz is apparently already used
  0, 0, _ -> "FizzBuzz"
  0, _, _ -> "Fizz"
  _, 0, _ -> "Buzz"
  _, _, a -> a
end

buzz = fn
  n -> fizz.(rem(n, 3), rem(n, 5), n)
end

buzz.(10) #Buzz
buzz.(11) #11
buzz.(12) #Fizz
buzz.(13) #13
buzz.(14) #14
buzz.(15) #FizzBuzz
buzz.(16) #16


## Currying, functions can return functions

fun1 = fn -> fn -> "Hello" end end

fun1.() # returns a function
fun1.().() # "Hello"

fun2 = fun1.()
fun2.() # "Hello"

#closure, inner function carries the scope of the outer function even after it finishes executing
greet = fn name -> (fn -> "Hello #{name}" end) end #parenthesis only for clarity
dave = greet.("Dave")
dave.() # "Hello Dave"


add_n = fn n -> (fn other -> n + other end) end
add_two = add_n.(2) # returns inner function
add_two.(3) # 5

#more simple exercises
# create a function that takes a string, returns a function that takes another string and returns the two strings concatenated with a space inbetween
prefix = fn first -> (fn second -> first <> " " <> second end) end
mrs = prefix.("Mrs")
mrs.("Smith")
prefix.("Elixir").("Rocks")


## First class functions

times_2 = fn n -> n * 2 end
apply = fn fun, value -> fun.(value) end
apply.(times_2, 10) # 20


## Quick helper functions
multiply_two_things = &(&1 * &2) # same as fn (a, b) -> a * b end

rnd = &(Float.round(&1, &2)) #elixir sees that this is an exact call and optimizes it to &Float.round/2
rnd = &(Float.round(&2, &1)) #not optimized, returns a new anonymous function

divrem = &{div(&1, &2), rem(&1, &2)} #since {} and [] are functions they can be used this way as well
divrem.(13,5) # {2, 3}

l = &length/1 #wraps the function and takes one argument

l.([5,4,3,2]) # 4

Enum.map [1,2,3,4], &(&1 + 1) # [2, 3, 4 ,5]

#last exercise in chapter 5

Enum.map [1,2,3,4], &(&1 + 2)
Enum.each [1,2,3,4], &IO.inspect(&1)

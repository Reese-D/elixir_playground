# commented lines are items that would thow an error, lines that end with # are comments or return values
a = 2 
2 = a 
#1 = a
a = 1 #would break in erlang but not elixir

:dave #an atom

[a, b, c] = [1, 2, 3] # list match
2 = b

### LISTS & TUPLES ###
#[a, 1, c] = [1, 2, 3]
[a, 2, c] = [1, 2, 4]
[a, 2, ^c] = [1, 2, 4] # can't match 3 to 4
[1, fred: 1, dave: 2] = [1, {:fred, 1}, {:dave, 2}] #list of key-value pair tuples
#[fred: 1, dave: 2, 1] = [{:fred, 1}, {:dave, 2}, 1]
[1,2,3] ++ [4,5] #[1,2,3,4,5]
[1,2,3,4] -- [1,3,5] # [2, 4]


### MAPS ###
states = %{ "AL" => "Alabama", "WI" => "Wisconsin" }
states["AL"] #"Alabama"
states["TX"] #nil
withTuples = %{ { :height, :cm } => 122, {:error, :busy } => :retry } #typically all keys are same type, but they don't have to be
withTuples[{:height, :cm}] # 122

atomKeys = %{ name: "john", job: "carpenter" }
atomKeys = %{ :name => "john", :job  => "carpenter" }
atomKeys.name #"john" -- this only works with atoms as keys
#atom.color -- key error


### BINARY ###
bin = << 1, 2 >>
byte_size bin # 2
bin = <<3 :: size(2), 5 :: size(4), 1 :: size(2)>> ##<<213>>
:io.format("~-8.2b~n", :binary.bin_to_list(bin)) #11010101 \n :ok
byte_size bin # 1

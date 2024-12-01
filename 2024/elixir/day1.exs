input = File.read!("../inputs/day1.txt")

list1 = []
list2 = []

lines = String.split(input, "\n")

{list1,list2} = Enum.reduce(lines,{list1,list2}, fn line,{list1,list2} ->
  nums = String.split(line, "   ")
  if nums != [""] do
    [first | rest] = nums
    {list1 ++ [first], list2 ++ rest}
  else
    {list1,list2}
  end
end)

list1 = Enum.map(list1,fn i -> String.to_integer(i) end)
list2 = Enum.map(list2,fn i -> String.to_integer(i) end)

list1 = Enum.sort(list1)
list2 = Enum.sort(list2)

ans = 0

ans = Enum.reduce(Enum.zip(list1,list2),ans,fn list,ans ->
  {a,b} = list
  ans + abs(a-b)
end)

IO.puts("The answer for part 1 is: #{ans}")

map = %{}

map = Enum.reduce(list2,map,fn i,map ->
    if map[i] == nil do
      map = Map.put(map,i,1)
      map
    else
      map = Map.put(map,i,map[i]+1)
      map
    end
end)

ans = 0

ans = Enum.reduce(list1,ans,fn i,ans ->
  if map[i]==nil do
    ans
  else
    ans + i * map[i]
  end
end)

IO.puts("The answer for part 2 is: #{ans}")

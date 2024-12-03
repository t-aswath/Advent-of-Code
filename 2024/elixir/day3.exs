defmodule Main do

  def read_input() do
    File.read!("../inputs/day3.txt")
  end


  def helper(str ,i) do

    str = String.slice(str, i+4..-1)
      |> String.split(")", trim: true)
      |> Enum.at(0)
      |> String.split(",", trim: true)

    if Enum.count(str) == 2 do

      case Integer.parse(Enum.at(str, 0)) do
        {num, ""} -> num
        _ -> 0
      end * case Integer.parse(Enum.at(str, 1)) do
        {num, ""} -> num
        _ -> 0
      end

    else
      0
    end

  end

  
  def part1() do

    input = read_input()

    ans = Enum.sum(for i <- 0..String.length(input) do

      if String.at(input, i) == "m" && String.at(input, i+1) == "u" && String.at(input, i+2) == "l" && String.at(input, i+3) == "(" do
        helper(input, i)
      else
        0
      end

    end)

    IO.puts("The answer for part 1 is: #{ans}")
    
  end


  def part2() do

    input = read_input()

    ans = Enum.reduce(0..String.length(input), {0,true}, fn i, {acc,boo} ->

      boo = if String.at(input, i) == "d" && String.at(input, i+1) == "o" && String.at(input, i+2) == "(" && String.at(input, i+3) == ")" do
        true
      else
        boo
      end

      boo = if String.at(input, i) == "d" && String.at(input, i+1) == "o" && String.at(input, i+2) == "n" && String.at(input, i+3) == "'"
            && String.at(input, i+4) == "t" && String.at(input, i+5) == "(" && String.at(input, i+6) == ")" do
        false
      else
        boo
      end

      if boo && String.at(input, i) == "m" && String.at(input, i+1) == "u" && String.at(input, i+2) == "l" && String.at(input, i+3) == "(" do
        {acc + helper(input, i) , boo} 
      else
        { acc + 0 , boo }
      end

    end)

    IO.puts("The answer for part 2 is: #{elem(ans, 0)}")
    
  end

end

Main.part1()
Main.part2()

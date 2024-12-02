defmodule Main do 

  def part1() do
    input = File.read!("../inputs/day2.txt")
    
    lines = String.split(input, "\n", trim: true)

    ans = 0

    ans = Enum.reduce(lines,ans,fn line,ans->
      
      nums = String.split(line, " ", trim: true)

      nums = Enum.map(nums,fn i -> String.to_integer(i) end)

      flag1 = Enum.all?(for i <- 1..length(nums)-1 do
        if Enum.at(nums,i) < Enum.at(nums,i-1) && Enum.at(nums,i-1)-Enum.at(nums,i) >=1 && Enum.at(nums,i-1)-Enum.at(nums,i) <= 3 do
          true
        else
          false
        end
      end)

      flag2 = Enum.all?(for i <- 1..length(nums)-1 do
        if Enum.at(nums,i) > Enum.at(nums,i-1) && Enum.at(nums,i)-Enum.at(nums,i-1) >=1 && Enum.at(nums,i)-Enum.at(nums,i-1) <= 3 do
          true
        else
          false
        end
      end)

      if flag1 || flag2 do
        ans+1
      else
        ans
      end

    end)

    IO.puts("The answer for part 1 is: #{ans}")

  end

  def part2() do

    input = File.read!("../inputs/day2.txt")
    
    lines = String.split(input, "\n", trim: true)

    ans = 0

    ans = Enum.reduce(lines,ans,fn line,ans->
      
      nums = String.split(line, " ", trim: true)

      nums = Enum.map(nums,fn i -> String.to_integer(i) end)

      safe = Enum.any?(for i <- 0..length(nums) do 

        nnums = if i != length(nums) do
          List.delete_at(nums,i)
        else
          nums
        end

        flag1 = Enum.all?(for i <- 1..length(nnums)-1 do
          if Enum.at(nnums,i) < Enum.at(nnums,i-1) && Enum.at(nnums,i-1)-Enum.at(nnums,i) >=1 && Enum.at(nnums,i-1)-Enum.at(nnums,i) <= 3 do
            true
          else
            false
          end
        end)

        flag2 = Enum.all?(for i <- 1..length(nnums)-1 do
          if Enum.at(nnums,i) > Enum.at(nnums,i-1) && Enum.at(nnums,i)-Enum.at(nnums,i-1) >=1 && Enum.at(nnums,i)-Enum.at(nnums,i-1) <= 3 do
            true
          else
            false
          end
        end)

        flag1 || flag2

      end)

      if safe do
        ans+1
      else
        ans
      end

    end)

    IO.puts("The answer for part 2 is: #{ans}")
    
  end

end

Main.part1()
Main.part2()

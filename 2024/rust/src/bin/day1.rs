use::std::fs;
use::std::collections::HashMap;

fn main() -> Result<(), Box<dyn std::error::Error>>{

    let input = fs::read_to_string("../inputs/day1.txt")?;

    let mut list1: Vec<i64> = Vec::new();
    let mut list2: Vec<i64> = Vec::new();

    for line in input.lines(){
        let nums:Vec<&str> = line.split_whitespace().collect();
        list1.push(nums[0].parse()?);
        list2.push(nums[1].parse()?);
    }

    list1.sort();
    list2.sort();

    let mut ans:i64 = 0;

    for i in 0..list1.len(){
        ans+=(list1[i]-list2[i]).abs();
    }

    println!("The answer for part 1 is: {}", ans);

    let mut counter:HashMap<i64, i64> = HashMap::new();

    for i in list2.iter(){
        *counter.entry(*i).or_insert(0)+=1;
    }

    let mut ans:i64 = 0;

    for i in list1.iter(){
        if counter.contains_key(i){
            ans+=(*i)*counter[i];
        }
    }

    println!("The answer for part 2 is: {}", ans);

    Ok(())
}

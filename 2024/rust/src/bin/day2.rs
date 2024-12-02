use std::fs;

fn main() -> Result<(), Box<dyn std::error::Error>> {

    let input = fs::read_to_string("../inputs/day2.txt")?;

    let mut ans :i64 = 0;

    for i in input.lines() {
        let nums : Vec<i64> = i.split(" ").map(|x| x.parse::<i64>().unwrap()).collect();

        let mut safe1 : bool = true;
        let mut safe2 : bool = true;

        for j in 1..nums.len() {
            if nums[j]<nums[j-1] && nums[j-1]-nums[j]>=1 && nums[j-1]-nums[j]<=3 {
            }
            else{
                safe1 = false;
            }
            if nums[j]>nums[j-1] && nums[j]-nums[j-1]>=1 && nums[j]-nums[j-1]<=3 {
            }
            else{
                safe2 = false;
            }
        }

        if safe1 || safe2 {
            ans+=1;
            continue;
        }
    }

    println!("The answer for part 1 is: {}", ans);

    let mut ans :i64 = 0;

    'outer : for i in input.lines() {

        let nums : Vec<i64> = i.split(" ").map(|x| x.parse::<i64>().unwrap()).collect();
        
        for z in 0..nums.len()+1{

            let mut safe1 : bool = true;
            let mut safe2 : bool = true;

            let mut num = nums.clone();

            if z!=nums.len() {
                num.remove(z);
            }

            for j in 1..num.len() {
                if num[j]<num[j-1] && num[j-1]-num[j]>=1 && num[j-1]-num[j]<=3 {
                }
                else{
                    safe1 = false;
                }

                if num[j]>num[j-1] && num[j]-num[j-1]>=1 && num[j]-num[j-1]<=3 {
                }
                else{
                    safe2 = false;
                }
            }

            if safe1 || safe2 {
                ans+=1;
                continue 'outer;
            }
        }
    }

    println!("The answer for part 2 is: {}", ans);

    Ok(())
}

use std::fs;
use unicode_segmentation::UnicodeSegmentation;


fn main() ->  Result<(), Box<dyn std::error::Error>> {

    let input = fs::read_to_string("../inputs/day3.txt")?;

    let mut content: String = String::new();

    for i in input.lines(){
        content.push_str(i);
    }

    println!("The answer for part 1 is: {}", part1(&content));
    println!("The answer for part 2 is: {}", part2(&content));

    Ok(())
}   

fn part1 (content: &String) -> i64 {
    let content = content.graphemes(true).collect::<Vec<&str>>();

    let mut ans:i64 = 0;

    for i in 0..content.len() {
        if content[i] == "m" && content[i+1] == "u" && content[i+2] == "l" && content[i+3] == "(" {
            ans+=helper(i, &content);
        }
    }

    ans
}

fn part2 (content: &String) -> i64 {
    let content = content.graphemes(true).collect::<Vec<&str>>();

    let mut ans:i64 = 0;

    let mut doo:bool = true;

    for i in 0..content.len() {

        if content[i] == "d" && content[i+1] == "o" && content[i+2] == "(" && content[i+3] == ")" {
            doo = true;
        }

        if content[i] == "d" && content[i+1] == "o" && content[i+2] == "n" && content[i+3] == "'" && content[i+4] == "t" && content[i+5] == "(" && content[i+6] == ")" {
            doo = false;
        }

        if doo && content[i] == "m" && content[i+1] == "u" && content[i+2] == "l" && content[i+3] == "(" {
            ans+=helper(i, &content);
        }
    }

    ans
}

fn helper (mut i: usize, content: &Vec<&str>) -> i64 {

    let mut num1: String = String::new();
    let mut num2: String = String::new();

    for j in i+4..content.len() {
        if content[j] == "," {
            i = j;
            break;
        }
        if content[j].parse::<i64>().is_ok() {
            num1.push_str(content[j]);
        }
        else{
            return 0;
        }
    }

    for j in i+1..content.len() {
        if content[j] == ")" {
            break;
        }
        if content[j].parse::<i64>().is_ok() {
            num2.push_str(content[j]);
        }
        else{
            return 0;
        }
    }

    let num1 = num1.parse::<i64>().unwrap();
    let num2 = num2.parse::<i64>().unwrap();

    num1*num2
}

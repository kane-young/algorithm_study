1744번 문제 그리디 문제이다

먼저 들어오는 수를 0이하, 1, 2이상 세 그룹으로 나누어서 배열에 저장해 주었다.

이후 절대값이 큰 수가 앞쪽으로 오도록 배열을 정렬해 준 다음 앞쪽부터 2개씩 묶어 곱한 후 result 값에 더해주었다.

고차 함수를 전혀 사용하지 않아 Swift 장점을 못 살렸기 때문에 다시 작성해 보자!!


```
let num = Int(readLine()!)!

var minusArray = [Int]() // 0과 음수가 있다
var oneArray = [Int]() // 1이 들어있다.
var array = [Int]() //양수가 들어있다.



for _ in 0..<num{
    let num = Int(readLine()!)!
    
    if num < 1{
        minusArray.append(num)
    }else if num == 1{
        oneArray.append(num)
    }else if num > 1{
        array.append(num)
    }
}

minusArray.sort()

array.sort(by: {(first, second) in
    return first > second
})

func calculate(array: inout [Int]) -> Int{
    var result = 0
    for i in 0..<array.count / 2{
        result += array[2*i] * array[(2*i) + 1]
    }
    
    if array.count % 2 == 1{
        result += array[array.count-1]
    }
    return result
}

let minus = calculate(array: &minusArray)
let one = oneArray.count
let plus = calculate(array: &array)

print( minus + one + plus )
```


1. 우선 compactMap 함수를 사용해서 count 갯수 만큼 수를 받아서 input에 배열을 저장 시켜주었다.(연산 프로퍼티)

2. 문제 해결을 하는 함수 solution은 배열을 매개변수로 받아서 정답을 나오게 하는데, filter를 사용해서 양수, 음수를 나누고 sorted(by: >)를 사용해서 간단하게 오름차순, 내림차순을 정의했다. 간단한 표현이 있는걸 까먹고 있었다...ㅠㅠ

3. sum 함수에서는 soluttion 함수 내에서 사용되는데, 이 문제에서 가지고 있는 예외 사항들을 guard를 통해서 제거해주었다.
~~~
func input() -> [Int] {
    let count = Int(readLine()!)!
    return (0..<count)
        .compactMap { _ in
            Int(String(readLine()!))
        }
}

func solution(_ numbers: [Int]) -> Int {
    let positiveNumbers = numbers
        .filter { $0 > 0 }
        .sorted(by: >)
    let negativeNumbers = numbers
        .filter { $0 <= 0 }
        .sorted(by: <)
    
    return sum(of: positiveNumbers) + sum(of: negativeNumbers)
}

func sum(of numbers: [Int]) -> Int {
    var result = 0
    for (index, number) in numbers.enumerated() where index % 2 == 0 {
        guard index + 1 < numbers.count else {
            result += number
            continue
        }
        let nextNumber = numbers[index + 1]
        guard ![number, nextNumber].contains(1) else {
            result += number + nextNumber
            continue
        }
        result += number * nextNumber
    }

    return result
}

let numbers = input()
print(solution(numbers))
~~~
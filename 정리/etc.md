# 알고리즘 이외의 Swift 코테를 위한 기록

특정 알고리즘이 아닌 Swift Coding Test를 풀때 도움이 되는 것들



<br>

<br>

## 입출력

요즘 코딩테스트 플랫폼들에서는 입력을 직접 하라고 하지 않고, func 의 매개변수로 입력값을 넣어주도록 한다

but, 아직 백준과 같은 플랫폼에서는 입력을 따로 구현해줘야 하니 기록하자

### 1. 공백단위의 문자열 입력을 받아 [Int] 배열로 변환하기

// input : 1 2 3 4 5

```swift
let intArr = readLine()!.split(seperator: " ").map { Int($0)! }
print(intArr) // [1, 2, 3, 4, 5]
```

### 2. 공백없는 입력값을 [Int] 배열로 변환하기

앞서 나온 것과는 다르게 공백이 없을 때, 입력을 나누는 문제도 자주 출제된다

// input: 12345

```swift
let stringArr = readLine()!.map{ String($0) }
print(stringArr) // ["1", "2", "3", "4", "5", "6"]
```
swift에서 String의 Element가 Character 타입이기에 map 고차함수를 통해서 글자 하나씩 분리

### 3. components vs split

1) components

Foundation에 포함된 Instance method 이기 때문에 `import Foundation` 필수 

- 용량이 추가됨
- [String]으로 리턴해서 바로 사용하기 쉬움

2) split

import 할 필요 없이 사용할 수 있는 기본 method

- [String.SubSequence]를 리턴해서 map 으로 처리를 해주어야 함
- 용량이 적다

<br>

<br>

## 소수점 다루기

### ceil, floor, truc, round

1. ceil (소수점 올림)
2. floor (소수점 내림)
3. truc (소수점 버림)
4. round (소수점 반올림)

```swift
ceil(1.1) // 2.0
floor(1.1) // 1.0
trunc(1.1) // 1.0
round(1.1) // 1.0

ceil(-2.5) // -2.0
floor(-2.5) // -3.0
trunc(-2.5) // -2.0
round(-2.5) // -3.0
```

## zip

두개의 sequence를 합쳐서 튜플을 element 로 가지는 하나의 sequence로 리턴

```swift
let sequence1 = ["kim", "lee", "park", "choi"]
let sequence2 = [1, 2, 3, 4]

let sequenceZip = zip(sequence1, sequence2)

for i in sequenceZip {
    print(i)
}
//("kim", 1)
//("lee", 2)
//("park", 3)
//("choi", 4)
```


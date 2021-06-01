### 초기 코드 

초기 코드에서는 시간 초과가 발생함

~~~
import Foundation

if let count = readLine(){
    if let number = Int(count){
        
        var array = Array(repeating: Array(repeating: 0, count: 2), count: number)
        var result = 0
        
        for i in 0..<number{
            if let input = readLine(){
                let inputEach = input.split(separator: " ").map{ Int($0)! }
                
                array[i][0] = inputEach[0]
                array[i][1] = inputEach[1]
            }
        }
        //모든 회의실 사용 신청 받기
        
        for i in 0..<number-1{
            for j in i+1..<number{
                if (array[i][1] - array[i][0]) > (array[j][1] - array[j][0]){
                    var temp = 0
                    temp = array[i][1]
                    array[i][1] = array[j][1]
                    array[j][1] = temp
                    
                    temp = array[i][0]
                    array[i][0] = array[j][0]
                    array[j][0] = temp
                }
            }
        }
        //이용시간이 적은 순서대로 정렬
        
        for i in 0..<number-1{
            for j in i+1..<number{
                if array[i][0] == -1{
                    continue
                }
                if array[j][0] == -1{
                    continue
                }
                
                if ((array[i][0] >= array[j][0]) && (array[i][0] >= array[j][1])) || ((array[i][1] <= array[j][0]) && (array[i][1] <= array[j][1])){
                    
                    
                } else{
                    array[j][0] = -1
                    array[j][1] = -1
                }
                
            }
        }
        
        for i in 0..<number{
            if array[i][0] != -1{
                result += 1
            }
        }
        print(result)
    }
}
~~~

### 이후 코드
~~~
import Foundation

guard let N = Int(readLine()!) else { fatalError() }
var conferences = [(Int, Int)]()
var now: Int = -1
var answer = 0
for _ in 0..<N{
    guard let time = readLine()?.split(separator: " ").map({Int($0)!}) else { fatalError() }
    conferences.append((time[0], time[1]))
}

conferences.sort(by: { (first: (Int, Int), second: (Int, Int)) -> Bool in
                    if first.1 == second.1{
                        return first.0 < second.0
                    } else{
                        return first.1 < second.1
                    }
})


for conference in conferences {
    if conference.0 >= now {
        now = conference.1
        answer += 1
    }
}

print(answer)
~~~

튜플을 요소로 갖는 배열을 지정하고 계산하였다.

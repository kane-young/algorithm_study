## 동빈나 유튜브에서 본 예제 문제

### BFS 알고리즘 설명과 예제 -1

미로 탈출 문제

미로 탈출 알고리즘의 경우 가장 최단 거리를 구해야 된다.

이 문제의 가장 Key Point는 for 문 내에서 array[nx][ny] 값이 1일때 queue에 해당 노드를 추가해주는 것 같다.

1이 아니면 이미 다른 노드에서 접근을 한 번 했다는 것이기에 접근할 이유가 없다!!

~~~
let input = readLine()!.split(separator: " ").map{ Int($0)! }

let n = input[0]
let m = input[1]

var array = Array(repeating: Array(repeating: 0, count: m+1), count: n+1)

for i in 0..<n{
    var inputt = readLine() ?? ""
    for j in 0..<m{
        array[i][j] = Int(String(inputt.removeFirst()))!
    }
}//array에 미로 입력 완료



//이동할 네가지 방향 정의
//좌, 우, 상, 하
let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]

var count = 0

func escape(x: Int, y: Int) -> Int{
    
    var queue: [(Int, Int)] = [(Int, Int)]()
    queue.append((x,y))
    
    while !queue.isEmpty{
        let firstTuple = queue.removeFirst()
        let x = firstTuple.0
        let y = firstTuple.1
        
        for i in 0..<4{
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            
            if nx < 0 || nx >= n || ny < 0 || ny >= m{
                continue
            }
            
            if array[nx][ny] == 0{
                continue
            }
            
            if array[nx][ny] == 1{
                array[nx][ny] = array[x][y] + 1
                queue.append((nx, ny))
            }
        }
    }
    
    return array[n-1][m-1]

}

print(escape(x: 0, y: 0))
~~~

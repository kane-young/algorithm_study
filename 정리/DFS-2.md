## 동빈나 유튜브에서 본 예제 문제

### DFS 알고리즘 설명과 예제 -1

DFS에 대한 이해력이 아직 많이 필요하다(원리에 대한 이해)

아래 문제는 [유튜브 링크 참조](https://www.youtube.com/watch?v=7C9RgOcvkvo&list=WL&index=1&t=2666s) 44:00 에 대한 문제이다.
문제에 대한 이해를 하는데 굉장히 오래 걸렸다


~~~
let input = readLine()!.split(separator: " ").map{ Int($0)! }

let n = input[0]
let m = input[1]

var array = Array(repeating: Array(repeating: 0, count: m), count: n)

for i in 0..<n{
    var inputt = readLine() ?? ""
    for j in 0..<m{
        array[i][j] = Int(String(inputt.removeFirst()))!
    }
}

func dfs(x: Int, y: Int) -> Bool{
    if x <= -1 || x >= n || y <= -1 || y >= m{
        return false
    }
    
    if array[x][y] == 0{
        array[x][y] = 1
        
        dfs(x: x - 1, y: y)
        dfs(x: x, y: y - 1)
        dfs(x: x + 1, y: y)
        dfs(x: x, y: y + 1)
        return true
    }
    return false
    
}

var result = 0
for i in 0..<n{
    for j in 0..<m{
        if dfs(x: i, y: j) == true{
            result += 1
        }
    }
}

print(result)
~~~
## 동빈나 유튜브에서 본 예제 문제

### BFS 알고리즘 설명과 예제 -1


#### BFS(Breadth - First Search)

- BFS는 너비 우선 탐색이라고도 부르며, 그래프에서 가까운 노드부터 우선적으로 탐색하는 알고리즘입니다. 
- BFS는 큐 자료구조를 이용하며, 구체적인 동작 과정은 다음과 같습니다(큐!!!!!!!)


1. 탐색 시작 ㄴ드를 큐에 삽입하고 방문 처리를 합니다.
2. 큐에서 노드를 꺼낸 뒤에 해당 노드의 인접 노드 중에서 방문하지 않은 노드를 모두 큐에 삽입하고 방문 처리합니다.
3. 더 이상 2번의 과정을 수행할 수 없을 때까지 반복합니다.

~~~
let array = [[], [2,3,8], [1,7], [1,4,5], [3,5], [3,4], [7], [2,6,8], [1,7]]
//각 노드가 연결된 정보를 표현(2차원 리스트)

var visited = Array(repeating: false, count: 9)

func bfs(start: Int){
    var queue = [start]
    visited[start] = true
    
    while !queue.isEmpty{
        let v = queue.removeFirst()
        print(v, terminator: " ")

        for i in array[v]{
            if !visited[i]{
                
                queue.append(i)
                visited[i] = true

            }
        }
    }
}

bfs(start: 1)
//1 2 3 8 7 4 5 6
~~~

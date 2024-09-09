use std::collections::BinaryHeap;

pub fn dijkstra(graph: &super::Graph, start: usize) -> Vec<u32> {
    let mut distances = vec![std::u32::MAX; graph.len()];
    let mut heap = BinaryHeap::new();
    distances[start] = 0;
    heap.push((-0i64, start)); // 距离取负值，以便使用 BinaryHeap 最小堆

    while let Some((neg_dist, node)) = heap.pop() {
        let pos_dist = -neg_dist as u32;
        graph[node].iter().for_each(|&(neigh, weight)| {
            let new_dist = pos_dist + weight;
            if new_dist < distances[neigh] {
                distances[neigh] = new_dist;
                let new_neg_dist: i64 = -(new_dist as i64);
                heap.push((new_neg_dist, neigh));
            }
        });
    }
    distances
}
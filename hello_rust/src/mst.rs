use std::cmp::Reverse;
use std::collections::BinaryHeap;

pub fn mst(graph: &super::Graph, start: usize) -> u32 {
    let mut min_cost = 0u32;
    let mut visited = vec![false; graph.len()];
    let mut heap = BinaryHeap::new();

    graph[start].iter().for_each(|&(neighbour, weight)| {
        heap.push((Reverse(weight), start, neighbour));
    });
    visited[start] = true;

    while let Some((Reverse(cost), from, to)) = heap.pop() {
        if visited[to] {
            continue;
        }

        visited[to] = true;
        min_cost += cost;

        println!("Edge from node {} to node {} with cost {}", from, to, cost);

        graph[to].iter().for_each(|&(neighbour, weight)| {
            if !visited[neighbour] {
                heap.push((Reverse(weight), to, neighbour));
            }
        });
    }

    return min_cost;
}

pub type Graph = Vec<Vec<(usize, u32)>>;

pub fn add_undirected_edge(graph: &mut Graph, a: usize, b: usize, weight: u32) {
    graph[a].push((b, weight)); // a -> b
    graph[b].push((a, weight)); // b -> a
}

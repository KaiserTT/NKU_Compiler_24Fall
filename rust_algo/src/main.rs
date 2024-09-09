use rust_algo::{Graph, dijkstra};

fn main() {
    let graph: Graph = vec![
        vec![(1, 5), (2, 4)],
        vec![(3, 4)],
        vec![(3, 4)],
        vec![],
        vec![]
    ];

    let start_node = 0;
    let distances = dijkstra(&graph, start_node);

    for (node, distance) in distances.iter().enumerate() {
        if *distance == u32::MAX {
            println!("从节点 {} 到节点 {} 无法到达", start_node, node);
        } else {
            println!("从节点 {} 到节点 {} 的最短距离是 {}", start_node, node, distance);
        }
    }
}

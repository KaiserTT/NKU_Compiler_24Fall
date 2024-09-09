use rust_algo::{add_undirected_edge, dijkstra, Graph};

#[test]
fn test_dijkstra_directed_graph() {
    let graph: Graph = vec![
        vec![(1, 5), (2, 4)],
        vec![(3, 4)],
        vec![(3, 4)],
        vec![],
        vec![],
    ];

    let distances = dijkstra(&graph, 0);

    assert_eq!(distances[0], 0); // 0->0 0
    assert_eq!(distances[1], 5); // 0->1 5
    assert_eq!(distances[2], 4); // 0->2 4
    assert_eq!(distances[3], 8); // 0->3 8
    assert_eq!(distances[4], u32::MAX); // 0 ->4 max
}

#[test]
fn test_dijkstra_disconnected() {
    let graph: Graph = vec![vec![(1, 2)], vec![(2, 2)], vec![], vec![(4, 1)], vec![]];

    let distances = dijkstra(&graph, 0);

    assert_eq!(distances[0], 0);
    assert_eq!(distances[1], 2);
    assert_eq!(distances[2], 4);
    assert_eq!(distances[3], u32::MAX); // 0->3 max
    assert_eq!(distances[4], u32::MAX); // 0->4 max
}

#[test]
fn test_dijkstra_single_node() {
    let graph: Graph = vec![vec![]]; // 只有一个节点

    let distances = dijkstra(&graph, 0);

    assert_eq!(distances[0], 0); // 0->0 0
}

#[test]
fn test_dijkstra_all_disconnected() {
    let graph: Graph = vec![vec![], vec![], vec![], vec![]]; // 无边图

    let distances = dijkstra(&graph, 0);

    assert_eq!(distances[0], 0); // 0->0 0
    assert_eq!(distances[1], u32::MAX); // 0->1 max
    assert_eq!(distances[2], u32::MAX); // 0->2 max
    assert_eq!(distances[3], u32::MAX); // 0->3 max
}

#[test]
fn test_dijkstra_undirected_graph() {
    // https://www.cnblogs.com/goldsunshine/p/12978305.html 中的例子
    let mut graph: Graph = vec![vec![]; 6];

    add_undirected_edge(&mut graph, 0, 1, 10); // A-B
    add_undirected_edge(&mut graph, 0, 3, 4); // A-D
    add_undirected_edge(&mut graph, 1, 2, 8); // B-C
    add_undirected_edge(&mut graph, 1, 3, 2); // B-D
    add_undirected_edge(&mut graph, 1, 4, 6); // B-E
    add_undirected_edge(&mut graph, 2, 4, 15); // C-D
    add_undirected_edge(&mut graph, 2, 4, 1); // C-E
    add_undirected_edge(&mut graph, 2, 5, 5); // C-F
    add_undirected_edge(&mut graph, 3, 4, 6); // D-E
    add_undirected_edge(&mut graph, 4, 5, 12); // E-F

    let distances = dijkstra(&graph, 0);

    assert_eq!(distances[0], 0); // A->A 0
    assert_eq!(distances[1], 6); // A->B 6
    assert_eq!(distances[2], 11); // A->C 11
    assert_eq!(distances[3], 4); // A->D 4
    assert_eq!(distances[4], 10); // A->E 10
    assert_eq!(distances[5], 16); // A->F 16
}

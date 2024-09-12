use hello_rust::{add_undirected_edge, mst, Graph};

#[test]
fn test_mst_ascend() {
    let num_nodes = 5;
    let mut graph: Graph = vec![Vec::new(); num_nodes];

    add_undirected_edge(&mut graph, 0, 1, 0);
    add_undirected_edge(&mut graph, 0, 2, 1);
    add_undirected_edge(&mut graph, 0, 3, 2);
    add_undirected_edge(&mut graph, 0, 4, 3);
    add_undirected_edge(&mut graph, 1, 2, 4);
    add_undirected_edge(&mut graph, 1, 3, 5);
    add_undirected_edge(&mut graph, 1, 4, 6);
    add_undirected_edge(&mut graph, 2, 3, 7);
    add_undirected_edge(&mut graph, 2, 4, 8);
    add_undirected_edge(&mut graph, 3, 4, 9);

    let mst_cost = mst(&graph, 0);

    assert_eq!(mst_cost, 6);
}

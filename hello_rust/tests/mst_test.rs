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

    let (mst_cost, parent) = mst(&graph, 0);

    assert_eq!(mst_cost, 6);
    assert!(parent[0].contains(&1));
    assert!(parent[0].contains(&2));
    assert!(parent[0].contains(&3));
    assert!(parent[0].contains(&4));
}

#[test]
fn test_mst_complete_graph() {
    let num_nodes = 4;
    let mut graph: Graph = vec![Vec::new(); num_nodes];

    add_undirected_edge(&mut graph, 0, 1, 1);
    add_undirected_edge(&mut graph, 0, 2, 2);
    add_undirected_edge(&mut graph, 0, 3, 3);
    add_undirected_edge(&mut graph, 1, 2, 1);
    add_undirected_edge(&mut graph, 1, 3, 4);
    add_undirected_edge(&mut graph, 2, 3, 2);

    let (mst_cost, parent) = mst(&graph, 0);

    assert_eq!(mst_cost, 4);
    assert!(parent[0].contains(&1));
    assert!(parent[1].contains(&2));
    assert!(parent[2].contains(&3));
}

#[test]
fn test_mst_sparse_graph() {
    let num_nodes = 6;
    let mut graph: Graph = vec![Vec::new(); num_nodes];

    add_undirected_edge(&mut graph, 0, 1, 4);
    add_undirected_edge(&mut graph, 1, 2, 6);
    add_undirected_edge(&mut graph, 3, 4, 2);
    add_undirected_edge(&mut graph, 4, 5, 1);

    let (mst_cost, parent) = mst(&graph, 0);

    assert_eq!(mst_cost, 10);
    assert!(parent[0].contains(&1));
    assert!(parent[1].contains(&2));
}

#[test]
fn test_mst_single_node() {
    let num_nodes = 1;
    let mut graph: Graph = vec![Vec::new(); num_nodes];

    let (mst_cost, parent) = mst(&graph, 0);

    assert_eq!(mst_cost, 0);
    assert!(parent[0].is_empty());
}

#[test]
fn test_mst_cycle_graph() {
    let num_nodes = 4;
    let mut graph: Graph = vec![Vec::new(); num_nodes];

    add_undirected_edge(&mut graph, 0, 1, 1);
    add_undirected_edge(&mut graph, 1, 2, 2);
    add_undirected_edge(&mut graph, 2, 3, 3);
    add_undirected_edge(&mut graph, 3, 0, 4);

    let (mst_cost, parent) = mst(&graph, 0);

    assert_eq!(mst_cost, 6);
    assert!(parent[0].contains(&1));
    assert!(parent[1].contains(&2));
    assert!(parent[2].contains(&3));
}

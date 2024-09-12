use hello_rust::{add_undirected_edge, mst, Graph};
use std::io::{self};

fn main() {
    println!("Enter Node Num:");
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("I/O Failed");
    let num_nodes: usize = input.trim().parse().expect("Please Enter a Valid Number");

    let mut graph: Graph = vec![Vec::new(); num_nodes];

    println!("Enter Edge Num:");
    input.clear();
    io::stdin().read_line(&mut input).expect("I/O Failed");
    let num_edges: usize = input.trim().parse().expect("Please Enter a Valid Number");

    for _ in 0..num_edges {
        println!("Please Enter Edge Info (Format: Node1 Node2 Weight):");
        input.clear();
        io::stdin().read_line(&mut input).expect("I/O Failed");
        let edge_info: Vec<&str> = input.trim().split_whitespace().collect();

        if edge_info.len() != 3 {
            println!("Please Enter a Valid Edge Info");
            continue;
        }

        let u: usize = edge_info[0].parse().expect("Invalid Node 1");
        let v: usize = edge_info[1].parse().expect("Invalid Node 2");
        let weight: u32 = edge_info[2].parse().expect("Invalid Weight");

        add_undirected_edge(&mut graph, u, v, weight);
    }

    let (mst_cost, _parent) = mst(&graph, 0);

    println!("MST cost: {}", mst_cost);
}

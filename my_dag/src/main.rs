use thepipelinetool::prelude::DAG;

fn main() {
    let dag = DAG::new();
    dag.parse_cli();
}

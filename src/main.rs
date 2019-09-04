use rand::distributions::{Uniform};

fn main() {
    let foo = Uniform::new(0u32, 3);
    println!("{:?}", foo);
}

module primitive_types::primitive_types;

use sui::object::{Self, UID};
use sui::transfer;
use sui::tx_context::{Self, TxContext};

public struct Person has key, store {
    id: UID,
    name: vector<u8>,
    age: u8,
    is_student: bool,
    phone_number: u64,
}

fun init(ctx: &mut TxContext) {
    let person = Person {
        id: object::new(ctx),
        name: b"emre",
        age: 23,
        is_student: true,
        phone_number: 555555555u64,
    };

    transfer::transfer(person, tx_context::sender(ctx));
}
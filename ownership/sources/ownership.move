module ownership::ownership;

use sui::object::{Self, UID};
use sui::transfer;
use sui::tx_context::{Self, TxContext};

public struct Box has key, store {
    id: UID,
    value: u8,
}

fun new_box(ctx: &mut TxContext, val: u8): Box {
    Box {
        id: object::new(ctx),
        value: val,
    }
}

entry fun create_owned_box(val: u8, ctx: &mut TxContext) {
    let my_box = new_box(ctx, val);
    transfer::transfer(my_box, tx_context::sender(ctx))
}

public entry fun create_immutable_box(val: u8, ctx: &mut TxContext) {
    let immutable_box = new_box(ctx, val);
    transfer::freeze_object(immutable_box);
}

public entry fun create_shared_box(val: u8, ctx: &mut TxContext) {
    let shared_box = new_box(ctx, val);
    transfer::share_object(shared_box);
}

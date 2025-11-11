/// Module: functions
module functions::functions;

use sui::tx_context::{Self, TxContext};
use std::ascii::String;

fun init(_ctx: &mut TxContext) {
    let _ = _ctx;
}

public fun sum_values(a: u8, b: u8): u16 {
    let x: u16 = a as u16;
    let y: u16 = b as u16;
    let result: u16 = x + y;
    result
}

public fun sum_with_bias(a: u8, b: u8, bias: u8): u16 {
    let total: u16 = (a as u16) + (b as u16) + (bias as u16);
    total
}

public fun greetings(_name: String): String {
    std::ascii::string("Hello, friend!")
}

public fun greetings_short(_name: String): String {
    std::ascii::string("Hi!")
}

public fun is_even(a: u8): bool {
    a % 2 == 0
}

public fun check(a: u8): bool {
    !is_even(a)
}
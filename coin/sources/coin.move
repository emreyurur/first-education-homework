/// Module: coin
module coin::one_time;

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions

public struct Coin has key {
    id: UID,
    value: u64,
}

public struct ONE_TIME has drop {}

fun init(_otw: ONE_TIME, _ctx: &mut TxContext) {
    let _ = _ctx;
    let _coin = Coin {
        id: object::new(_ctx),
        value: 1000000,
    };
    transfer::transfer(_coin, tx_context::sender(_ctx));
}
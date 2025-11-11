/// Module: capability
module capability::capability;

use std::ascii::String;

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions

//Workshop Capability
// This module provides a capability to access the functions module.

public struct WorkshopCapability has key {
    id: UID,
}

fun init(_ctx: &mut TxContext) {
    let _ = _ctx;
    let _capability = WorkshopCapability { id: object::new(_ctx) };
    transfer::transfer(_capability, tx_context::sender(_ctx))
}

public struct Workshop has key, store {
    id: UID,
    workshop_lessons: vector<String>,
}

entry fun create_workshop(_: &WorkshopCapability, _ctx: &mut TxContext) {
    let new_workshop = Workshop {
        id: object::new(_ctx),
        workshop_lessons: vector::empty<String>(),
    };
    transfer::transfer(new_workshop, tx_context::sender(_ctx));
}

public fun add_lesson(_: &WorkshopCapability, workshop: &mut Workshop, lesson: String) {
    vector::push_back(&mut workshop.workshop_lessons, lesson);
}
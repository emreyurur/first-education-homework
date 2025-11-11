/// Module: build
module build::build;

public struct Capability has store {}

fun init(ctx: &mut TxContext) {
    let _ = ctx;
}

fun init_with_capability(ctx: &mut TxContext, capability: &mut Capability) {
    let _ = ctx;
    let _ = capability;
}
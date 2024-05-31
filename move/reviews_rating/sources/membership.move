// Copyright (c) Mysten Labs, Inc.
// SPDX-License-Identifier: Apache-2.0

module suikula::membership {
    use sui::tx_context::{sender};

    /// Represents a membership that can be used to delete reviews
    public struct Moderator has key {
        id: UID,
    }

    /// A capability that can be used to setup memberships
    public struct ModCap has key, store {
        id: UID
    }

    fun init(ctx: &mut TxContext) {
        let mod_cap = ModCap {
            id: object::new(ctx)
        };
        transfer::transfer(mod_cap, sender(ctx));
    }

    /// Adds a membership
    public fun add_membership(
        _: &ModCap,
        recipient: address,
        ctx: &mut TxContext
    ) {
        // generate an NFT and transfer it to membership who may use it to delete reviews
        let mod = Moderator {
            id: object::new(ctx)
        };
        transfer::transfer(mod, recipient);
    }

    /// Deletes a membership
    public fun delete_membership(
        mod: Moderator
    ) {
        let Moderator { id } = mod;
        object::delete(id);
    }
}

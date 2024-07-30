// Copyright (c) Mysten Labs, Inc.
// SPDX-License-Identifier: Apache-2.0

module suikula::community {
    use std::string::String;
    
    use sui::dynamic_field as df;

    public struct AdminCap has key { id: UID }

    public struct GiftCap has key { id: UID }

    fun init(ctx: &mut TxContext) {
        transfer::transfer(AdminCap {
            id: object::new(ctx)
        }, ctx.sender())
    }
    /// Kula
    public struct Community has key, store {
        id: UID,
        community_name: String
    }

    /// Create a new community
    public fun create_community(
        _: &AdminCap,
        community_name: String,
        ctx: &mut TxContext,
    ) {
        let db = Community {
            id: object::new(ctx),
            community_name
        };
        transfer::share_object(db);
    }

    public fun register_member(_: &AdminCap, db: &mut Community, service_id: ID, recipient: address, ctx: &mut TxContext) {
        transfer::transfer(GiftCap {
            id: object::new(ctx)
        }, recipient);
        df::add(&mut db.id, service_id, service_id);
    }
}

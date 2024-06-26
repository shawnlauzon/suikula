// Copyright (c) Mysten Labs, Inc.
// SPDX-License-Identifier: Apache-2.0

module suikula::community {
    use std::string::String;

    use sui::dynamic_field as df;

    /// Community is a collection of services
    public struct Community has key, store {
        id: UID,
        service_type: String
    }

    /// Create a new community
    public fun create_community(
        service_type: String,
        ctx: &mut TxContext,
    ) {
        let db = Community {
            id: object::new(ctx),
            service_type
        };
        transfer::share_object(db);
    }

    public fun register_service(db: &mut Community, service_id: ID) {
        df::add(&mut db.id, service_id, service_id);
    }
}

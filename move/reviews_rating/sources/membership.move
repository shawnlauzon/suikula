// Copyright (c) Mysten Labs, Inc.
// SPDX-License-Identifier: Apache-2.0

module suikula::membership {
    use sui::tx_context::{sender};
    use std::string::String;

    public struct Gift has key, store {
        id: UID,
        owner: address,
        recipient: address,
        service_id: ID,
        content: String,
        // intrinsic score
        len: u64,
    }
    
    public(package) fun new_review(
        _: &suikula::community::GiftCap,
        owner: address,
        recipient: address,
        service_id: ID,
        content: String,
        ctx: &mut TxContext
    ): Gift {
        let len = content.length();
        let new_gift = Gift {
            id: object::new(ctx),
            owner,
            recipient,
            service_id,
            content,
            len,
        };
        new_gift
    }
}

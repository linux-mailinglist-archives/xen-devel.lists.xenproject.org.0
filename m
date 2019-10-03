Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8126FCB105
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2019 23:23:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iG8Wf-0007dZ-Ln; Thu, 03 Oct 2019 21:20:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=leaW=X4=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iG8We-0007dU-Hm
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2019 21:20:40 +0000
X-Inumbo-ID: a59871c4-e623-11e9-973a-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id a59871c4-e623-11e9-973a-12813bfff9fa;
 Thu, 03 Oct 2019 21:20:38 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 84BCC1597;
 Thu,  3 Oct 2019 14:20:38 -0700 (PDT)
Received: from [10.37.12.39] (unknown [10.37.12.39])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9E56F3F534;
 Thu,  3 Oct 2019 14:20:37 -0700 (PDT)
To: Brian Woods <brian.woods@xilinx.com>
References: <20191002003228.GA3940@xilinx.com>
 <48c9fc54-553e-3b6b-bad2-dbad35991df0@arm.com>
 <b02aeec5-b90f-d330-a504-0ab0e6ff86c9@arm.com>
 <20191002185617.GA2644@xilinx.com>
 <75d64b52-7bea-3349-e45f-44c8bce86d6e@arm.com>
 <20191002212249.GB2644@xilinx.com> <20191002232017.GC2644@xilinx.com>
 <ade177bc-003f-edcc-47fe-d1014d638990@arm.com>
 <20191003181547.GA13953@xilinx.com>
 <c2ea24d9-6bd0-a5b2-9ea1-b3bfe5e30a02@arm.com>
 <20191003202457.GA4040@xilinx.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <3764ed03-e2a8-31e4-0e73-0bd3d88434ca@arm.com>
Date: Thu, 3 Oct 2019 22:20:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191003202457.GA4040@xilinx.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Errors with Loading Xen at a Certain Address
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgQnJpYW4sCgpPbiAxMC8zLzE5IDk6MjQgUE0sIEJyaWFuIFdvb2RzIHdyb3RlOgo+IE9uIFRo
dSwgT2N0IDAzLCAyMDE5IGF0IDA3OjIzOjIzUE0gKzAwMDAsIEp1bGllbiBHcmFsbCB3cm90ZToK
PiBUaGVyZSdzIGEgV0FSTl9PTigpIGJldHdlZW4gdGhlIHR3byBkZWJ1ZyBwcmludGtzIGNhbGxz
IEkgc2hhcmVkIGFib3ZlLgoKTG9va2luZyBhdCB0aGUgbG9nLCB0aGUgTUZOIHNlZW1zIHRvIGNv
cnJlc3BvbmQgdG8gdGhlIG9uZSByaWdodCBhZnRlciAKWGVuICgwMDAwMDAwMDAxNDAwMDAwIC0g
MDAwMDAwMDAwMTUzMjhmMSkgaW4gbWVtb3J5LgoKU28gaXQgaXMgbm9ybWFsIHRvIGhhdmUgdGhl
IHBhZ2UgZ2l2ZW4gdG8gdGhlIGJvb3QgYWxsb2NhdG9yLiBIb3dldmVyLCBJIAphbSBub3QgZW50
aXJlbHkgc3VyZSB3aGljaCBiaXQgb2YgaW5pdF9kb25lKCkgaXMgZ2l2aW5nIHRoZSBwYWdlIGFn
YWluIAp0byB4ZW5oZWFwLgoKSXQgaXMgdW5saWtlbHkgdG8gYmUgZnJlZV9pbml0X21lbW9yeSgp
IGJlY2F1c2UgaXQgZGVhbCB3aXRoIHRoZSBpbml0IApzZWN0aW9uIHRoYXQgaXMgbm90IGF0IHRo
ZSBlbmQgb2YgdGhlIGJpbmFyeS4KClRoaXMgd291bGQgbGVhdmUgZGlzY2FyZF9pbml0aWFsX21v
ZHVsZXMoKSBidXQgdGhlcmUgYXJlIGEgY2hlY2sgdG8gc2tpcCAKWGVuIG1vZHVsZS4KClRoZSBj
YWxsIHN0YWNrIG9ubHkgcHJpbnQgdGhlIGFkZHJlc3MgYW5kIG5vdCB0aGUgc3ltYm9sIGJlY2F1
c2UgaXQgCnVucmVnaXN0ZXJlZCB0aGUgc3ltYm9scyBmb3IgaW5pdC4gU2VlIHVucmVnaXN0ZXJf
aW5pdF92aXJ0dWFsX21lbW9yeSgpLgoKKFhFTikgWGVuIGNhbGwgdHJhY2U6CihYRU4pICAgIFs8
MDAwMDAwMDAwMDIxYzFhOD5dIHBhZ2VfYWxsb2MuYyNmcmVlX2hlYXBfcGFnZXMrMHgxYTgvMHg2
MTQgKFBDKQooWEVOKSAgICBbPDAwMDAwMDAwMDAyMWMxYTg+XSBwYWdlX2FsbG9jLmMjZnJlZV9o
ZWFwX3BhZ2VzKzB4MWE4LzB4NjE0IChMUikKKFhFTikgICAgWzwwMDAwMDAwMDAwMjFlOTAwPl0g
cGFnZV9hbGxvYy5jI2luaXRfaGVhcF9wYWdlcysweDNkNC8weDU2NAooWEVOKSAgICBbPDAwMDAw
MDAwMDAyMWViMjQ+XSBpbml0X2RvbWhlYXBfcGFnZXMrMHg5NC8weDljCihYRU4pICAgIFs8MDAw
MDAwMDAwMDJiODNlYz5dIDAwMDAwMDAwMDAyYjgzZWMKKFhFTikgICAgWzwwMDAwMDAwMDAwMmI4
OTA0Pl0gMDAwMDAwMDAwMDJiODkwNAooWEVOKSAgICBbPDAwMDAwMDAwMDAyNjBhM2M+XSBzZXR1
cC5jI2luaXRfZG9uZSsweDEwLzB4MjAKKFhFTikgICAgWzwwMDAwMDAwMDAwMmI5OWFjPl0gMDAw
MDAwMDAwMDJiOTlhYwoKWW91IHNob3VsZCBiZSBhYmxlIHRvIHVzZSBhZGRyMmxpbmUgb24gdGhl
IGFkZHJlc3Mgd2l0aCBYZW4gYmluYXJ5LgpJIGhhdmUgdGhlIGZlZWxpbmcgdGhpcyB3aWxsIHBv
aW50IHRvIGRpc2NhcmRfaW5pdGlhbF9tb2R1bGVzKCkgYXMgdGhpcyAKaXMgYW4gaW5pdCBmdW5j
dGlvbiBhbmQgdGhlIHN5bWJvbCBzaG91bGQgbm90IGJlIHByaW50ZWQuCgpCdXQsIEkgY2FuJ3Qg
c2VlIGFueXRoaW5nIG9idmlvdXNseSB3cm9uZyBpbiB0aGUgZnVuY3Rpb24uLi4gU28gSSBhbSBu
b3QgCmVudGlyZWx5IHN1cmUgd2hhdCBjb3VsZCBiZSB0aGUgbmV4dCBzdGVwcy4KCkNoZWVycywK
Ci0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=

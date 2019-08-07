Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13295850C1
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 18:11:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvOUL-0003ET-Lc; Wed, 07 Aug 2019 16:08:33 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WZHT=WD=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hvOUJ-0003EH-CG
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 16:08:31 +0000
X-Inumbo-ID: 98cb9354-b92d-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 98cb9354-b92d-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 16:08:30 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C0277344;
 Wed,  7 Aug 2019 09:08:29 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4EC693F706;
 Wed,  7 Aug 2019 09:08:29 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.21.1908061428420.2451@sstabellini-ThinkPad-T480s>
 <20190806214925.7534-1-sstabellini@kernel.org>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <532408cc-6352-9eee-cee1-0535df8a2c93@arm.com>
Date: Wed, 7 Aug 2019 17:08:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190806214925.7534-1-sstabellini@kernel.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 1/7] xen/arm: extend
 device_tree_for_each_node
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
Cc: Stefano Stabellini <stefanos@xilinx.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCk9uIDA2LzA4LzIwMTkgMjI6NDksIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToKPiBBZGQgbmV3IHBhcmFtZXRlcnMgdG8gZGV2aWNlX3RyZWVfZm9yX2VhY2hfbm9kZTogbm9k
ZSwgZGVwdGgsCj4gYWRkcmVzc19jZWxscywgc2l6ZV9jZWxscy4KCmFkZHJlc3NfY2VsbHMgKHJl
c3AuIHNpemVfY2VsbHMpIGFyZSBuYW1lZCBhZGRyZXNzX2NlbGxzX3AgKHJlc3AuIHNpemVfY2Vs
bHNfcCkgCmluIHRoZSBjb2RlLgoKQnV0IEkgYW0gbm90IGNvbnZpbmNlZCB5b3UgbmVlZCB0aGVt
LiBQZXIgdGhlIERUIHNwZWMgKHYwLjIgc2VjdGlvbiAyLjMuNSksIHRoZSAKcGFyZW50IHNob3Vs
ZCBlaXRoZXIgY29udGFpbiB0aGUgI2FkZHJlc3MtY2VsbHMgYW5kICNzaXplLWNlbGxzIG9yIGRl
ZmF1bHQgCnZhbHVlcyAocmVzcC4gMiBhbmQgMSkgd2lsbCBiZSB1c2VkLiBJdCBpcyBjbGVhcmx5
IHN0YXRlZCB0aGF0IHZhbHVlcyBhcmUgbm90IAppbmhlcml0ZWQgZnJvbSB0aGUgYW5jZXN0b3Jz
LgoKU28gdGVjaG5pY2FsbHkgdGhlIGltcGxlbWVudGF0aW9uIG9mIGRldmljZV90cmVlX2Zvcl9l
YWNoX25vZGUoKSBpcyBpbmNvcnJlY3QuIApJZiB5b3UgZm9sbG93IHRoZSBzcGVjIGhlcmUsIHRo
ZW4gdGhlIGFkZHJlc3NfY2VsbHNfcCBhbmQgc2l6ZV9jZWxsc19wIHdvdWxkIApiZWNvbWUgdW5u
ZWNlc3NhcnkuCgo+IE5vZGUgaXMgdGhlIHBhcmVudCBub2RlIHRvIHN0YXJ0IHRoZSBzZWFyY2gg
ZnJvbTsKPiBkZXB0aCBpcyB0aGUgbWluIGRlcHRoIG9mIHRoZSBzZWFyY2ggKHRoZSBkZXB0aCBv
ZiB0aGUgcGFyZW50IG5vZGUpOwo+IGFkZHJlc3NfY2VsbHMgYW5kIHNpemVfY2VsbHMgYXJlIHRo
ZSByZXNwZWN0aXZlIHBhcmFtZXRlcnMgYXQgdGhlIHBhcmVudAo+IG5vZGUuIFBhc3NpbmcgMCwg
MCwgMCwgMCB0cmlnZ2VycyB0aGUgb2xkIGJlaGF2aW9yLiA+Cj4gV2UgbmVlZCB0aGlzIGNoYW5n
ZSBiZWNhdXNlIGluIGZvbGxvdy11cCBwYXRjaGVzIHdlIHdhbnQgdG8gYmUgYWJsZSB0bwo+IHVz
ZSByZXVzZSBkZXZpY2VfdHJlZV9mb3JfZWFjaF9ub2RlIHRvIGNhbGwgYSBmdW5jdGlvbiBmb3Ig
ZWFjaCBjaGlsZHJlbgo+IG5vZGVzIG9mIGEgcHJvdmlkZWQgbm9kZS4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHN0ZWZhbm9zQHhpbGlueC5jb20+Cj4gLS0tCj4gQ2hh
bmdlcyBpbiB2NDoKPiAtIGFkZCBhZGRyZXNzX2NlbGxzIGFuZCBzaXplX2NlbGxzIHBhcmFtZXRl
cnMKPiAKPiBDaGFuZ2VzIGluIHYzOgo+IC0gaW1wcm92ZSBjb21taXQgbWVzc2FnZQo+IC0gaW1w
cm92ZSBpbi1jb2RlIGNvbW1lbnRzCj4gLSBpbXByb3ZlIGNvZGUgc3R5bGUKPiAKPiBDaGFuZ2Vz
IGluIHYyOgo+IC0gbmV3Cj4gLS0tCj4gICB4ZW4vYXJjaC9hcm0vYWNwaS9ib290LmMgICAgICB8
ICAyICstCj4gICB4ZW4vYXJjaC9hcm0vYm9vdGZkdC5jICAgICAgICB8IDIxICsrKysrKysrKysr
KysrKy0tLS0tLQo+ICAgeGVuL2luY2x1ZGUveGVuL2RldmljZV90cmVlLmggfCAgNiArKysrLS0K
PiAgIDMgZmlsZXMgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKPiAK
PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2FjcGkvYm9vdC5jIGIveGVuL2FyY2gvYXJtL2Fj
cGkvYm9vdC5jCj4gaW5kZXggOWIyOTc2OWExMC4uZDI3NWY4YzUzNSAxMDA2NDQKPiAtLS0gYS94
ZW4vYXJjaC9hcm0vYWNwaS9ib290LmMKPiArKysgYi94ZW4vYXJjaC9hcm0vYWNwaS9ib290LmMK
PiBAQCAtMjQ4LDcgKzI0OCw3IEBAIGludCBfX2luaXQgYWNwaV9ib290X3RhYmxlX2luaXQodm9p
ZCkKPiAgICAgICAgKi8KPiAgICAgICBpZiAoIHBhcmFtX2FjcGlfb2ZmIHx8ICggIXBhcmFtX2Fj
cGlfZm9yY2UKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJiYgZGV2aWNlX3RyZWVf
Zm9yX2VhY2hfbm9kZShkZXZpY2VfdHJlZV9mbGF0dGVuZWQsCj4gLSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGR0X3NjYW5fZGVwdGgxX25vZGVzLCBO
VUxMKSkpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDAsIDAsIDAsIDAsIGR0
X3NjYW5fZGVwdGgxX25vZGVzLCBOVUxMKSkpCgpOSVQ6IENhbiB3ZSBzcGxpdCB0aGUgaWY/CgpD
aGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs

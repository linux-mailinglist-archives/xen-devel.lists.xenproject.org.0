Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE738EC14
	for <lists+xen-devel@lfdr.de>; Thu, 15 Aug 2019 14:56:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyFHK-0005uR-9C; Thu, 15 Aug 2019 12:54:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=y4W9=WL=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hyFHI-0005uM-HG
 for xen-devel@lists.xenproject.org; Thu, 15 Aug 2019 12:54:52 +0000
X-Inumbo-ID: dd9c3bb2-bf5b-11e9-8524-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id dd9c3bb2-bf5b-11e9-8524-bc764e2007e4;
 Thu, 15 Aug 2019 12:54:49 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E245A344;
 Thu, 15 Aug 2019 05:54:48 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5673B3F694;
 Thu, 15 Aug 2019 05:54:48 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
References: <1564763985-20312-1-git-send-email-olekstysh@gmail.com>
 <1564763985-20312-3-git-send-email-olekstysh@gmail.com>
 <3c6d54f2-06ad-6bd1-447b-0e4cbef3d391@arm.com>
 <8626bea6-cec3-128a-3b7a-b4c1542a659a@gmail.com>
 <7101e744-784b-9b89-3a90-e748ff03a02d@arm.com>
 <6119cff5-b39a-3782-18d9-f6e51c57ac37@gmail.com>
 <74e0b656-a6a1-d0c6-3cb2-e32d552d42c8@arm.com>
 <alpine.DEB.2.21.1908141208300.8737@sstabellini-ThinkPad-T480s>
 <becf5395-56cd-ccc6-4931-0e3854532ac8@arm.com>
Message-ID: <44ba5fba-48c3-f352-510c-fc0d8ada181a@arm.com>
Date: Thu, 15 Aug 2019 13:54:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <becf5395-56cd-ccc6-4931-0e3854532ac8@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V2 2/6] iommu/arm: Add ability to handle
 deferred probing request
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
Cc: Oleksandr <olekstysh@gmail.com>, xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAxNS8wOC8yMDE5IDEwOjI5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gT24gMTQvMDgv
MjAxOSAyMDoyNSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+PiBPbiBXZWQsIDE0IEF1ZyAy
MDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEkgYWdyZWUgdGhhdCB3ZSBzaG91bGQgZW5hYmxl
IGFsbCBJT01NVXMgb3Igbm9uZS4gSSBkb24ndCB0aGluayB3ZSB3YW50Cj4+IHRvIGRlYWwgd2l0
aCBwYXJ0aWFsbHkgaW5pdGlhbGl6ZWQgSU9NTVVzIHN5c3RlbXMuCj4+Cj4+IEZhaWx1cmUgdG8g
ZW5hYmxlIGFsbCBJT01NVXMgc2hvdWxkIGxlYWQgdG8gcmV0dXJuaW5nIGFuIGVycm9yIGZyb20g
dGhlCj4+IHJlbGV2YW50IGZ1bmN0aW9uIChhcmNoX2lvbW11X3BvcHVsYXRlX3BhZ2VfdGFibGU/
KSB3aGljaCBzaG91bGQKPiAKPiBUaGUgcGF0Y2ggaXM6Cj4gCj4gfD4gc3RhcnRfeGVuKCkKPiB8
PsKgwqAgaW9tbXVfc2V0dXAoKQo+IHw+wqDCoMKgwqAgaW9tbXVfaGFyZHdhcmVfc2V0dXAoKQo+
IAo+PiB0cmFuc2xhdGUgaW50byBYZW4gZmFpbGluZyB0byBib290IGFuZCBjcmFzaGluZy4gV2hp
Y2ggSSB0aGluayBpdCBpcwo+PiB3aGF0IHlvdSBhcmUgc3VnZ2VzdGluZywgcmlnaHQ/Cj4gCj4g
VGhhdCdzIGNvcnJlY3QuIEF0IHRoZSBtb21lbnQgdGhlIHJldHVybiB2YWx1ZSBvZiBpb21tdV9z
ZXR1cCgpIGlzIGlnbm9yZWQuIFdoYXQgCj4gSSB3b3VsZCBsaWtlIHRvIHN1Z2dlc3QgaXMgc29t
ZXRoaW5nIGFsb25nIHRoZSBmb2xsb3dpbmcgbGluZXM6Cj4gCj4gcmMgPSBpb21tdV9zZXR1cCgp
Owo+IGlmICggaW9tbXVfZW5hYmxlICYmIHJjICE9IC1FTk9ERVYgKQo+ICDCoCBwYW5pYygiVW5h
YmxlIHRvIHNldHVwIElPTU1VcyIpOwo+IAo+Pgo+PiAoSSB3b3VsZG4ndCBjYWxsIHBhbmljKCkg
aW5zaWRlIHRoZSBJT01NVSBzcGVjaWZpYyBpbml0aWFsaXplciwgYmVjYXVzZQo+PiB0aGVyZSBt
aWdodCBiZSBpb21tdT0gY29tbWFuZCBsaW5lIG9wdGlvbnMgZm9yIFhlbiB0aGF0IHNwZWNpZnkg
YQo+PiBkaWZmZXJlbnQgZGVzaXJlZCBvdXRjb21lLiBJIHdvdWxkIGRlYWwgd2l0aCB0aGlzIGNh
c2UgdGhlIHNhbWUgd2F5IHdlCj4+IHdvdWxkIGRlYWwgd2l0aCBhbiBlcnJvciBkdXJpbmcgaW5p
dGlhbGl6YXRpb24gb2YgYSBzaW5nbGUgSU9NTVUuKQo+IAo+IEkgYW0gbm90IHN1cmUgdG8gdW5k
ZXJzdGFuZCB0aGlzLiBJZiB5b3UgaGF2ZSBhbiBoYWxmIGluaXRpYWxpemVkIElPTU1VIChub3Rl
IAo+IHRoZSAic2luZ2xlIiBoZXJlISksIHRoZW4gY29udGludWluZyBpcyBsaWtlbHkgdG8gbWFr
ZSB0aGluZ3MgbXVjaCB3b3JzdC4KPiAKPiBJIGRvbid0IGFkdm9jYXRlIHRvIHB1dCB0aGUgcGFu
aWMoKSBpbnNpZGUgdGhlIElPTU1VIHNwZWNpZmljIGluaXRpYWxpemVyIChzZWUgCj4gYWJvdmUp
LiBCdXQgY2xlYXJseSwgd2Ugc2hvdWxkIHJldHVybiBhbiBlcnJvciBubyBtYXR0ZXIgdGhlIGNv
bnRlbnQgb2YgJ2lvbW11JyAKPiBjb21tYW5kIGxpbmUgaWYgdGhlIHVzZXIgcmVxdWVzdGVkIHRv
IGVuYWJsZSB0aGUgSU9NTVVzIChpZiBhbnkpLiBJdCB3b3VsZG4ndCBiZSAKPiByaWdodCBpZiB0
aGUgdXNlciBjYW4gc2F5ICJpZ25vcmUgSU9NTVUgZXJyb3IiIGFzIG1vc3QgbGlrZWx5IHlvdSB3
aWxsIGhhdmUgCj4gdW5leHBlY3RlZCBlcnJvciBhZnRlcndhcmRzLgoKSSBub3RpY2VkIHRoZXJl
IHdhcyBhbHJlYWR5IGEgcGFuaWMoKSBpbiBpb21tdV9zZXR1cCgpIGp1c3QgaW4gY2FzZSB0aGUg
dXNlcgpmb3JjZSB0aGUgdXNlIG9mIElPTU1VIGJ1dCB0aGV5IHdlcmUgbm90IGluaXRpYWxpemVk
LiBJIHdhcyBoYWxmLXRlbXB0ZWQgdG8gc2V0CmlvbW11X2ZvcmNlIHRvIHRydWUgZm9yIEFybSwg
YnV0IEkgdGhpbmsgdGhpcyBpcyBhIGRpZmZlcmVudCBpc3N1ZS4KClNvIGhlcmUgbXkgdGFrZSAo
bm90IHRlc3RlZCBub3IgY29tcGlsZWQpLgoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9zZXR1
cC5jIGIveGVuL2FyY2gvYXJtL3NldHVwLmMKaW5kZXggMmM1ZDEzNzJjMC4uOGY5NGY2MThiMCAx
MDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL3NldHVwLmMKKysrIGIveGVuL2FyY2gvYXJtL3NldHVw
LmMKQEAgLTc1NSw2ICs3NTUsNyBAQCB2b2lkIF9faW5pdCBzdGFydF94ZW4odW5zaWduZWQgbG9u
ZyBib290X3BoeXNfb2Zmc2V0LAogICAgICAgICAubWF4X2dyYW50X2ZyYW1lcyA9IGdudHRhYl9k
b20wX2ZyYW1lcygpLAogICAgICAgICAubWF4X21hcHRyYWNrX2ZyYW1lcyA9IG9wdF9tYXhfbWFw
dHJhY2tfZnJhbWVzLAogICAgIH07CisgICAgaW50IHJjOwogCiAgICAgZGNhY2hlX2xpbmVfYnl0
ZXMgPSByZWFkX2RjYWNoZV9saW5lX2J5dGVzKCk7CiAKQEAgLTg5MCw3ICs4OTEsOSBAQCB2b2lk
IF9faW5pdCBzdGFydF94ZW4odW5zaWduZWQgbG9uZyBib290X3BoeXNfb2Zmc2V0LAogCiAgICAg
c2V0dXBfdmlydF9wYWdpbmcoKTsKIAotICAgIGlvbW11X3NldHVwKCk7CisgICAgcmMgPSBpb21t
dV9zZXR1cCgpOworICAgIGlmICggIWlvbW11X2VuYWJsZWQgJiYgcmMgIT0gLUVOT0RFViApCisg
ICAgICAgIHBhbmljKCJDb3VsZG4ndCBjb25maWd1cmUgY29ycmVjdGx5IGFsbCB0aGUgSU9NTVVz
LiIpOwogCiAgICAgZG9faW5pdGNhbGxzKCk7CiAKZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3Bh
c3N0aHJvdWdoL2FybS9pb21tdS5jIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL2lvbW11
LmMKaW5kZXggMjEzNTIzMzczNi4uZjIxOWRlOWFjMyAxMDA2NDQKLS0tIGEveGVuL2RyaXZlcnMv
cGFzc3Rocm91Z2gvYXJtL2lvbW11LmMKKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJt
L2lvbW11LmMKQEAgLTUxLDYgKzUxLDE0IEBAIGludCBfX2luaXQgaW9tbXVfaGFyZHdhcmVfc2V0
dXAodm9pZCkKICAgICAgICAgcmMgPSBkZXZpY2VfaW5pdChucCwgREVWSUNFX0lPTU1VLCBOVUxM
KTsKICAgICAgICAgaWYgKCAhcmMgKQogICAgICAgICAgICAgbnVtX2lvbW11cysrOworICAgICAg
ICAvKgorICAgICAgICAgKiBJZ25vcmUgdGhlIGZvbGxvd2luZyBlcnJvciBjb2RlczoKKyAgICAg
ICAgICogICAtIEVCQURGOiBJbmRpY2F0ZSB0aGUgY3VycmVudCBub3QgaXMgbm90IGFuIElPTU1V
CisgICAgICAgICAqICAgLSBFTk9ERVY6IFRoZSBJT01NVSBpcyBub3QgcHJlc2VudCBvciBjYW5u
b3QgYmUgdXNlZCBieQorICAgICAgICAgKiAgICAgWGVuLgorICAgICAgICAgKi8KKyAgICAgICAg
ZWxzZSBpZiAoIHJjICE9IC1FQkFERiAmJiByYyAhPSAtRU5PREVWICkKKyAgICAgICAgICAgIHJl
dHVybiByYzsKICAgICB9CiAKICAgICByZXR1cm4gKCBudW1faW9tbXVzID4gMCApID8gMCA6IC1F
Tk9ERVY7CgoKCgo+IAo+IENoZWVycywKPiAKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 842A84184F
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2019 00:41:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hapPF-0001XZ-J7; Tue, 11 Jun 2019 22:38:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3Cq/=UK=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hapPE-0001XQ-DY
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2019 22:38:16 +0000
X-Inumbo-ID: 9996ac9e-8c99-11e9-abc0-438614916813
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9996ac9e-8c99-11e9-abc0-438614916813;
 Tue, 11 Jun 2019 22:38:15 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 214A021721;
 Tue, 11 Jun 2019 22:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560292694;
 bh=cg1C6mXgJ0L2j7cG4E1EAcwkUG1Dljnr1mViHe4UVKE=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=s8VSunrUPvZIxZYFVXYd0iHSDbNvNGPBFVDmmlZTKl2RYLXgUP2agefy0L/4q9R4o
 aO2mCmhuqvcSwrTtq/dWqdGg9gG/lD/BfLVQTB08U4VFGIfBlnzMPh25lYeMT3bhBt
 uoL6PUaBjwWB4/ZGi4t3jMEgdbYzBd1JAx3FR+Yo=
Date: Tue, 11 Jun 2019 15:38:13 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190514123125.29086-9-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1906111537400.13737@sstabellini-ThinkPad-T480s>
References: <20190514123125.29086-1-julien.grall@arm.com>
 <20190514123125.29086-9-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH MM-PART3 v2 08/12] xen/arm: mm: Remove enum
 xenmap_operation
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>, Oleksandr_Tyshchenko@epam.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCAxNCBNYXkgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFRoZSBlbnVtIHhlbm1h
cF9vcGVyYXRpb24gaXMgbm90IHVzZWQgYW55bW9yZS4gU28gcmVtb3ZlIGl0Lgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4gUmV2aWV3ZWQt
Ynk6IEFuZHJpaSBBbmlzb3YgPGFuZHJpaV9hbmlzb3ZAZXBhbS5jb20+CgpBY2tlZC1ieTogU3Rl
ZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgoKCj4gLS0tCj4gICAgIENo
YW5nZXMgaW4gdjI6Cj4gICAgICAgICAtIEFkZCBBbmRyaWkncyByZXZpZXdlZC1ieQo+IC0tLQo+
ICB4ZW4vYXJjaC9hcm0vbW0uYyB8IDI0ICsrKysrKysrLS0tLS0tLS0tLS0tLS0tLQo+ICAxIGZp
bGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAxNiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0t
Z2l0IGEveGVuL2FyY2gvYXJtL21tLmMgYi94ZW4vYXJjaC9hcm0vbW0uYwo+IGluZGV4IDg2ZTFm
YWVlYjUuLjY1MWUyOTYwNDEgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gvYXJtL21tLmMKPiArKysg
Yi94ZW4vYXJjaC9hcm0vbW0uYwo+IEBAIC05NzQsMTMgKzk3NCw2IEBAIHN0YXRpYyBpbnQgY3Jl
YXRlX3hlbl90YWJsZShscGFlX3QgKmVudHJ5KQo+ICAgICAgcmV0dXJuIDA7Cj4gIH0KPiAgCj4g
LWVudW0geGVubWFwX29wZXJhdGlvbiB7Cj4gLSAgICBJTlNFUlQsCj4gLSAgICBSRU1PVkUsCj4g
LSAgICBNT0RJRlksCj4gLSAgICBSRVNFUlZFCj4gLX07Cj4gLQo+ICAvKiBTYW5pdHkgY2hlY2sg
b2YgdGhlIGVudHJ5ICovCj4gIHN0YXRpYyBib29sIHhlbl9wdF9jaGVja19lbnRyeShscGFlX3Qg
ZW50cnksIG1mbl90IG1mbiwgdW5zaWduZWQgaW50IGZsYWdzKQo+ICB7Cj4gQEAgLTEwNDAsOCAr
MTAzMyw4IEBAIHN0YXRpYyBib29sIHhlbl9wdF9jaGVja19lbnRyeShscGFlX3QgZW50cnksIG1m
bl90IG1mbiwgdW5zaWduZWQgaW50IGZsYWdzKQo+ICAgICAgcmV0dXJuIHRydWU7Cj4gIH0KPiAg
Cj4gLXN0YXRpYyBpbnQgeGVuX3B0X3VwZGF0ZV9lbnRyeShlbnVtIHhlbm1hcF9vcGVyYXRpb24g
b3AsIHVuc2lnbmVkIGxvbmcgYWRkciwKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IG1mbl90IG1mbiwgdW5zaWduZWQgaW50IGZsYWdzKQo+ICtzdGF0aWMgaW50IHhlbl9wdF91cGRh
dGVfZW50cnkodW5zaWduZWQgbG9uZyBhZGRyLCBtZm5fdCBtZm4sCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgZmxhZ3MpCj4gIHsKPiAgICAgIGxwYWVfdCBw
dGUsICplbnRyeTsKPiAgICAgIGxwYWVfdCAqdGhpcmQgPSBOVUxMOwo+IEBAIC0xMDk5LDggKzEw
OTIsNyBAQCBzdGF0aWMgaW50IHhlbl9wdF91cGRhdGVfZW50cnkoZW51bSB4ZW5tYXBfb3BlcmF0
aW9uIG9wLCB1bnNpZ25lZCBsb25nIGFkZHIsCj4gIAo+ICBzdGF0aWMgREVGSU5FX1NQSU5MT0NL
KHhlbl9wdF9sb2NrKTsKPiAgCj4gLXN0YXRpYyBpbnQgeGVuX3B0X3VwZGF0ZShlbnVtIHhlbm1h
cF9vcGVyYXRpb24gb3AsCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25n
IHZpcnQsCj4gK3N0YXRpYyBpbnQgeGVuX3B0X3VwZGF0ZSh1bnNpZ25lZCBsb25nIHZpcnQsCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICBtZm5fdCBtZm4sCj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICB1bnNpZ25lZCBsb25nIG5yX21mbnMsCj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICB1bnNpZ25lZCBpbnQgZmxhZ3MpCj4gQEAgLTExMzEsNyArMTEyMyw3IEBAIHN0YXRpYyBpbnQg
eGVuX3B0X3VwZGF0ZShlbnVtIHhlbm1hcF9vcGVyYXRpb24gb3AsCj4gIAo+ICAgICAgZm9yKCA7
IGFkZHIgPCBhZGRyX2VuZDsgYWRkciArPSBQQUdFX1NJWkUgKQo+ICAgICAgewo+IC0gICAgICAg
IHJjID0geGVuX3B0X3VwZGF0ZV9lbnRyeShvcCwgYWRkciwgbWZuLCBmbGFncyk7Cj4gKyAgICAg
ICAgcmMgPSB4ZW5fcHRfdXBkYXRlX2VudHJ5KGFkZHIsIG1mbiwgZmxhZ3MpOwo+ICAgICAgICAg
IGlmICggcmMgKQo+ICAgICAgICAgICAgICBicmVhazsKPiAgCj4gQEAgLTExNTYsMjQgKzExNDgs
MjQgQEAgaW50IG1hcF9wYWdlc190b194ZW4odW5zaWduZWQgbG9uZyB2aXJ0LAo+ICAgICAgICAg
ICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIG5yX21mbnMsCj4gICAgICAgICAgICAgICAgICAg
ICAgIHVuc2lnbmVkIGludCBmbGFncykKPiAgewo+IC0gICAgcmV0dXJuIHhlbl9wdF91cGRhdGUo
SU5TRVJULCB2aXJ0LCBtZm4sIG5yX21mbnMsIGZsYWdzKTsKPiArICAgIHJldHVybiB4ZW5fcHRf
dXBkYXRlKHZpcnQsIG1mbiwgbnJfbWZucywgZmxhZ3MpOwo+ICB9Cj4gIAo+ICBpbnQgcG9wdWxh
dGVfcHRfcmFuZ2UodW5zaWduZWQgbG9uZyB2aXJ0LCB1bnNpZ25lZCBsb25nIG5yX21mbnMpCj4g
IHsKPiAtICAgIHJldHVybiB4ZW5fcHRfdXBkYXRlKFJFU0VSVkUsIHZpcnQsIElOVkFMSURfTUZO
LCBucl9tZm5zLCBfUEFHRV9QT1BVTEFURSk7Cj4gKyAgICByZXR1cm4geGVuX3B0X3VwZGF0ZSh2
aXJ0LCBJTlZBTElEX01GTiwgbnJfbWZucywgX1BBR0VfUE9QVUxBVEUpOwo+ICB9Cj4gIAo+ICBp
bnQgZGVzdHJveV94ZW5fbWFwcGluZ3ModW5zaWduZWQgbG9uZyB2LCB1bnNpZ25lZCBsb25nIGUp
Cj4gIHsKPiAgICAgIEFTU0VSVCh2IDw9IGUpOwo+IC0gICAgcmV0dXJuIHhlbl9wdF91cGRhdGUo
UkVNT1ZFLCB2LCBJTlZBTElEX01GTiwgKGUgLSB2KSA+PiBQQUdFX1NISUZULCAwKTsKPiArICAg
IHJldHVybiB4ZW5fcHRfdXBkYXRlKHYsIElOVkFMSURfTUZOLCAoZSAtIHYpID4+IFBBR0VfU0hJ
RlQsIDApOwo+ICB9Cj4gIAo+ICBpbnQgbW9kaWZ5X3hlbl9tYXBwaW5ncyh1bnNpZ25lZCBsb25n
IHMsIHVuc2lnbmVkIGxvbmcgZSwgdW5zaWduZWQgaW50IGZsYWdzKQo+ICB7Cj4gICAgICBBU1NF
UlQocyA8PSBlKTsKPiAtICAgIHJldHVybiB4ZW5fcHRfdXBkYXRlKE1PRElGWSwgcywgSU5WQUxJ
RF9NRk4sIChlIC0gcykgPj4gUEFHRV9TSElGVCwgZmxhZ3MpOwo+ICsgICAgcmV0dXJuIHhlbl9w
dF91cGRhdGUocywgSU5WQUxJRF9NRk4sIChlIC0gcykgPj4gUEFHRV9TSElGVCwgZmxhZ3MpOwo+
ICB9Cj4gIAo+ICBlbnVtIG1nIHsgbWdfY2xlYXIsIG1nX3JvLCBtZ19ydywgbWdfcnggfTsKPiAt
LSAKPiAyLjExLjAKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=

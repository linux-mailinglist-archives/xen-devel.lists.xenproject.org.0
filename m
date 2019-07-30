Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC9C7AF6F
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 19:16:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsVhr-0006ge-3F; Tue, 30 Jul 2019 17:14:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7c++=V3=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hsVhp-0006gV-QG
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 17:14:33 +0000
X-Inumbo-ID: 7f2a4d6e-b2ed-11e9-8b08-cbbbd75f62ce
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7f2a4d6e-b2ed-11e9-8b08-cbbbd75f62ce;
 Tue, 30 Jul 2019 17:14:32 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CB373206A2;
 Tue, 30 Jul 2019 17:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564506872;
 bh=avx620xfzdFgHd71N9N4FgkpS2D+nge9Qa0BT1D7Nu8=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=oTmLYbZhFBK35YuaUvRUc4J9L+AEJz5PCScd3LgYNFPAuaYKBwUloR/V+nc5yGIQ4
 lCMkRZsgZPnQUtqbpcgJ3LHo55zxLzgv6aMHH+Ja99Efia04SM8lIPiIsLq+i2miPj
 5omdAvhpSYWLun/7T4RVL9YzZuwa4AeTgHItK5YU=
Date: Tue, 30 Jul 2019 10:14:31 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190722213958.5761-10-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1907301014200.28600@sstabellini-ThinkPad-T480s>
References: <20190722213958.5761-1-julien.grall@arm.com>
 <20190722213958.5761-10-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 09/35] xen/arm64: head: Improve coding
 style and document cpu_init()
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
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAyMiBKdWwgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEFkanVzdCB0aGUgY29k
aW5nIHN0eWxlIHVzZWQgaW4gdGhlIGNvbW1lbnRzIHdpdGhpbiBjcHVfaW5pdCgpLiBUYWtlIHRo
ZQo+IG9wcG9ydHVuaXR5IHRvIGFsdGVyIHRoZSBlYXJseSBwcmludCB0byBtYXRjaCB0aGUgZnVu
Y3Rpb24gbmFtZS4KPiAKPiBMYXN0bHksIGRvY3VtZW50IHRoZSBiZWhhdmlvciBhbmQgdGhlIG1h
aW4gcmVnaXN0ZXJzIHVzYWdlIHdpdGhpbiB0aGUKPiBmdW5jdGlvbi4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgoKUmV2aWV3ZWQtYnk6IFN0
ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KCgo+IC0tLQo+ICAgICBD
aGFuZ2VzIGluIHYyOgo+ICAgICAgICAgLSBXZSBkb24ndCBjbG9iYmVyIHg0IHNvIHVwZGF0ZSB0
aGUgY29tbWVudAo+IC0tLQo+ICB4ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TIHwgMTkgKysrKysr
KysrKysrKystLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgNSBkZWxl
dGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUyBiL3hl
bi9hcmNoL2FybS9hcm02NC9oZWFkLlMKPiBpbmRleCA5MmM4MzM4ZDcxLi5kZGM1MTY3MDIwIDEw
MDY0NAo+IC0tLSBhL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMKPiArKysgYi94ZW4vYXJjaC9h
cm0vYXJtNjQvaGVhZC5TCj4gQEAgLTM5NywxOSArMzk3LDI2IEBAIHNraXBfYnNzOgo+ICAgICAg
ICAgIHJldAo+ICBFTkRQUk9DKHplcm9fYnNzKQo+ICAKPiArLyoKPiArICogSW5pdGlhbGl6ZSB0
aGUgcHJvY2Vzc29yIGZvciB0dXJuaW5nIHRoZSBNTVUgb24uCj4gKyAqCj4gKyAqIENsb2JiZXJz
IHgwIC0geDMKPiArICovCj4gIGNwdV9pbml0Ogo+IC0gICAgICAgIFBSSU5UKCItIFNldHRpbmcg
dXAgY29udHJvbCByZWdpc3RlcnMgLVxyXG4iKQo+ICsgICAgICAgIFBSSU5UKCItIEluaXRpYWxp
emUgQ1BVIC1cclxuIikKPiAgCj4gICAgICAgICAgLyogU2V0IHVwIG1lbW9yeSBhdHRyaWJ1dGUg
dHlwZSB0YWJsZXMgKi8KPiAgICAgICAgICBsZHIgICB4MCwgPU1BSVJWQUwKPiAgICAgICAgICBt
c3IgICBtYWlyX2VsMiwgeDAKPiAgCj4gLSAgICAgICAgLyogU2V0IHVwIFRDUl9FTDI6Cj4gKyAg
ICAgICAgLyoKPiArICAgICAgICAgKiBTZXQgdXAgVENSX0VMMjoKPiAgICAgICAgICAgKiBQUyAt
LSBCYXNlZCBvbiBJRF9BQTY0TU1GUjBfRUwxLlBBUmFuZ2UKPiAgICAgICAgICAgKiBUb3AgYnl0
ZSBpcyB1c2VkCj4gICAgICAgICAgICogUFQgd2Fsa3MgdXNlIElubmVyLVNoYXJlYWJsZSBhY2Nl
c3NlcywKPiAgICAgICAgICAgKiBQVCB3YWxrcyBhcmUgd3JpdGUtYmFjaywgd3JpdGUtYWxsb2Nh
dGUgaW4gYm90aCBjYWNoZSBsZXZlbHMsCj4gLSAgICAgICAgICogNDgtYml0IHZpcnR1YWwgYWRk
cmVzcyBzcGFjZSBnb2VzIHRocm91Z2ggdGhpcyB0YWJsZS4gKi8KPiArICAgICAgICAgKiA0OC1i
aXQgdmlydHVhbCBhZGRyZXNzIHNwYWNlIGdvZXMgdGhyb3VnaCB0aGlzIHRhYmxlLgo+ICsgICAg
ICAgICAqLwo+ICAgICAgICAgIGxkciAgIHgwLCA9KFRDUl9SRVMxfFRDUl9TSDBfSVN8VENSX09S
R04wX1dCV0F8VENSX0lSR04wX1dCV0F8VENSX1QwU1ooNjQtNDgpKQo+ICAgICAgICAgIC8qIElE
X0FBNjRNTUZSMF9FTDFbMzowXSAoUEFSYW5nZSkgY29ycmVzcG9uZHMgdG8gVENSX0VMMlsxODox
Nl0gKFBTKSAqLwo+ICAgICAgICAgIG1ycyAgIHgxLCBJRF9BQTY0TU1GUjBfRUwxCj4gQEAgLTQy
MCw5ICs0MjcsMTEgQEAgY3B1X2luaXQ6Cj4gICAgICAgICAgbGRyICAgeDAsID1TQ1RMUl9FTDJf
U0VUCj4gICAgICAgICAgbXNyICAgU0NUTFJfRUwyLCB4MAo+ICAKPiAtICAgICAgICAvKiBFbnN1
cmUgdGhhdCBhbnkgZXhjZXB0aW9ucyBlbmNvdW50ZXJlZCBhdCBFTDIKPiArICAgICAgICAvKgo+
ICsgICAgICAgICAqIEVuc3VyZSB0aGF0IGFueSBleGNlcHRpb25zIGVuY291bnRlcmVkIGF0IEVM
Mgo+ICAgICAgICAgICAqIGFyZSBoYW5kbGVkIHVzaW5nIHRoZSBFTDIgc3RhY2sgcG9pbnRlciwg
cmF0aGVyCj4gLSAgICAgICAgICogdGhhbiBTUF9FTDAuICovCj4gKyAgICAgICAgICogdGhhbiBT
UF9FTDAuCj4gKyAgICAgICAgICovCj4gICAgICAgICAgbXNyIHNwc2VsLCAjMQo+ICAgICAgICAg
IHJldAo+ICBFTkRQUk9DKGNwdV9pbml0KQo+IC0tIAo+IDIuMTEuMAo+IAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

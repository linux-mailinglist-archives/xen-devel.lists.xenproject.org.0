Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B96B555D2E
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2019 03:04:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfwJI-0001hS-Ty; Wed, 26 Jun 2019 01:01:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JP5O=UZ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hfwJH-0001BN-2O
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2019 01:01:15 +0000
X-Inumbo-ID: e4f8b384-97ad-11e9-aab3-1b417ed8d971
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e4f8b384-97ad-11e9-aab3-1b417ed8d971;
 Wed, 26 Jun 2019 01:01:14 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CCF6D2085A;
 Wed, 26 Jun 2019 01:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561510873;
 bh=LrsjwLgyiPISBWEQHKfR46xPLxuGsdwZDw5FC/Jq9bM=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=p5+QxsU5lByrAj8mehqpvSSAtrKAuYFpjc7rHtqex02UiFzyELzyKG62FVECapdMp
 hmsB38Yk6FDFIj6WWdW4SJp1zZ8K6vPT45yJoM210owTeyK/zjBauY5WhgqTYkwXTn
 jaBGl0pD10C/dMKxEyXRjX1Q2X/ZSTCghqctmUr4=
Date: Tue, 25 Jun 2019 18:01:11 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190610193215.23704-10-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1906251749180.5851@sstabellini-ThinkPad-T480s>
References: <20190610193215.23704-1-julien.grall@arm.com>
 <20190610193215.23704-10-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 09/17] xen/arm64: head: Improve coding style
 and document cpu_init()
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
Cc: xen-devel@lists.xenproject.org, Oleksandr_Tyshchenko@epam.com,
 Stefano Stabellini <sstabellini@kernel.org>, andrii_anisov@epam.com,
 andre.przywara@arm.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAxMCBKdW4gMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEFkanVzdCB0aGUgY29k
aW5nIHN0eWxlIHVzZWQgaW4gdGhlIGNvbW1lbnRzIHdpdGhpbiBjcHVfaW5pdCgpLiBUYWtlIHRo
ZQo+IG9wcG9ydHVuaXR5IHRvIGFsdGVyIHRoZSBlYXJseSBwcmludCB0byBtYXRjaCB0aGUgZnVu
Y3Rpb24gbmFtZS4KPiAKPiBMYXN0bHksIGRvY3VtZW50IHRoZSBiZWhhdmlvciBhbmQgdGhlIG1h
aW4gcmVnaXN0ZXJzIHVzYWdlIHdpdGhpbiB0aGUKPiBmdW5jdGlvbi4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+IC0tLQo+ICB4ZW4vYXJj
aC9hcm0vYXJtNjQvaGVhZC5TIHwgMTkgKysrKysrKysrKysrKystLS0tLQo+ICAxIGZpbGUgY2hh
bmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEv
eGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUyBiL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMKPiBp
bmRleCA2YWEzMTQ4MTkyLi5lZTAwMjQxNzNlIDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL2FybS9h
cm02NC9oZWFkLlMKPiArKysgYi94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TCj4gQEAgLTM5Niwx
OSArMzk2LDI2IEBAIHNraXBfYnNzOgo+ICAgICAgICAgIHJldAo+ICBFTkRQUk9DKHplcm9fYnNz
KQo+ICAKPiArLyoKPiArICogSW5pdGlhbGl6ZSB0aGUgcHJvY2Vzc29yIGZvciB0dXJuaW5nIHRo
ZSBNTVUgb24uCj4gKyAqCj4gKyAqIENsb2JiZXJzIHgwIC0geDQKClNob3VsZG4ndCBpdCBiZSB4
MCAtIHgzPwoKVGhlIHJlc3QgbG9va3MgZmluZS4KCgo+ICsgKi8KPiAgY3B1X2luaXQ6Cj4gLSAg
ICAgICAgUFJJTlQoIi0gU2V0dGluZyB1cCBjb250cm9sIHJlZ2lzdGVycyAtXHJcbiIpCj4gKyAg
ICAgICAgUFJJTlQoIi0gSW5pdGlhbGl6ZSBDUFUgLVxyXG4iKQo+ICAKPiAgICAgICAgICAvKiBT
ZXQgdXAgbWVtb3J5IGF0dHJpYnV0ZSB0eXBlIHRhYmxlcyAqLwo+ICAgICAgICAgIGxkciAgIHgw
LCA9TUFJUlZBTAo+ICAgICAgICAgIG1zciAgIG1haXJfZWwyLCB4MAo+ICAKPiAtICAgICAgICAv
KiBTZXQgdXAgVENSX0VMMjoKPiArICAgICAgICAvKgo+ICsgICAgICAgICAqIFNldCB1cCBUQ1Jf
RUwyOgo+ICAgICAgICAgICAqIFBTIC0tIEJhc2VkIG9uIElEX0FBNjRNTUZSMF9FTDEuUEFSYW5n
ZQo+ICAgICAgICAgICAqIFRvcCBieXRlIGlzIHVzZWQKPiAgICAgICAgICAgKiBQVCB3YWxrcyB1
c2UgSW5uZXItU2hhcmVhYmxlIGFjY2Vzc2VzLAo+ICAgICAgICAgICAqIFBUIHdhbGtzIGFyZSB3
cml0ZS1iYWNrLCB3cml0ZS1hbGxvY2F0ZSBpbiBib3RoIGNhY2hlIGxldmVscywKPiAtICAgICAg
ICAgKiA0OC1iaXQgdmlydHVhbCBhZGRyZXNzIHNwYWNlIGdvZXMgdGhyb3VnaCB0aGlzIHRhYmxl
LiAqLwo+ICsgICAgICAgICAqIDQ4LWJpdCB2aXJ0dWFsIGFkZHJlc3Mgc3BhY2UgZ29lcyB0aHJv
dWdoIHRoaXMgdGFibGUuCj4gKyAgICAgICAgICovCj4gICAgICAgICAgbGRyICAgeDAsID0oVENS
X1JFUzF8VENSX1NIMF9JU3xUQ1JfT1JHTjBfV0JXQXxUQ1JfSVJHTjBfV0JXQXxUQ1JfVDBTWig2
NC00OCkpCj4gICAgICAgICAgLyogSURfQUE2NE1NRlIwX0VMMVszOjBdIChQQVJhbmdlKSBjb3Jy
ZXNwb25kcyB0byBUQ1JfRUwyWzE4OjE2XSAoUFMpICovCj4gICAgICAgICAgbXJzICAgeDEsIElE
X0FBNjRNTUZSMF9FTDEKPiBAQCAtNDI3LDkgKzQzNCwxMSBAQCBjcHVfaW5pdDoKPiAgICAgICAg
ICBsZHIgICB4MCwgPShIU0NUTFJfQkFTRSkKPiAgICAgICAgICBtc3IgICBTQ1RMUl9FTDIsIHgw
Cj4gIAo+IC0gICAgICAgIC8qIEVuc3VyZSB0aGF0IGFueSBleGNlcHRpb25zIGVuY291bnRlcmVk
IGF0IEVMMgo+ICsgICAgICAgIC8qCj4gKyAgICAgICAgICogRW5zdXJlIHRoYXQgYW55IGV4Y2Vw
dGlvbnMgZW5jb3VudGVyZWQgYXQgRUwyCj4gICAgICAgICAgICogYXJlIGhhbmRsZWQgdXNpbmcg
dGhlIEVMMiBzdGFjayBwb2ludGVyLCByYXRoZXIKPiAtICAgICAgICAgKiB0aGFuIFNQX0VMMC4g
Ki8KPiArICAgICAgICAgKiB0aGFuIFNQX0VMMC4KPiArICAgICAgICAgKi8KPiAgICAgICAgICBt
c3Igc3BzZWwsICMxCj4gICAgICAgICAgcmV0Cj4gIEVORFBST0MoY3B1X2luaXQpCj4gLS0gCj4g
Mi4xMS4wCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6002F240C3
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2019 21:00:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hSnT9-0000Eh-E6; Mon, 20 May 2019 18:57:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rume=TU=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hSnT8-0000Eb-02
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 18:57:06 +0000
X-Inumbo-ID: 0ed5ef58-7b31-11e9-b072-af63e0f687c2
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0ed5ef58-7b31-11e9-b072-af63e0f687c2;
 Mon, 20 May 2019 18:57:04 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DBADF205ED;
 Mon, 20 May 2019 18:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558378624;
 bh=57GaPY63scSljz1caKfUnGHAC0X1F0Wh0qm2UwLuGo8=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=Ek6PYtv0gLsxAzefOI+D3Auci+/Jwu8HXmOz0sKuaO4qsauK1DEXm324cX9x+8ElQ
 hlh4Tl0zWH51Cf7s8w8nT+eNSu3aX5Ezjbr30FPP0rI5TyOnHa6/GK3FPd1nf0Vgdc
 k6dWRayjq5HDfth5Y2tgvb4pqsKjKytuoA6LS0QI=
Date: Mon, 20 May 2019 11:56:56 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190514121132.26732-2-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1905201143390.16404@sstabellini-ThinkPad-T480s>
References: <20190514121132.26732-1-julien.grall@arm.com>
 <20190514121132.26732-2-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH MM-PART1 v3 1/8] xen/arm: Don't boot Xen on
 platform using AIVIVT instruction caches
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
 Andrii_Anisov@epam.com, Oleksandr_Tyshchenko@epam.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCAxNCBNYXkgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFRoZSBBSVZJVlQgaXMg
YSB0eXBlIG9mIGluc3RydWN0aW9uIGNhY2hlIGF2YWlsYWJsZSBvbiBBcm12Ny4gVGhpcyBpcwo+
IHRoZSBvbmx5IGNhY2hlIG5vdCBpbXBsZW1lbnRpbmcgdGhlIElWSVBUIGV4dGVuc2lvbiBhbmQg
dGhlcmVmb3JlCj4gcmVxdWlyaW5nIHNwZWNpZmljIGNhcmUuCj4gCj4gVG8gc2ltcGxpZnkgbWFp
bnRlbmFuY2UgcmVxdWlyZW1lbnRzLCBYZW4gd2lsbCBub3QgYm9vdCBvbiBwbGF0Zm9ybQo+IHVz
aW5nIEFJVklWVCBjYWNoZS4KPiAKPiBUaGlzIHNob3VsZCBub3QgYmUgYW4gaXNzdWUgYmVjYXVz
ZSBYZW4gQXJtMzIgY2FuIG9ubHkgYm9vdCBvbiBhIHNtYWxsCj4gbnVtYmVyIG9mIHByb2Nlc3Nv
cnMgKHNlZSBhcmNoL2FybS9hcm0zMi9wcm9jLXY3LlMpLiBBbGwgb2YgdGhlbSBhcmUKPiBub3Qg
dXNpbmcgQUlWSVZUIGNhY2hlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVs
aWVuLmdyYWxsQGFybS5jb20+CgpBcyB3ZSBoYXZlIGFscmVhZHkgZGlzY3Vzc2VkLCBJIGFtIE9L
IHdpdGggdGhpcyBhbmQgbmVpdGhlciBvZiB1cwpmb3Jlc2VlIGFueSBpc3N1ZXMuIEdpdmVuIHRo
YXQgaXQgY291bGQgYmUgY29uc2lkZXJlZCBhcyBhIGRyb3AgaW4Kc3VwcG9ydCBmb3Igc29tZXRo
aW5nLCBJIHRoaW5rIGl0IHdvdWxkIGJlIG5pY2UgdG8gc2VuZCBhbiBlbWFpbCBvdXRzaWRlCm9m
IHRoZSBzZXJpZXMgdG8gc2F5IHdlIHdvbid0IHN1cHBvcnQgQUlWSVZUIHByb2Nlc3NvcnMgYW55
IGxvbmdlciwKdXNpbmcgd29yZHMgZWFzaWVyIHRvIHVuZGVyc3RhbmQgdG8gdXNlcnMgKG5vdCBu
ZWNlc3NhcmlseSBkZXZlbG9wZXJzKS4KV291bGQgeW91IGJlIGFibGUgdG8gZG8gdGhhdD8gSSBj
YW4gaGVscCB5b3Ugd2l0aCB0aGUgdGV4dC4KCgo+IC0tLQo+IAo+ICAgICBDaGFuZ2VzIGluIHYz
Ogo+ICAgICAgICAgLSBQYXRjaCBhZGRlZAo+IC0tLQo+ICB4ZW4vYXJjaC9hcm0vc2V0dXAuYyAg
ICAgICAgICAgIHwgNSArKysrKwo+ICB4ZW4vaW5jbHVkZS9hc20tYXJtL3Byb2Nlc3Nvci5oIHwg
NSArKysrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0t
Z2l0IGEveGVuL2FyY2gvYXJtL3NldHVwLmMgYi94ZW4vYXJjaC9hcm0vc2V0dXAuYwo+IGluZGV4
IGNjYjBmMTgxZWEuLmZhYWYwMjliOTkgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gvYXJtL3NldHVw
LmMKPiArKysgYi94ZW4vYXJjaC9hcm0vc2V0dXAuYwo+IEBAIC01MjYsMTAgKzUyNiwxNSBAQCBz
dGF0aWMgdm9pZCBfX2luaXQgc2V0dXBfbW0odW5zaWduZWQgbG9uZyBkdGJfcGFkZHIsIHNpemVf
dCBkdGJfc2l6ZSkKPiAgICAgIHVuc2lnbmVkIGxvbmcgYm9vdF9tZm5fc3RhcnQsIGJvb3RfbWZu
X2VuZDsKPiAgICAgIGludCBpOwo+ICAgICAgdm9pZCAqZmR0Owo+ICsgICAgY29uc3QgdWludDMy
X3QgY3RyID0gUkVBRF9DUDMyKENUUik7Cj4gIAo+ICAgICAgaWYgKCAhYm9vdGluZm8ubWVtLm5y
X2JhbmtzICkKPiAgICAgICAgICBwYW5pYygiTm8gbWVtb3J5IGJhbmtcbiIpOwo+ICAKPiArICAg
IC8qIFdlIG9ubHkgc3VwcG9ydHMgaW5zdHJ1Y3Rpb24gY2FjaGVzIGltcGxlbWVudGluZyB0aGUg
SVZJUFQgZXh0ZW5zaW9uLiAqLwoKUGxlYXNlIG1lbnRpb24gdGhhdCBJVklQVCBjYW4gb25seSBi
ZSBpbXBsZW1lbnRlZCBieSBQSVBUIGFuZCBWSVBUCmNhY2hlcywgbm90IGJ5IEFJVklWVCBjYWNo
ZXMuIFRoYXQgc2hvdWxkIG1ha2UgaXQgc3RyYWlnaHRmb3J3YXJkIHRvCnVuZGVyc3RhbmQgdGhl
IHJlYXNvbiBmb3IgdGhlIHBhbmljIGJlbG93LgoKCj4gKyAgICBpZiAoICgoY3RyID4+IENUUl9M
MUlwX1NISUZUKSAmIENUUl9MMUlwX01BU0spID09IENUUl9MMUlwX0FJVklWVCApCj4gKyAgICAg
ICAgcGFuaWMoIkFJVklWVCBpbnN0cnVjdGlvbiBjYWNoZSBub3Qgc3VwcG9ydGVkXG4iKTsKPiAr
Cj4gICAgICBpbml0X3BkeCgpOwo+ICAKPiAgICAgIHJhbV9zdGFydCA9IGJvb3RpbmZvLm1lbS5i
YW5rWzBdLnN0YXJ0Owo+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20tYXJtL3Byb2Nlc3Nv
ci5oIGIveGVuL2luY2x1ZGUvYXNtLWFybS9wcm9jZXNzb3IuaAo+IGluZGV4IGI1ZjUxNTgwNWQu
LjA0YjA1YjNmMzkgMTAwNjQ0Cj4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLWFybS9wcm9jZXNzb3Iu
aAo+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vcHJvY2Vzc29yLmgKPiBAQCAtNiw2ICs2LDEx
IEBACj4gICNlbmRpZgo+ICAjaW5jbHVkZSA8cHVibGljL2FyY2gtYXJtLmg+Cj4gIAo+ICsvKiBD
VFIgQ2FjaGUgVHlwZSBSZWdpc3RlciAqLwo+ICsjZGVmaW5lIENUUl9MMUlwX01BU0sgICAgICAg
MHgzCj4gKyNkZWZpbmUgQ1RSX0wxSXBfU0hJRlQgICAgICAxNAo+ICsjZGVmaW5lIENUUl9MMUlw
X0FJVklWVCAgICAgMHgxCj4gKwo+ICAvKiBNSURSIE1haW4gSUQgUmVnaXN0ZXIgKi8KPiAgI2Rl
ZmluZSBNSURSX1JFVklTSU9OX01BU0sgICAgICAweGYKPiAgI2RlZmluZSBNSURSX1JFU0lWSU9O
KG1pZHIpICAgICAoKG1pZHIpICYgTUlEUl9SRVZJU0lPTl9NQVNLKQo+IC0tIAo+IDIuMTEuMAo+
IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

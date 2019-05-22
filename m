Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 867BE263E5
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2019 14:32:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hTQMz-0003Sd-JV; Wed, 22 May 2019 12:29:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=3DNt=TW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hTQMx-0003SY-Oe
 for xen-devel@lists.xenproject.org; Wed, 22 May 2019 12:29:19 +0000
X-Inumbo-ID: 3597307c-7c8d-11e9-8df8-47b10361758d
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3597307c-7c8d-11e9-8df8-47b10361758d;
 Wed, 22 May 2019 12:29:15 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 22 May 2019 06:29:13 -0600
Message-Id: <5CE540960200007800231571@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Wed, 22 May 2019 06:29:10 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Julien Grall" <julien.grall@arm.com>
References: <20190520181250.17404-1-julien.grall@arm.com>
 <5CE3C45A0200007800230E0E@prv1-mh.provo.novell.com>
 <1c7f43ce-7df2-24c9-ecb2-d8be1afebfa5@arm.com>
 <5CE3C8370200007800230E40@prv1-mh.provo.novell.com>
 <f2f912ac-a1c6-1f07-f708-cf2935c0270f@arm.com>
 <83c1a4f7-0714-0ee5-e225-835126d92c5d@arm.com>
In-Reply-To: <83c1a4f7-0714-0ee5-e225-835126d92c5d@arm.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH] xen/public: arch-arm: Restrict the
 visibility of struct vcpu_guest_core_regs
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDIyLjA1LjE5IGF0IDE0OjIwLCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgoK
PiAKPiBPbiAyMS8wNS8yMDE5IDEwOjU1LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEhpIEphbiwK
Pj4gCj4+IE9uIDUvMjEvMTkgMTA6NDMgQU0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gT24g
MjEuMDUuMTkgYXQgMTE6MzUsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4+Pj4gT24g
NS8yMS8xOSAxMDoyNiBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+Pj4+IE9uIDIwLjA1LjE5
IGF0IDIwOjEyLCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+Pj4+Pj4gICAgICAgQXMg
dGhpcyBpcyBub3cgWGVuIGFuZCB0b29scyBvbmx5LCBJIGFtIHdvbmRlcmluZyB3aGV0aGVyIHRo
ZSBjaGVjayBvbgo+Pj4+Pj4gICAgICAgR05VX0MgaXMgc3RpbGwgbmVjZXNzYXJ5LiBJIGFtIGhh
cHB5IHRvIHNlbmQgYSBmb2xsb3ctdXAgcGF0Y2ggKG9yIGZvbGQKPj4+Pj4+ICAgICAgIGluIHRo
aXMgb25lKSBpZiBpdCBjYW4gYmUgcmVtb3ZlZC4KPj4+Pj4KPj4+Pj4gSSB0aGluayB0aGlzIHNo
b3VsZCBiZSBkcm9wcGVkIGlmIGl0IGNhbiBiZSB3aXRob3V0IGJyZWFraW5nIGFueQo+Pj4+PiBw
YXJ0IG9mIHRoZSBidWlsZC4KPj4+PiBUaGlzIGlzIGJlY2F1c2UgYWxsIHRoZSB0b29scyBhcmUg
cGFydCBvZiB4ZW4uZ2l0LCByaWdodD8KPj4+Cj4+PiBSaWdodCAtIG5vLW9uZSBlbHNlIGlzIHN1
cHBvc2VkIHRvIGRlZmluZSBfX1hFTl9UT09MU19fLCBvcgo+Pj4gaWYgYW55b25lIGRvZXMsIHRo
ZXkncmUgb24gdGhlaXIgb3duLgo+PiAKPj4gVGhhbmtzIGZvciB0aGUgaW5mb3JtYXRpb24uIEkg
d2lsbCBkbyBhIGZ1bGwgYnVpbGQgY2hlY2suCj4gCj4gSSB0aG91Z2h0IGFib3V0IHRoaXMgYWdh
aW4sIGxvbmcgdGVybSB0aGVyZSBhcmUgYW4gYXR0ZW1wdCB0byBidWlsZCB4ZW4gd2l0aCAKPiBv
dGhlciBjb21waWxlciBub3QgbmVjZXNzYXJpbHkgc3VwcG9ydGluZyBHTlUgQyBleHRlbnNpb24u
Cj4gV2hpbGUgdGhpcyB3b3VsZCBwcm9iYWJseSBub3QgYmUgdGhlIG9ubHkgcGxhY2UgdGhhdCBu
ZWVkIHRvIGJlIHJld29ya2VkLCB3ZSAKPiB3b3VsZCBoYXZlIHRvIHJldmVydCBwYXJ0IG9mIHRo
aXMgY2hhbmdlLiBTbyBJIHdpbGwgbm90IGRyb3AgdGhlICNpZmRlZiBoZXJlLgoKV2VsbCwgSSBk
b24ndCBrbm93IGhvdyBpdCBpcyBmb3IgQXJtLCBidXQgb24geDg2IHdlIGFjdHVhbGx5IHVzZSB0
aGUKImV4dGVuZGVkIiBuYW1pbmcgcXVpdGUgZXh0ZW5zaXZlbHksIHNvIGJ1aWxkaW5nIHdpdGgg
YSBjb21waWxlcgp0aGF0IGRvZXNuJ3Qgc3VwcG9ydCB0aGlzIGV4dGVuc2lvbiBpcyBub3QgcmVh
bGx5IGFuIG9wdGlvbiB0aGVyZS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs

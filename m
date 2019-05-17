Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1FE213B9
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2019 08:29:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRWK8-0007m9-8E; Fri, 17 May 2019 06:26:32 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mYL4=TR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hRWK6-0007m4-Q2
 for xen-devel@lists.xenproject.org; Fri, 17 May 2019 06:26:30 +0000
X-Inumbo-ID: b44d6b63-786c-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b44d6b63-786c-11e9-8980-bc764e045a96;
 Fri, 17 May 2019 06:26:29 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 17 May 2019 00:26:28 -0600
Message-Id: <5CDE5414020000780022FED3@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Fri, 17 May 2019 00:26:28 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: <alistair23@gmail.com>
References: <20190516000212.13468-1-alistair.francis@wdc.com>
 <20190516000212.13468-2-alistair.francis@wdc.com>
 <5CDD3C4B020000780022F8BE@prv1-mh.provo.novell.com>
 <CAKmqyKPhUK9LDpJA8+H16uO4augfEHW+WdnBMjZzdwHa3dM8YA@mail.gmail.com>
In-Reply-To: <CAKmqyKPhUK9LDpJA8+H16uO4augfEHW+WdnBMjZzdwHa3dM8YA@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 2/3] xen/drivers/char: Don't require vpl011
 for all non-x86 archs
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
Cc: Ian Jackson <Ian.Jackson@eu.citrix.com>,
 Alistair Francis <alistair.francis@wdc.com>, Wei Liu <wei.liu2@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDE2LjA1LjE5IGF0IDIxOjMwLCA8YWxpc3RhaXIyM0BnbWFpbC5jb20+IHdyb3RlOgo+
IE9uIFRodSwgTWF5IDE2LCAyMDE5IGF0IDM6MzIgQU0gSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1
c2UuY29tPiB3cm90ZToKPj4KPj4gPj4+IE9uIDE2LjA1LjE5IGF0IDAyOjAyLCA8YWxpc3RhaXIu
ZnJhbmNpc0B3ZGMuY29tPiB3cm90ZToKPj4gPiBNYWtlIHRoZSBhc20vdnBsMDExLmggZGVwZW5k
ZW50IG9uIHRoZSBBUk0gYXJjaGl0ZWN0dXJlLgo+Pgo+PiBCdXQgd2Ugb25seSBoYXZlIHg4NiBh
bmQgQXJtIHJpZ2h0IG5vdy4gQSB3b3JkIG1vcmUgYWJvdXQKPj4geW91ciBtb3RpdmF0aW9uIHdv
dWxkIGhlbHAuCj4gCj4gQXMgdGhlIGNvZGUgY3VycmVudGx5IGlzIG5vIG9uZSBjYW4gYWRkIGFu
b3RoZXIgYXJjaGl0ZWN0dXJlLiBUaGlzIGlzCj4ganVzdCBhIGdlbmVyYWwgZml4dXAgYXMgYXNz
dW1pbmcgWGVuIHdpbGwgb25seSBldmVyIHN1cHBvcnQgdHdvIGFyY2hzCj4gc2VlbXMgc3RyYW5n
ZS4KCkJ1dCB0aGF0J3MgdGhlbiBub3QgdGhlIG9ubHkgcGxhY2UsIGlzIGl0PyBJJ2Qgbm90IGV4
cGVjdCBhIHNpbmdsZSwKcmFuZG9tIGNoYW5nZSBvZiB0aGlzIGtpbmQgdG8gYmUgc2VudCBhbGwg
b24gaXRzIG93biBpbiBzdWNoIGEKY2FzZS4KCj4+IEFsc28gSSBkb24ndCB0aGluayB5b3VyIENj
IGxpc3QgaXMgd2lkZSBlbm91Z2ggZm9yIHRoaXMgY2hhbmdlLgo+IAo+IEkgY291bGRuJ3QgZmlu
ZCBhbnlvdGhlciBwZW9wbGUgaW4gdGhlIE1BSU5UQUlORVJTIGZpbGUsIHdobyBlbHNlIHNob3Vs
ZCBJIAo+IENDPwoKV2VsbCwgaG93IGRpZCB5b3UgbGFuZCBhdCBDYy1pbmcgdGhlIHRvb2wgc3Rh
Y2sgbWFpbnRhaW5lcnMgb24KdGhpcyBoeXBlcnZpc29yIGNoYW5nZT8gQW55d2F5IC0gdGhlcmUn
cyBhIHNlY3Rpb24gVEhFIFJFU1QKYXQgdGhlIGJvdHRvbSBvZiAuL01BSU5UQUlORVJTLCBhbmQg
d2UgYWxzbyBoYXZlIHRoZSB0d28Kc2NyaXB0cy8qX21haW50YWluZXJzLnBsIHNjcmlwdHMgdG8g
YWlkIHlvdSB3aXRoIGRldGVybWluaW5nCndobyB0byBDYy4KCkphbgoKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

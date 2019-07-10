Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF06C65020
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jul 2019 04:26:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hlOib-0000DW-Uk; Thu, 11 Jul 2019 02:21:57 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lnXc=VH=hy-research.com=hy-gsoc@srs-us1.protection.inumbo.net>)
 id 1hlMAQ-0006Lb-Ec
 for xen-devel@lists.xenproject.org; Wed, 10 Jul 2019 23:38:30 +0000
X-Inumbo-ID: d0e921ce-a36b-11e9-8980-bc764e045a96
Received: from dragonslair2.panasol.com (unknown [66.218.47.232])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id d0e921ce-a36b-11e9-8980-bc764e045a96;
 Wed, 10 Jul 2019 23:38:28 +0000 (UTC)
Received: from acer0.localnet (IDENT:405@dragonslair.panasol.com [10.10.10.1])
 by dragonslair2.panasol.com (8.14.4/8.9.3) with ESMTP id
 x6ANKW1Q011748; Wed, 10 Jul 2019 16:20:32 -0700
From: Hunyue Yau <hy-gsoc@hy-research.com>
To: Denis Obrezkov <denisobrezkov@gmail.com>
Date: Wed, 10 Jul 2019 16:20:31 -0700
Message-ID: <520937670.d9P0eaHOQZ@acer0>
User-Agent: KMail/4.14.2 (Linux/4.4.0-040400-generic; KDE/4.14.2; x86_64; ; )
In-Reply-To: <e7104450-54ae-6720-9d9f-f4e8889946c8@gmail.com>
References: <25386cfa-d0b7-83fe-4d87-5af3459d54bd@gmail.com>
 <alpine.DEB.2.21.1907101512230.12168@sstabellini-ThinkPad-T480s>
 <e7104450-54ae-6720-9d9f-f4e8889946c8@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 11 Jul 2019 02:21:57 +0000
Subject: Re: [Xen-devel] [GSoC-2019] About the crossbar and xen
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Iain Hunter <drhunter95@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RGVuaXMsCgpOb3Qgc3VyZSBpZiB5b3UgZ29uZSB0aHJvdWdoIHRoaXMgLSB0aGUgaW50ZXJydXB0
IHJvdXRpbmcgaXMgZGVzY3JpYmVkIGluIHRoZSAKVFJNIGNoYXB0ZXIgb24gaW50ZXJydXB0IGNv
bnRyb2xsZXJzLiBJbiBteSBlZGl0aW9uIChsYXJnZSBmaWxlLCBkb24ndCB3YW50IHRvIApyZWRv
d25sb2FkIHVubGVzcyBuZWVkZWQuKSwgdGhpcyBpcyBjaGFwdGVyIDE3LiBUYWJsZSAxNy0yIChp
biBteSBlZGl0aW9uKSAgCnNob3VsZCBhZGRyZXNzIGEgbG90IG9mIHdoYXQgeW91IGFyZSBhc2tp
bmcuIEl0IHNob3dzIHRoZSBJUlEgSW5wdXQgbGluZSAoYWthIApHSUMgSUQgbnVtYmVyKSwgdGhl
IElSUSBjcm9zcyBiYXIgaW5zdGFuY2UgYWxvbmcgd2l0aCB0aGUgY29uZmlnIHJlZ2lzdGVyIGFu
ZCAKc29tZSBkZXNjcmlwdGlvbi4gRmlndXJlIDE3LTEgc2hvd3MgdGhlIHRoZSBsYXlvdXQuIAoK
RnJvbSB3aGF0IEkgY2FuIHRlbGwsIHRoZSBjcm9zcyBiYXIgaXMgc28gdGhlIGludGVycnVwdCBj
YW4gYmUgc2VudCB0byB0aGUgCm90aGVyIHByb2Nlc3NvciBvbiB0aGUgZGllIGJlc2lkZXMgdGhl
IGNvcnRleC1hIChha2EgTVBVIGluIHRoZSBUUk0pLiBNYXBwaW5nIAp0aGUgVFJNIG5hbWVzIHRv
IERUIG5hbWVzIG1pZ2h0IHN0aWxsIGJlIGJpdCBvZiB3b3JrIGJ1dCB0aGlzIHNob3VsZCBnaXZl
IHlvdSAKYW4gaWRlYSB3aGF0IHRvIGxvb2sgZm9yIGluIHRoZSBMaW51eCBrZXJuZWwgdG8gYmFj
a291dCB0aGUgbmFtZXMgdXNlZC4KCgpPbiBXZWRuZXNkYXksIEp1bHkgMTAsIDIwMTkgMjI6NDM6
MzcgRGVuaXMgT2JyZXprb3Ygd3JvdGU6Cj4gSGksCj4gCj4gT24gNy8xMC8xOSAxMDoxNyBQTSwg
U3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+ID4gT24gV2VkLCAxMCBKdWwgMjAxOSwgRGVuaXMg
T2JyZXprb3Ygd3JvdGU6Cj4gPj4gSGksCj4gPj4gCj4gPj4gT24gNy8xMC8xOSA5OjQ5IFBNLCBT
dGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gPj4+ICAgcGhhbmRsZSA9IDwweDAwMDAwMDAyPjsK
PiA+Pj4gCj4gPj4+IEkgdGhpbmsgdGhhdCBtZWFucyB0aGF0IGludGVycnVwdHMgZ28gdG8gdGhl
IEdJQyB2aWEgQ3Jvc3NiYXI7IGkuZS4gdGhlCj4gPj4+IHBhcmVudCBpbnRlcnJ1cHQgY29udHJv
bGxlciBvZiBDcm9zc2JhciBpcyB0aGUgR0lDLgo+ID4+IAo+ID4+IEJ1dCB0aGUgY3Jvc3NiYXIn
cyBpbnRlcnJ1cHQtcGFyZW50IG5vZGUgaXMgMHgwMDAwMDAwOCBhbmQgcGhhbmRsZSB2YWx1ZQo+
ID4+IDB4MDAwMDAwMDggYmVsb25ncyB0bwo+ID4+IGludGVycnVwdC1jb250cm9sbGVyQDQ4Mjgx
MDAwIHsKPiA+PiAKPiA+PiAJCWNvbXBhdGlibGUgPSAidGksb21hcDUtd3VnZW4tbXB1IiwgInRp
LG9tYXA0LXd1Z2VuLW1wdSI7Cj4gPj4gCj4gPj4gRm9yIG1lIGl0IGxvb2tzIGxpa2UgaW50ZXJy
dXB0cyBmcm9tIGNyb3NzYmFyIGdvZXMgdG8gd3VnZW4gYW5kIHRoZSBmcm9tCj4gPj4gd3VnZW4g
dG8gR0lDLiBCdXQgSSBkb24ndCBxdWl0ZSB1bmRlcnN0YW5kIGl0Lgo+ID4gCj4gPiBIaSBEZW5p
cywKPiA+IAo+ID4gSSBvbmx5IHJlYWQgeW91ciBlbWFpbCBhbmQgZ290IGEgcGFydGlhbCBwaWN0
dXJlLiBJIHJlYWQgdGhlIGZ1bGwgZGV2aWNlCj4gPiB0cmVlIG5vdyBhbmQgdGhlIGhpZXJhcmNo
eSBpcyBhcyBmb2xsb3c6Cj4gPiAKPiA+IC0gY3Jvc3NiYXIgcm91dGVzIHRvIHBoYW5kbGUgOAo+
ID4gLSBwaGFuZGxlIDggaXMgb21hcDUtd3VnZW4tbXB1IGFuZCByb3V0ZXMgdG8gcGhhbmRsZSAy
Cj4gPiAtIHBoYW5kbGUgMiBpcyB0aGUgR0lDCj4gPiAKPiA+IFNvOgo+ID4gCj4gPiBjcm9zc2Jh
ciAtPiBvbWFwNS13dWdlbi1tcHUgLT4gR0lDCj4gCj4gSSBhbSBpbnRlcmVzdGVkIHdoZXRoZXIg
d2Ugc2hvdWxkIGRvIHNvbWV0aGluZyB3aXRoIG9tYXA1LXd1Z2VuLW1wdS4gSQo+IGZvdW5kIHRo
YXQgY3Jvc3NiYXIgaXMgY29ubmVjdGVkIHRvIEdJQy4gQW5kIG9uIHNvbWUgc2NoZW1lcyBpbiB0
cm0gaXQKPiBpcyBjb25uZWN0ZWQgdmlhIG9tYXA1LXd1Z2VuLW1wdS4gU28sIGl0IGlzIG5vdCBj
bGVhciBmb3IgbWUgd2hldGhlciBpdAo+IHNob3VsZCBiZSBoYW5kbGVkIGluIHhlbi4KCi0tIApI
dW55dWUgWWF1Cmh0dHA6Ly93d3cuaHktcmVzZWFyY2guY29tLwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

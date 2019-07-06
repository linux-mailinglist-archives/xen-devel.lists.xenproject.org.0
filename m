Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F011861270
	for <lists+xen-devel@lfdr.de>; Sat,  6 Jul 2019 19:41:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hjodO-0003Ok-QC; Sat, 06 Jul 2019 17:38:02 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vVoM=VD=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hjodN-0003Of-OE
 for xen-devel@lists.xenproject.org; Sat, 06 Jul 2019 17:38:01 +0000
X-Inumbo-ID: cc65c15c-a014-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id cc65c15c-a014-11e9-8980-bc764e045a96;
 Sat, 06 Jul 2019 17:38:00 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BA8E628;
 Sat,  6 Jul 2019 10:37:59 -0700 (PDT)
Received: from [10.37.8.51] (unknown [10.37.8.51])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9BBB33F703;
 Sat,  6 Jul 2019 10:37:57 -0700 (PDT)
To: Denis Obrezkov <denisobrezkov@gmail.com>,
 Iain Hunter <drhunter95@gmail.com>
References: <4ec41ede-a8cb-6724-aa88-254387b2aa15@gmail.com>
 <CALC81-tWyUTXVf5uxtdi_i5Ndz0CRtoJ=XwTecz40bzyL7Ps1w@mail.gmail.com>
 <779518d6-b7f8-9faa-f22d-558013dc8cfb@gmail.com>
 <583833d2-8303-48f5-7cab-f9e4e112a694@gmail.com>
 <3a2a6185-0056-d931-a194-578239eedabc@gmail.com>
 <c85dcf69-2a56-811d-fa95-b313ca9ea66f@arm.com>
 <42daf482-9f3e-55c7-9bad-c61b147252af@gmail.com>
 <da1d04bb-54ad-5bf7-f62e-1fecbb1e7611@arm.com>
 <e22d87c2-d09b-848a-b520-e80599d895a1@gmail.com>
 <625d8126-5baa-4d83-b27c-fabd94fe5f77@arm.com>
 <27be8a8a-7bf1-2c18-bc1d-6dd4898da47b@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <761afa88-7655-96d9-0ad9-3eb198c1eb59@arm.com>
Date: Sat, 6 Jul 2019 18:37:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <27be8a8a-7bf1-2c18-bc1d-6dd4898da47b@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [GSOC-2019] Problem with initializing crossbar on
 bb-x15 in dom0
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
 nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Hunyue Yau <hy-gsoc@hy-research.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgRGVuaXMsCgpPbiA3LzYvMTkgNTo1MCBQTSwgRGVuaXMgT2JyZXprb3Ygd3JvdGU6Cj4+PiBP
aywgSSBjaGFuZ2VkIGl0IGFuZCB3YXMgYWJsZSB0byBib290IHRvIHRoZSBwcmV2aW91cyBlcnJv
ci4gSSB0aGluayBhCj4+PiBsb2dpY2FsIG5leHQgc3RlcCB3b3VsZCBiZSB0byBzZXQgdXAgdGhl
IHVhcnQgc29tZWhvdz8KPj4KPj4gRG8geW91IG1lYW4gdGhlIFVBUlQgdXNlZCBieSBYZW4/Cj4g
WWVzLCB0byBiZSBhYmxlIHRvIHN3aXRjaCBiZXR3ZWVuIHhlbiBhbmQgZG9tMCwgdG8gZG93bmxv
YWQgYSBwcm9kdWNlZAo+IGR0IGZvciBkb20wIGZvciBleGFtcGxlLgoKWWVzIGl0IHdvdWxkIGJl
IHNlbnNpYmxlIHRvIHRyeSB0byBpbXBsZW1lbnQgYSBjcm9zc2JhciBkcml2ZXIgaW4gWGVuIAph
bmQgdGVzdCB3aXRoIHRoZSBVQVJULiBMb29raW5nIGF0IHRoZSBkcml2ZXIgaW4gTGludXgsIHRo
aXMgc2hvdWxkIG5vdCAKYmUgdG9vIGRpZmZpY3VsdC4KCj4+Cj4+Pj4KPj4+PiBCdXQgdGhpcyBm
ZWVscyB3ZWlyZCB0byBtYXAgdGhlbiB1bm1hcCB0aGUgbW1pby4gSW5zdGVhZCwgeW91IHNob3Vs
ZAo+Pj4+IGJsYWNrbGlzdCB0aGUgY3Jvc3NiYXIgZGV2aWNlLiBIYXZlIGEgbG9vayBhdCB0aGUg
ZmllbGQgYmxhY2tsaXN0X2RldiBpbgo+Pj4+IHBsYXRmb3JtX2Rlc2MuCj4+PiBIbSwgSSBjYW4g
c2VlIHRoYXQgaW4gdGhlIGRldmljZSB0cmVlIHRoZSBjcm9zc2JhciBoYXMgYSBwaGFuZGxlCj4+
PiBwcm9wZXJ0eSA8MHgwMDAwMDAwOD4gYW5kIHRoZSBtYWluIG5vZGUgaGFzIGFuIGludGVycnVw
dC1wYXJlbnQgcHJvcGVydHkKPj4+IDB4MDAwMDAwMDguIFNvLCBhbGwgdGhlIGludGVycnVwdHMg
c2VlbXMgdG8gYmUgbWFwcGVkIHRvIHRoZSBjcm9zc2Jhci4KPj4+IFdvdWxkbid0IGJlIHRoYXQg
YSBwcm9ibGVtIGlmIHdlIGJsYWNrbGlzdCB0aGUgZGV2aWNlPwo+Pgo+Pgo+PiBUaGUgRGV2aWNl
IGlzIG93bmVkIGJ5IFhlbiwgc28gdGVjaG5pY2FsbHkgRG9tMCBkb2VzIG5vdCBzZWUgdGhlCj4+
IGhhcmR3YXJlIG9uZS4gSW5zdGVhZCBpdCBzZWVzIGEgdmlydHVhbCBhbmQgdGhlcmVmb3JlIHRo
ZSBub2RlIHNob3VsZCBiZQo+PiBjcmVhdGVkIHRvIHJlZmxlY3QgaXQuCj4+Cj4+IFRoZSBwdXJw
b3NlIG9mIHJlY3JlYXRpbmcgdGhlIG5vZGUgaXMgeW91IGNhbiBhbHRlciBpdCB0byBtYXRjaCB3
aGF0IHdlCj4+IGFjdHVhbGx5IGV4cG9zZWQgdG8gdGhlIGRvbWFpbiAocHJvcGVydHkgdmFsdWVz
IG1heSBkaWZmZXIpLiBJdCBtYXkKPj4gaGFwcGVuIHRoYXQgYSBsb3Qgb2YgaW5mb3JtYXRpb24g
YXJlIGV4YWN0bHkgdGhlIHNhbWUgYXMgdGhlIGhhcmR3YXJlCj4+IGFuZCBjYW4ganVzdCBiZSBj
b3BpZWQuCj4+Cj4+IFRoaXMgaXMsIGZvciBpbnN0YW5jZSwgd2hhdCB3ZSBkbyBmb3IgdGhlIEdJ
QyBhbmQgdGltZXIuCj4gSSBtZWFuIGlmIHdlIGV4cG9zZSBvbmx5IEdJQyB0byB0aGUgZG9tMCB0
aGVuIHdlIG5lZWQgdG8gY2hhbmdlIHRoZQo+IGludGVycnVwdC1wYXJlbnQgcHJvcGVydHkgdG8g
bWFrZSBhbGwgbm9kZXMgaGF2ZSBHSUMncyBwaGFuZGxlIGFzIHRoZWlyCj4gaW50ZXJydXB0LXBh
cmVudC4gQW5kIHdoZW4gZG9tMCB0cmllcyB0byBtb2RpZnkgaXJxIGNvbm5lY3Rpb25zIHRoZW4g
eGVuCj4gc2hvdWxkIG1vZGlmeSB0aGUgY3Jvc3NiYXIuIEl0IHNlZW1zIHRvIGJlIGEgYml0IGVy
cm9yIHByb25lIGFwcHJvYWNoLgoKSSBkb24ndCB0aGluayBJIGV2ZXIgc3VnZ2VzdGVkIHRvIG5v
dCBleHBvc2UgdGhlIGNyb3NzYmFyIHRvIERvbTAuIApJbnN0ZWFkLCBJIHN1Z2dlc3RlZCB0byB2
aXJ0dWFsaXplIGZvciBEb20wLCBzbyBpdCBjYW4gYmUgdXNlZCBieSBYZW4gYXMgCndlbGwuCgo+
Pgo+Pj4gQWxzbywgdGhlIHRlZ3JhCj4+PiBpbXBsZW1lbnRhdGlvbiBibGFja2xpc3Qgb25seSBh
IHVhcnQuCj4+Cj4+IEkgZG9uJ3QgdW5kZXJzdGFuZCB0aGlzLgo+IEluIGhlcmUgWzFdIHlvdSBj
YW4gZmluZCB0aGF0IG9ubHkgdWFydCBpcyBibGFja2xpc3RlZCAoaW4KPiB0ZWdyYV9ibGFja2xp
c3RfZGV2W10pLiBTbywgaW4gdGVncmEgdGhleSBkaWRuJ3QgYmxhY2tsaXN0IHRoZWlyIHZlcnNp
b24KPiBvZiB0aGUgY3Jvc3NiYXIuCgpUaGlzIHNlcmllcyBoYXMgbm90IGJlZW4gbWVyZ2VkLiBJ
biBvdGhlciB3b3JkLCB0aGUgY29kZSBpcyBub3QgeWV0IAptYXRjaGluZyB0aGUgZXhwZWN0YXRp
b25zIG9mIHRoZSBtYWludGFpbmVycy4KCkkgcG9pbnRlZCB5b3UgdG8gdGhpcyBzZXJpZXMsIGJl
Y2F1c2UgSSB0aGluayBzb21lIG9mIHRoZSBpZGVhIGNvdWxkIGJlIApyZS11c2VkIGZvciBpbXBs
ZW1lbnRpbmcgdGhlIGNyb3NzYmFyLgoKSW4gdGhpcyBwYXJ0aWN1bGFyIGNhc2UsIGl0IGhhcyBi
ZWVuIHN1Z2dlc3RlZCB0byB1c2UgYmxhY2tsaXN0X2RldiAKcmF0aGVyIHRoYW4gdW5tYXBwaW5n
IChzZWUgWzJdKS4KCkNoZWVycywKCj4gCj4gCj4gWzFdCj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE3LTA0L21zZzAwOTkzLmh0bWwKWzJd
IApodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIw
MTctMDQvbXNnMDE5NzkuaHRtbAoKPiAKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

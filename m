Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F9E62B71
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2019 00:30:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hkc7D-0004yq-3j; Mon, 08 Jul 2019 22:28:07 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=83Ve=VF=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hkc7B-0004yl-A4
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2019 22:28:05 +0000
X-Inumbo-ID: a64ee2ec-a1cf-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a64ee2ec-a1cf-11e9-8980-bc764e045a96;
 Mon, 08 Jul 2019 22:28:03 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0FBCF2171F;
 Mon,  8 Jul 2019 22:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1562624882;
 bh=y+XIsH/y9GQJ5cIR1uIrjAXbymz5AODsmhmZLVBf4Gk=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=BcYvIYi7Q81VHW+61t4l+sV5d2uSxOwmpyNm6wbhs1l7khfF/rtBjlWvsWuOdtQ0A
 HGWbe49nBv1gSgRMlvVfuwFKJeNgeFYJ4l6YJiAMfoTC2bo/GX9taqqhtxwa/8qXY1
 rpbHpeKV9FZQGxzT8VcBHNWiuxttuYmJCZpeyI1Q=
Date: Mon, 8 Jul 2019 17:27:56 -0500 (CDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <Julien.Grall@arm.com>
In-Reply-To: <aa6c668d-acd3-6d9b-fb91-ff9b4ec9f82a@arm.com>
Message-ID: <alpine.DEB.2.21.1907081534450.3099@sstabellini-ThinkPad-T480s>
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
 <761afa88-7655-96d9-0ad9-3eb198c1eb59@arm.com>
 <9e4fd741-176b-04dc-2356-587a1542b832@gmail.com>
 <aa6c668d-acd3-6d9b-fb91-ff9b4ec9f82a@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
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
Cc: Hunyue Yau <hy-gsoc@hy-research.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Denis Obrezkov <denisobrezkov@gmail.com>, Iain Hunter <drhunter95@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gU2F0LCA2IEp1bCAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gT24gMDYvMDcvMjAxOSAx
ODo1NSwgRGVuaXMgT2JyZXprb3Ygd3JvdGU6Cj4gPiBIaSwKPiA+IAo+ID4gT24gNy82LzE5IDc6
MzcgUE0sIEp1bGllbiBHcmFsbCB3cm90ZToKPiA+IAo+ID4+Cj4gPj4gWWVzIGl0IHdvdWxkIGJl
IHNlbnNpYmxlIHRvIHRyeSB0byBpbXBsZW1lbnQgYSBjcm9zc2JhciBkcml2ZXIgaW4gWGVuCj4g
Pj4gYW5kIHRlc3Qgd2l0aCB0aGUgVUFSVC4gTG9va2luZyBhdCB0aGUgZHJpdmVyIGluIExpbnV4
LCB0aGlzIHNob3VsZCBub3QKPiA+PiBiZSB0b28gZGlmZmljdWx0Lgo+ID4gSSBkb24ndCB1bmRl
cnN0YW5kIHdoeSB4ZW4gZG9lc24ndCByZWFjdCBvbiB0cmlwbGUgQ3RybCthLiBJdCBwcm9iYWJs
eQo+ID4gbWVhbnMgdGhhdCBVQVJUJ3MgaW50ZXJydXB0cyBkb2Vzbid0IHdvcmsuIEJ1dCBJIHdh
cyBhYmxlIHRvIHR5cGUgaW4KPiA+IHUtYm9vdCBzbyB0aGUgdWFydCBzaG91bGQgYmUgYWxyZWFk
eSBjb25maWd1cmVkLiBPciBub3Q/IFNob3VsZCBJIHNldCB1cAo+ID4gaXQgaW4gYSBjcm9zc2Jh
ciBmaXJzdD8KPiBYZW4gaXMgbm90IGFibGUgdG8gZGVhbCB3aXRoIHRoZSBjcm9zc2Jhci4gSXQg
bWVhbnMgaXQgY2Fubm90IHRyYW5zbGF0ZSAKPiB0aGUgaW50ZXJydXB0IGFuZCB0aGVyZWZvcmUg
Y2Fubm90IGluaXRpYWxpemUgdGhlIFVBUlQ6Cj4gCj4gKFhFTikgb21hcC11YXJ0OiBVbmFibGUg
dG8gcmV0cmlldmUgdGhlIElSUQo+IChYRU4pIFVuYWJsZSB0byBpbml0aWFsaXplIGR0dWFydDog
LTIyCj4gKFhFTikgQmFkIGNvbnNvbGU9IG9wdGlvbiAnZHR1YXJ0Jwo+IAo+ICBGcm9tIG15IHVu
ZGVyc3RhbmRpbmcsIGV2ZW4gaWYgeW91IGFyZSBhYmxlIHRvIHRyYW5zbGF0ZSBpdCwgeW91IGRv
bid0IAo+IGtub3cgaG93IFUtYm9vdCBjb25maWd1cmVkIHRoZSBjcm9zc2Jhci4gSW4gb3RoZXIg
d29yZHMsIHlvdSBkb24ndCBrbm93IAo+IHdoaWNoIEdJQyBJbnRlcnJ1cHQgSUQgd2FzIHVzZWQg
Zm9yIHRoZSBVQVJULiBTbywgeW91IHN0aWxsIG5lZWQgdG8gCj4gY29uZmlndXJlIHRoZSBjcm9z
c2JhciBpbiBYZW4uCj4gCj4gPj4KPiA+Pj4+Cj4gPj4KPiA+PiBJIGRvbid0IHRoaW5rIEkgZXZl
ciBzdWdnZXN0ZWQgdG8gbm90IGV4cG9zZSB0aGUgY3Jvc3NiYXIgdG8gRG9tMC4KPiA+PiBJbnN0
ZWFkLCBJIHN1Z2dlc3RlZCB0byB2aXJ0dWFsaXplIGZvciBEb20wLCBzbyBpdCBjYW4gYmUgdXNl
ZCBieSBYZW4gYXMKPiA+PiB3ZWxsLgo+ID4+Cj4gPj4+Pgo+ID4+Pj4+IEFsc28sIHRoZSB0ZWdy
YQo+ID4+Pj4+IGltcGxlbWVudGF0aW9uIGJsYWNrbGlzdCBvbmx5IGEgdWFydC4KPiA+Pj4+Cj4g
Pj4+PiBJIGRvbid0IHVuZGVyc3RhbmQgdGhpcy4KPiA+Pj4gSW4gaGVyZSBbMV0geW91IGNhbiBm
aW5kIHRoYXQgb25seSB1YXJ0IGlzIGJsYWNrbGlzdGVkIChpbgo+ID4+PiB0ZWdyYV9ibGFja2xp
c3RfZGV2W10pLiBTbywgaW4gdGVncmEgdGhleSBkaWRuJ3QgYmxhY2tsaXN0IHRoZWlyIHZlcnNp
b24KPiA+Pj4gb2YgdGhlIGNyb3NzYmFyLgo+ID4+Cj4gPj4gVGhpcyBzZXJpZXMgaGFzIG5vdCBi
ZWVuIG1lcmdlZC4gSW4gb3RoZXIgd29yZCwgdGhlIGNvZGUgaXMgbm90IHlldAo+ID4+IG1hdGNo
aW5nIHRoZSBleHBlY3RhdGlvbnMgb2YgdGhlIG1haW50YWluZXJzLgo+ID4+Cj4gPj4gSSBwb2lu
dGVkIHlvdSB0byB0aGlzIHNlcmllcywgYmVjYXVzZSBJIHRoaW5rIHNvbWUgb2YgdGhlIGlkZWEg
Y291bGQgYmUKPiA+PiByZS11c2VkIGZvciBpbXBsZW1lbnRpbmcgdGhlIGNyb3NzYmFyLgo+ID4+
Cj4gPj4gSW4gdGhpcyBwYXJ0aWN1bGFyIGNhc2UsIGl0IGhhcyBiZWVuIHN1Z2dlc3RlZCB0byB1
c2UgYmxhY2tsaXN0X2Rldgo+ID4+IHJhdGhlciB0aGFuIHVubWFwcGluZyAoc2VlIFsyXSkuCj4g
Pj4KPiA+IAo+ID4gSG0sIEkgdGhvdWdodCB0aGF0IGlkZWEgYmVoaW5kIHRoZSBwYXRjaCB3YXMg
dGhhdCB0aGV5IHVubWFwIHRoZSBjb250cm9sCj4gPiByZWdpc3RlciBhbmQgaW50ZXJjZXB0IHRo
ZSBjYWxscyBmcm9tIExpbnV4IHRvIHRoYXQgY29udHJvbCByZWdpc3Rlci4gQXQKPiA+IHRoZSBz
YW1lIHRpbWUgdGhleSBwcmVzZXJ2ZWQgdGhlIGNyb3NzYmFyIGluIHRoZSBkZXZpY2UgdHJlZS4g
QW5kLCBJCj4gPiB0aG91Z2h0IHRoYXQgeW91IHdhbnRlZCB0byBkZW1vbnN0cmF0ZSB0aGlzIGV4
YWN0IHRoaW5nLgo+IAo+IEkgdGhpbmsgdW5tYXBwaW5nIHNvbWV0aGluZyB5b3UganVzdCBtYXBw
ZWQgaXMgYSBncm9zcyBoYWNrLiBJdCB3b3VsZCBiZSAKPiBiZXN0IGlmIHRoaXMgY2FuIGJlIGF2
b2lkZWQuCj4gCj4gQWxzbywgSSBhbSBhbHNvIG5vdCBlbnRpcmVseSBjb252aW5jZSB3ZSB3YW50
IHRvIGZ1bGx5IHByZXNlcnZlIHRoZSAKPiBjcm9zc2JhciBub2RlIGluIHRoZSBEVC4gSXQgd2ls
bCBkZXBlbmQgaG93IHRoZSBjcm9zc2JhciB3aWxsIGJlIAo+IHZpcnR1YWxpemVkIGZvciBEb20w
Lgo+IAo+ICBGcm9tIG15IHVuZGVyc3RhbmRpbmcsIHRoZSBjcm9zc2JhciBpcyBhYmxlIHRvIGhh
bmRsZSBOIGlycXMuIEZvciBlYWNoIAo+IGlycXMsIHRoZXJlIHdpbGwgYmUgYSBjb3JyZXNwb25k
aW5nIHJlZ2lzdGVyLgo+IAo+IFRoZSBzaW1wbGVzdCBhcHByb2FjaCB3b3VsZCBiZSB0byBleHBv
c2UgZXhhY3RseSB0aGUgc2FtZSBjcm9zc2JhciB0byAKPiBEb20wIGFuZCB0cmFwIGFsbCB0aGUg
YWNjZXNzLiBBbnkgYWNjZXNzIHRvIHJlZ2lzdGVycyBhc3NvY2lhdGVkIHRvIElSUXMgCj4gdXNl
ZCBieSBYZW4gd291bGQganVzdCBiZSBpZ25vcmVkLiBJbiB0aGlzIGFwcHJvYWNoLCB3ZSB3b3Vs
ZCBwcm9iYWJseSAKPiB3YW50IHRvIHVwZGF0ZSB0aS1pcnFzLXNraXAvdGksaXJxcy1yZXNlcnZl
ZC4KClRoaXMgaXMgc2ltaWxhciB0byB3aGF0IEkgc3VnZ2VzdGVkIHRvIERlbmlzIG9uIElSQy4g
RGVuaXMsIGlzIHlvdSBzdGlsbApoYXZlIHRoZSBsb2dzLCB5b3Ugc2hvdWxkIGZpbmQgc29tZSBt
b3JlIHBvaW50ZXJzIGluIHRoZSBzYW1lIGRpcmVjdGlvbi4KCgo+ID4gQ291bGQgeW91Cj4gPiBk
ZXNjcmliZSBob3cgaW4gZ2VuZXJhbCB0aGUgYXBwcm9hY2ggd2l0aCBibGFja2xpc3Rpbmcgc2hv
dWxkIHdvcms/Cj4gCj4gSSBkaWRuJ3QgZnVsbHkgdGhvdWdodCB0aHJvdWdoIHNvIGZhci4KPiAK
PiBPbiBhIHNlY29uZCB0aG91Z2h0LCB0aGlzIG1heSBub3Qgd29yayBjb3JyZWN0bHkuIFdlIHdh
bnQgdG8ga2VlcCB0aGUgCj4gY3Jvc3NiYXIgbm9kZSBwYXRoIHRoZSBzYW1lIHRvIGF2b2lkIGlz
c3VlIHdpdGggYWxpYXNpbmcgKHNlZSAvYWxpYXNlcykuCj4gCj4gU28gcHJvYmFibHkgdGhlIGJl
c3Qgd291bGQgYmUgdG8gbWF0Y2ggdGhlIGNyb3NzYmFyIGNvbXBhdGlibGUgYW5kIHRoZW4gCj4g
YWx0ZXIgYW55dGhpbmcgd2Ugd2FudC4gU2VlIGhvdyB3ZSBkZWFsIHdpdGggdGhlIEdJQyBpbiBt
YWtlX2dpY19ub2RlLgo+IAo+IEluIHN1bW1hcnk6Cj4gICAgIDEpIEEgcGxhdGZvcm0gY2FsbGJh
Y2sgKG1heWJlIHBsYXRmb3JtX3NwZWNpZmljX21hcHBpbmcpIHdpbGwgaG9vayAKPiB0aGUgaGFu
ZGxlcnMgZm9yIHRoZSBjcm9zc2Jhcgo+ICAgICAyKSBoYW5kbGVfbm9kZSBpcyBleHRlbmRlZCB0
byBjYXRjaCB0aGUgY3Jvc3NiYXIgbm9kZS4gRm9yIG5vdywgLCAKPiB5b3UgY291bGQgaGFjayBk
b21haW5fYnVpbGQuYyB0byBtYXRjaCB0aGUgY2FsbGJhY2suIFRoaXMgYWxsb3dzIHlvdSB0byAK
PiBmb2N1cyBvbiB2aXJ0dWFsaXppbmcgdGhlIGNyb3NzYmFyLiBXZSBjYW4gZGlzY3VzcyBhIGJl
dHRlciBhcHByb2FjaCAKPiBsYXRlciBvbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=

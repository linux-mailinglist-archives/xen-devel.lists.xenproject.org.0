Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1374362A
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jun 2019 15:01:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbPJO-0006uB-Mt; Thu, 13 Jun 2019 12:58:38 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=BOU1=UM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hbPJM-0006u6-UR
 for xen-devel@lists.xenproject.org; Thu, 13 Jun 2019 12:58:36 +0000
X-Inumbo-ID: f4612e8a-8dda-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f4612e8a-8dda-11e9-8980-bc764e045a96;
 Thu, 13 Jun 2019 12:58:35 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 13 Jun 2019 06:58:34 -0600
Message-Id: <5D0248770200007800237DAF@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Thu, 13 Jun 2019 06:58:31 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Julien Grall" <julien.grall@arm.com>
References: <1558721577-13958-1-git-send-email-andrii.anisov@gmail.com>
 <1558721577-13958-3-git-send-email-andrii.anisov@gmail.com>
 <5CFA734902000078002364C0@prv1-mh.provo.novell.com>
 <7a225ac4-f1e0-7cf8-b697-ea1f985f2dc8@arm.com>
 <5CFF6FEE0200007800236E11@prv1-mh.provo.novell.com>
 <7de133a9-6aa7-1523-3f8f-b5506efef032@gmail.com>
 <5D02448E0200007800237D77@prv1-mh.provo.novell.com>
 <9390f580-d99b-0163-48c2-7c1bd2d0133d@arm.com>
In-Reply-To: <9390f580-d99b-0163-48c2-7c1bd2d0133d@arm.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v3] xen: introduce
 VCPUOP_register_runstate_phys_memory_area hypercall
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, andrii.anisov@gmail.com,
 xen-devel <xen-devel@lists.xenproject.org>,
 "andrii_anisov@epam.com" <andrii_anisov@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDEzLjA2LjE5IGF0IDE0OjQ4LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IEhpIEphbiwKPiAKPiBPbiAxMy8wNi8yMDE5IDEzOjQxLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+
Pj4gT24gMTMuMDYuMTkgYXQgMTQ6MzIsIDxhbmRyaWkuYW5pc292QGdtYWlsLmNvbT4gd3JvdGU6
Cj4+PiBKYW4sIEp1bGllbiwKPj4+Cj4+PiBPbiAxMS4wNi4xOSAxMjoxMCwgSmFuIEJldWxpY2gg
d3JvdGU6Cj4+Pj4+PiBBdCB0aGUgdmVyeSBsZWFzdCBzdWNoIGxvb3BzIHdhbnQgYSBjcHVfcmVs
YXgoKSBpbiB0aGVpciBib2RpZXMuCj4+Pj4+PiBCdXQgdGhpcyBiZWluZyBvbiBhIGh5cGVyY2Fs
bCBwYXRoIC0gYXJlIHRoZXJlIHRoZW9yZXRpY2FsIGd1YXJhbnRlZXMKPj4+Pj4+IHRoYXQgYSBn
dWVzdCBjYW4ndCBhYnVzZSB0aGlzIHRvIGxvY2sgdXAgYSBDUFU/Cj4+Pj4+IEhtbW0sIEkgc3Vn
Z2VzdGVkIHRoaXMgYnV0IGl0IGxvb2tzIGxpa2UgYSBndWVzdCBtYXkgY2FsbCB0aGUgaHlwZXJj
YWxsCj4+PiBtdWx0aXBsZQo+Pj4+PiB0aW1lIGZyb20gZGlmZmVyZW50IHZDUFUuIFNvIHRoaXMg
Y291bGQgYmUgYSB3YXkgdG8gZGVsYXkgd29yayBvbiB0aGUgQ1BVLgo+Pj4+Pgo+Pj4+PiBJIHdh
bnRlZCB0byBtYWtlIHRoZSBjb250ZXh0IHN3aXRjaCBtb3N0bHkgbG9ja2xlc3MgYW5kIHRoZXJl
Zm9yZSBhdm9pZGluZwo+Pj4gdG8KPj4+Pj4gaW50cm9kdWNlIGEgc3BpbmxvY2suCj4+Pj4KPj4+
PiBXZWxsLCBjb25zdHJ1Y3RzIGxpa2UgdGhlIGFib3ZlIGFyZSB0cnlpbmcgdG8gbWltaWMgYSBz
cGlubG9jawo+Pj4+IHdpdGhvdXQgYWN0dWFsbHkgdXNpbmcgYSBzcGlubG9jay4gVGhlcmUgYXJl
IGV4dHJlbWVseSByYXJlCj4+Pj4gc2l0dWF0aW9uIGluIHdoaWNoIHRoaXMgbWF5IGluZGVlZCBi
ZSB3YXJyYW50ZWQsIGJ1dCBoZXJlIGl0Cj4+Pj4gZmFsbHMgaW4gdGhlIGNvbW1vbiAibWFrZXMg
dGhpbmdzIHdvcnNlIG92ZXJhbGwiIGJ1Y2tldCwgSQo+Pj4+IHRoaW5rLiBUbyBub3QgdW5kdWx5
IHBlbmFsaXplIHRoZSBhY3R1YWwgdXBkYXRlIHBhdGhzLCBJIHRoaW5rCj4+Pj4gdXNpbmcgYSBy
L3cgbG9jayB3b3VsZCBiZSBhcHByb3ByaWF0ZSBoZXJlLgo+Pj4KPj4+IFNvIHdoYXQgaXMgdGhl
IGNvbmNsdXNpb24gaGVyZT8gU2hvdWxkIHdlIGdvIHdpdGggdHJ5bG9jayBhbmQKPj4+IGh5cGVy
Y2FsbF9jcmVhdGVfY29udGludWF0aW9uKCkgaW4gb3JkZXIgdG8gYXZvaWQgbG9ja2luZyBidXQg
c3RpbGwgbm90IGZhaWwKPj4+IHRvIHRoZSBndWVzdD8KPj4gCj4+IEknbSBub3QgY29udmluY2Vk
IGEgInRyeWxvY2siIGFwcHJvYWNoIGlzIG5lZWRlZCAtIHRoYXQncwo+PiBzb21ldGhpbmcgSnVs
aWVuIHN1Z2dlc3RlZC4KPiAKPiBJIHRoaW5rIHRoZSB0cnlsb2NrIGluIHRoZSBjb250ZXh0IHN3
aXRjaCBpcyBhIG11c3QuIE90aGVyd2lzZSB5b3Ugd291bGQgZGVsYXkgCj4gY29udGV4dCBzd2l0
Y2ggaWYgdGhlIGluZm9ybWF0aW9uIGdldCB1cGRhdGVkLgoKRGVsYXkgaW4gd2hhdCB3YXk/IEku
ZS4gaG93IHdvdWxkIHRoaXMgYmUgYW4gaXNzdWUgb3RoZXIgdGhhbiBmb3IKdGhlIGd1ZXN0IGl0
c2VsZiAod2hpY2ggc2hvdWxkbid0IGJlIGNvbnN0YW50bHkgdXBkYXRpbmcgdGhlCmFkZHJlc3Mg
Zm9yIHRoZSByZWdpb24pPwoKPj4gSSdtIHByZXR0eSBzdXJlIHdlJ3JlIGFjcXVpcmluZyBvdGhl
cgo+PiBsb2NrcyBpbiBoeXBlcmNhbGwgY29udGV4dCB3aXRob3V0IGdvaW5nIHRoZSB0cnlsb2Nr
IHJvdXRlLiBJIGFtCj4+IGNvbnZpbmNlZCB0aG91Z2ggdGhhdCB0aGUgcHNldWRvLWxvY2sgeW91
J3ZlIHVzZWQgbmVlZHMgdG8gYmUKPj4gcmVwbGFjZWQgYnkgYSByZWFsIChhbmQgcGVyaGFwcyBy
L3cpIG9uZSwgX2lmXyB0aGVyZSBpcyBhbnkgbmVlZAo+PiBmb3IgbG9ja2luZyBpbiB0aGUgZmly
c3QgcGxhY2UuCj4gCj4gWW91IHdlcmUgdGhlIG9uZSBhc2tpbmcgZm9yIHRoZW9yZXRpY2FsIGd1
YXJhbnRlZXMgdGhhdCBhIGd1ZXN0IGNhbid0IGFidXNlIHRoaXMgCj4gdG8gbG9jayB1cCBhIENQ
VS4gVGhlcmUgYXJlIG5vIHdheSB0byBndWFyYW50ZWUgdGhhdCBhcyBtdWx0aXBsZSB2Q1BVcyBj
b3VsZCAKPiBjYWxsIHRoZSBoeXBlcmNhbGwgYW5kIHRha2UgdGhlIHNhbWUgbG9jayBwb3RlbnRp
YWxseSBkZWxheWluZyBzaWduaWZpY2FudGx5IHRoZSAKPiB3b3JrLgoKV2VsbCwgSSBtYXkgaGF2
ZSBnb25lIGEgbGl0dGxlIHRvbyBmYXIgd2l0aCBteSBvcmlnaW5hbCByZXNwb25zZS4gSXQKanVz
dCB3YXMgc28gb2RkIHRvIHNlZSB0aGlzIHBzZXVkbyBsb2NrIHVzZWQuCgo+IFJlZ2FyZGluZyB0
aGUgbmVlZCBvZiB0aGUgbG9jaywgSSBzdGlsbCBjYW4ndCBzZWUgaG93IHlvdSBjYW4gbWFrZSBp
dCBzYWZlIAo+IHdpdGhvdXQgaXQgYXMgeW91IG1heSBoYXZlIGNvbmN1cnJlbnQgY2FsbC4KPiAK
PiBGZWVsIGZyZWUgdG8gc3VnZ2VzdCBhIHdheS4KCldlbGwsIGlmIG5vbmUgY2FuIGJlIGZvdW5k
LCB0aGVuIGZpbmUuIEkgZG9uJ3QgaGF2ZSB0aGUgdGltZSBvciBpbnRlcmVzdApoZXJlIHRvIHRy
eSBhbmQgdGhpbmsgYWJvdXQgYSBsb2NrbGVzcyBhcHByb2FjaDsgaXQganVzdCBkb2Vzbid0IF9m
ZWVsXwpsaWtlIHRoaXMgb3VnaHQgdG8gc3RyaWN0bHkgcmVxdWlyZSB1c2Ugb2YgYSBsb2NrLiBU
aGlzIGd1dCBmZWVsaW5nIG9mIG1pbmUKbWF5IHdlbGwgYmUgd3JvbmcuCgpKYW4KCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

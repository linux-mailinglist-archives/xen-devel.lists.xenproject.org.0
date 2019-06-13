Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15EB543601
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jun 2019 14:44:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbP3F-0005mL-Ps; Thu, 13 Jun 2019 12:41:57 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=BOU1=UM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hbP3E-0005mB-LV
 for xen-devel@lists.xenproject.org; Thu, 13 Jun 2019 12:41:56 +0000
X-Inumbo-ID: a062b3b7-8dd8-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a062b3b7-8dd8-11e9-8980-bc764e045a96;
 Thu, 13 Jun 2019 12:41:55 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 13 Jun 2019 06:41:54 -0600
Message-Id: <5D02448E0200007800237D77@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Thu, 13 Jun 2019 06:41:50 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: <andrii.anisov@gmail.com>
References: <1558721577-13958-1-git-send-email-andrii.anisov@gmail.com>
 <1558721577-13958-3-git-send-email-andrii.anisov@gmail.com>
 <5CFA734902000078002364C0@prv1-mh.provo.novell.com>
 <7a225ac4-f1e0-7cf8-b697-ea1f985f2dc8@arm.com>
 <5CFF6FEE0200007800236E11@prv1-mh.provo.novell.com>
 <7de133a9-6aa7-1523-3f8f-b5506efef032@gmail.com>
In-Reply-To: <7de133a9-6aa7-1523-3f8f-b5506efef032@gmail.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 "andrii_anisov@epam.com" <andrii_anisov@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDEzLjA2LjE5IGF0IDE0OjMyLCA8YW5kcmlpLmFuaXNvdkBnbWFpbC5jb20+IHdyb3Rl
Ogo+IEphbiwgSnVsaWVuLAo+IAo+IE9uIDExLjA2LjE5IDEyOjEwLCBKYW4gQmV1bGljaCB3cm90
ZToKPj4+PiBBdCB0aGUgdmVyeSBsZWFzdCBzdWNoIGxvb3BzIHdhbnQgYSBjcHVfcmVsYXgoKSBp
biB0aGVpciBib2RpZXMuCj4+Pj4gQnV0IHRoaXMgYmVpbmcgb24gYSBoeXBlcmNhbGwgcGF0aCAt
IGFyZSB0aGVyZSB0aGVvcmV0aWNhbCBndWFyYW50ZWVzCj4+Pj4gdGhhdCBhIGd1ZXN0IGNhbid0
IGFidXNlIHRoaXMgdG8gbG9jayB1cCBhIENQVT8KPj4+IEhtbW0sIEkgc3VnZ2VzdGVkIHRoaXMg
YnV0IGl0IGxvb2tzIGxpa2UgYSBndWVzdCBtYXkgY2FsbCB0aGUgaHlwZXJjYWxsIAo+IG11bHRp
cGxlCj4+PiB0aW1lIGZyb20gZGlmZmVyZW50IHZDUFUuIFNvIHRoaXMgY291bGQgYmUgYSB3YXkg
dG8gZGVsYXkgd29yayBvbiB0aGUgQ1BVLgo+Pj4KPj4+IEkgd2FudGVkIHRvIG1ha2UgdGhlIGNv
bnRleHQgc3dpdGNoIG1vc3RseSBsb2NrbGVzcyBhbmQgdGhlcmVmb3JlIGF2b2lkaW5nIAo+IHRv
Cj4+PiBpbnRyb2R1Y2UgYSBzcGlubG9jay4KPj4gCj4+IFdlbGwsIGNvbnN0cnVjdHMgbGlrZSB0
aGUgYWJvdmUgYXJlIHRyeWluZyB0byBtaW1pYyBhIHNwaW5sb2NrCj4+IHdpdGhvdXQgYWN0dWFs
bHkgdXNpbmcgYSBzcGlubG9jay4gVGhlcmUgYXJlIGV4dHJlbWVseSByYXJlCj4+IHNpdHVhdGlv
biBpbiB3aGljaCB0aGlzIG1heSBpbmRlZWQgYmUgd2FycmFudGVkLCBidXQgaGVyZSBpdAo+PiBm
YWxscyBpbiB0aGUgY29tbW9uICJtYWtlcyB0aGluZ3Mgd29yc2Ugb3ZlcmFsbCIgYnVja2V0LCBJ
Cj4+IHRoaW5rLiBUbyBub3QgdW5kdWx5IHBlbmFsaXplIHRoZSBhY3R1YWwgdXBkYXRlIHBhdGhz
LCBJIHRoaW5rCj4+IHVzaW5nIGEgci93IGxvY2sgd291bGQgYmUgYXBwcm9wcmlhdGUgaGVyZS4K
PiAKPiBTbyB3aGF0IGlzIHRoZSBjb25jbHVzaW9uIGhlcmU/IFNob3VsZCB3ZSBnbyB3aXRoIHRy
eWxvY2sgYW5kIAo+IGh5cGVyY2FsbF9jcmVhdGVfY29udGludWF0aW9uKCkgaW4gb3JkZXIgdG8g
YXZvaWQgbG9ja2luZyBidXQgc3RpbGwgbm90IGZhaWwgCj4gdG8gdGhlIGd1ZXN0PwoKSSdtIG5v
dCBjb252aW5jZWQgYSAidHJ5bG9jayIgYXBwcm9hY2ggaXMgbmVlZGVkIC0gdGhhdCdzCnNvbWV0
aGluZyBKdWxpZW4gc3VnZ2VzdGVkLiBJJ20gcHJldHR5IHN1cmUgd2UncmUgYWNxdWlyaW5nIG90
aGVyCmxvY2tzIGluIGh5cGVyY2FsbCBjb250ZXh0IHdpdGhvdXQgZ29pbmcgdGhlIHRyeWxvY2sg
cm91dGUuIEkgYW0KY29udmluY2VkIHRob3VnaCB0aGF0IHRoZSBwc2V1ZG8tbG9jayB5b3UndmUg
dXNlZCBuZWVkcyB0byBiZQpyZXBsYWNlZCBieSBhIHJlYWwgKGFuZCBwZXJoYXBzIHIvdykgb25l
LCBfaWZfIHRoZXJlIGlzIGFueSBuZWVkCmZvciBsb2NraW5nIGluIHRoZSBmaXJzdCBwbGFjZS4K
CkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

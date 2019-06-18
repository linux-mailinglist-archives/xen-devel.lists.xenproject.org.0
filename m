Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B871C4A5C3
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2019 17:47:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdGHg-00022t-1P; Tue, 18 Jun 2019 15:44:32 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=/6v3=UR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hdGHe-00022o-Ti
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2019 15:44:30 +0000
X-Inumbo-ID: f5913b0d-91df-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f5913b0d-91df-11e9-8980-bc764e045a96;
 Tue, 18 Jun 2019 15:44:29 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 18 Jun 2019 09:44:28 -0600
Message-Id: <5D0906D802000078002395EF@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Tue, 18 Jun 2019 09:44:24 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: <andrii.anisov@gmail.com>
References: <1558721577-13958-1-git-send-email-andrii.anisov@gmail.com>
 <1558721577-13958-3-git-send-email-andrii.anisov@gmail.com>
 <5CFA734902000078002364C0@prv1-mh.provo.novell.com>
 <7a225ac4-f1e0-7cf8-b697-ea1f985f2dc8@arm.com>
 <5CFF6FEE0200007800236E11@prv1-mh.provo.novell.com>
 <7de133a9-6aa7-1523-3f8f-b5506efef032@gmail.com>
 <5D02448E0200007800237D77@prv1-mh.provo.novell.com>
 <9390f580-d99b-0163-48c2-7c1bd2d0133d@arm.com>
 <5D0248770200007800237DAF@prv1-mh.provo.novell.com>
 <f5b28793-5cc4-0f83-d571-af87d75e38c0@arm.com>
 <5D0252300200007800237E93@prv1-mh.provo.novell.com>
 <f90caffd-32c1-54a4-a28a-8d5f3976f8f8@arm.com>
 <90a3c768-5274-dbb8-8eb2-2eda902c3e5b@gmail.com>
 <a439c5ec-cec5-51be-bf76-eebdf50cf1bb@arm.com>
 <5e13f916-4ea7-05a6-3156-df6dc8bbd1d8@gmail.com>
 <5D03C06F020000780023864D@prv1-mh.provo.novell.com>
 <46e206de-dd8e-6931-bda6-32af5c7ba964@gmail.com>
 <5D0733230200007800238AF2@prv1-mh.provo.novell.com>
 <21179ac0-326d-a48a-7c33-69d6ffc43064@gmail.com>
In-Reply-To: <21179ac0-326d-a48a-7c33-69d6ffc43064@gmail.com>
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

Pj4+IE9uIDE4LjA2LjE5IGF0IDE3OjMyLCA8YW5kcmlpLmFuaXNvdkBnbWFpbC5jb20+IHdyb3Rl
Ogo+IE9uIDE3LjA2LjE5IDA5OjI4LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+IFdlIG1heSByZXF1
aXJlIGV4aXN0aW5nIHJ1bnN0YXRlIGFyZWEgdW5yZWdpc3RlcmluZyBpZiB0aGUgc3lzdGVtIGlz
IGF3YXJlCj4+PiBvZiBpdC4gQnV0IGl0IGlzIGZvciB0aGUgbmV3IGludGVyZmFjZS4KPj4+IFRo
ZSBvbGQgb25lIGhhcyBubyBkb2N1bWVudGF0aW9uIGFib3V0IHRoZSB1bnJlZ2lzdGVyaW5nLiBU
aGUgaW1wbGljaXQgd2F5Cj4+PiBpcyBrbm93biB0byB1cywgYnV0IG5vdCBrbm93biB0byB1c2Vy
cy4KPj4+IEhvdyB0byBzb2x2ZSB0aGUgY2xhc2g/Cj4+IAo+PiBBbmQgb25jZSBhZ2FpbiBJJ20g
bm90IHN1cmUgd2hhdCB0byBhbnN3ZXIsIGNvbnNpZGVyaW5nIHRoYXQgSSd2ZQo+PiBhbHJlYWR5
IG91dGxpbmVkIGEgcG9zc2libGUgbW9kZWwgKHdpdGhvdXQgYW55IGV4cGxpY2l0IHVucmVnaXN0
cmF0aW9uKS4KPiAKPiBKdXN0IHRvIGJlIHN1cmUsICJ0aGUgbW9kZWwiIHlvdSBhcmUgdGFsa2lu
ZyBhYm91dCBpcyBmb2xsb3dpbmc6Cj4gCj4+IEkgdGhvdWdodCBpdCBoYWQgYmVlbiBjbGFyaWZp
ZWQgYWxyZWFkeSB0aGF0IG5vcm1hbCBndWVzdHMgY2FuIHZlcnkKPj4gd2VsbCB1c2UgYm90aCBp
bnRlcmZhY2VzLCBqdXN0IG5vdCBib3RoIGF0IHRoZSBzYW1lIHRpbWU6IEJvb3QgbG9hZGVyCj4+
IGFuZCBPUyBjb3VsZCBkaXNhZ3JlZSBpbiB0aGlzIHJlZ2FyZCwgYXMgdGhlIHByaW1lIGV4YW1w
bGUuCj4gCj4gSXMgaXQgY29ycmVjdD8KCk5vdCByZWFsbHkgLSB3aGF0IHlvdSBxdW90ZSBpcyBh
IHN0YXRlbWVudCwgbm90IHRoZSBvdXRsaW5lIG9mIGEKbW9kZWwuIFRoZSBiYXNpYyBpZGVhIGZv
ciBlbmZvcmNlbWVudCBvZiBhIHJlc3RyaWN0aW9uIHdhcyB0bwphbGxvdyBzd2l0Y2hpbmcgbW9k
ZXMgb25seSB3aGVuIGp1c3Qgb25lIHZDUFUgaXMgb25saW5lIGluIGEKZ3Vlc3QuCgo+IEJ1dCB3
aXRoIHRoZSBjdXJyZW50IGludGVyZmFjZSAoVkEpIHRoYXQgbW9kZWwgaXMgYWxyZWFkeSBicm9r
ZW4gd2l0aG91dCAKPiB1bnJlZ2lzdHJhdGlvbi4gT24gY2hhbmdlIGJldHdlZW4gZW50aXRpZXMg
d2l0aCBkaWZmZXJlbnQgVkEgc3BhY2VzIHRoZSAKPiBoeXBlcnZpc29yIGRlZmluaXRlbHkgaGFz
IGEgY2hhbmNlIHRvIHNwb2lsIHRoZSBuZXcgVkEgc3BhY2UgYXQgdGhlIG9sZCBhZGRyZXNzLgo+
IElNSE8gaXQgc2hvdWxkIGJlIGZpeGVkIChhdCBsZWFzdCBkb2N1bWVudGVkKSBmb3IgdGhlIG9s
ZCBpbnRlcmZhY2UuCgpEb2N1bWVudCAtIHN1cmUsIGZlZWwgZnJlZS4gRml4IC0gSSBkb24ndCBz
ZWUgaG93IHlvdSB3b3VsZCBkbwp0aGlzLiBFdmVyeSBjb21wb25lbnQgaGFuZGluZyBjb250cm9s
IG9udG8gYW5vdGhlciBvbmUgd291bGQKYmUgaW4gY2hhcmdlIG9uIGl0cyBvd24uIFRoYXQncyBu
b3QgdW5kZXIgb3VyIGNvbnRyb2wuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==

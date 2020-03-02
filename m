Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6C8175803
	for <lists+xen-devel@lfdr.de>; Mon,  2 Mar 2020 11:10:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j8hyr-0007OP-Ie; Mon, 02 Mar 2020 10:07:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=GA0H=4T=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j8hyp-0007OK-F3
 for xen-devel@lists.xenproject.org; Mon, 02 Mar 2020 10:07:19 +0000
X-Inumbo-ID: 993e1c74-5c6d-11ea-aea3-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 993e1c74-5c6d-11ea-aea3-bc764e2007e4;
 Mon, 02 Mar 2020 10:07:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 72A56B227;
 Mon,  2 Mar 2020 10:07:17 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e53b3573-9c9a-734c-df67-6f6da7fd8ef4@suse.com>
 <00a4c7ca-36a4-c108-719c-01a6e16df9b2@suse.com>
 <d851c095-84a1-9edb-5905-64860fb1b7a7@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <cf139d45-13ba-668e-f2e9-b88180429db7@suse.com>
Date: Mon, 2 Mar 2020 11:07:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <d851c095-84a1-9edb-5905-64860fb1b7a7@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/5] IOMMU: iommu_intremap is x86-only
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMDIuMjAyMCAyMToxNiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAyOC8wMi8yMDIw
IDEyOjI2LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gUHJvdmlkZSBhICNkZWZpbmUgZm9yIG90aGVy
IGNhc2VzOyBpdCBkaWRuJ3Qgc2VlbSB3b3J0aHdoaWxlIHRvIG1lIHRvCj4+IGludHJvZHVjZSBh
biBJT01NVV9JTlRSRU1BUCBLY29uZmlnIG9wdGlvbiBhdCB0aGlzIHBvaW50Lgo+Pgo+PiBTaWdu
ZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+Cj4+IC0tLSBhL2Rv
Y3MvbWlzYy94ZW4tY29tbWFuZC1saW5lLnBhbmRvYwo+PiArKysgYi9kb2NzL21pc2MveGVuLWNv
bW1hbmQtbGluZS5wYW5kb2MKPj4gQEAgLTEyOTksNiArMTI5OSw4IEBAIGJvb2xlYW4gKGUuZy4g
YGlvbW11PW5vYCkgY2FuIG92ZXJyaWRlIHQKPj4gICAgICBnZW5lcmF0aW9uIG9mIElPTU1VcyBv
bmx5IHN1cHBvcnRlZCBETUEgcmVtYXBwaW5nLCBhbmQgSW50ZXJydXB0IFJlbWFwcGluZwo+PiAg
ICAgIGFwcGVhcmVkIGluIHRoZSBzZWNvbmQgZ2VuZXJhdGlvbi4KPj4gIAo+PiArICAgIFRoaXMg
b3B0aW9uIGlzIG5vdCB2YWxpZCBvbiBBcm0uCj4gCj4gVGhlIGxvbmdldml0eSBvZiB0aGlzIGNv
bW1lbnQgd291bGQgYmUgZ3JlYXRlciBpZiBpdCB3ZXJlIHBocmFzZWQgYXMgImlzCj4gb25seSB2
YWxpZCBvbiB4ODYiLCBlc3BlY2lhbGx5IGdpdmVuIHRoZSBSRkMgUklTQ1Ygc2VyaWVzIG9uIGxp
c3QuCgpIb3cgZG8gd2Uga25vdyBob3cgaW50cmVtYXAgaXMgZ29pbmcgdG8gd29yayBvbiBmdXR1
cmUgcG9ydHM/Cgo+PiBAQCAtOTAsOCArODksMTAgQEAgc3RhdGljIGludCBfX2luaXQgcGFyc2Vf
aW9tbXVfcGFyYW0oY29ucwo+PiAgICAgICAgICAgICAgaW9tbXVfc25vb3AgPSB2YWw7Cj4+ICAg
ICAgICAgIGVsc2UgaWYgKCAodmFsID0gcGFyc2VfYm9vbGVhbigicWludmFsIiwgcywgc3MpKSA+
PSAwICkKPj4gICAgICAgICAgICAgIGlvbW11X3FpbnZhbCA9IHZhbDsKPj4gKyNpZm5kZWYgaW9t
bXVfaW50cmVtYXAKPj4gICAgICAgICAgZWxzZSBpZiAoICh2YWwgPSBwYXJzZV9ib29sZWFuKCJp
bnRyZW1hcCIsIHMsIHNzKSkgPj0gMCApCj4+ICAgICAgICAgICAgICBpb21tdV9pbnRyZW1hcCA9
IHZhbCA/IGlvbW11X2ludHJlbWFwX2Z1bGwgOiBpb21tdV9pbnRyZW1hcF9vZmY7Cj4+ICsjZW5k
aWYKPiAKPiBUaGUgdXNlIG9mIGlmbmRlZiBpbiBwYXJ0aWN1bGFyIG1ha2VzIHRoZSByZXN1bHQg
dmVyeSB3ZWlyZCB0byByZWFkLsKgCj4gVGhlcmUgYXBwZWFyIHRvIGJlIG5vIHVzZXMgb2YgaW9t
bXVfaW50cmVtYXAgb3V0c2lkZSBvZiB4ODYgY29kZSwgb3RoZXIKPiB0aGFuIGluIHRoaXMgc2V0
dXAsIHNvIGhhdmluZyBpdCBmYWxzZSBpbiB0aGUgIUNPTkZJR19YODYgY2FzZSBpc24ndAo+IGhl
bHBmdWwuCj4gCj4gSG93IGFib3V0IGp1c3QgZ3VhcmRpbmcgdXNlcyBvZiB0aGUgdmFyaWFibGUg
d2l0aCBJU19FTkFCTEVEKENPTkZJR19YODYpCj4gYW5kIGEgY29tbW9uIGV4dGVybj/CoCBXZSB1
c2UgdGhpcyBEQ0UgdHJpY2sgYWxyZWFkeSB0byByZWR1Y2UgdGhlCj4gaWZkZWZhcnkgaW4gdGhl
IGNvZGUuCgpBIGNvbW1vbiBleHRlcm4gd291bGQgbWVhbiB0byBndWFyZCBfYWxsXyB1c2VzIG9m
IHRoZSB2YXJpYWJsZSwgYWxzbwpyZWFkcy4gVGhhdCdzIGEgbG90IG9mIElTX0VOQUJMRUQoQ09O
RklHX1g4NikgdG8gYWRkLiBGdXJ0aGVybW9yZSwKYXMgc2FpZCBhYm92ZSwgSSdtIHVuY29udmlu
Y2VkIGFsbCBmdXR1cmUgcG9ydHMgd291bGQgYmUgQXJtLWxpa2UgaW4KdGhpcyByZWdhcmQgKGhp
c3RvcmljYWxseSBhdCBsZWFzdCBpYTY0IHdhc24ndCkuCgpUaGUgaWRlYSBvZiB1c2luZyAjaWZk
ZWYgbGlrZSBpcyBkb25lIGhlcmUgaXMgdGhhdCBhIG5ldyBwb3J0IHdvdWxkCnR5cGljYWxseSBv
bmx5IG5lZWQgdG8gYWRqdXN0IHRoZSBjb25kaXRpb25hbCBhcm91bmQgdGhlIGRlY2xhcmF0aW9u
LwojZGVmaW5lIHRvIGNob29zZSBvbmUgb2YgdGhlIHR3byBvcHRpb25zLiBObyBvdGhlciBjb3Vs
ZCB3b3VsZCBuZWVkCnRvdWNoaW5nLiBJU19FTkFCTEVEKENPTkZJR19YODYpLCBvdG9oLCB3b3Vs
ZCByZXF1aXJlIGFsbCBzaXRlcyB3ZSdkCmFkZCBub3cgdG8gYmUgdG91Y2hlZCBhZ2FpbiB3aGVu
IGFuIHg4Ni1saWtlIHBvcnQgYXBwZWFycy4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==

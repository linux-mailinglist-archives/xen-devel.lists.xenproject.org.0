Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB57151A59
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2020 13:11:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyx02-0007Qk-B6; Tue, 04 Feb 2020 12:08:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=2C6S=3Y=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1iyx01-0007Qf-Mk
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2020 12:08:13 +0000
X-Inumbo-ID: 04318f8f-4747-11ea-8f21-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 04318f8f-4747-11ea-8f21-12813bfff9fa;
 Tue, 04 Feb 2020 12:08:12 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1iywzz-0006eF-Qm; Tue, 04 Feb 2020 12:08:11 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1iywzz-00073N-H5; Tue, 04 Feb 2020 12:08:11 +0000
Date: Tue, 4 Feb 2020 12:08:08 +0000
From: Wei Liu <wl@xen.org>
To: Hongyan Xia <hongyxia@amazon.com>
Message-ID: <20200204120808.fknxju7u43jpmvcc@debian>
References: <45c03833059b0ce3f52c02693a2eb649356adf3e.1580755007.git.hongyxia@amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <45c03833059b0ce3f52c02693a2eb649356adf3e.1580755007.git.hongyxia@amazon.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] x86/domain_page: implement pure per-vCPU
 mapping infrastructure
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
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 jgrall@amazon.com, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhhbmtzLCBJIHdlbGNvbWUgZWZmb3J0IHRvIG1ha2UgWGVuIG1vcmUgc2NhbGFibGUuIDotKSAK
Ck9uIE1vbiwgRmViIDAzLCAyMDIwIGF0IDA2OjM2OjUzUE0gKzAwMDAsIEhvbmd5YW4gWGlhIHdy
b3RlOgo+IFJld3JpdGUgdGhlIG1hcGNhY2hlIHRvIGJlIHB1cmVseSBwZXItdkNQVSBpbnN0ZWFk
IG9mIHBhcnRseSBwZXItdkNQVQo+IGFuZCBwYXJ0bHkgcGVyLWRvbWFpbi4KPiAKPiBUaGlzIHBh
dGNoIGlzIG5lZWRlZCB0byBhZGRyZXNzIHBlcmZvcm1hbmNlIGlzc3VlcyB3aGVuIHdlIHN0YXJ0
IHJlbHlpbmcKPiBvbiB0aGUgbWFwY2FjaGUsIGUuZy4sIHdoZW4gd2UgZG8gbm90IGhhdmUgYSBk
aXJlY3QgbWFwLiBDdXJyZW50bHksIHRoZQo+IHBlci1kb21haW4gbG9jayBvbiB0aGUgbWFwY2Fj
aGUgaXMgYSBib3R0bGVuZWNrIGZvciBtdWx0aWNvcmUsIGNhdXNpbmcKPiBwZXJmb3JtYW5jZSBk
ZWdyYWRhdGlvbiBhbmQgZXZlbiBmdW5jdGlvbmFsIHJlZ3Jlc3Npb25zLiBUaGlzIHBhdGNoCj4g
bWFrZXMgdGhlIG1hcHBpbmcgc3RydWN0dXJlIHBlci12Q1BVIGFuZCBjb21wbGV0ZWx5IGxvY2ts
ZXNzLgo+IAoKV2hlbiBJIHNlZSAicmVncmVzc2lvbiIsIEkgdGhpbmsgb2Ygc29tZXRoaW5nIHRo
YXQgd2FzIHdvcmtpbmcgYmVmb3JlCmJ1dCBub3QgYW55bW9yZS4gSSBkb24ndCB0aGluayB0aGF0
J3MgdGhlIGNhc2UgZm9yIHRoZSBmb2xsb3dpbmcgdHdvCnRoaW5ncy4gCgpJIHdvdWxkIGp1c3Qg
Y2xhc3NpZnkgdGhlbSBhcyBidWcgYW5kL29yIGltcHJvdmVtZW50LgoKPiBGdW5jdGlvbmFsIHJl
Z3Jlc3Npb246Cj4gCj4gV2hlbiBhIGRvbWFpbiBpcyBydW4gb24gbW9yZSB0aGFuIDY0IGNvcmVz
LCBGcmVlQlNEIDEwIHBhbmlja3MgZnJlcXVlbnRseQo+IGR1ZSB0byBvY2Nhc2lvbmFsIHNpbXVs
dGFuZW91cyBzZXRfc2luZ2xlc2hvdF90aW1lciBoeXBlcmNhbGxzIGZyb20gdG9vCj4gbWFueSBj
b3Jlcy4gU29tZSBjb3JlcyB3aWxsIGJlIGJsb2NrZWQgd2FpdGluZyBvbiBtYXBfZG9tYWluX3Bh
Z2UsCj4gZXZlbnR1YWxseSBmYWlsaW5nIHRvIHNldCBhIHRpbWVyIGluIHRoZSBmdXR1cmUuIEZy
ZWVCU0QgY2Fubm90IGhhbmRsZQo+IHRoaXMgYW5kIHBhbmlja3MuIFRoaXMgd2FzIGZpeGVkIGlu
IGxhdGVyIEZyZWVCU0QgcmVsZWFzZXMgYnkgaGFuZGxpbmcKPiAtRVRJTUUsIGJ1dCBzdGlsbCB0
aGUgZGVncmFkYXRpb24gaW4gdGltZXIgcGVyZm9ybWFuY2UgaXMgYSBiaWcgaXNzdWUuCj4gCj4g
UGVyZm9ybWFuY2UgcmVncmVzc2lvbjoKPiAKPiBNYW55IGJlbmNobWFya3Mgc2VlIGEgcGVyZm9y
bWFuY2UgZHJvcCB3aGVuIGhhdmluZyBhIGxhcmdlIGNvcmUgY291bnQuCj4gSSBoYXZlIGRvbmUg
YSBHZWVrYmVuY2ggb24gYSAzMi12Q1BVIGd1ZXN0Lgo+IAo+IHBlcmYgZHJvcCAgICAgb2xkICAg
ICAgICBuZXcKPiBzaW5nbGUgICAgICAgMC4wNCUgICAgICAwLjE4JQo+IG11bHRpICAgICAgICAy
LjQzJSAgICAgIDAuMDglCj4gCj4gUmVtb3ZpbmcgdGhlIHBlci1kb21haW4gbG9jayBpbiB0aGUg
bWFwY2FjaGUgYnJpbmdzIHRoZSBtdWx0aS1jb3JlCj4gcGVyZm9ybWFuY2UgYWxtb3N0IGlkZW50
aWNhbCB0byB1c2luZyB0aGUgZGlyZWN0IG1hcCBmb3IgbWFwcGluZ3MuCj4gCj4gVGhlcmUgc2hv
dWxkIGJlIHJvb20gZm9yIGZ1dGhlciBvcHRpbWlzYXRpb25zLCBidXQgdGhpcyBhbHJlYWR5Cj4g
aW1wcm92ZXMgb3ZlciB0aGUgb2xkIG1hcGNhY2hlIGJ5IGEgbG90Lgo+IAo+IE5vdGUgdGhhdCBl
bnRyaWVzIGluIHRoZSBtYXBoYXNoIHdpbGwgb2NjdXB5IGludXNlIHNsb3RzLiBXaXRoIDE2IHNs
b3RzCj4gcGVyIHZDUFUgYW5kIGEgbWFwaGFzaCBjYXBhY2l0eSBvZiA4LCB3ZSBvbmx5IGhhdmUg
YW5vdGhlciA4IGF2YWlsYWJsZSwKPiB3aGljaCBpcyBub3QgZW5vdWdoIGZvciBuZXN0ZWQgcGFn
ZSB0YWJsZSB3YWxrcy4gV2UgbmVlZCB0byBpbmNyZWFzZSB0aGUKPiBudW1iZXIgb2Ygc2xvdHMg
aW4gY29uZmlnLmguCj4gCj4gU2lnbmVkLW9mZi1ieTogSG9uZ3lhbiBYaWEgPGhvbmd5eGlhQGFt
YXpvbi5jb20+CgoKQXMgZmFyIGFzIEkgY2FuIHRlbGwgYWxsIHZjcHVzIHN0aWxsIHNoYXJlIHRo
ZSBzYW1lIHBlci1kb21haW4gbWFwY2FjaGUKcmVnaW9uLiBUaGUgZGlmZmVyZW5jZSBpcyBub3cg
dGhlIHJlZ2lvbiBpcyBkaXZpZGVkIGludG8gc3VicmVnaW9uIGZvcgplYWNoIHZjcHUgdG8gdXNl
LgoKPiAtLS0KPiAgeGVuL2FyY2gveDg2L2RvbWFpbi5jICAgICAgICB8ICAgNSArLQo+ICB4ZW4v
YXJjaC94ODYvZG9tYWluX3BhZ2UuYyAgIHwgMjI5ICsrKysrKysrKysrLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCj4gIHhlbi9pbmNsdWRlL2FzbS14ODYvY29uZmlnLmggfCAgIDIgKy0KPiAgeGVu
L2luY2x1ZGUvYXNtLXg4Ni9kb21haW4uaCB8ICAzMCArLS0tLQo+ICA0IGZpbGVzIGNoYW5nZWQs
IDgwIGluc2VydGlvbnMoKyksIDE4NiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVu
L2FyY2gveDg2L2RvbWFpbi5jIGIveGVuL2FyY2gveDg2L2RvbWFpbi5jCj4gaW5kZXggZjUzYWU1
ZmY4Ni4uYTI3OGFhNDY3OCAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC94ODYvZG9tYWluLmMKPiAr
KysgYi94ZW4vYXJjaC94ODYvZG9tYWluLmMKPiBAQCAtNDQ1LDYgKzQ0NSw5IEBAIHZvaWQgYXJj
aF92Y3B1X2Rlc3Ryb3koc3RydWN0IHZjcHUgKnYpCj4gICAgICB4ZnJlZSh2LT5hcmNoLm1zcnMp
Owo+ICAgICAgdi0+YXJjaC5tc3JzID0gTlVMTDsKPiAgCj4gKyAgICB4ZnJlZSh2LT5hcmNoLnB2
Lm1hcGNhY2hlKTsKPiArICAgIHYtPmFyY2gucHYubWFwY2FjaGUgPSBOVUxMOwo+ICsKCktlZXAg
aW4gbWluZCB0aGF0IGFjY2Vzc2luZyB0aGUgdW5pb24ge3B2LCBodm19IGJlZm9yZSBrbm93aW5n
IHRoZQpleGFjdCB2YXJpYW50IGlzIGRhbmdlcm91cy4KCkJlY2F1c2UgbWFwY2FjaGUgaXMgaW5p
dGlhbGlzZWQgZm9yIFBWIG9ubHksIHNvIGl0IHNob3VsZCBiZSBmcmVlZCBmb3IKUFYgb25seS4g
SSB0aGluayB5b3UgbmVlZCB0byBwdXQgaXQgdG8gcHZfdmNwdV9kZXN0cm95LgoKSWYgeW91IGRv
bid0IHdhbnQgdG8gZG8gdGhhdCBiZWNhdXNlIG9mIGFzeW1tZXRyeSB3aXRoCm1hcGNhY2hlX3Zj
cHVfaW5pdCwgeW91IG1heSB3YW50IHRvIGludmVudCBtYXBjYWNoZV92Y3B1X2Rlc3Ryb3kgZm9y
CnlvdXIgcHVycG9zZS4KCihJIHdpbGwgbmVlZCB0byBwdWxsIHRoaXMgcGF0Y2ggdG8gYSBicmFu
Y2ggdG8gc2VlIHRoZSBmaW5hbCBpbmNhcm5hdGlvbgpiZWZvcmUgSSByZXZpZXcgZnVydGhlcikK
CldlaS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

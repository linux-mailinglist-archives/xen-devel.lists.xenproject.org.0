Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBCFCA03BC
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2019 15:51:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2yJZ-0003nP-Ow; Wed, 28 Aug 2019 13:48:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=uWOn=WY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i2yJY-0003nK-Cr
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2019 13:48:44 +0000
X-Inumbo-ID: 8b7966b8-c99a-11e9-ae47-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8b7966b8-c99a-11e9-ae47-12813bfff9fa;
 Wed, 28 Aug 2019 13:48:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C1F2EAD07;
 Wed, 28 Aug 2019 13:48:40 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20190828133229.86085-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9e9181b9-4e8b-0148-0f64-78b9ac87c4af@suse.com>
Date: Wed, 28 Aug 2019 15:48:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190828133229.86085-1-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] Partially revert "x86/mm: Clean IOMMU flags
 from p2m-pt code"
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
Cc: Alexandru Stefan ISAILA <aisaila@bitdefender.com>,
 xen-devel@lists.xenproject.org, George Dunlap <george.dunlap@eu.citrix.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMDguMjAxOSAxNTozMiwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IFRoaXMgcGFydGlh
bGx5IHJldmVydHMgY29tbWl0Cj4gODU0YTQ5YTc0ODZhMDJlZGFlNWIzZTUzNjE3YmFjZTUyNmU5
YzFiMSBieSByZS1hZGRpbmcgdGhlIGxvZ2ljIHRoYXQKPiBwcm9wYWdhdGVzIGNoYW5nZXMgdG8g
dGhlIGRvbWFpbiBwaHlzbWFwIGRvbmUgYnkgcDJtX3B0X3NldF9lbnRyeSBpbnRvCj4gdGhlIGlv
bW11IHBhZ2UgdGFibGVzLiBXaXRob3V0IHRoaXMgbG9naWMgY2hhbmdlcyB0byB0aGUgZ3Vlc3Qg
cGh5c21hcAo+IGFyZSBub3QgcHJvcGFnYXRlZCB0byB0aGUgaW9tbXUsIGxlYXZpbmcgc3RhbGUg
aW9tbXUgZW50cmllcyB0aGF0IGNhbgo+IGxlYWsgZGF0YSwgb3IgZmFpbGluZyB0byBhZGQgbmV3
IGVudHJpZXMuCgpPaCwgaW5kZWVkIC0gaG93IGRpZCBJIG1pc3MgdGhpcyB3aGlsZSByZXZpZXdp
bmc/Cgo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9wMm0tcHQuYwo+ICsrKyBiL3hlbi9hcmNoL3g4
Ni9tbS9wMm0tcHQuYwo+IEBAIC0zNSw2ICszNSw3IEBACj4gICNpbmNsdWRlIDxhc20vcDJtLmg+
Cj4gICNpbmNsdWRlIDxhc20vbWVtX3NoYXJpbmcuaD4KPiAgI2luY2x1ZGUgPGFzbS9odm0vbmVz
dGVkaHZtLmg+Cj4gKyNpbmNsdWRlIDxhc20vaHZtL3N2bS9hbWQtaW9tbXUtcHJvdG8uaD4KCkkg
Z3Vlc3MgeW91IGRvbid0IHJlYWxseSBuZWVkIHRvIHJlLWFkZCB0aGlzLCBhcyAuLi4KCj4gQEAg
LTY0MCw5ICs2NzEsMjQgQEAgcDJtX3B0X3NldF9lbnRyeShzdHJ1Y3QgcDJtX2RvbWFpbiAqcDJt
LCBnZm5fdCBnZm5fLCBtZm5fdCBtZm4sCj4gICAgICAgICAgICYmIChnZm4gKyAoMVVMIDw8IHBh
Z2Vfb3JkZXIpIC0gMSA+IHAybS0+bWF4X21hcHBlZF9wZm4pICkKPiAgICAgICAgICBwMm0tPm1h
eF9tYXBwZWRfcGZuID0gZ2ZuICsgKDFVTCA8PCBwYWdlX29yZGVyKSAtIDE7Cj4gIAo+ICsgICAg
aWYgKCBpb21tdV9lbmFibGVkICYmIChpb21tdV9vbGRfZmxhZ3MgIT0gaW9tbXVfcHRlX2ZsYWdz
IHx8Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgIG9sZF9tZm4gIT0gbWZuX3gobWZuKSkg
KQo+ICsgICAgewo+ICsgICAgICAgIEFTU0VSVChyYyA9PSAwKTsKPiArCj4gKyAgICAgICAgaWYg
KCBuZWVkX2lvbW11X3B0X3N5bmMocDJtLT5kb21haW4pICkKPiArICAgICAgICAgICAgcmMgPSBp
b21tdV9wdGVfZmxhZ3MgPwo+ICsgICAgICAgICAgICAgICAgaW9tbXVfbGVnYWN5X21hcChkLCBf
ZGZuKGdmbiksIG1mbiwgcGFnZV9vcmRlciwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgaW9tbXVfcHRlX2ZsYWdzKSA6Cj4gKyAgICAgICAgICAgICAgICBpb21tdV9sZWdhY3lf
dW5tYXAoZCwgX2RmbihnZm4pLCBwYWdlX29yZGVyKTsKPiArICAgICAgICBlbHNlIGlmICggaW9t
bXVfdXNlX2hhcF9wdChkKSAmJiBpb21tdV9vbGRfZmxhZ3MgKQo+ICsgICAgICAgICAgICBhbWRf
aW9tbXVfZmx1c2hfcGFnZXMocDJtLT5kb21haW4sIGdmbiwgcGFnZV9vcmRlcik7CgouLi4gSSBk
b24ndCB0aGluayB0aGUgImVsc2UgaWYoKSIgbmVlZHMgcmVzdG9yaW5nICh3aXRoIHRoZXJlIG5v
dApiZWluZyBhbnkgc2hhcmluZyBvZiBwYWdlIHRhYmxlcyBmb3IgQU1EL1NWTSkuCgpKYW4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

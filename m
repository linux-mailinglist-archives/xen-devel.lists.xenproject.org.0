Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0B3B9D4D
	for <lists+xen-devel@lfdr.de>; Sat, 21 Sep 2019 12:12:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iBcLB-0004Zo-Km; Sat, 21 Sep 2019 10:10:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VugD=XQ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iBcL9-0004WG-NK
 for xen-devel@lists.xenproject.org; Sat, 21 Sep 2019 10:10:07 +0000
X-Inumbo-ID: fc88ce5a-dc57-11e9-95b8-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id fc88ce5a-dc57-11e9-95b8-12813bfff9fa;
 Sat, 21 Sep 2019 10:10:06 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 903AC1000;
 Sat, 21 Sep 2019 03:10:06 -0700 (PDT)
Received: from [10.37.8.63] (unknown [10.37.8.63])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1146D3F59C;
 Sat, 21 Sep 2019 03:10:05 -0700 (PDT)
To: xen-devel <xen-devel@lists.xenproject.org>
References: <20190921100753.21347-1-julien.grall@arm.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <9b7aa713-a7d7-86e7-b1cb-696989333988@arm.com>
Date: Sat, 21 Sep 2019 11:10:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190921100753.21347-1-julien.grall@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13] xen/arm: mm: Clear boot pagetables
 before bringing-up each secondary CPU
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
Cc: Julien Grall <julien.grall@arm.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpJIGZvcmdvdCB0byBjYWxsIHNjcmlwdHMvYWRkX21haW50YWluZXJzLnBsIG9uIHRoaXMg
cGF0Y2guIEkgaGF2ZSBqdXN0IApyZXNlbnQgaXQuIFNvcnJ5IGZvciB0aGUgbm9pc2UuCgpDaGVl
cnMsCgpPbiA5LzIxLzE5IDExOjA3IEFNLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gQXQgdGhlIG1v
bWVudCwgYm9vdCBwYWdldGFibGVzIGFyZSBvbmx5IGNsZWFyZWQgb25jZSBhdCBib290LiBUaGlz
IG1lYW5zCj4gd2hlbiBib290aW5nIENQVTIgKGFuZCBvbndhcmRzKSB0aGVuIGJvb3QgcGFnZXRh
YmxlcyB3aWxsIG5vdCBiZQo+IGNsZWFyZWQuCj4gCj4gVG8ga2VlcCB0aGUgaW50ZXJmYWNlIGV4
YWN0bHkgdGhlIHNhbWUgZm9yIGFsbCBzZWNvbmRhcnkgQ1BVLCB0aGUgYm9vdAo+IHBhZ2V0YWJs
ZXMgYXJlIG5vdyBjbGVhcmVkIGJlZm9yZSBicmluZ2luZy11cCBlYWNoIHNlY29uZGFyeSBDUFUu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4K
PiAtLS0KPiAgIHhlbi9hcmNoL2FybS9tbS5jIHwgMjcgKysrKysrKysrKysrKysrKysrLS0tLS0t
LS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkK
PiAKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL21tLmMgYi94ZW4vYXJjaC9hcm0vbW0uYwo+
IGluZGV4IDExMjlkYzI4YzguLmUxNGVlNzZmZjggMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gvYXJt
L21tLmMKPiArKysgYi94ZW4vYXJjaC9hcm0vbW0uYwo+IEBAIC03MDQsOCArNzA0LDIwIEBAIHZv
aWQgX19pbml0IHNldHVwX3BhZ2V0YWJsZXModW5zaWduZWQgbG9uZyBib290X3BoeXNfb2Zmc2V0
KQo+ICAgCj4gICAgICAgc3dpdGNoX3R0YnIodHRicik7Cj4gICAKPiAtICAgIC8qIENsZWFyIHRo
ZSBjb3B5IG9mIHRoZSBib290IHBhZ2V0YWJsZXMuIEVhY2ggc2Vjb25kYXJ5IENQVQo+IC0gICAg
ICogcmVidWlsZHMgdGhlc2UgaXRzZWxmIChzZWUgaGVhZC5TKSAqLwo+ICsgICAgeGVuX3B0X2Vu
Zm9yY2Vfd254KCk7Cj4gKwo+ICsjaWZkZWYgQ09ORklHX0FSTV8zMgo+ICsgICAgcGVyX2NwdSh4
ZW5fcGd0YWJsZSwgMCkgPSBjcHUwX3BndGFibGU7Cj4gKyAgICBwZXJfY3B1KHhlbl9kb21tYXAs
IDApID0gY3B1MF9kb21tYXA7Cj4gKyNlbmRpZgo+ICt9Cj4gKwo+ICtzdGF0aWMgdm9pZCBjbGVh
cl9ib290X3BhZ2V0YWJsZXModm9pZCkKPiArewo+ICsgICAgLyoKPiArICAgICAqIENsZWFyIHRo
ZSBjb3B5IG9mIHRoZSBib290IHBhZ2V0YWJsZXMuIEVhY2ggc2Vjb25kYXJ5IENQVQo+ICsgICAg
ICogcmVidWlsZHMgdGhlc2UgaXRzZWxmIChzZWUgaGVhZC5TKQo+ICsgICAgICovCj4gICAgICAg
Y2xlYXJfdGFibGUoYm9vdF9wZ3RhYmxlKTsKPiAgICNpZmRlZiBDT05GSUdfQVJNXzY0Cj4gICAg
ICAgY2xlYXJfdGFibGUoYm9vdF9maXJzdCk7Cj4gQEAgLTcxMywxOCArNzI1LDEzIEBAIHZvaWQg
X19pbml0IHNldHVwX3BhZ2V0YWJsZXModW5zaWduZWQgbG9uZyBib290X3BoeXNfb2Zmc2V0KQo+
ICAgI2VuZGlmCj4gICAgICAgY2xlYXJfdGFibGUoYm9vdF9zZWNvbmQpOwo+ICAgICAgIGNsZWFy
X3RhYmxlKGJvb3RfdGhpcmQpOwo+IC0KPiAtICAgIHhlbl9wdF9lbmZvcmNlX3dueCgpOwo+IC0K
PiAtI2lmZGVmIENPTkZJR19BUk1fMzIKPiAtICAgIHBlcl9jcHUoeGVuX3BndGFibGUsIDApID0g
Y3B1MF9wZ3RhYmxlOwo+IC0gICAgcGVyX2NwdSh4ZW5fZG9tbWFwLCAwKSA9IGNwdTBfZG9tbWFw
Owo+IC0jZW5kaWYKPiAgIH0KPiAgIAo+ICAgI2lmZGVmIENPTkZJR19BUk1fNjQKPiAgIGludCBp
bml0X3NlY29uZGFyeV9wYWdldGFibGVzKGludCBjcHUpCj4gICB7Cj4gKyAgICBjbGVhcl9ib290
X3BhZ2V0YWJsZXMoKTsKPiArCj4gICAgICAgLyogU2V0IGluaXRfdHRiciBmb3IgdGhpcyBDUFUg
Y29taW5nIHVwLiBBbGwgQ1B1cyBzaGFyZSBhIHNpbmdsZSBzZXRvZgo+ICAgICAgICAqIHBhZ2V0
YWJsZXMsIGJ1dCByZXdyaXRlIGl0IGVhY2ggdGltZSBmb3IgY29uc2lzdGVuY3kgd2l0aCAzMiBi
aXQuICovCj4gICAgICAgaW5pdF90dGJyID0gKHVpbnRwdHJfdCkgeGVuX3BndGFibGUgKyBwaHlz
X29mZnNldDsKPiBAQCAtNzY3LDYgKzc3NCw4IEBAIGludCBpbml0X3NlY29uZGFyeV9wYWdldGFi
bGVzKGludCBjcHUpCj4gICAgICAgcGVyX2NwdSh4ZW5fcGd0YWJsZSwgY3B1KSA9IGZpcnN0Owo+
ICAgICAgIHBlcl9jcHUoeGVuX2RvbW1hcCwgY3B1KSA9IGRvbWhlYXA7Cj4gICAKPiArICAgIGNs
ZWFyX2Jvb3RfcGFnZXRhYmxlcygpOwo+ICsKPiAgICAgICAvKiBTZXQgaW5pdF90dGJyIGZvciB0
aGlzIENQVSBjb21pbmcgdXAgKi8KPiAgICAgICBpbml0X3R0YnIgPSBfX3BhKGZpcnN0KTsKPiAg
ICAgICBjbGVhbl9kY2FjaGUoaW5pdF90dGJyKTsKPiAKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DBF47188
	for <lists+xen-devel@lfdr.de>; Sat, 15 Jun 2019 20:15:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hcDAo-0004p4-Py; Sat, 15 Jun 2019 18:13:06 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZUrs=UO=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hcDAm-0004oz-QB
 for xen-devel@lists.xenproject.org; Sat, 15 Jun 2019 18:13:04 +0000
X-Inumbo-ID: 371a3b45-8f99-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 371a3b45-8f99-11e9-8980-bc764e045a96;
 Sat, 15 Jun 2019 18:13:02 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B814F28;
 Sat, 15 Jun 2019 11:13:02 -0700 (PDT)
Received: from [10.37.12.2] (unknown [10.37.12.2])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ABB293F246;
 Sat, 15 Jun 2019 11:13:01 -0700 (PDT)
To: Amit Singh Tomar <amittomer25@gmail.com>, xen-devel@lists.xenproject.org
References: <1559498651-25602-1-git-send-email-amittomer25@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <6225c492-86e4-4f2f-dd12-f5d63db6c186@arm.com>
Date: Sat, 15 Jun 2019 19:12:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1559498651-25602-1-git-send-email-amittomer25@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] xen/arm: Black list everything with a PPI
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
Cc: andre.przywara@arm.com, sstabellini@kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgQW1pdCwKClNvcnJ5IGZvciB0aGUgbGF0ZSBhbnN3ZXIuCgpUaXRsZTogInhlbi9hcm06IGRv
bWFpbl9idWlsZDogQmxhY2sgbGlzdCBkZXZpY2VzIHVzaW5nIFBQSXMiCgpPbiA2LzIvMTkgNzow
NCBQTSwgQW1pdCBTaW5naCBUb21hciB3cm90ZToKPiBYRU4gc2hvdWxkIG5vdCBmb3J3YXJkIFBQ
SXMgdG8gRG9tMCBhcyBpdCBvbmx5IHN1cHBvcnQgU1BJcy4KClJlYWRpbmcgdGhpcyBzZW50ZW5j
ZSwgaXQgbGVhZHMgdG8gdGhpbmsgdGhhdCBYZW4gZG9lcyBub3Qgc3VwcG9ydCBQUElzIAphdCBh
bGwuIEhvd2V2ZXIsIHdlIGFyZSBzdXBwb3J0aW5nIFBQSXMgaW4gWGVuIGJ1dCBub3QgYWJsZSB0
byBmb3J3YXJkIAp0aGVtIGRpcmVjdGx5IHRvIGEgZ3Vlc3QuCgpTbyBob3cgYWJvdXQ6CgoiQ3Vy
cmVudGx5LCB0aGUgdkdJQyBpcyBub3QgYWJsZSB0byBjb3BlIHdpdGggaGFyZHdhcmUgUFBJcyBy
b3V0ZWQgdG8gCmd1ZXN0cy4iCgo+IE9uZSBvZiBzb2x1dGlvbiB0byB0aGlzIHByb2JsZW0gaXMg
dG8gc2tpcCBhbnkgZGV2aWNlIHRoYXQKCnMvb2Ygc29sdXRpb24vb2YgdGhlIHNvbHV0aW9ucy8K
Cj4gdXNlcyBQUEkgc291cmNlIGNvbXBsZXRlbHkgd2hpbGUgYnVpbGRpbmcgZG9tYWluIGl0c2Vs
Zi4KCnMvYnVpbGRpbmcgZG9tYWluL2J1aWxkaW5nIHRoZSBkb21haW4vCgo+IAo+IFRoaXMgcGF0
Y2ggZ29lcyB0aHJvdWdoIGFsbCB0aGUgaW50ZXJydXB0IHNvdXJjZXMgb2YgZGV2aWNlIGFuZCBz
a2lwIGl0CgpzL29mIGRldmljZS9vZiBhIGRldmljZS8KCj4gaWYgb25lIG9mIGludGVycnVwdCBz
b3VyY2UgaXMgUFBJLiBJdCBmaXhlcyBYRU4gYm9vdCBvbiBpLk1YOE1RIGJ5CgoiaWYgb25lIG9m
IHRoZSBpbnRlcnJ1cHRzIHNvdXJjZXMgaXMgYSBQUEkiLgoKPiBza2lwcGluZyBQTVUgbm9kZS4K
CnMvUE1VL3RoZSBQTVUvCgo+IAo+IFN1Z2dlc3RlZC1ieTogIEp1bGllbiBHcmFsbCA8anVsaWVu
LmdyYWxsQGFybS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogQW1pdCBTaW5naCBUb21hciA8YW1pdHRv
bWVyMjVAZ21haWwuY29tPgo+IC0tLQo+IENoYW5nZXMgc2luY2UgdjE6Cj4gICAgICAqIEFkZGVk
IGNvbW1lbnQgZm9yIFBQSXMgcmFuZ2UuCj4gLS0tCj4gICB4ZW4vYXJjaC9hcm0vZG9tYWluX2J1
aWxkLmMgfCAxNyArKysrKysrKysrKysrKysrLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDE2IGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2Rv
bWFpbl9idWlsZC5jIGIveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jCj4gaW5kZXggZDk4MzY3
Ny4uNTAzNTc1OCAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMKPiAr
KysgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMKPiBAQCAtMTM1Myw3ICsxMzUzLDcgQEAg
c3RhdGljIGludCBfX2luaXQgaGFuZGxlX25vZGUoc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IGtl
cm5lbF9pbmZvICpraW5mbywKPiAgICAgICAgICAgeyAvKiBzZW50aW5lbCAqLyB9LAo+ICAgICAg
IH07Cj4gICAgICAgc3RydWN0IGR0X2RldmljZV9ub2RlICpjaGlsZDsKPiAtICAgIGludCByZXM7
Cj4gKyAgICBpbnQgcmVzLCBpLCBuaXJxLCBpcnFfaWQ7Cj4gICAgICAgY29uc3QgY2hhciAqbmFt
ZTsKPiAgICAgICBjb25zdCBjaGFyICpwYXRoOwo+ICAgCj4gQEAgLTEzOTksNiArMTM5OSwyMSBA
QCBzdGF0aWMgaW50IF9faW5pdCBoYW5kbGVfbm9kZShzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3Qg
a2VybmVsX2luZm8gKmtpbmZvLAo+ICAgICAgICAgICByZXR1cm4gMDsKPiAgICAgICB9Cj4gICAK
PiArICAgIC8qIFNraXAgdGhlIG5vZGUsIHVzaW5nIFBQSSBzb3VyY2UgKi8KCkkgd291bGQgYWRk
IGEgd29yZCBleHBsYWluaW5nIHdoeSB0aGV5IGFyZSBza2lwcGVkOgoKIlRoZSB2R0lDIGRvZXMg
bm90IHN1cHBvcnQgcm91dGluZyBoYXJkd2FyZSBQUElzIHRvIGd1ZXN0LiBTbyB3ZSBuZWVkIHRv
IApza2lwIGFueSBub2RlcyB1c2luZyBQUElzIi4KCj4gKyAgICBuaXJxID0gZHRfbnVtYmVyX29m
X2lycShub2RlKTsKPiArCj4gKyAgICBmb3IgKCBpID0gMCA7IGkgPCBuaXJxIDsgaSsrICkKPiAr
ICAgIHsKPiArICAgICAgICBpcnFfaWQgPSBwbGF0Zm9ybV9nZXRfaXJxKG5vZGUsIGkpOwo+ICsK
PiArICAgICAgICAvKiBQUElzIHJhbmdlcyBmcm9tIElEIDE2IHRvIDMxICovCj4gKyAgICAgICAg
aWYgKCBpcnFfaWQgPj0gMTYgJiYgaXJxX2lkIDwgMzIgKQo+ICsgICAgICAgIHsKPiArICAgICAg
ICAgICAgZHRfZHByaW50aygiIFNraXAgbm9kZSB3aXRoIChQUEkgc291cmNlKVxuIik7CgpUaGUg
KCkgbG9va3MgYSBiaXQgb2RkIGhlcmUuIElmIHlvdSB3YW50IHRvIGZvbGxvdyB0aGUgb3RoZXIg
cHJpbnRrLCAKdGhlbiBpdCBzaG91bGQgYmU6ICIgIFNraXAgaXQgKHVzaW5nIFBQSXMpXG4iCgpD
aGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs

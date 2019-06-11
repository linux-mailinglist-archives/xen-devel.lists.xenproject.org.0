Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F383C057
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2019 02:09:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1haUJ4-0006xy-4W; Tue, 11 Jun 2019 00:06:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tchP=UK=mxnavi.com=chenbaodong@srs-us1.protection.inumbo.net>)
 id 1haUJ2-0006xt-SR
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2019 00:06:28 +0000
X-Inumbo-ID: bf35e324-8bdc-11e9-96ae-13e671f2fa95
Received: from mxnavi-mail.mxnavi.com (unknown [116.90.87.199])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bf35e324-8bdc-11e9-96ae-13e671f2fa95;
 Tue, 11 Jun 2019 00:06:24 +0000 (UTC)
Received: from [192.168.51.47] (61.161.186.150) by mxnavi-mail.mxnavi.com
 (116.90.87.199) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Tue, 11 Jun
 2019 08:03:13 +0800
To: Julien Grall <julien.grall@arm.com>, <xen-devel@lists.xenproject.org>
References: <0fe17c1570db4930b80f0b13d3b785a8@sslemail.net>
 <fd6f7662-2da9-a4a8-feba-cd80e94c449a@arm.com>
From: chenbaodong <chenbaodong@mxnavi.com>
Message-ID: <b7c64d49-05a4-23b1-7b00-a68adf4ec9c0@mxnavi.com>
Date: Tue, 11 Jun 2019 08:06:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <fd6f7662-2da9-a4a8-feba-cd80e94c449a@arm.com>
Content-Language: en-US
X-Originating-IP: [61.161.186.150]
X-ClientProxiedBy: mxnavi-mail.mxnavi.com (116.90.87.199) To
 mxnavi-mail.mxnavi.com (116.90.87.199)
Subject: Re: [Xen-devel] [PATCH] xen/arm: vtimer: fix return value to void
 for virt_timer_[save|restore]
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
Cc: Stefano Stabellini <sstabellini@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDYvMTEvMTkgMDQ6MTYsIEp1bGllbiBHcmFsbCB3cm90ZToKPiBIaSwKPgo+IE5JVDogSSB3
b3VsZCB1c2UgImNoYW5nZSIgaW5zdGVhZCBvZiAiZml4Ii4gSSBmZWVsICJmaXgiIGlzIG1vcmUg
d2hlbiAKPiB0aGVyZSBhcmUgYW4gYWN0dWFsIGJ1Zy4KU291bmQgZ29vZCB0byBtZS4KPgo+IE9u
IDYvMTAvMTkgNjowNyBBTSwgQmFvZG9uZyBDaGVuIHdyb3RlOgo+PiBUaGUgb3JpZ2luYWwgdHlw
ZSBpcyBpbnQgYW5kIG5vdCB1c2VkIGF0IGFsbCBzbyBmaXggdG8gdm9pZC4KPgo+IFRoZSBjb21t
aXQgbWVzc2FnZSBpcyBhIGJpdCB1bmNsZWFyLCB5b3UgbWVudGlvbiB0aGUgdHlwZSB3aGVyZWFz
IHRoZSAKPiBrZXkgcG9pbnQgaXMgbm9uZSBvZiB0aGUgY2FsbGVycyBhcmUgdXNpbmcgdGhlIHJl
dHVybiB2YWx1ZS4gU28gaG93IAo+IGFib3V0Ogo+Cj4gInZpcnRfdGltZXJfe3NhdmUsIHJldHVy
bn0gYWx3YXlzIHJldHVybiAwIGFuZCBub25lIG9mIHRoZSBjYWxsZXIgCj4gYWN0dWFsbHkgY2hl
Y2sgaXQuIFNvIGNoYW5nZSB0aGUgcmV0dXJuIHR5cGUgdG8gdm9pZC4iCj4KPiBJZiB5b3UgYXJl
IGhhcHB5IHdpdGggaXQsIEkgY2FuIG1ha2UgdGhlIG1vZGlmaWNhdGlvbnMgdGhlbSBvbiBjb21t
aXQuCmhhcHB5IHdpdGggaXQsIHBsZWFzZS4KPgo+IENoZWVycywKPgo+Pgo+PiBTaWduZWQtb2Zm
LWJ5OiBCYW9kb25nIENoZW4gPGNoZW5iYW9kb25nQG14bmF2aS5jb20+Cj4+IC0tLQo+PiDCoCB4
ZW4vYXJjaC9hcm0vdnRpbWVyLmPCoMKgwqDCoMKgwqDCoCB8IDYgKystLS0tCj4+IMKgIHhlbi9p
bmNsdWRlL2FzbS1hcm0vdnRpbWVyLmggfCA0ICsrLS0KPj4gwqAgMiBmaWxlcyBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS94ZW4vYXJj
aC9hcm0vdnRpbWVyLmMgYi94ZW4vYXJjaC9hcm0vdnRpbWVyLmMKPj4gaW5kZXggYzk5ZGQyMy4u
ZTZhZWJkYSAxMDA2NDQKPj4gLS0tIGEveGVuL2FyY2gvYXJtL3Z0aW1lci5jCj4+ICsrKyBiL3hl
bi9hcmNoL2FybS92dGltZXIuYwo+PiBAQCAtMTM2LDcgKzEzNiw3IEBAIHZvaWQgdmNwdV90aW1l
cl9kZXN0cm95KHN0cnVjdCB2Y3B1ICp2KQo+PiDCoMKgwqDCoMKgIGtpbGxfdGltZXIoJnYtPmFy
Y2gucGh5c190aW1lci50aW1lcik7Cj4+IMKgIH0KPj4gwqAgLWludCB2aXJ0X3RpbWVyX3NhdmUo
c3RydWN0IHZjcHUgKnYpCj4+ICt2b2lkIHZpcnRfdGltZXJfc2F2ZShzdHJ1Y3QgdmNwdSAqdikK
Pj4gwqAgewo+PiDCoMKgwqDCoMKgIEFTU0VSVCghaXNfaWRsZV92Y3B1KHYpKTsKPj4gwqAgQEAg
LTE0OSwxMCArMTQ5LDkgQEAgaW50IHZpcnRfdGltZXJfc2F2ZShzdHJ1Y3QgdmNwdSAqdikKPj4g
wqDCoMKgwqDCoMKgwqDCoMKgIHNldF90aW1lcigmdi0+YXJjaC52aXJ0X3RpbWVyLnRpbWVyLCAK
Pj4gdGlja3NfdG9fbnModi0+YXJjaC52aXJ0X3RpbWVyLmN2YWwgKwo+PiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB2LT5kb21haW4tPmFyY2gudmlydF90aW1lcl9iYXNl
Lm9mZnNldCAtIAo+PiBib290X2NvdW50KSk7Cj4+IMKgwqDCoMKgwqAgfQo+PiAtwqDCoMKgIHJl
dHVybiAwOwo+PiDCoCB9Cj4+IMKgIC1pbnQgdmlydF90aW1lcl9yZXN0b3JlKHN0cnVjdCB2Y3B1
ICp2KQo+PiArdm9pZCB2aXJ0X3RpbWVyX3Jlc3RvcmUoc3RydWN0IHZjcHUgKnYpCj4+IMKgIHsK
Pj4gwqDCoMKgwqDCoCBBU1NFUlQoIWlzX2lkbGVfdmNwdSh2KSk7Cj4+IMKgIEBAIC0xNjMsNyAr
MTYyLDYgQEAgaW50IHZpcnRfdGltZXJfcmVzdG9yZShzdHJ1Y3QgdmNwdSAqdikKPj4gV1JJVEVf
U1lTUkVHNjQodi0+ZG9tYWluLT5hcmNoLnZpcnRfdGltZXJfYmFzZS5vZmZzZXQsIENOVFZPRkZf
RUwyKTsKPj4gwqDCoMKgwqDCoCBXUklURV9TWVNSRUc2NCh2LT5hcmNoLnZpcnRfdGltZXIuY3Zh
bCwgQ05UVl9DVkFMX0VMMCk7Cj4+IMKgwqDCoMKgwqAgV1JJVEVfU1lTUkVHMzIodi0+YXJjaC52
aXJ0X3RpbWVyLmN0bCwgQ05UVl9DVExfRUwwKTsKPj4gLcKgwqDCoCByZXR1cm4gMDsKPj4gwqAg
fQo+PiDCoCDCoCBzdGF0aWMgYm9vbCB2dGltZXJfY250cF9jdGwoc3RydWN0IGNwdV91c2VyX3Jl
Z3MgKnJlZ3MsIHVpbnQzMl90IAo+PiAqciwgYm9vbCByZWFkKQo+PiBkaWZmIC0tZ2l0IGEveGVu
L2luY2x1ZGUvYXNtLWFybS92dGltZXIuaCBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vdnRpbWVyLmgK
Pj4gaW5kZXggOTFkODhiMy4uOWQ0ZmI0YyAxMDA2NDQKPj4gLS0tIGEveGVuL2luY2x1ZGUvYXNt
LWFybS92dGltZXIuaAo+PiArKysgYi94ZW4vaW5jbHVkZS9hc20tYXJtL3Z0aW1lci5oCj4+IEBA
IC0yNCw4ICsyNCw4IEBAIGV4dGVybiBpbnQgZG9tYWluX3Z0aW1lcl9pbml0KHN0cnVjdCBkb21h
aW4gKmQsCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHN0cnVjdCB4ZW5fYXJjaF9kb21haW5jb25maWcgKmNvbmZpZyk7Cj4+
IMKgIGV4dGVybiBpbnQgdmNwdV92dGltZXJfaW5pdChzdHJ1Y3QgdmNwdSAqdik7Cj4+IMKgIGV4
dGVybiBib29sIHZ0aW1lcl9lbXVsYXRlKHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzLCB1bmlv
biBoc3IgaHNyKTsKPj4gLWV4dGVybiBpbnQgdmlydF90aW1lcl9zYXZlKHN0cnVjdCB2Y3B1ICp2
KTsKPj4gLWV4dGVybiBpbnQgdmlydF90aW1lcl9yZXN0b3JlKHN0cnVjdCB2Y3B1ICp2KTsKPj4g
K2V4dGVybiB2b2lkIHZpcnRfdGltZXJfc2F2ZShzdHJ1Y3QgdmNwdSAqdik7Cj4+ICtleHRlcm4g
dm9pZCB2aXJ0X3RpbWVyX3Jlc3RvcmUoc3RydWN0IHZjcHUgKnYpOwo+PiDCoCBleHRlcm4gdm9p
ZCB2Y3B1X3RpbWVyX2Rlc3Ryb3koc3RydWN0IHZjcHUgKnYpOwo+PiDCoCB2b2lkIHZ0aW1lcl91
cGRhdGVfaXJxcyhzdHJ1Y3QgdmNwdSAqdik7Cj4+Cj4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=

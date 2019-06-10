Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E742E3BD62
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2019 22:18:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1haQik-0004bg-50; Mon, 10 Jun 2019 20:16:46 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=j7+2=UJ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1haQih-0004bb-P0
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2019 20:16:43 +0000
X-Inumbo-ID: a93b64ab-8bbc-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id a93b64ab-8bbc-11e9-8980-bc764e045a96;
 Mon, 10 Jun 2019 20:16:42 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E4441344;
 Mon, 10 Jun 2019 13:16:41 -0700 (PDT)
Received: from [10.37.10.2] (unknown [10.37.10.2])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 142523F73C;
 Mon, 10 Jun 2019 13:16:40 -0700 (PDT)
To: Baodong Chen <chenbaodong@mxnavi.com>, xen-devel@lists.xenproject.org
References: <1560143274-10547-1-git-send-email-chenbaodong@mxnavi.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <fd6f7662-2da9-a4a8-feba-cd80e94c449a@arm.com>
Date: Mon, 10 Jun 2019 21:16:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1560143274-10547-1-git-send-email-chenbaodong@mxnavi.com>
Content-Language: en-US
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

SGksCgpOSVQ6IEkgd291bGQgdXNlICJjaGFuZ2UiIGluc3RlYWQgb2YgImZpeCIuIEkgZmVlbCAi
Zml4IiBpcyBtb3JlIHdoZW4gCnRoZXJlIGFyZSBhbiBhY3R1YWwgYnVnLgoKT24gNi8xMC8xOSA2
OjA3IEFNLCBCYW9kb25nIENoZW4gd3JvdGU6Cj4gVGhlIG9yaWdpbmFsIHR5cGUgaXMgaW50IGFu
ZCBub3QgdXNlZCBhdCBhbGwgc28gZml4IHRvIHZvaWQuCgpUaGUgY29tbWl0IG1lc3NhZ2UgaXMg
YSBiaXQgdW5jbGVhciwgeW91IG1lbnRpb24gdGhlIHR5cGUgd2hlcmVhcyB0aGUgCmtleSBwb2lu
dCBpcyBub25lIG9mIHRoZSBjYWxsZXJzIGFyZSB1c2luZyB0aGUgcmV0dXJuIHZhbHVlLiBTbyBo
b3cgYWJvdXQ6CgoidmlydF90aW1lcl97c2F2ZSwgcmV0dXJufSBhbHdheXMgcmV0dXJuIDAgYW5k
IG5vbmUgb2YgdGhlIGNhbGxlciAKYWN0dWFsbHkgY2hlY2sgaXQuIFNvIGNoYW5nZSB0aGUgcmV0
dXJuIHR5cGUgdG8gdm9pZC4iCgpJZiB5b3UgYXJlIGhhcHB5IHdpdGggaXQsIEkgY2FuIG1ha2Ug
dGhlIG1vZGlmaWNhdGlvbnMgdGhlbSBvbiBjb21taXQuCgpDaGVlcnMsCgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IEJhb2RvbmcgQ2hlbiA8Y2hlbmJhb2RvbmdAbXhuYXZpLmNvbT4KPiAtLS0KPiAgIHhl
bi9hcmNoL2FybS92dGltZXIuYyAgICAgICAgfCA2ICsrLS0tLQo+ICAgeGVuL2luY2x1ZGUvYXNt
LWFybS92dGltZXIuaCB8IDQgKystLQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMo
KyksIDYgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS92dGltZXIu
YyBiL3hlbi9hcmNoL2FybS92dGltZXIuYwo+IGluZGV4IGM5OWRkMjMuLmU2YWViZGEgMTAwNjQ0
Cj4gLS0tIGEveGVuL2FyY2gvYXJtL3Z0aW1lci5jCj4gKysrIGIveGVuL2FyY2gvYXJtL3Z0aW1l
ci5jCj4gQEAgLTEzNiw3ICsxMzYsNyBAQCB2b2lkIHZjcHVfdGltZXJfZGVzdHJveShzdHJ1Y3Qg
dmNwdSAqdikKPiAgICAgICBraWxsX3RpbWVyKCZ2LT5hcmNoLnBoeXNfdGltZXIudGltZXIpOwo+
ICAgfQo+ICAgCj4gLWludCB2aXJ0X3RpbWVyX3NhdmUoc3RydWN0IHZjcHUgKnYpCj4gK3ZvaWQg
dmlydF90aW1lcl9zYXZlKHN0cnVjdCB2Y3B1ICp2KQo+ICAgewo+ICAgICAgIEFTU0VSVCghaXNf
aWRsZV92Y3B1KHYpKTsKPiAgIAo+IEBAIC0xNDksMTAgKzE0OSw5IEBAIGludCB2aXJ0X3RpbWVy
X3NhdmUoc3RydWN0IHZjcHUgKnYpCj4gICAgICAgICAgIHNldF90aW1lcigmdi0+YXJjaC52aXJ0
X3RpbWVyLnRpbWVyLCB0aWNrc190b19ucyh2LT5hcmNoLnZpcnRfdGltZXIuY3ZhbCArCj4gICAg
ICAgICAgICAgICAgICAgICB2LT5kb21haW4tPmFyY2gudmlydF90aW1lcl9iYXNlLm9mZnNldCAt
IGJvb3RfY291bnQpKTsKPiAgICAgICB9Cj4gLSAgICByZXR1cm4gMDsKPiAgIH0KPiAgIAo+IC1p
bnQgdmlydF90aW1lcl9yZXN0b3JlKHN0cnVjdCB2Y3B1ICp2KQo+ICt2b2lkIHZpcnRfdGltZXJf
cmVzdG9yZShzdHJ1Y3QgdmNwdSAqdikKPiAgIHsKPiAgICAgICBBU1NFUlQoIWlzX2lkbGVfdmNw
dSh2KSk7Cj4gICAKPiBAQCAtMTYzLDcgKzE2Miw2IEBAIGludCB2aXJ0X3RpbWVyX3Jlc3RvcmUo
c3RydWN0IHZjcHUgKnYpCj4gICAgICAgV1JJVEVfU1lTUkVHNjQodi0+ZG9tYWluLT5hcmNoLnZp
cnRfdGltZXJfYmFzZS5vZmZzZXQsIENOVFZPRkZfRUwyKTsKPiAgICAgICBXUklURV9TWVNSRUc2
NCh2LT5hcmNoLnZpcnRfdGltZXIuY3ZhbCwgQ05UVl9DVkFMX0VMMCk7Cj4gICAgICAgV1JJVEVf
U1lTUkVHMzIodi0+YXJjaC52aXJ0X3RpbWVyLmN0bCwgQ05UVl9DVExfRUwwKTsKPiAtICAgIHJl
dHVybiAwOwo+ICAgfQo+ICAgCj4gICBzdGF0aWMgYm9vbCB2dGltZXJfY250cF9jdGwoc3RydWN0
IGNwdV91c2VyX3JlZ3MgKnJlZ3MsIHVpbnQzMl90ICpyLCBib29sIHJlYWQpCj4gZGlmZiAtLWdp
dCBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vdnRpbWVyLmggYi94ZW4vaW5jbHVkZS9hc20tYXJtL3Z0
aW1lci5oCj4gaW5kZXggOTFkODhiMy4uOWQ0ZmI0YyAxMDA2NDQKPiAtLS0gYS94ZW4vaW5jbHVk
ZS9hc20tYXJtL3Z0aW1lci5oCj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLWFybS92dGltZXIuaAo+
IEBAIC0yNCw4ICsyNCw4IEBAIGV4dGVybiBpbnQgZG9tYWluX3Z0aW1lcl9pbml0KHN0cnVjdCBk
b21haW4gKmQsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgeGVuX2Fy
Y2hfZG9tYWluY29uZmlnICpjb25maWcpOwo+ICAgZXh0ZXJuIGludCB2Y3B1X3Z0aW1lcl9pbml0
KHN0cnVjdCB2Y3B1ICp2KTsKPiAgIGV4dGVybiBib29sIHZ0aW1lcl9lbXVsYXRlKHN0cnVjdCBj
cHVfdXNlcl9yZWdzICpyZWdzLCB1bmlvbiBoc3IgaHNyKTsKPiAtZXh0ZXJuIGludCB2aXJ0X3Rp
bWVyX3NhdmUoc3RydWN0IHZjcHUgKnYpOwo+IC1leHRlcm4gaW50IHZpcnRfdGltZXJfcmVzdG9y
ZShzdHJ1Y3QgdmNwdSAqdik7Cj4gK2V4dGVybiB2b2lkIHZpcnRfdGltZXJfc2F2ZShzdHJ1Y3Qg
dmNwdSAqdik7Cj4gK2V4dGVybiB2b2lkIHZpcnRfdGltZXJfcmVzdG9yZShzdHJ1Y3QgdmNwdSAq
dik7Cj4gICBleHRlcm4gdm9pZCB2Y3B1X3RpbWVyX2Rlc3Ryb3koc3RydWN0IHZjcHUgKnYpOwo+
ICAgdm9pZCB2dGltZXJfdXBkYXRlX2lycXMoc3RydWN0IHZjcHUgKnYpOwo+ICAgCj4gCgotLSAK
SnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

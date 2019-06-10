Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA923B2C5
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2019 12:11:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1haHEX-0003tN-SP; Mon, 10 Jun 2019 10:08:57 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=j7+2=UJ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1haHEV-0003tI-PL
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2019 10:08:55 +0000
X-Inumbo-ID: c0d8d705-8b67-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id c0d8d705-8b67-11e9-8980-bc764e045a96;
 Mon, 10 Jun 2019 10:08:54 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3A659344;
 Mon, 10 Jun 2019 03:08:54 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 800D83F557;
 Mon, 10 Jun 2019 03:10:35 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
References: <20190514123125.29086-1-julien.grall@arm.com>
 <74c57ae1-192c-b3dd-4e76-9ac7d6ac2f5c@arm.com>
Message-ID: <814634d9-1461-960d-8621-29952cf0148f@arm.com>
Date: Mon, 10 Jun 2019 11:08:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <74c57ae1-192c-b3dd-4e76-9ac7d6ac2f5c@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH MM-PART3 v2 00/12] xen/arm: Provide a
 generic function to update Xen PT
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
Cc: Oleksandr_Tyshchenko@epam.com, Stefano Stabellini <sstabellini@kernel.org>,
 Andrii_Anisov@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

KCsgQ29tbWl0dGVycykKClBpbmcgYWdhaW4uLi4gSSBoYXZlIHNvbWUgdXBjb21pbmcgcGF0Y2hl
cyB0aGF0IGFyZSBibG9ja2VkIG9uIHRoaXMgd29yay4uLgoKQ2hlZXJzLAoKT24gMjkvMDUvMjAx
OSAxODoyMywgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpLAo+IAo+IEdlbnRsZSBwaW5nLi4uCj4g
Cj4gQ2hlZXJzLAo+IAo+IE9uIDE0LzA1LzIwMTkgMTM6MzEsIEp1bGllbiBHcmFsbCB3cm90ZToK
Pj4gSGkgYWxsLAo+Pgo+PiBUaGlzIGlzIHRoZSB0aGlyZCBwYXJ0IG9mIHRoZSBib290L21lbW9y
eSByZXdvcmsgZm9yIFhlbiBvbiBBcm0uIEF0IHRoZQo+PiBtb21lbnQsIHRoZSB1cGRhdGUgdG8g
WGVuIFBUIGlzIHNjYXR0ZXJlZCBhbGwgYXJvdW5kIG1tLmMuIFRoaXMgbWFrZXMKPj4gZGlmZmlj
dWx0IHRvIHJld29yayBYZW4gbWVtb3J5IGxheW91dCBvciBldmVuIGVuc3VyaW5nIHdlIGFyZSBm
b2xsb3dpbmcgdGhlCj4+IEFybSBBcm0gcHJvcGVybHkgKGFuZCB3ZSBhcmUgbm90IHNvIGZhciEp
Lgo+Pgo+PiBUaGlzIHBhcnQgY29udGFpbnMgY29kZSB0byBwcm92aWRlIGEgZ2VuZXJpYyBmdW5j
dGlvbiB0byB1cGRhdGUgWGVuIFBULgo+PiBXaGlsZSBJIGNvdWxkIGhhdmUgc3RhcnRlZCBmcm9t
IHNjcmF0Y2gsIEkgZGVjaWRlZCB0byBiYXNlIHRoZSBuZXcgZnVuY3Rpb24KPj4gb24gY3JlYXRl
X3hlbl9lbnRyaWVzKCkgKG5vdyByZW5hbWVkIHhlbl9wdF91cGRhdGUoKSkuIFRoaXMgbWFrZXMg
c2xpZ2h0bHkKPj4gZWFzaWVyIHRvIGZvbGxvdyB0aGUgY2hhbmdlcy4KPj4KPj4gSW4gdGhpcyBz
ZXJpZXMsIHRoZSBuZXcgZ2VuZXJpYyBmdW5jdGlvbiB3aWxsIG9ubHkgc3VwcG9ydCAzcmQtbGV2
ZWwgdXBkYXRlCj4+IGFuZCBjYW5ub3QgYmUgdXNlZCBpbiBlYXJseSBib290IChpLmUgYmVjYXVz
ZSB4ZW5oZWFwIGlzIG5vdCBpbml0aWFsaXplZCkuCj4+IFRoaXMgd2lsbCBiZSBleHRlbmRlZCBp
biBmb2xsb3ctdXAgc2VyaWVzIHRvIGFsbG93IG1vcmUgdXNlIHdpdGhpbiBtbS5jLgo+Pgo+PiBU
aGVyZSBhcmUgcHJvYmFibHkgc29tZSBvcHRpbWl6YXRpb24gcG9zc2libGUgYXJvdW5kIHRoZSBU
TEJzIGZsdXNoLiBJIGhhdmVuJ3QKPj4gbG9va2VkIGF0IGl0IHNvIGZhci4KPj4KPj4gVGhlIGxh
c3QgdHdvIHBhdGNoZXMgb2YgdGhpcyBzZXJpZXMgaXMgdG8gc2hvdyBob3cgZXhpc3RpbmcgY2Fs
bGVycyBjYW4gYmUKPj4gY29udmVydGVkLiBUaGVyZSBhcmUgbW9yZSBjb252ZXJzaW9uIHRvIGNv
bWUgaW4gZm9sbG93LXVwIHNlcmllcy4KPj4KPj4gVGhpcyBzZXJpZXMgaXMgYmFzZWQgb24gdGhl
IGZpcnN0IHR3byBwYXJ0cyBzZW50IHNlcGFyYXRlbHkgKHNlZSBbMV0gYW5kIFsyXSkuCj4+Cj4+
IEZvciBjb252ZW5pZW5jZSwgSSBwcm92aWRlZCBhIGJyYW5jaCB3aXRoIGFsbCB0aGUgcGF0Y2hl
cyBhcHBsaWVkIGJhc2VkIG9uCj4+IHN0YWdpbmc6Cj4+Cj4+IMKgwqDCoMKgIGdpdDovL3hlbmJp
dHMueGVuLm9yZy9wZW9wbGUvanVsaWVuZy94ZW4tdW5zdGFibGUuZ2l0IGJyYW5jaCBtbS9wYXJ0
My92Mgo+Pgo+PiBDaGVlcnMsCj4+Cj4+IFsxXSBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTktMDUvbXNnMDExMDkuaHRtbAo+PiBbMl0gaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE5LTA1
L21zZzAxMTQ5Lmh0bWwKPj4KPj4gSnVsaWVuIEdyYWxsICgxMik6Cj4+IMKgwqAgeGVuL2FybTog
bHBhZTogQWRkIGEgbWFjcm8gdG8gZ2VuZXJhdGUgb2Zmc2V0cyBmcm9tIGFuIGFkZHJlc3MKPj4g
wqDCoCB4ZW4vYXJtOiBtbTogUmVuYW1lIGNyZWF0ZV94ZW5fZW50cmllcygpIHRvIHhlbl9wdF91
cGRhdGUoKQo+PiDCoMKgIHhlbi9hcm06IG1tOiBNb3ZlIG91dCBvZiB4ZW5fcHRfdXBkYXRlKCkg
dGhlIGxvZ2ljIHRvIHVwZGF0ZSBhbiBlbnRyeQo+PiDCoMKgIHhlbi9hcm06IG1tOiBPbmx5IGlu
Y3JlbWVudCBtZm4gd2hlbiB2YWxpZCBpbiB4ZW5fcHRfdXBkYXRlCj4+IMKgwqAgeGVuL2FybTog
bW06IEludHJvZHVjZSBfUEFHRV9QUkVTRU5UIGFuZCBfUEFHRV9QT1BVTEFURQo+PiDCoMKgIHhl
bi9hcm06IG1tOiBTYW5pdHkgY2hlY2sgYW55IHVwZGF0ZSBvZiBYZW4gcGFnZSB0YWJsZXMKPj4g
wqDCoCB4ZW4vYXJtOiBtbTogUmV3b3JrIHhlbl9wdF91cGRhdGVfZW50cnkgdG8gYXZvaWQgdXNl
IHhlbm1hcF9vcGVyYXRpb24KPj4gwqDCoCB4ZW4vYXJtOiBtbTogUmVtb3ZlIGVudW0geGVubWFw
X29wZXJhdGlvbgo+PiDCoMKgIHhlbi9hcm06IG1tOiBVc2UgeywgdW59bWFwX2RvbWFpbl9wYWdl
KCkgdG8gbWFwL3VubWFwIFhlbiBwYWdlLXRhYmxlcwo+PiDCoMKgIHhlbi9hcm06IG1tOiBSZXdv
cmsgWGVuIHBhZ2UtdGFibGVzIHdhbGsgZHVyaW5nIHVwZGF0ZQo+PiDCoMKgIHhlbi9hcm06IG1t
OiBEb24ndCBvcGVuLWNvZGUgWGVuIFBUIHVwZGF0ZSBpbiB7c2V0LCBjbGVhcn1fZml4bWFwKCkK
Pj4gwqDCoCB4ZW4vYXJtOiBtbTogUmVtb3ZlIHNldF9wdGVfZmxhZ3Nfb25fcmFuZ2UoKQo+Pgo+
PiDCoCB4ZW4vYXJjaC9hcm0vbW0uY8KgwqDCoMKgwqDCoMKgwqDCoCB8IDQyMSArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0KPj4gwqAgeGVuL2FyY2gvYXJtL3Ay
bS5jwqDCoMKgwqDCoMKgwqDCoCB8wqAgMjMgKy0tCj4+IMKgIHhlbi9pbmNsdWRlL2FzbS1hcm0v
bHBhZS5oIHzCoMKgIDkgKwo+PiDCoCB4ZW4vaW5jbHVkZS9hc20tYXJtL3BhZ2UuaCB8wqDCoCA5
ICstCj4+IMKgIDQgZmlsZXMgY2hhbmdlZCwgMzA1IGluc2VydGlvbnMoKyksIDE1NyBkZWxldGlv
bnMoLSkKPj4KPiAKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=

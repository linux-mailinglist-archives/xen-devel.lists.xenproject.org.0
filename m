Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0ABA115DA
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2019 10:55:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hM7SJ-0003FH-7u; Thu, 02 May 2019 08:52:39 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Flb6=TC=citrix.com=prvs=018be947d=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hM7SI-0003F9-1x
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 08:52:38 +0000
X-Inumbo-ID: a1a6e802-6cb7-11e9-843c-bc764e045a96
Received: from SMTP.EU.CITRIX.COM (unknown [185.25.65.24])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a1a6e802-6cb7-11e9-843c-bc764e045a96;
 Thu, 02 May 2019 08:52:36 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,421,1549929600"; d="scan'208";a="89559111"
To: Razvan Cojocaru <rcojocaru@bitdefender.com>, Tamas K Lengyel
 <tamas@tklengyel.com>, <xen-devel@lists.xenproject.org>
References: <20190501235731.1486-1-tamas@tklengyel.com>
 <59f57a48-b1da-7362-4024-c890cf357bf0@bitdefender.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <a7da1f76-ea62-4c9e-d1bd-45c193ac11ed@citrix.com>
Date: Thu, 2 May 2019 09:52:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <59f57a48-b1da-7362-4024-c890cf357bf0@bitdefender.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] x86/vm_event: add gdtr_base to the vm_event
 structure
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
Cc: Petre PIRCALABU <ppircalabu@bitdefender.com>, Wei Liu <wei.liu2@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIvMDUvMjAxOSAwOToyNSwgUmF6dmFuIENvam9jYXJ1IHdyb3RlOgo+IE9uIDUvMi8xOSAy
OjU3IEFNLCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6Cj4+IFJlY2VpdmluZyB0aGlzIHJlZ2lzdGVy
IGlzIHVzZWZ1bCBmb3IgaW50cm9zcGVjdGluZyAzMi1iaXQgV2luZG93cwo+PiB3aGVuIHRoZQo+
PiBldmVudCBiZWluZyB0cmFwcGVkIGhhcHBlbmVkIHdoaWxlIGluIHJpbmczLgo+Pgo+PiBTaWdu
ZWQtb2ZmLWJ5OiBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+Cj4+IENjOiBS
YXp2YW4gQ29qb2NhcnUgPHJjb2pvY2FydUBiaXRkZWZlbmRlci5jb20+Cj4+IENjOiBUYW1hcyBL
IExlbmd5ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+Cj4+IENjOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+Cj4+IENjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXgu
Y29tPgo+PiBDYzogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KPj4gQ2M6IFJvZ2VyIFBh
dSBNb25uZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4+IC0tLQo+PiDCoCB4ZW4vYXJjaC94ODYv
dm1fZXZlbnQuY8KgwqDCoMKgwqDCoCB8IDUgKysrKysKPj4gwqAgeGVuL2luY2x1ZGUvcHVibGlj
L3ZtX2V2ZW50LmggfCAzICsrLQo+PiDCoCAyIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3ZtX2V2ZW50
LmMgYi94ZW4vYXJjaC94ODYvdm1fZXZlbnQuYwo+PiBpbmRleCA1MWMzNDkzYjFkLi44NzM3ODhl
MzJmIDEwMDY0NAo+PiAtLS0gYS94ZW4vYXJjaC94ODYvdm1fZXZlbnQuYwo+PiArKysgYi94ZW4v
YXJjaC94ODYvdm1fZXZlbnQuYwo+PiBAQCAtMTc5LDYgKzE3OSwxMCBAQCBzdGF0aWMgdm9pZCB2
bV9ldmVudF9wYWNrX3NlZ21lbnRfcmVnaXN0ZXIoZW51bQo+PiB4ODZfc2VnbWVudCBzZWdtZW50
LAo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmVnLT5lc19zZWwgPSBzZWcuc2VsOwo+PiDCoMKgwqDC
oMKgwqDCoMKgwqAgYnJlYWs7Cj4+IMKgICvCoMKgwqAgY2FzZSB4ODZfc2VnX2dkdHI6Cj4+ICvC
oMKgwqDCoMKgwqDCoCByZWctPmdkdHJfYmFzZSA9IHNlZy5iYXNlOwo+PiArwqDCoMKgwqDCoMKg
wqAgYnJlYWs7Cj4KPiBQbGVhc2UgYWxzbyBhZGQgbGltaXQsIGFyLCBzZWwsIGxpa2UgdGhlIG90
aGVycyBkby4KCkluIFhlbiwgd2UgbW9kZWwgR0RUUi9JRFRSIGp1c3QgbGlrZSBhbGwgb3RoZXIg
c2VnbWVudHMgaW4gdGhlIHNlZ21lbnQKY2FjaGUgZm9yIGNvbnZlbmllbmNlL2NvbnNpc3RlbmN5
LCBpbmNsdWRpbmcgZmFraW5nIHVwIG9mIHNvbWUgZGVmYXVsdAphdHRyaWJ1dGVzLgoKSG93ZXZl
ciwgdGhlcmUgaXMgbm8gc3VjaCB0aGluZyBhcyBhIHNlbGVjdG9yIG9yIGFjY2VzcyByaWdodHMg
Zm9yIHRoZW0sCmFuZCB0aGUgVk1DUyBsYWNrcyB0aGUgZmllbGRzLCB3aGlsZSB0aGUgVk1DQiBt
YXJrcyB0aGUgZmllbGRzIGFzCnJlc2VydmVkLsKgwqAgSXQgaXMgYWxtb3N0IGNlcnRhaW5seSBu
b3Qgd29ydGggd2FzdGluZyB0aGUgc3BhY2UgaW4gdGhlIHJpbmcuCgp+QW5kcmV3CgpQLlMuIElm
IHlvdSBjb25zdWx0IHRoZSBzdGF0ZS1hZnRlci1yZXNldCB0YWJsZSBpbiBib3RoIFNETXMsIGl0
IGRvZXMKc3RhdGUgdGhhdCBBY2Nlc3MgUmlnaHRzIGV4aXN0LCBhbmQgZGVmYXVsdCB0byBQcmVz
ZW50IGFuZCBSL1csIGJ1dCB0aGlzCmlzbid0IGEgZmllbGQgd2hpY2ggY2FuIGJlIGNoYW5nZWQg
YXQgYW55IHBvaW50LsKgIEkgc3VzcGVjdCByZWFsCnBpcGVsaW5lcyBtb2RlbCBHRFRSL0xEVFIg
anVzdCBsaWtlIHRoZSBvdGhlciBzZWdtZW50cyBmb3IKc2ltcGxpZmljYXRpb24gb2YgdGhlIHNl
Z21lbnRhdGlvbiBsb2dpYywgd2hpY2ggaXMgd2h5IEkgY2hvc2UgdG8gZG8gdGhlCnNhbWUgaW4g
WGVuLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

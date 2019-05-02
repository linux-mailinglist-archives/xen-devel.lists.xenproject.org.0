Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A0F11678
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2019 11:18:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hM7p2-0005Bs-TY; Thu, 02 May 2019 09:16:08 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=L2Tp=TC=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1hM7p2-0005Bn-3G
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 09:16:08 +0000
X-Inumbo-ID: ea37a990-6cba-11e9-843c-bc764e045a96
Received: from mx01.bbu.dsd.mx.bitdefender.com (unknown [91.199.104.161])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ea37a990-6cba-11e9-843c-bc764e045a96;
 Thu, 02 May 2019 09:16:06 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 B805830747CB; Thu,  2 May 2019 12:16:05 +0300 (EEST)
Received: from [10.10.196.90] (unknown [195.210.5.22])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 8D858306E4AC;
 Thu,  2 May 2019 12:16:05 +0300 (EEST)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, xen-devel@lists.xenproject.org
References: <20190501235731.1486-1-tamas@tklengyel.com>
 <59f57a48-b1da-7362-4024-c890cf357bf0@bitdefender.com>
 <a7da1f76-ea62-4c9e-d1bd-45c193ac11ed@citrix.com>
From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Message-ID: <80505bd5-aa34-2e43-7b43-29195e72d1e2@bitdefender.com>
Date: Thu, 2 May 2019 12:15:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <a7da1f76-ea62-4c9e-d1bd-45c193ac11ed@citrix.com>
Content-Language: en-US-large
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiA1LzIvMTkgMTE6NTIgQU0sIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gT24gMDIvMDUvMjAx
OSAwOToyNSwgUmF6dmFuIENvam9jYXJ1IHdyb3RlOgo+PiBPbiA1LzIvMTkgMjo1NyBBTSwgVGFt
YXMgSyBMZW5neWVsIHdyb3RlOgo+Pj4gUmVjZWl2aW5nIHRoaXMgcmVnaXN0ZXIgaXMgdXNlZnVs
IGZvciBpbnRyb3NwZWN0aW5nIDMyLWJpdCBXaW5kb3dzCj4+PiB3aGVuIHRoZQo+Pj4gZXZlbnQg
YmVpbmcgdHJhcHBlZCBoYXBwZW5lZCB3aGlsZSBpbiByaW5nMy4KPj4+Cj4+PiBTaWduZWQtb2Zm
LWJ5OiBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+Cj4+PiBDYzogUmF6dmFu
IENvam9jYXJ1IDxyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29tPgo+Pj4gQ2M6IFRhbWFzIEsgTGVu
Z3llbCA8dGFtYXNAdGtsZW5neWVsLmNvbT4KPj4+IENjOiBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+Cj4+PiBDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNv
bT4KPj4+IENjOiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgo+Pj4gQ2M6IFJvZ2VyIFBh
dSBNb25uZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4+PiAtLS0KPj4+ICDCoCB4ZW4vYXJjaC94
ODYvdm1fZXZlbnQuY8KgwqDCoMKgwqDCoCB8IDUgKysrKysKPj4+ICDCoCB4ZW4vaW5jbHVkZS9w
dWJsaWMvdm1fZXZlbnQuaCB8IDMgKystCj4+PiAgwqAgMiBmaWxlcyBjaGFuZ2VkLCA3IGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2
L3ZtX2V2ZW50LmMgYi94ZW4vYXJjaC94ODYvdm1fZXZlbnQuYwo+Pj4gaW5kZXggNTFjMzQ5M2Ix
ZC4uODczNzg4ZTMyZiAxMDA2NDQKPj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni92bV9ldmVudC5jCj4+
PiArKysgYi94ZW4vYXJjaC94ODYvdm1fZXZlbnQuYwo+Pj4gQEAgLTE3OSw2ICsxNzksMTAgQEAg
c3RhdGljIHZvaWQgdm1fZXZlbnRfcGFja19zZWdtZW50X3JlZ2lzdGVyKGVudW0KPj4+IHg4Nl9z
ZWdtZW50IHNlZ21lbnQsCj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgIHJlZy0+ZXNfc2VsID0gc2Vn
LnNlbDsKPj4+ICDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4+PiAgwqAgK8KgwqDCoCBjYXNl
IHg4Nl9zZWdfZ2R0cjoKPj4+ICvCoMKgwqDCoMKgwqDCoCByZWctPmdkdHJfYmFzZSA9IHNlZy5i
YXNlOwo+Pj4gK8KgwqDCoMKgwqDCoMKgIGJyZWFrOwo+Pgo+PiBQbGVhc2UgYWxzbyBhZGQgbGlt
aXQsIGFyLCBzZWwsIGxpa2UgdGhlIG90aGVycyBkby4KPiAKPiBJbiBYZW4sIHdlIG1vZGVsIEdE
VFIvSURUUiBqdXN0IGxpa2UgYWxsIG90aGVyIHNlZ21lbnRzIGluIHRoZSBzZWdtZW50Cj4gY2Fj
aGUgZm9yIGNvbnZlbmllbmNlL2NvbnNpc3RlbmN5LCBpbmNsdWRpbmcgZmFraW5nIHVwIG9mIHNv
bWUgZGVmYXVsdAo+IGF0dHJpYnV0ZXMuCj4gCj4gSG93ZXZlciwgdGhlcmUgaXMgbm8gc3VjaCB0
aGluZyBhcyBhIHNlbGVjdG9yIG9yIGFjY2VzcyByaWdodHMgZm9yIHRoZW0sCj4gYW5kIHRoZSBW
TUNTIGxhY2tzIHRoZSBmaWVsZHMsIHdoaWxlIHRoZSBWTUNCIG1hcmtzIHRoZSBmaWVsZHMgYXMK
PiByZXNlcnZlZC7CoMKgIEl0IGlzIGFsbW9zdCBjZXJ0YWlubHkgbm90IHdvcnRoIHdhc3Rpbmcg
dGhlIHNwYWNlIGluIHRoZSByaW5nLgoKUmlnaHQsIEkgZ290IGNhcnJpZWQgYXdheSB0aGVyZTog
SSBzYXcgZ2R0cl9saW1pdCBhbmQgZGlkbid0IGNoZWNrIHRoYXQgCmlmIHRoZSByZXN0IGlzIGF2
YWlsYWJsZS4KCgpUaGFua3MsClJhenZhbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==

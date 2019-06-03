Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F285331EB
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2019 16:19:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXnlM-0006wb-Ba; Mon, 03 Jun 2019 14:16:36 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SGpH=UC=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1hXnlK-0006wU-MS
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 14:16:34 +0000
X-Inumbo-ID: 2fbabc75-860a-11e9-8980-bc764e045a96
Received: from mx01.bbu.dsd.mx.bitdefender.com (unknown [91.199.104.161])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2fbabc75-860a-11e9-8980-bc764e045a96;
 Mon, 03 Jun 2019 14:16:32 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 8C6D730747CA; Mon,  3 Jun 2019 17:16:31 +0300 (EEST)
Received: from [10.10.196.90] (unknown [195.210.5.22])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 67269306E4AC;
 Mon,  3 Jun 2019 17:16:31 +0300 (EEST)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <1559564728-17167-1-git-send-email-andrew.cooper3@citrix.com>
 <1559564728-17167-6-git-send-email-andrew.cooper3@citrix.com>
From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Message-ID: <b31fd6e0-7f30-840c-e098-96a9209ce879@bitdefender.com>
Date: Mon, 3 Jun 2019 17:16:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1559564728-17167-6-git-send-email-andrew.cooper3@citrix.com>
Content-Language: en-US-large
Subject: Re: [Xen-devel] [PATCH 5/5] xen/vm-event: Misc fixups
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Tamas K Lengyel <tamas@tklengyel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNi8zLzE5IDM6MjUgUE0sIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gICAqIERyb3AgcmVkdW5k
YW50IGJyYWNrZXMsIGFuZCBpbmxpbmUgcXVhbGlmaWVycy4KPiAgICogSW5zZXJ0IG5ld2xpbmVz
IGFuZCBzcGFjZXMgd2hlcmUgYXBwcm9wcmlhdGUuCj4gICAqIERyb3AgcmVkdW5kYW50IE5ERUJV
RyAtIGdkcHJpbnQoKSBpcyBhbHJlYWR5IGNvbmRpdGlvbmFsLiAgRml4IHRoZQo+ICAgICBsb2dn
aW5nIGxldmVsLCBhcyBnZHByaW50aygpIGFscmVhZHkgcHJlZml4ZXMgdGhlIGd1ZXN0IG1hcmtl
ci4KPiAKPiBObyBmdW5jdGlvbmFsIGNoYW5nZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcg
Q29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+IC0tLQo+IENDOiBSYXp2YW4gQ29q
b2NhcnUgPHJjb2pvY2FydUBiaXRkZWZlbmRlci5jb20+Cj4gQ0M6IFRhbWFzIEsgTGVuZ3llbCA8
dGFtYXNAdGtsZW5neWVsLmNvbT4KPiBDQzogUGV0cmUgUGlyY2FsYWJ1IDxwcGlyY2FsYWJ1QGJp
dGRlZmVuZGVyLmNvbT4KPiAtLS0KPiAgIHhlbi9jb21tb24vdm1fZXZlbnQuYyB8IDIxICsrKysr
KysrKysrKy0tLS0tLS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDkg
ZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vdm1fZXZlbnQuYyBiL3hl
bi9jb21tb24vdm1fZXZlbnQuYwo+IGluZGV4IDcyZjQyYjQuLmU4NzI2ODAgMTAwNjQ0Cj4gLS0t
IGEveGVuL2NvbW1vbi92bV9ldmVudC5jCj4gKysrIGIveGVuL2NvbW1vbi92bV9ldmVudC5jCj4g
QEAgLTEwMiw2ICsxMDIsNyBAQCBzdGF0aWMgaW50IHZtX2V2ZW50X2VuYWJsZSgKPiAgIHN0YXRp
YyB1bnNpZ25lZCBpbnQgdm1fZXZlbnRfcmluZ19hdmFpbGFibGUoc3RydWN0IHZtX2V2ZW50X2Rv
bWFpbiAqdmVkKQo+ICAgewo+ICAgICAgIGludCBhdmFpbF9yZXEgPSBSSU5HX0ZSRUVfUkVRVUVT
VFMoJnZlZC0+ZnJvbnRfcmluZyk7Cj4gKwo+ICAgICAgIGF2YWlsX3JlcSAtPSB2ZWQtPnRhcmdl
dF9wcm9kdWNlcnM7Cj4gICAgICAgYXZhaWxfcmVxIC09IHZlZC0+Zm9yZWlnbl9wcm9kdWNlcnM7
Cj4gICAKPiBAQCAtMTY4LDcgKzE2OSw3IEBAIHN0YXRpYyB2b2lkIHZtX2V2ZW50X3dha2VfcXVl
dWVkKHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCB2bV9ldmVudF9kb21haW4gKnZlZCkKPiAgICAq
Lwo+ICAgdm9pZCB2bV9ldmVudF93YWtlKHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCB2bV9ldmVu
dF9kb21haW4gKnZlZCkKPiAgIHsKPiAtICAgIGlmICghbGlzdF9lbXB0eSgmdmVkLT53cS5saXN0
KSkKPiArICAgIGlmICggIWxpc3RfZW1wdHkoJnZlZC0+d3EubGlzdCkgKQo+ICAgICAgICAgICB2
bV9ldmVudF93YWtlX3F1ZXVlZChkLCB2ZWQpOwo+ICAgICAgIGVsc2UKPiAgICAgICAgICAgdm1f
ZXZlbnRfd2FrZV9ibG9ja2VkKGQsIHZlZCk7Cj4gQEAgLTIxNiw4ICsyMTcsOCBAQCBzdGF0aWMg
aW50IHZtX2V2ZW50X2Rpc2FibGUoc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IHZtX2V2ZW50X2Rv
bWFpbiAqKnBfdmVkKQo+ICAgICAgIHJldHVybiAwOwo+ICAgfQo+ICAgCj4gLXN0YXRpYyBpbmxp
bmUgdm9pZCB2bV9ldmVudF9yZWxlYXNlX3Nsb3Qoc3RydWN0IGRvbWFpbiAqZCwKPiAtICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qgdm1fZXZlbnRfZG9tYWlu
ICp2ZWQpCj4gK3N0YXRpYyB2b2lkIHZtX2V2ZW50X3JlbGVhc2Vfc2xvdChzdHJ1Y3QgZG9tYWlu
ICpkLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHZtX2V2ZW50
X2RvbWFpbiAqdmVkKQoKQnV0IGlubGluZSBpcyBzdGlsbCBhc2tpbmcgdGhlIGNvbXBpbGVyIHRv
IHRyeSBhbmQgZ2VuZXJhdGUgY29kZSB0aGF0IApkb2Vzbid0IGVuZCB1cCBDQUxMaW5nIGFuIGFj
dHVhbCBmdW5jdGlvbiwgc28gaXMgaXQgcmVhbGx5IHJlZHVuZGFudCAKaGVyZT8gSSBkbyByZWFs
aXplIHRoYXQgZm9yIG1vc3QgY2FzZXMgdGhlIGNvbXBpbGVyIHdpbGwgaGF2ZSBpdHMgd2F5IAp3
aXRoIHRoaXMgY29kZSBhbnl3YXkgLSBlc3BlY2lhbGx5IHNpbmNlIHRoZSBmdW5jdGlvbiBpcyBz
dGF0aWMgLSBidXQgCiJzdGF0aWMiIGlzIG5vdCBndWFyYW50ZWVkIHRvIGFsc28gbWVhbiAiaW5s
aW5lIiwgaXMgaXQ/CgpJbiBhbnkgY2FzZSwKQWNrZWQtYnk6IFJhenZhbiBDb2pvY2FydSA8cmNv
am9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4KCgpUaGFua3MsClJhenZhbgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

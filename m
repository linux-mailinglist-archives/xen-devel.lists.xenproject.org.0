Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C0CE5F1
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2019 17:17:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hL7z7-0005lb-GE; Mon, 29 Apr 2019 15:14:25 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=C3NY=S7=citrix.com=prvs=015693d2f=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1hL7z5-0005lW-C7
 for xen-devel@lists.xen.org; Mon, 29 Apr 2019 15:14:23 +0000
X-Inumbo-ID: 76ca9bfe-6a91-11e9-843c-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 76ca9bfe-6a91-11e9-843c-bc764e045a96;
 Mon, 29 Apr 2019 15:14:21 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,409,1549929600"; d="scan'208";a="84659864"
To: Pawel Wieczorkiewicz <wipawel@amazon.de>, <xen-devel@lists.xen.org>
References: <20190416120716.26269-1-wipawel@amazon.de>
 <20190416120716.26269-2-wipawel@amazon.de>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Message-ID: <3dc69ca8-6c12-65ab-074c-b635bd5bdaeb@citrix.com>
Date: Mon, 29 Apr 2019 16:14:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190416120716.26269-2-wipawel@amazon.de>
Content-Language: en-US
Subject: Re: [Xen-devel] [livepatch-build-tools part2 2/6] common: Add
 is_referenced_section() helper function
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
Cc: mpohlack@amazon.de, konrad.wilk@oracle.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNC8xNi8xOSAxOjA3IFBNLCBQYXdlbCBXaWVjem9ya2lld2ljeiB3cm90ZToKPiBUaGlzIGZ1
bmN0aW9uIGNoZWNrcyBpZiBnaXZlbiBzZWN0aW9uIGhhcyBhbiBpbmNsdWRlZCBjb3JyZXNwb25k
aW5nCj4gUkVMQSBzZWN0aW9uIGFuZC9vciBhbnkgb2YgdGhlIHN5bWJvbHMgdGFibGUgc3ltYm9s
cyByZWZlcmVuY2VzIHRoZQo+IHNlY3Rpb24uIFNlY3Rpb24gYXNzb2NpYXRlZCBzeW1ib2xzIGFy
ZSBpZ25vcmVkIGhlcmUgYXMgdGhlcmUgaXMKPiBhbHdheXMgc3VjaCBhIHN5bWJvbCBmb3IgZXZl
cnkgc2VjdGlvbi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQYXdlbCBXaWVjem9ya2lld2ljeiA8d2lw
YXdlbEBhbWF6b24uZGU+Cj4gUmV2aWV3ZWQtYnk6IEFuZHJhLUlyaW5hIFBhcmFzY2hpdiA8YW5k
cmFwcnNAYW1hem9uLmNvbT4KPiBSZXZpZXdlZC1ieTogQmpvZXJuIERvZWJlbCA8ZG9lYmVsQGFt
YXpvbi5kZT4KPiBSZXZpZXdlZC1ieTogTm9yYmVydCBNYW50aGV5IDxubWFudGhleUBhbWF6b24u
ZGU+Cj4gLS0tCj4gICBjb21tb24uYyB8IDIyICsrKysrKysrKysrKysrKysrKysrKy0KPiAgIGNv
bW1vbi5oIHwgIDEgKwo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2NvbW1vbi5jIGIvY29tbW9uLmMKPiBpbmRleCAx
ZmIwN2NiLi5jOTY4Mjk5IDEwMDY0NAo+IC0tLSBhL2NvbW1vbi5jCj4gKysrIGIvY29tbW9uLmMK
PiBAQCAtMTUsNyArMTUsNyBAQAo+ICAgCj4gICBpbnQgaXNfcmVsYV9zZWN0aW9uKHN0cnVjdCBz
ZWN0aW9uICpzZWMpCj4gICB7Cj4gLQlyZXR1cm4gKHNlYy0+c2guc2hfdHlwZSA9PSBTSFRfUkVM
QSk7Cj4gKwlyZXR1cm4gc2VjICYmIChzZWMtPnNoLnNoX3R5cGUgPT0gU0hUX1JFTEEpOwo+ICAg
fQo+ICAgCj4gICBpbnQgaXNfbG9jYWxfc3ltKHN0cnVjdCBzeW1ib2wgKnN5bSkKPiBAQCAtMjcw
LDYgKzI3MCwyNiBAQCBpbnQgaXNfc3RhbmRhcmRfc2VjdGlvbihzdHJ1Y3Qgc2VjdGlvbiAqc2Vj
KQo+ICAgCX0KPiAgIH0KPiAgIAo+ICtpbnQgaXNfcmVmZXJlbmNlZF9zZWN0aW9uKGNvbnN0IHN0
cnVjdCBzZWN0aW9uICpzZWMsIGNvbnN0IHN0cnVjdCBrcGF0Y2hfZWxmICprZWxmKQoKTGV0J3Mg
a2VlcCB0byA4MCBjaGFycyB3aGVyZSBwcmFjdGljYWwgKGFuZCB0aHJvdWdob3V0IHRoZSByZXN0
IG9mIHRoZSAKcGF0Y2hlcykuCgo+ICt7Cj4gKwlzdHJ1Y3Qgc3ltYm9sICpzeW07Cj4gKwo+ICsJ
aWYgKGlzX3JlbGFfc2VjdGlvbihzZWMtPnJlbGEpICYmIHNlYy0+cmVsYS0+aW5jbHVkZSkKPiAr
CQlyZXR1cm4gdHJ1ZTsKPiArCj4gKwlsaXN0X2Zvcl9lYWNoX2VudHJ5KHN5bSwgJmtlbGYtPnN5
bWJvbHMsIGxpc3QpIHsKPiArCQlpZiAoIXN5bS0+aW5jbHVkZSB8fCAhc3ltLT5zZWMpCj4gKwkJ
CWNvbnRpbnVlOwo+ICsJCS8qIElnbm9yZSBzZWN0aW9uIGFzc29jaWF0ZWQgc2VjdGlvbnMgKi8K
PiArCQlpZiAoc3ltLT50eXBlID09IFNUVF9TRUNUSU9OKQo+ICsJCQljb250aW51ZTsKPiArCQlp
ZiAoc3ltLT5zZWMtPmluZGV4ID09IHNlYy0+aW5kZXgpCj4gKwkJCXJldHVybiB0cnVlOwoKWW91
IGNhbiBzaW1wbGlmeSB0aGlzIGNoZWNrIHRvIGBzeW0tPnNlYyA9PSBzZWNgIGxpa2UgdGhlIHJl
c3Qgb2YgdGhlIApjb2RlIGRvZXMuCgotLSAKUm9zcyBMYWdlcndhbGwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E31655D35
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2019 03:05:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfwL6-0002yp-B4; Wed, 26 Jun 2019 01:03:08 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JP5O=UZ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hfwL4-0002yX-Tb
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2019 01:03:06 +0000
X-Inumbo-ID: 269b2866-97ae-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 269b2866-97ae-11e9-8980-bc764e045a96;
 Wed, 26 Jun 2019 01:03:04 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 13A292085A;
 Wed, 26 Jun 2019 01:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561510983;
 bh=MyO9DKioeEeZzDX5mJuvkhpmZuo3QxtRPSD2ki6W9W4=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=Fc3V8b7Scak5aOO40Duwvkw/yNwVjh/wBhUSe+Miv79q3xs6Y6F5X6sIxPS1cMLi2
 MCEUw0OdCHOp6s7HOsROOIS0yUCXP4tHxwU+OZO8zVxcnWgsZYFkhIkUbkLC66w9H4
 h6tmgSgSfHXKiw8DzdD+QpsZ27D8kkdMcdPXIGog=
Date: Tue, 25 Jun 2019 18:03:01 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190610193215.23704-11-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1906251802510.5851@sstabellini-ThinkPad-T480s>
References: <20190610193215.23704-1-julien.grall@arm.com>
 <20190610193215.23704-11-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 10/17] xen/arm64: head: Improve coding style
 and document create_pages_tables()
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
Cc: xen-devel@lists.xenproject.org, Oleksandr_Tyshchenko@epam.com,
 Stefano Stabellini <sstabellini@kernel.org>, andrii_anisov@epam.com,
 andre.przywara@arm.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAxMCBKdW4gMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEFkanVzdCB0aGUgY29k
aW5nIHN0eWxlIHVzZWQgaW4gdGhlIGNvbW1lbnRzIHdpdGhpbiBjcmVhdGVfcGFnZXNfdGFibGVz
KCkKPiAKPiBMYXN0bHksIGRvY3VtZW50IHRoZSBiZWhhdmlvciBhbmQgdGhlIG1haW4gcmVnaXN0
ZXJzIHVzYWdlIHdpdGhpbiB0aGUKPiBmdW5jdGlvbi4gTm90ZSB0aGF0IHgyNSBpcyBub3cgb25s
eSB1c2VkIHdpdGhpbiB0aGUgZnVuY3Rpb24sIHNvIGl0IGRvZXMKPiBub3QgbmVlZCB0byBiZSBw
YXJ0IG9mIHRoZSBjb21tb24gcmVnaXN0ZXIuCj4gCj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdy
YWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPiAtLS0KPiAgeGVuL2FyY2gvYXJtL2FybTY0L2hl
YWQuUyB8IDM0ICsrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNo
YW5nZWQsIDIzIGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQg
YS94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TIGIveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUwo+
IGluZGV4IGVlMDAyNDE3M2UuLjdiOTJjMWM4ZWIgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gvYXJt
L2FybTY0L2hlYWQuUwo+ICsrKyBiL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMKPiBAQCAtNzAs
NyArNzAsNyBAQAo+ICAgKiAgeDIyIC0gaXNfc2Vjb25kYXJ5X2NwdQo+ICAgKiAgeDIzIC0gVUFS
VCBhZGRyZXNzCj4gICAqICB4MjQgLQo+IC0gKiAgeDI1IC0gaWRlbnRpdHkgbWFwIGluIHBsYWNl
Cj4gKyAqICB4MjUgLQo+ICAgKiAgeDI2IC0gc2tpcF96ZXJvX2JzcyAoYm9vdCBjcHUgb25seSkK
PiAgICogIHgyNyAtCj4gICAqICB4MjggLQo+IEBAIC00NDMsMTYgKzQ0MywyNyBAQCBjcHVfaW5p
dDoKPiAgICAgICAgICByZXQKPiAgRU5EUFJPQyhjcHVfaW5pdCkKPiAgCj4gKy8qCj4gKyAqIFJl
YnVpbGQgdGhlIGJvb3QgcGFnZXRhYmxlJ3MgZmlyc3QtbGV2ZWwgZW50cmllcy4gVGhlIHN0cnVj
dHVyZQo+ICsgKiBpcyBkZXNjcmliZWQgaW4gbW0uYy4KPiArICoKPiArICogQWZ0ZXIgdGhlIENQ
VSBlbmFibGVzIHBhZ2luZyBpdCB3aWxsIGFkZCB0aGUgZml4bWFwIG1hcHBpbmcKPiArICogdG8g
dGhlc2UgcGFnZSB0YWJsZXMsIGhvd2V2ZXIgdGhpcyBtYXkgY2xhc2ggd2l0aCB0aGUgMToxCj4g
KyAqIG1hcHBpbmcuIFNvIGVhY2ggQ1BVIG11c3QgcmVidWlsZCB0aGUgcGFnZSB0YWJsZXMgaGVy
ZSB3aXRoCj4gKyAqIHRoZSAxOjEgaW4gcGxhY2UuCj4gKyAqCj4gKyAqIElucHV0czoKPiArICog
ICB4MTk6IHBhZGRyKHN0YXJ0KQo+ICsgKiAgIHgyMDogcGh5cyBvZmZzZXQKCklzIHgyMCBhY3R1
YWxseSB1c2VkPwoKVGhlIHJlc3QgbG9va3MgZmluZS4KCgo+ICsgKiBDbG9iYmVycyB4MCAtIHg0
LCB4MjUKPiArICoKPiArICogUmVnaXN0ZXIgdXNhZ2Ugd2l0aGluIHRoaXMgZnVuY3Rpb246Cj4g
KyAqICAgeDI1OiBJZGVudGl0eSBtYXAgaW4gcGxhY2UKPiArICovCj4gIGNyZWF0ZV9wYWdlX3Rh
YmxlczoKPiAtICAgICAgICAvKiBSZWJ1aWxkIHRoZSBib290IHBhZ2V0YWJsZSdzIGZpcnN0LWxl
dmVsIGVudHJpZXMuIFRoZSBzdHJ1Y3R1cmUKPiAtICAgICAgICAgKiBpcyBkZXNjcmliZWQgaW4g
bW0uYy4KPiAtICAgICAgICAgKgo+IC0gICAgICAgICAqIEFmdGVyIHRoZSBDUFUgZW5hYmxlcyBw
YWdpbmcgaXQgd2lsbCBhZGQgdGhlIGZpeG1hcCBtYXBwaW5nCj4gLSAgICAgICAgICogdG8gdGhl
c2UgcGFnZSB0YWJsZXMsIGhvd2V2ZXIgdGhpcyBtYXkgY2xhc2ggd2l0aCB0aGUgMToxCj4gLSAg
ICAgICAgICogbWFwcGluZy4gU28gZWFjaCBDUFUgbXVzdCByZWJ1aWxkIHRoZSBwYWdlIHRhYmxl
cyBoZXJlIHdpdGgKPiAtICAgICAgICAgKiB0aGUgMToxIGluIHBsYWNlLiAqLwo+IC0KPiAtICAg
ICAgICAvKiBJZiBYZW4gaXMgbG9hZGVkIGF0IGV4YWN0bHkgWEVOX1ZJUlRfU1RBUlQgdGhlbiB3
ZSBkb24ndAo+ICsgICAgICAgIC8qCj4gKyAgICAgICAgICogSWYgWGVuIGlzIGxvYWRlZCBhdCBl
eGFjdGx5IFhFTl9WSVJUX1NUQVJUIHRoZW4gd2UgZG9uJ3QKPiAgICAgICAgICAgKiBuZWVkIGFu
IGFkZGl0aW9uYWwgMToxIG1hcHBpbmcsIHRoZSB2aXJ0dWFsIG1hcHBpbmcgd2lsbAo+ICAgICAg
ICAgICAqIHN1ZmZpY2UuCj4gICAgICAgICAgICovCj4gQEAgLTQ3Niw3ICs0ODcsOCBAQCBjcmVh
dGVfcGFnZV90YWJsZXM6Cj4gICAgICAgICAgY2J6ICAgeDEsIDFmICAgICAgICAgICAgICAgICAv
KiBJdCdzIGluIHNsb3QgMCwgbWFwIGluIGJvb3RfZmlyc3QKPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAqIG9yIGJvb3Rfc2Vjb25kIGxhdGVyIG9uICovCj4gIAo+IC0g
ICAgICAgIC8qIExldmVsIHplcm8gZG9lcyBub3Qgc3VwcG9ydCBzdXBlcnBhZ2UgbWFwcGluZ3Ms
IHNvIHdlIGhhdmUKPiArICAgICAgICAvKgo+ICsgICAgICAgICAqIExldmVsIHplcm8gZG9lcyBu
b3Qgc3VwcG9ydCBzdXBlcnBhZ2UgbWFwcGluZ3MsIHNvIHdlIGhhdmUKPiAgICAgICAgICAgKiB0
byB1c2UgYW4gZXh0cmEgZmlyc3QgbGV2ZWwgcGFnZSBpbiB3aGljaCB3ZSBjcmVhdGUgYSAxR0Ig
bWFwcGluZy4KPiAgICAgICAgICAgKi8KPiAgICAgICAgICBsb2FkX3BhZGRyIHgyLCBib290X2Zp
cnN0X2lkCj4gLS0gCj4gMi4xMS4wCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs

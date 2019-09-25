Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5D5BE241
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 18:18:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD9yA-0006UI-Kd; Wed, 25 Sep 2019 16:16:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Cfsh=XU=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iD9y8-0006U8-Vt
 for xen-devel@lists.xen.org; Wed, 25 Sep 2019 16:16:45 +0000
X-Inumbo-ID: dd375782-dfaf-11e9-bf31-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by localhost (Halon) with ESMTPS
 id dd375782-dfaf-11e9-bf31-bc764e2007e4;
 Wed, 25 Sep 2019 16:16:44 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C3C6021D79;
 Wed, 25 Sep 2019 16:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569428203;
 bh=ZxLujxd6n1kUuzG2HZBRP4xePSI3Q3TY2Y47oZQgWG4=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=P/HLtWYgfawX2aw6LysBxt1uNwVrqMMLsv6wvmUDF99JDQFKa70dKDLe3ERstRzQ5
 1laHzLz+taTXtlr1XLjVtZYkrQoyvK+Hbq5RkE4/DyBkqtABHW1+rqvd66JqpdFOsn
 hbaMBkIOOoT8fbWwYh1xSTa4Wl++GH0/tXggrfZo=
Date: Wed, 25 Sep 2019 09:16:42 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <3d883055-b997-92e1-3121-e383959a5e25@arm.com>
Message-ID: <alpine.DEB.2.21.1909250907480.24909@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1908201838370.20094@sstabellini-ThinkPad-T480s>
 <20190821035315.12812-7-sstabellini@kernel.org>
 <8e13c7ad-c3cb-aa46-744b-8dc01fe70718@arm.com>
 <alpine.DEB.2.21.1909241056070.24909@sstabellini-ThinkPad-T480s>
 <3d883055-b997-92e1-3121-e383959a5e25@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v4 7/8] xen/arm: introduce nr_spis
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
Cc: Stefano Stabellini <stefanos@xilinx.com>,
 Stefano Stabellini <sstabellini@kernel.org>, andrii_anisov@epam.com,
 Achin.Gupta@arm.com, xen-devel@lists.xen.org, Volodymyr_Babchuk@epam.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCAyNSBTZXAgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpLAo+IAo+IE9uIDI0
LzA5LzIwMTkgMTg6NTYsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiA+IE9uIFdlZCwgMTEg
U2VwIDIwMTksIEp1bGllbiBHcmFsbCB3cm90ZToKPiA+ID4gSGkgU3RlZmFubywKPiA+ID4gCj4g
PiA+IE9uIDgvMjEvMTkgNDo1MyBBTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+ID4gPiA+
IFdlIGRvbid0IGhhdmUgYSBjbGVhciB3YXkgdG8ga25vdyBob3cgbWFueSB2aXJ0dWFsIFNQSXMg
d2UgbmVlZCBmb3IgdGhlCj4gPiA+ID4gZG9tMC1sZXNzIGRvbWFpbnMuIEludHJvZHVjZSBhIG5l
dyBvcHRpb24gdW5kZXIgeGVuLGRvbWFpbiB0byBzcGVjaWZ5Cj4gPiA+ID4gdGhlIG51bWJlciBv
ZiBTUElzIHRvIGFsbG9jYXRlIGZvciBhIGRvbWFpbi4KPiA+ID4gPiAKPiA+ID4gPiBUaGUgcHJv
cGVydHkgaXMgb3B0aW9uYWwuIFdoZW4gYWJzZW50LCB3ZSdsbCB1c2UgdGhlIHBoeXNpY2FsIG51
bWJlciBvZgo+ID4gPiA+IEdJQyBsaW5lcyBmb3IgZG9tMC1sZXNzIGRvbWFpbnMsIGp1c3QgbGlr
ZSBmb3IgZG9tMC4gR2l2ZW4gdGhhdAo+ID4gPiA+IGRvbTAtbGVzcyBWTXMgYXJlIG1lYW50IGZv
ciBzdGF0aWMgcGFydGl0aW9uaW5nIHNjZW5hcmlvcyB3aGVyZSB0aGUKPiA+ID4gPiBudW1iZXIg
b2YgVk1zIGlzIHZlcnkgbG93LCBpbmNyZWFzZWQgbWVtb3J5IG92ZXJoZWFkIHNob3VsZCBub3Qg
YmUgYQo+ID4gPiA+IHByb2JsZW0sIGFuZCBpdCBpcyBwb3NzaWJsZSB0byBtaW5pbWl6ZSBpdCB1
c2luZyAibnJfc3BpcyIuCj4gPiA+ID4gCj4gPiA+ID4gUmVtb3ZlIHRoZSBvbGQgc2V0dGluZyBv
ZiBucl9zcGlzIGJhc2VkIG9uIHRoZSBwcmVzZW5jZSBvZiB0aGUgdnBsMDExLgo+ID4gPiAKPiA+
ID4gSSBhbSBhZnJhaWQgdGhpcyBzdGlsbCBkb2VzIG5vdCBleHBsYWluIHRoZSBpbXBsaWNhdGlv
bnMgb2YgdGhpcyBwYXRjaCB0bwo+ID4gPiBjdXJyZW50IHNldHVwICh3aXRoIGFuZCB3aXRob3V0
IFZQTDAxMSkuCj4gPiA+IAo+ID4gPiBGb3IgaW5zdGFuY2UsIHdpdGggeW91ciBjaGFuZ2UsIFZQ
TDAxMSBtYXkgbm90IHdvcmsgYW55bW9yZS4gSW1hZ2luZSB3ZQo+ID4gPiBkZWNpZGUKPiA+ID4g
dG8gcHVzaCB0aGUgdnBsMDExIGludGVycnVwdCB0b3dhcmRzIHRoZSBlbmQgb2YgdGhlIEludGVy
cnVwdCBJRCBzcGFjZQo+ID4gPiAoaS5lLgo+ID4gPiAxMDE5KS4KPiA+ID4gCj4gPiA+IEkgZG9u
J3QgdGhpbmsgd2Ugd2FudCB0aGUgdXNlciB0byBoYXZlIHRvIHNlbGVjdCBucl9zcGlzIGJ5IGhp
bXNlbGYgZm9yCj4gPiA+IHRoaXMKPiA+ID4gY2FzZS4KPiA+ID4gCj4gPiA+IFJlZ2FyZGluZyB0
aGUgY2hhbmdlIHdpdGhvdXQgdnBsMDExLCB0aGlzIGlzIG5vdCBleHBsYWluZWQgd2h5IGFsbCB0
aGUKPiA+ID4gZG9tYWlucwo+ID4gPiAoZXZlbiB0aGUgb25lIHdpdGhvdXQgU1BJcyByb3V0ZWQp
IHdpbGwgaGF2ZSBTUElzIGV4cG9zZWQuIEZvciBpbnN0YW5jZSwKPiA+ID4gaWYKPiA+ID4geW91
IHdlcmUgdG8gZXhwb3NlIDI1NiBpbnRlcnJ1cHRzIGZvciA0IGRvbWFpbnMsIHRoaXMgd2lsbCBy
b3VnaGx5IHVzZQo+ID4gPiA4MEtCIG9mCj4gPiA+IG1lbW9yeS4gSSBkb24ndCB0aGluayB0aGlz
IGlzIHdoYXQgeW91IGhhZCBpbiBtaW5kIGFzICJsb3cgZm9vdHByaW50Ii4KPiA+ICAgV2hhdCBk
byB5b3UgdGhpbmsgb2YgdGhlIGZvbGxvd2luZzoKPiA+IAo+ID4gVGhlIGltcGxpY2F0aW9uIG9m
IHRoaXMgY2hhbmdlIGlzIHRoYXQgd2l0aG91dCBucl9zcGlzIGRvbTBsZXNzIGRvbWFpbnMKPiA+
IGdldCB0aGUgc2FtZSBhbW91bnQgb2YgU1BJIGFsbG9jYXRlZCBhcyBkb20wLCByZWdhcmRsZXNz
IG9mIGhvdyBtYW55Cj4gPiBwaHlzaWNhbCBkZXZpY2VzIHRoZXkgaGF2ZSBhc3NpZ25lZCwgYW5k
IHJlZ2FyZGxlc3Mgb2Ygd2hldGhlciB0aGV5IGhhdmUKPiA+IGEgdmlydHVhbCBwbDAxMSAod2hp
Y2ggYWxzbyBuZWVkcyBhbiBlbXVsYXRlZCBTUEkpLgo+ID4gCj4gPiBXaGVuIG5yX3NwaXMgaXMg
cHJlc2VudCwgdGhlIGRvbWFpbiBnZXRzIGV4YWN0bHkgbnJfc3BpcyBhbGxvY2F0ZWQgU1BJcy4K
PiA+IElmIHRoZSBudW1iZXIgaXMgdG9vIGxvdywgaXQgbWlnaHQgbm90IGJlIGVub3VnaCBmb3Ig
dGhlIGRldmljZXMKPiA+IGFzc2lnbmVkIGl0IHRvIGl0LiBJZiB0aGUgbnVtYmVyIGlzIGxlc3Mg
dGhhbiBHVUVTVF9WUEwwMTFfU1BJLCB0aGUKPiA+IHZpcnR1YWwgcGwwMTEgd29uJ3Qgd29yay4K
PiAKPiBUaGlzIGlzIGdvb2QgdG8gYWRkcmVzcyBteSBmaXJzdCByZW1hcmsuIEhvdyBhYm91dCB0
aGUgb3RoZXJzPwogCkZvciB5b3VyIHBvaW50IGFib3V0ICJWUEwwMTEgbWF5IG5vdCB3b3JrIGFu
eW1vcmUiLCBhcmUgeW91IHN1Z2dlc3RpbmcKd2UgcHJpbnQgYSB3YXJuaW5nIG9yIHRoYXQgd2Ug
YWx3YXlzIGFsbG9jYXRlIGF0IGxlYXN0CkdVRVNUX1ZQTDAxMV9TUEkrMSBTUElzIGlmIHZwbDAx
MSBpcyByZXF1ZXN0ZWQ/CgpGb3IgeW91ciBwb2ludCBhYm91dCAiaXQgaXMgbm90IGV4cGxhaW5l
ZCB3aHkgYWxsIHRoZSBkb21haW5zIHdpbGwgaGF2ZQpTUElzIGV4cG9zZWQiIHdvdWxkIHlvdSBs
aWtlIG1lIHRvIGFkZCBhIHNlbnRlbmNlIHRvIHRoZSBjb21taXQgbWVzc2FnZQp0byBtYWtlIGl0
IGNsZWFyZXIgb3IgZG8geW91IGhhdmUgc29tZXRoaW5nIGVsc2UgaW4gbWluZD8KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

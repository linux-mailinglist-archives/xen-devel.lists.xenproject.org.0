Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3963D558
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2019 20:18:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1halIe-0002vS-C1; Tue, 11 Jun 2019 18:15:12 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3Cq/=UK=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1halIc-0002vL-Oi
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2019 18:15:10 +0000
X-Inumbo-ID: d890ac10-8c74-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id d890ac10-8c74-11e9-8980-bc764e045a96;
 Tue, 11 Jun 2019 18:15:09 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5C5B421734;
 Tue, 11 Jun 2019 18:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560276908;
 bh=6tFeebVm0Y9tHLEi977LGWmr9IaJTqqKa3YW7yIhePg=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=w6ST2wOTmWNmLWkaAObhsYabsroN80/tsqG25KRKCt4Fbj7JiNCrB2lcIti9KY0cb
 fWyDI4C0Wop2ZLYnjJnq1jWxhpdaZulAN6hTY3LDeBpW03FeDZfvSiKe6VMB4RtzqF
 VjoB0mk5xAdm4Ajfpcsdl4htniyPmXs+VSWgy6FU=
Date: Tue, 11 Jun 2019 11:15:07 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <091bcd75-6a83-cedd-c0c1-8c5559ccf57c@arm.com>
Message-ID: <alpine.DEB.2.21.1906111114180.13737@sstabellini-ThinkPad-T480s>
References: <20190508161603.21964-1-julien.grall@arm.com>
 <20190508161603.21964-5-julien.grall@arm.com>
 <alpine.DEB.2.21.1905091307080.25766@sstabellini-ThinkPad-T480s>
 <5fe19f3a-e17b-04b5-ff15-5579ebe789eb@arm.com>
 <cc1d2550-794c-842d-26db-178f614f81b3@arm.com>
 <4b1d9bf6-bf3b-a5ec-da06-534618bb34a8@arm.com>
 <alpine.DEB.2.21.1905101050260.25766@sstabellini-ThinkPad-T480s>
 <10c3ba27-c0df-a0d4-4033-530ec99291ac@arm.com>
 <alpine.DEB.2.21.1905201357570.16404@sstabellini-ThinkPad-T480s>
 <471832b3-c328-2275-2abd-845371be819b@arm.com>
 <alpine.DEB.2.21.1906101347270.8691@sstabellini-ThinkPad-T480s>
 <091bcd75-6a83-cedd-c0c1-8c5559ccf57c@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 4/7] xen/arm: page: Clarify the Xen TLBs
 helpers name
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <Andrii_Anisov@epam.com>,
 "Oleksandr_Tyshchenko@epam.com" <Oleksandr_Tyshchenko@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAxMCBKdW4gMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpIFN0ZWZhbm8sCj4g
Cj4gT24gNi8xMC8xOSA5OjUxIFBNLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gPiBPbiBN
b24sIDIwIE1heSAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gPiA+IE9uIDIwLzA1LzIwMTkg
MjI6MDEsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiA+ID4gPiBPbiBGcmksIDEwIE1heSAy
MDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gPiA+ID4gPiBGZWVsIGZyZWUgdG8gc3VnZ2VzdCBh
biBpbi1jb2RlIGNvbW1lbnQgc28gd2UgY2FuIGRpc2N1c3Mgb24gdGhlCj4gPiA+ID4gPiB3b3J0
aGluZXNzLgo+ID4gPiA+IAo+ID4gPiA+IEkgc3VnZ2VzdCBzb21ldGhpbmcgbGlrZSB0aGUgZm9s
bG93aW5nOgo+ID4gPiA+IAo+ID4gPiA+ICAgIC8qCj4gPiA+ID4gICAgICogRmx1c2ggYWxsIGh5
cGVydmlzb3IgbWFwcGluZ3MgZnJvbSB0aGUgVExCIG9mIHRoZSBsb2NhbCBwcm9jZXNzb3IuCj4g
PiA+ID4gTm90ZQo+ID4gPiA+ICAgICAqIHRoYXQgaW5zdHJ1Y3Rpb24gY2FjaGUgbWFpbnRlbmFu
Y2UgbWlnaHQgYWxzbyBiZSByZXF1aXJlZCB3aGVuCj4gPiA+ID4gc2VsZgo+ID4gPiA+ICAgICAq
IG1vZGlmeWluZyBYZW4gY29kZSwgc2VlIEQ1LTI1MjIgaW4gQVJNIERESSAwNDg3RC5hIGFuZCBC
My4xMS4yIGluCj4gPiA+ID4gQVJNCj4gPiA+ID4gICAgICogRERJIDA0MDZDLmMuCj4gPiA+ID4g
ICAgICovCj4gPiA+IAo+ID4gPiBUaGlzIGxvb2tzIHF1aXRlIG91dC1vZi1jb250ZXh0LCB3aGF0
IGlzIHRoZSByZWxhdGlvbiBiZXR3ZWVuCj4gPiA+IHNlbGYtbW9kaWZ5aW5nIGNvZGUgYW5kIFRM
QiBmbHVzaD8KPiA+IAo+ID4gIkZsdXNoIGFsbCBoeXBlcnZpc29yIG1hcHBpbmdzIGZyb20gdGhl
IFRMQiBvZiB0aGUgbG9jYWwgcHJvY2Vzc29yIiBpcwo+ID4gdGhlIGRlc2NyaXB0aW9uIG9mIHRo
ZSBmdW5jdGlvbiBiZWxvdyAoaXQgY2Fubm90IGJlIHNlZW4gaGVyZSBidXQgaXQncwo+ID4gdGhl
IGZ1bmN0aW9uIG9uIHRvcCBvZiB3aGljaCB0aGlzIGNvbW1lbnQgaXMgc3VwcG9zZWQgdG8gYmUg
b24sCj4gPiBmbHVzaF94ZW5fZGF0YV90bGJfbG9jYWwpLiBUaGUgcmVzdCBvZiB0aGUgY29tbWVu
dCBpcyBpbmZvcm1hdGl2ZQo+ID4gcmVnYXJkaW5nIGRpZmZpY3VsdCBjYXNlcyBzdWNoIGFzIHNl
bGYtbW9kaWZ5aW5nIGNvZGUsIHdoaWNoIHdhcyBwcmVzZW50Cj4gPiBpbiB0aGUgcHJldmlvdXMg
dmVyc2lvbiBvZiB0aGUgY29kZSBhbmQgSSB3b3VsZCBsaWtlIHRvIHJldGFpbi4gVGhlCj4gPiBy
ZWxhdGlvbiBpcyB0aGF0IHRoZXJlIGlzIGEgZ29vZCBjaGFuY2UgeW91IG5lZWQgdG8gZG8gYm90
aC4KPiBTb3JyeSBidXQgdGhpcyBkb2Vzbid0IG1ha2Ugc2Vuc2UgdG8gbWUuIFlvdSBhcmUgdW5s
aWtlbHkgZ29pbmcgdG8gbW9kaWZ5Cj4gbWFwcGluZyB3aGVuIHVzaW5nIHNlbGYtbW9kaWZ5aW5n
LiBBbmQgaWYgeW91IHdlcmUsIHRoZW4gYmVjYXVzZSBpbnN0cnVjdGlvbnMKPiBjYWNoZXMgYXJl
IGltcGxlbWVudGluZyB0aGUgSVZJUFQgZXh0ZW5zaW9uIChhc3N1bWluZyB3ZSBmb3JiaWQgSVZJ
VlQgY2FjaGUgYXMKPiBzdWdnZXN0ZWQgYnkgcGF0Y2ggIzEgZm9yIEFybTMyKSB0aGVyZSBhcmUg
bm8gbmVlZCB0byBtb2RpZnlpbmcgdGhlIGNhY2hlCj4gYmVjYXVzZSB0aGUgcGh5c2ljYWwgYWRk
cmVzcyB3b3VsZCBiZSBkaWZmZXJlbnQuCj4gCj4gQWxsIHRoZSBzZWxmLW1vZGlmeWluZyBjb2Rl
IGluIFhlbiAoaS5lIGFsdGVybmF0aXZlLCBsaXZlcGF0Y2gpIGRvbid0IHJlcXVpcmVzCj4gYSBU
TEIgbWFpbnRlbmFuY2UuIEkgYWxzbyBjYW4ndCBzZWUgd2hlbiB0aGUgdHdvIHdvdWxkIGJlIG5l
Y2Vzc2FyeSBhdCB0aGUKPiBzYW1lLgo+IAo+IENhbiB5b3UgcGxlYXNlIGdpdmUgYSBjb25jcmV0
ZSBleGFtcGxlIHdoZXJlIGl0IHdvdWxkIGJlIG5lY2Vzc2FyeT8KCkdpdmVuIHRoZSBzY2FyY2l0
eSBvZiBJVklWVCBwbGF0Zm9ybXMgb3V0IHRoZXJlLCB0aGUgdW5saWtlbHkgdXNlZnVsbmVzcwpp
biB0aGUgSVZJUFQgY2FzZSwgYW5kIHRoYXQgdGhpcyBpcyBqdXN0IGEgY29tbWVudCwgSSBkb24n
dCB0aGluayB0aGlzCmlzc3VlIGlzIHdvcnRoIHNwZW5kaW5nIG1vcmUgdGltZSBvbi4KCkZvciB2
MyBvZiB0aGUgcGF0Y2g6CgpBY2tlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGlu
aUBrZXJuZWwub3JnPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==

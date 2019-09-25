Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A674FBE360
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 19:30:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDB39-0005YE-Hh; Wed, 25 Sep 2019 17:25:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Cfsh=XU=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iDB38-0005Y9-CE
 for xen-devel@lists.xen.org; Wed, 25 Sep 2019 17:25:58 +0000
X-Inumbo-ID: 89093806-dfb9-11e9-97fb-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by localhost (Halon) with ESMTPS
 id 89093806-dfb9-11e9-97fb-bc764e2007e4;
 Wed, 25 Sep 2019 17:25:57 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 72EEC20665;
 Wed, 25 Sep 2019 17:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569432357;
 bh=2g47TfIHzTdVnkytSgdQfykNMPR9MeI1wdd8TDi5d5c=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=YfTtHvVKjWc0fPROxypQqtNFPRmvX/MncfhYCOZg4Z+U4nwtZG/jDpuTIIDgvqfWa
 5jbIfvc6A9HwiXG+AfT06pvbXNXhf2XCsG37VkERNdXToGc/xJrkzcKzA7NoH8ckRX
 BZsEpsnkNHOHaU0Tz84sE78rsOqVgjm9ULyUFaOc=
Date: Wed, 25 Sep 2019 10:25:45 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <83b76ef2-98b6-8169-ea8f-dbfc79f40b25@arm.com>
Message-ID: <alpine.DEB.2.21.1909251024570.24909@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1908201838370.20094@sstabellini-ThinkPad-T480s>
 <20190821035315.12812-7-sstabellini@kernel.org>
 <8e13c7ad-c3cb-aa46-744b-8dc01fe70718@arm.com>
 <alpine.DEB.2.21.1909241056070.24909@sstabellini-ThinkPad-T480s>
 <3d883055-b997-92e1-3121-e383959a5e25@arm.com>
 <alpine.DEB.2.21.1909250907480.24909@sstabellini-ThinkPad-T480s>
 <83b76ef2-98b6-8169-ea8f-dbfc79f40b25@arm.com>
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

T24gV2VkLCAyNSBTZXAgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpLAo+IAo+IE9uIDI1
LzA5LzIwMTkgMTc6MTYsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiA+IE9uIFdlZCwgMjUg
U2VwIDIwMTksIEp1bGllbiBHcmFsbCB3cm90ZToKPiA+ID4gSGksCj4gPiA+IAo+ID4gPiBPbiAy
NC8wOS8yMDE5IDE4OjU2LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gPiA+ID4gT24gV2Vk
LCAxMSBTZXAgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+ID4gPiA+ID4gSGkgU3RlZmFubywK
PiA+ID4gPiA+IAo+ID4gPiA+ID4gT24gOC8yMS8xOSA0OjUzIEFNLCBTdGVmYW5vIFN0YWJlbGxp
bmkgd3JvdGU6Cj4gPiA+ID4gPiA+IFdlIGRvbid0IGhhdmUgYSBjbGVhciB3YXkgdG8ga25vdyBo
b3cgbWFueSB2aXJ0dWFsIFNQSXMgd2UgbmVlZCBmb3IKPiA+ID4gPiA+ID4gdGhlCj4gPiA+ID4g
PiA+IGRvbTAtbGVzcyBkb21haW5zLiBJbnRyb2R1Y2UgYSBuZXcgb3B0aW9uIHVuZGVyIHhlbixk
b21haW4gdG8KPiA+ID4gPiA+ID4gc3BlY2lmeQo+ID4gPiA+ID4gPiB0aGUgbnVtYmVyIG9mIFNQ
SXMgdG8gYWxsb2NhdGUgZm9yIGEgZG9tYWluLgo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gVGhl
IHByb3BlcnR5IGlzIG9wdGlvbmFsLiBXaGVuIGFic2VudCwgd2UnbGwgdXNlIHRoZSBwaHlzaWNh
bCBudW1iZXIKPiA+ID4gPiA+ID4gb2YKPiA+ID4gPiA+ID4gR0lDIGxpbmVzIGZvciBkb20wLWxl
c3MgZG9tYWlucywganVzdCBsaWtlIGZvciBkb20wLiBHaXZlbiB0aGF0Cj4gPiA+ID4gPiA+IGRv
bTAtbGVzcyBWTXMgYXJlIG1lYW50IGZvciBzdGF0aWMgcGFydGl0aW9uaW5nIHNjZW5hcmlvcyB3
aGVyZSB0aGUKPiA+ID4gPiA+ID4gbnVtYmVyIG9mIFZNcyBpcyB2ZXJ5IGxvdywgaW5jcmVhc2Vk
IG1lbW9yeSBvdmVyaGVhZCBzaG91bGQgbm90IGJlIGEKPiA+ID4gPiA+ID4gcHJvYmxlbSwgYW5k
IGl0IGlzIHBvc3NpYmxlIHRvIG1pbmltaXplIGl0IHVzaW5nICJucl9zcGlzIi4KPiA+ID4gPiA+
ID4gCj4gPiA+ID4gPiA+IFJlbW92ZSB0aGUgb2xkIHNldHRpbmcgb2YgbnJfc3BpcyBiYXNlZCBv
biB0aGUgcHJlc2VuY2Ugb2YgdGhlCj4gPiA+ID4gPiA+IHZwbDAxMS4KPiA+ID4gPiA+IAo+ID4g
PiA+ID4gSSBhbSBhZnJhaWQgdGhpcyBzdGlsbCBkb2VzIG5vdCBleHBsYWluIHRoZSBpbXBsaWNh
dGlvbnMgb2YgdGhpcyBwYXRjaAo+ID4gPiA+ID4gdG8KPiA+ID4gPiA+IGN1cnJlbnQgc2V0dXAg
KHdpdGggYW5kIHdpdGhvdXQgVlBMMDExKS4KPiA+ID4gPiA+IAo+ID4gPiA+ID4gRm9yIGluc3Rh
bmNlLCB3aXRoIHlvdXIgY2hhbmdlLCBWUEwwMTEgbWF5IG5vdCB3b3JrIGFueW1vcmUuIEltYWdp
bmUKPiA+ID4gPiA+IHdlCj4gPiA+ID4gPiBkZWNpZGUKPiA+ID4gPiA+IHRvIHB1c2ggdGhlIHZw
bDAxMSBpbnRlcnJ1cHQgdG93YXJkcyB0aGUgZW5kIG9mIHRoZSBJbnRlcnJ1cHQgSUQgc3BhY2UK
PiA+ID4gPiA+IChpLmUuCj4gPiA+ID4gPiAxMDE5KS4KPiA+ID4gPiA+IAo+ID4gPiA+ID4gSSBk
b24ndCB0aGluayB3ZSB3YW50IHRoZSB1c2VyIHRvIGhhdmUgdG8gc2VsZWN0IG5yX3NwaXMgYnkg
aGltc2VsZgo+ID4gPiA+ID4gZm9yCj4gPiA+ID4gPiB0aGlzCj4gPiA+ID4gPiBjYXNlLgo+ID4g
PiA+ID4gCj4gPiA+ID4gPiBSZWdhcmRpbmcgdGhlIGNoYW5nZSB3aXRob3V0IHZwbDAxMSwgdGhp
cyBpcyBub3QgZXhwbGFpbmVkIHdoeSBhbGwgdGhlCj4gPiA+ID4gPiBkb21haW5zCj4gPiA+ID4g
PiAoZXZlbiB0aGUgb25lIHdpdGhvdXQgU1BJcyByb3V0ZWQpIHdpbGwgaGF2ZSBTUElzIGV4cG9z
ZWQuIEZvcgo+ID4gPiA+ID4gaW5zdGFuY2UsCj4gPiA+ID4gPiBpZgo+ID4gPiA+ID4geW91IHdl
cmUgdG8gZXhwb3NlIDI1NiBpbnRlcnJ1cHRzIGZvciA0IGRvbWFpbnMsIHRoaXMgd2lsbCByb3Vn
aGx5IHVzZQo+ID4gPiA+ID4gODBLQiBvZgo+ID4gPiA+ID4gbWVtb3J5LiBJIGRvbid0IHRoaW5r
IHRoaXMgaXMgd2hhdCB5b3UgaGFkIGluIG1pbmQgYXMgImxvdyBmb290cHJpbnQiLgo+ID4gPiA+
ICAgIFdoYXQgZG8geW91IHRoaW5rIG9mIHRoZSBmb2xsb3dpbmc6Cj4gPiA+ID4gCj4gPiA+ID4g
VGhlIGltcGxpY2F0aW9uIG9mIHRoaXMgY2hhbmdlIGlzIHRoYXQgd2l0aG91dCBucl9zcGlzIGRv
bTBsZXNzIGRvbWFpbnMKPiA+ID4gPiBnZXQgdGhlIHNhbWUgYW1vdW50IG9mIFNQSSBhbGxvY2F0
ZWQgYXMgZG9tMCwgcmVnYXJkbGVzcyBvZiBob3cgbWFueQo+ID4gPiA+IHBoeXNpY2FsIGRldmlj
ZXMgdGhleSBoYXZlIGFzc2lnbmVkLCBhbmQgcmVnYXJkbGVzcyBvZiB3aGV0aGVyIHRoZXkgaGF2
ZQo+ID4gPiA+IGEgdmlydHVhbCBwbDAxMSAod2hpY2ggYWxzbyBuZWVkcyBhbiBlbXVsYXRlZCBT
UEkpLgo+ID4gPiA+IAo+ID4gPiA+IFdoZW4gbnJfc3BpcyBpcyBwcmVzZW50LCB0aGUgZG9tYWlu
IGdldHMgZXhhY3RseSBucl9zcGlzIGFsbG9jYXRlZCBTUElzLgo+ID4gPiA+IElmIHRoZSBudW1i
ZXIgaXMgdG9vIGxvdywgaXQgbWlnaHQgbm90IGJlIGVub3VnaCBmb3IgdGhlIGRldmljZXMKPiA+
ID4gPiBhc3NpZ25lZCBpdCB0byBpdC4gSWYgdGhlIG51bWJlciBpcyBsZXNzIHRoYW4gR1VFU1Rf
VlBMMDExX1NQSSwgdGhlCj4gPiA+ID4gdmlydHVhbCBwbDAxMSB3b24ndCB3b3JrLgo+ID4gPiAK
PiA+ID4gVGhpcyBpcyBnb29kIHRvIGFkZHJlc3MgbXkgZmlyc3QgcmVtYXJrLiBIb3cgYWJvdXQg
dGhlIG90aGVycz8KPiA+ICAgRm9yIHlvdXIgcG9pbnQgYWJvdXQgIlZQTDAxMSBtYXkgbm90IHdv
cmsgYW55bW9yZSIsIGFyZSB5b3Ugc3VnZ2VzdGluZwo+ID4gd2UgcHJpbnQgYSB3YXJuaW5nIG9y
IHRoYXQgd2UgYWx3YXlzIGFsbG9jYXRlIGF0IGxlYXN0Cj4gPiBHVUVTVF9WUEwwMTFfU1BJKzEg
U1BJcyBpZiB2cGwwMTEgaXMgcmVxdWVzdGVkPwo+IAo+IE15IHByZWZlcmVuY2UgaXMgdG8gZG8g
dGhlIGxhdGVyIGFzIHRoaXMgbWF0Y2ggdGhlIGJlaGF2aW9yIHdoZW4gZ3Vlc3QgYXJlCj4gY3Jl
YXRlZCBieSBsaWJ4bC4gVGhpcyBpcyBhbHNvIHRoZSBjdXJyZW50IGJlaGF2aW9yLgoKT0ssIGlm
IG5yX3NwaXMgaXMgbm90IHByZXNlbnQsIEknbGwgbWFrZSBzdXJlIHRoYXQgdGhlIGFsbG9jYXRl
ZCBTUElzCmFyZSBlbm91Z2ggdG8gYWNjb3VudCBmb3IgR1VFU1RfVlBMMDExX1NQSS4KCgo+IEJ1
dCBpZiB5b3Ugd2FudCB0byBjaGFuZ2UgdGhpcyBiZWhhdmlvciwgdGhlbiB5b3UgbmVlZCB0byBk
b2N1bWVudCBpdCBhcyB0aGlzCj4gaXMgYSBicmVha2FnZSBiZXR3ZWVuIHRoZSBwcmV2aW91cyBp
bnRlcmZhY2UuCj4gCj4gPiAKPiA+IEZvciB5b3VyIHBvaW50IGFib3V0ICJpdCBpcyBub3QgZXhw
bGFpbmVkIHdoeSBhbGwgdGhlIGRvbWFpbnMgd2lsbCBoYXZlCj4gPiBTUElzIGV4cG9zZWQiIHdv
dWxkIHlvdSBsaWtlIG1lIHRvIGFkZCBhIHNlbnRlbmNlIHRvIHRoZSBjb21taXQgbWVzc2FnZQo+
ID4gdG8gbWFrZSBpdCBjbGVhcmVyIG9yIGRvIHlvdSBoYXZlIHNvbWV0aGluZyBlbHNlIGluIG1p
bmQ/Cj4gCj4gQSBzZW50ZW5jZSBpbiB0aGUgY29tbWl0IG1lc3NhZ2UgaXMgYmUgZ29vZCBlbm91
Z2guCgpPSwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

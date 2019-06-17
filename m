Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C064548A1C
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2019 19:31:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hcvQk-0002Hl-5d; Mon, 17 Jun 2019 17:28:30 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7cdP=UQ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hcvQi-0002Hg-Tq
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2019 17:28:28 +0000
X-Inumbo-ID: 5102dcae-9125-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5102dcae-9125-11e9-8980-bc764e045a96;
 Mon, 17 Jun 2019 17:28:27 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7F0CC208C0;
 Mon, 17 Jun 2019 17:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560792506;
 bh=E/3YfejkkyquDvzMnyZx/HTSDNpitE4xMPc3dxypSmU=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=osnirf8d+MRcxXbvEQyPLBi60pBtFEIViyXZ2S5Zr27t+guscknHnOrRfzQQk+5GN
 mcYnVF+/w7pO0uZFaELJ7LdFzLW7USbg+x3+UXYG2lSjQRibKX6DlbmWFLyir6/Nap
 fRD/OY4YMA5LiJhMnvBbKcYLcwdGMn9ANcYcCcZ4=
Date: Mon, 17 Jun 2019 10:28:25 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <3274e117-4e51-5360-8f94-ece7a6981998@arm.com>
Message-ID: <alpine.DEB.2.21.1906171026050.2072@sstabellini-ThinkPad-T480s>
References: <20190611184541.7281-1-volodymyr_babchuk@epam.com>
 <20190611184541.7281-3-volodymyr_babchuk@epam.com>
 <686a7564-5c8b-937f-1e14-671e7b08a18b@arm.com>
 <1a81a53d-91e3-37e0-79df-8f59a0dc6a2a@arm.com>
 <alpine.DEB.2.21.1906170926150.2072@sstabellini-ThinkPad-T480s>
 <3274e117-4e51-5360-8f94-ece7a6981998@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v6 02/10] xen/arm: optee: add OP-TEE header
 files
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
Cc: "tee-dev@lists.linaro.org" <tee-dev@lists.linaro.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "lars.kurth@citrix.com" <lars.kurth@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAxNyBKdW4gMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IE9uIDE3LzA2LzIwMTkg
MTc6MjgsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiA+IExvb2tpbmcgYXQgaHR0cHM6Ly93
d3cuZ251Lm9yZy9saWNlbnNlcy9saWNlbnNlLWxpc3QuZW4uaHRtbCBhbmQgYWxzbwo+ID4gbG9v
a2luZyBhdCB0aGUgdXNhZ2UgaW4gdGhlIExpbnV4IGtlcm5lbCwgSSBhbSBwcmV0dHkgc3VyZSBp
dCBpcwo+ID4gY29tcGF0aWJsZS4gSG93ZXZlciwgZ2l2ZW4gdGhhdCB0aGUgWGVuIGh5cGVydmlz
b3IgYXMgYSB3aG9sZSBpcyBHUEx2MiwKPiA+IEkgdGhpbmsgaXQgd291bGQgYmUgbW9yZSBwcmVj
aXNlIHRvIHNheToKPiA+IAo+ID4gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9u
bHkgT1IgQlNELTItQ2xhdXNlKQo+IAo+IFdlbGwsIHRoaXMgaXMgaW1wb3J0ZWQgZnJvbSBPUC1U
RUUuIFNvIEkgZG9uJ3QgdGhpbmsgd2UgaGF2ZSB0aGUgZnJlZWRvbSB0bwo+IGNoYW5nZSB0aGlz
IGNvcHlyaWdodCBoZWFkZXIgaGVyZS4uLgoKSW50ZXJlc3RpbmcgcG9pbnQ6IEkgd291bGQgaGF2
ZSB0aG91Z2h0IHRoYXQgZ2l2ZW4gdGhhdCB0aGlzIGlzIGEgR1BMdjIKcHJvamVjdCwgaWYgd2Ug
d2VudCB3aXRoIFNQRFgsIGFsbCBmaWxlcyB3b3VsZCBuZWVkIHRvIGhhdmUgYQpHUEwtMi4wLW9u
bHkgdGFnIG9uIHRoZW0sIHBsdXMsIG9wdGlvbmFsbHksIGFuIE9SIFhYWCBjbGF1c2UuCgpTb21l
dGhpbmcgZm9yIExhcnMgdG8gaW52ZXN0aWdhdGUuCgoKPiBXaGF0IEkgd2FzIGFza2luZyBpcyB3
aGV0aGVyIHRoaXMgaXMgT0sgdG8gaW1wb3J0IEJTRC0yLUNsYXVzZSBjb2RlIGluIFhlbi4KPiBZ
b3Ugc2VlbSB0byBhZ3JlZSB0aGF0IGl0IHNob3VsZCBiZSBwb3NzaWJsZS4KClllcC4gVGhlIHBy
b2JsZW1hdGljIEJTRCBsaWNlbnNlIGlzIHRoZSBCU0QtNC1DbGF1c2UuCgoKPiBJIHdpbGwgZ2l2
ZSBhIGNoYW5jZSB0byBMYXJzIHRvIGFuc3dlci4gSSB3aWxsIGNvbW1pdCAjMS04IHRvbW9ycm93
IGV2ZW5pbmcuCgorMQoKIAo+ID4gCj4gPiAKPiA+IE9uIE1vbiwgMTcgSnVuIDIwMTksIEp1bGll
biBHcmFsbCB3cm90ZToKPiA+ID4gaG1tLCBJIGZvcmdvdCB0byBDQyBsYXJzLiBTb3JyeSBmb3Ig
dGhhdC4KPiA+ID4gCj4gPiA+IENoZWVycywKPiA+ID4gCj4gPiA+IE9uIDE1LzA2LzIwMTkgMTk6
MzksIEp1bGllbiBHcmFsbCB3cm90ZToKPiA+ID4gPiAoKyBMYXJzKQo+ID4gPiA+IAo+ID4gPiA+
IEhpLAo+ID4gPiA+IAo+ID4gPiA+IE9uIDYvMTEvMTkgNzo0NiBQTSwgVm9sb2R5bXlyIEJhYmNo
dWsgd3JvdGU6Cj4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLWFybS90ZWUv
b3B0ZWVfbXNnLmgKPiA+ID4gPiA+IGIveGVuL2luY2x1ZGUvYXNtLWFybS90ZWUvb3B0ZWVfbXNn
LmgKPiA+ID4gPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiA+ID4gPiBpbmRleCAwMDAwMDAw
MDAwLi5mZTc0M2RiZGUzCj4gPiA+ID4gPiAtLS0gL2Rldi9udWxsCj4gPiA+ID4gPiArKysgYi94
ZW4vaW5jbHVkZS9hc20tYXJtL3RlZS9vcHRlZV9tc2cuaAo+ID4gPiA+ID4gQEAgLTAsMCArMSwz
MTAgQEAKPiA+ID4gPiA+ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogQlNELTItQ2xhdXNl
ICovCj4gPiA+ID4gCj4gPiA+ID4gSG1tbSwgc29ycnkgSSBoYXZlbid0IG5vdGljZWQgaXQgdW50
aWwgbm93IChTRFBYIGlzIG1vcmUgZXhwbGljaXQgdGhhdAo+ID4gPiA+IHRoZQo+ID4gPiA+IGZ1
bGwtYmxvd24gbGljZW5zZSkuIEkgc3VzcGVjdCB0aGlzIGlzIGZpbmUgdG8gaGF2ZSBCU0QtMiBD
bGF1c2UgbGljZW5zZQo+ID4gPiA+IGluCj4gPiA+ID4gWGVuIGJ1dCBJIHdhbnQgdG8gY29uZmly
bWF0aW9uIGZyb20gc29tZW9uZSBrbm93aW5nIG1vcmUgdGhhbiBtZSBhYm91dAo+ID4gPiA+IGxp
Y2Vuc2UgY29tcGF0aWJpbGl0eS4gTGFycz8KPiA+ID4gPiAKPiA+ID4gPiBJZiB0aGlzIGlzIGZp
bmUsIHRoZW4gSSB3b3VsZCBsaWtlIHRvIGFkZCBhIHdvcmQgaW4gdGhlIGNvbW1pdCBtZXNzYWdl
Cj4gPiA+ID4gKEkgYW0KPiA+ID4gPiBoYXBweSB0byBkbyB0aGF0IG9uIGNvbW1pdCkuCj4gPiA+
ID4gCj4gPiA+ID4gQ2hlZXJzLAo+ID4gPiA+IAo+ID4gPiAKPiA+ID4gLS0gCj4gPiA+IEp1bGll
biBHcmFsbAo+ID4gPiAKPiAKPiAtLSAKPiBKdWxpZW4gR3JhbGwKPiAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

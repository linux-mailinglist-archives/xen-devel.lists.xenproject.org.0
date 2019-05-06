Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA5814C7D
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2019 16:41:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNelD-0001p5-CD; Mon, 06 May 2019 14:38:31 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+Gz0=TG=citrix.com=prvs=022e014eb=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hNelC-0001p0-5F
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 14:38:30 +0000
X-Inumbo-ID: 9c9e15a1-700c-11e9-843c-bc764e045a96
Received: from SMTP.EU.CITRIX.COM (unknown [185.25.65.24])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9c9e15a1-700c-11e9-843c-bc764e045a96;
 Mon, 06 May 2019 14:38:28 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,438,1549929600"; d="scan'208";a="89671581"
Date: Mon, 6 May 2019 16:37:53 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190506143753.gz6pwqntzn6aobgh@Air-de-Roger>
References: <5CC6DD090200007800229E80@prv1-mh.provo.novell.com>
 <5CC6DF710200007800229EC5@prv1-mh.provo.novell.com>
 <20190506135203.by4dre24krtuy3up@Air-de-Roger>
 <5CD043EF020000780022C382@prv1-mh.provo.novell.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5CD043EF020000780022C382@prv1-mh.provo.novell.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 8/9] x86/IRQ: make fixup_irqs() skip
 unconnected internally used interrupts
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBNYXkgMDYsIDIwMTkgYXQgMDg6MjU6NTFBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDA2LjA1LjE5IGF0IDE1OjUyLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gT24gTW9uLCBBcHIgMjksIDIwMTkgYXQgMDU6MjY6NDFBTSAtMDYwMCwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4gPj4gLS0tIGEveGVuL2FyY2gveDg2L2lycS5jCj4gPj4gKysrIGIveGVu
L2FyY2gveDg2L2lycS5jCj4gPj4gQEAgLTI0MTIsOCArMjQxMiwyMCBAQCB2b2lkIGZpeHVwX2ly
cXMoY29uc3QgY3B1bWFza190ICptYXNrLCBiCj4gPj4gICAgICAgICAgdmVjdG9yID0gaXJxX3Rv
X3ZlY3RvcihpcnEpOwo+ID4+ICAgICAgICAgIGlmICggdmVjdG9yID49IEZJUlNUX0hJUFJJT1JJ
VFlfVkVDVE9SICYmCj4gPj4gICAgICAgICAgICAgICB2ZWN0b3IgPD0gTEFTVF9ISVBSSU9SSVRZ
X1ZFQ1RPUiApCj4gPj4gKyAgICAgICAgewo+ID4+ICAgICAgICAgICAgICBjcHVtYXNrX2FuZChk
ZXNjLT5hcmNoLmNwdV9tYXNrLCBkZXNjLT5hcmNoLmNwdV9tYXNrLCBtYXNrKTsKPiA+PiAgCj4g
Pj4gKyAgICAgICAgICAgIC8qCj4gPj4gKyAgICAgICAgICAgICAqIFRoaXMgY2FuIGluIHBhcnRp
Y3VsYXIgaGFwcGVuIHdoZW4gcGFya2luZyBzZWNvbmRhcnkgdGhyZWFkcwo+ID4+ICsgICAgICAg
ICAgICAgKiBkdXJpbmcgYm9vdCBhbmQgd2hlbiB0aGUgc2VyaWFsIGNvbnNvbGUgd2FudHMgdG8g
dXNlIGEgUENJIElSUS4KPiA+PiArICAgICAgICAgICAgICovCj4gPj4gKyAgICAgICAgICAgIGlm
ICggZGVzYy0+aGFuZGxlciA9PSAmbm9faXJxX3R5cGUgKQo+ID4gCj4gPiBJIGZvdW5kIGl0IHdl
aXJkIHRoYXQgYSBpcnEgaGFzIGEgdmVjdG9yIGFzc2lnbmVkIChpbiB0aGlzIGNhc2UgYQo+ID4g
aGlnaC1wcmlvcml0eSB2ZWN0b3IpIGJ1dCBubyBpcnEgdHlwZSBzZXQuCj4gPiAKPiA+IFNob3Vs
ZG4ndCB0aGUgdmVjdG9yIGJlIGFzc2lnbmVkIHdoZW4gdGhlIHR5cGUgaXMgc2V0Pwo+IAo+IElu
IGdlbmVyYWwgSSB3b3VsZCBhZ3JlZSwgYnV0IHRoZSB3YXkgdGhlIHNlcmlhbCBjb25zb2xlIElS
UQo+IGdldHMgc2V0IHVwIGlzIGRpZmZlcmVudCAtIHNlZSBzbXBfaW50cl9pbml0KCkuIFdoZW4g
aXQncyBhIFBDSQo+IElSUSAoSU8tQVBJQyBwaW4gMTYgb3IgYWJvdmUpLCB3ZSdsbCBrbm93IGhv
dyB0byBwcm9ncmFtCj4gdGhlIElPLUFQSUMgUlRFIChlZGdlL2xldmVsLCBhY3Rpdml0eSBoaWdo
L2xvdykgb25seSB3aGVuCj4gRG9tMCBib290cywgYW5kIGhlbmNlIHdlIGRvbid0IHNldCAtPmhh
bmRsZXIgZWFybHkuCgpPaCwgT0suIEkgZ3Vlc3MgYXNzdW1pbmcgbGV2ZWwgdHJpZ2dlcmVkIGFj
dGl2ZSBsb3cgdW5sZXNzIGRvbTAKcHJvdmlkZXMgYSBkaWZmZXJlbnQgY29uZmlndXJhdGlvbiBp
cyBub3Qgc2FmZS4KClJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0
cml4LmNvbT4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs

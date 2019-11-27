Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E116110B40B
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 18:03:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ia0hR-0002X5-R1; Wed, 27 Nov 2019 17:01:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=juU/=ZT=arm.com=mark.rutland@srs-us1.protection.inumbo.net>)
 id 1ia0hQ-0002Ws-Br
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2019 17:01:56 +0000
X-Inumbo-ID: 9d2e11f8-1137-11ea-a55d-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 9d2e11f8-1137-11ea-a55d-bc764e2007e4;
 Wed, 27 Nov 2019 17:01:54 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 06A0430E;
 Wed, 27 Nov 2019 09:01:54 -0800 (PST)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 43C313F6C4;
 Wed, 27 Nov 2019 09:01:51 -0800 (PST)
Date: Wed, 27 Nov 2019 17:01:49 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Pavel Tatashin <pasha.tatashin@soleen.com>
Message-ID: <20191127170148.GG51937@lakrids.cambridge.arm.com>
References: <20191122022406.590141-1-pasha.tatashin@soleen.com>
 <20191122022406.590141-4-pasha.tatashin@soleen.com>
 <20191127151154.GC51937@lakrids.cambridge.arm.com>
 <CA+CK2bDDom_pwLC-ABwDw66ynyELH3f3NdjUEdhr1LYLkgWJvg@mail.gmail.com>
 <20191127160342.GF51937@lakrids.cambridge.arm.com>
 <CA+CK2bBszdMYbneQ1UiYxSndN8zmoVwbTVJ20NeajYPehT_X5Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+CK2bBszdMYbneQ1UiYxSndN8zmoVwbTVJ20NeajYPehT_X5Q@mail.gmail.com>
User-Agent: Mutt/1.11.1+11 (2f07cb52) (2018-12-01)
Subject: Re: [Xen-devel] [PATCH v2 3/3] arm64: remove the rest of
 asm-uaccess.h
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, Stefan Agner <stefan@agner.ch>,
 Russell King - ARM Linux admin <linux@armlinux.org.uk>,
 Masahiro Yamada <yamada.masahiro@socionext.com>, Will Deacon <will@kernel.org>,
 boris.ostrovsky@oracle.com, Sasha Levin <sashal@kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>, James Morris <jmorris@namei.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 xen-devel@lists.xenproject.org, Vladimir Murzin <vladimir.murzin@arm.com>,
 Marc Zyngier <marc.zyngier@arm.com>, alexios.zavras@intel.com,
 Thomas Gleixner <tglx@linutronix.de>, allison@lohutok.net, jgross@suse.com,
 steve.capper@arm.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, James Morse <james.morse@arm.com>,
 info@metux.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBOb3YgMjcsIDIwMTkgYXQgMTE6MDk6MzVBTSAtMDUwMCwgUGF2ZWwgVGF0YXNoaW4g
d3JvdGU6Cj4gT24gV2VkLCBOb3YgMjcsIDIwMTkgYXQgMTE6MDMgQU0gTWFyayBSdXRsYW5kIDxt
YXJrLnJ1dGxhbmRAYXJtLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gV2VkLCBOb3YgMjcsIDIwMTkg
YXQgMTA6MzE6NTRBTSAtMDUwMCwgUGF2ZWwgVGF0YXNoaW4gd3JvdGU6Cj4gPiA+IE9uIFdlZCwg
Tm92IDI3LCAyMDE5IGF0IDEwOjEyIEFNIE1hcmsgUnV0bGFuZCA8bWFyay5ydXRsYW5kQGFybS5j
b20+IHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4gT24gVGh1LCBOb3YgMjEsIDIwMTkgYXQgMDk6MjQ6
MDZQTSAtMDUwMCwgUGF2ZWwgVGF0YXNoaW4gd3JvdGU6Cj4gPiA+ID4gPiBUaGUgX191YWNjZXNz
X3R0YnIwX2Rpc2FibGUgYW5kIF9fdWFjY2Vzc190dGJyMF9lbmFibGUsCj4gPiA+ID4gPiBhcmUg
dGhlIGxhc3QgdHdvIG1hY3JvcyBkZWZpbmVkIGluIGFzbS11YWNjZXNzLmguCj4gPiA+ID4gPgo+
ID4gPiA+ID4gUmVwbGFjZSB0aGVtIHdpdGggQyB3cmFwcGVycyBhbmQgY2FsbCBDIGZ1bmN0aW9u
cyBmcm9tCj4gPiA+ID4gPiBrZXJuZWxfZW50cnkgYW5kIGtlcm5lbF9leGl0Lgo+ID4gPiA+Cj4g
PiA+ID4gRm9yIG5vdywgcGxlYXNlIGxlYXZlIHRob3NlIGFzLWlzLgo+ID4gPiA+Cj4gPiA+ID4g
SSBkb24ndCB0aGluayB3ZSB3YW50IHRvIGhhdmUgb3V0LW9mLWxpbmUgQyB3cmFwcGVycyBpbiB0
aGUgbWlkZGxlIG9mCj4gPiA+ID4gdGhlIGVudHJ5IGFzc2VtYmx5IHdoZXJlIHdlIGRvbid0IGhh
dmUgYSBjb21wbGV0ZSBrZXJuZWwgZW52aXJvbm1lbnQuCj4gPiA+ID4gVGhlIHVzZSBpbiBlbnRy
eSBjb2RlIGNhbiBhbHNvIGFzc3VtZSBub24tcHJlZW1wdGliaWxpdHksIHdoaWxlIHRoZSBDCj4g
PiA+ID4gZnVuY3Rpb25zIGhhdmUgdG8gZXhwbGNpdGlseSBkaXNhYmxlIHRoYXQuCj4gPiA+Cj4g
PiA+IEkgZG8gbm90IHVuZGVyc3RhbmQsIGlmIEMgZnVuY3Rpb24gaXMgY2FsbGVkIGZvcm0gbm9u
LXByZWVtcHRpYmxlCj4gPiA+IGNvbnRleHQgaXQgc3RheXMgbm9uLXByZWVtcHRpYmxlLiBrZXJu
ZWxfZXhpdCBhbHJlYWR5IG1heSBjYWxsIEMKPiA+ID4gZnVuY3Rpb25zIGFyb3VuZCB0aGUgdGlt
ZSBfX3VhY2Nlc3NfdHRicjBfZW5hYmxlIGlzIGNhbGxlZCAoaXQgbWF5Cj4gPiA+IGNhbGwgcG9z
dF90dGJyX3VwZGF0ZV93b3JrYXJvdW5kKSwgYW5kIHRoYXQgQyBmdW5jdGlvbnMgZG9lcyBub3Qg
ZG8KPiA+ID4gZXhwbGljaXQgcHJlZW1wdCBkaXNhYmxlOgo+ID4KPiA+IFNvcnJ5LCBJIG1lYW50
IHRoYXQgSVJRcyBhcmUgZGlzYWJsZWQgaGVyZS4KPiA+Cj4gPiBUaGUgQyB3cmFwcGVyIGNhbGxz
IF9fdWFjY2Vzc190dGJyMF9lbmFibGUoKSwgd2hpY2ggY2FsbHMKPiA+IGxvY2FsX2lycV9zYXZl
KCkgYW5kIGxvY2FsX2lycV9yZXN0b3JlKCkuIFRob3NlIGFyZSBwb2ludGxlc3MgaW4gdGhlCj4g
PiBib3dlbHMgb2YgdGhlIGVudHJ5IGNvZGUsIGFuZCBwb3RlbnRpYWxseSBleHBlbnNpdmUgaWYg
SVJRIHByaW8gbWFza2luZwo+ID4gaXMgaW4gdXNlLgo+ID4KPiA+IEknZCByYXRoZXIgbm90IGFk
ZCBtb3JlIG91dC1vZi1saW5lIEMgY29kZSBjYWxscyBoZXJlIHJpZ2h0IG5vdyBhcyBJJ2QKPiA+
IHByZWZlciB0byBmYWN0b3Igb3V0IHRoZSBsb2dpYyB0byBDIGluIGEgYmV0dGVyIHdheS4KPiAK
PiBBaCwgeWVzLCB0aGlzIG1ha2VzIHNlbnNlLiBJIGNvdWxkIGNlcnRhaW5seSBmYWN0b3Igb3V0
IEMgY2FsbHMgaW4gYQo+IGJldHRlciB3YXksIG9yIGlzIHRoaXMgc29tZXRoaW5nIHlvdSB3YW50
IHRvIHdvcmsgb24/CgpJJ20gaG9waW5nIHRvIGRvIHRoYXQgYXMgcGFydCBvZiBvbmdvaW5nIGVu
dHJ5LWRlYXNtIHdvcmssIG5vdyB0aGF0IGEKbG90IG9mIHRoZSBwcmVyZXF1aXNpdGUgd29yayB3
YXMgbWVyZ2VkIGluIHY1LjQuCgo+IFdpdGhvdXQgcmVtb3ZpbmcgdGhlc2UgYXNzZW1ibHkgbWFj
cm9zIEkgZG8gbm90IHRoaW5rIHdlIHdhbnQgdG8KPiBhZGRyZXNzIHRoaXMgc3VnZ2VzdGlvbiBm
cm9tIEtlZXMgQ29vazoKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sL0NBK0NLMmJDQlMy
ZktPVG1URm0xM2l2M3U1VEJQd3BvQ3NZZWVQMzUyRFZFLWdzOUdKd0BtYWlsLmdtYWlsLmNvbS8K
CkluIHRoZSBtZWFuIHRpbWUsIHdlIGNvdWxkIGFkZCBjaGVja3MgYXJvdW5kIGFkZHJfbGltaXRf
dXNlcl9jaGVjaygpLAphbmQgaW4gdGhlIGNvbnRleHQtc3dpdGNoIHBhdGguIEkgaGF2ZSBzb21l
IHByZXBhcmF0b3J5IGNsZWFudXAgdG8gYWxsb3cKZm9yIHRoZSBjb250ZXh0LXN3aXRjaCBjaGVj
aywgd2hpY2ggSSdsbCBzZW5kIG91dCBhdCAtcmMxLiBUaGF0IHdhcyB3aGF0CkkgdXNlZCB0byBk
ZXRlY3QgdGhlIGNhc2UgeW91IHJlcG9ydGVkIHByZXZpb3VzbHkuCgpUaGFua3MsCk1hcmsuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

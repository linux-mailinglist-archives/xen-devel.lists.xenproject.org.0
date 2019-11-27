Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 889D210B2EF
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 17:06:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZznD-0004Ml-5Y; Wed, 27 Nov 2019 16:03:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=juU/=ZT=arm.com=mark.rutland@srs-us1.protection.inumbo.net>)
 id 1iZznB-0004MT-Ec
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2019 16:03:49 +0000
X-Inumbo-ID: 7f27c7c4-112f-11ea-a3b8-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 7f27c7c4-112f-11ea-a3b8-12813bfff9fa;
 Wed, 27 Nov 2019 16:03:48 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1388630E;
 Wed, 27 Nov 2019 08:03:48 -0800 (PST)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 50F533F68E;
 Wed, 27 Nov 2019 08:03:45 -0800 (PST)
Date: Wed, 27 Nov 2019 16:03:43 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Pavel Tatashin <pasha.tatashin@soleen.com>
Message-ID: <20191127160342.GF51937@lakrids.cambridge.arm.com>
References: <20191122022406.590141-1-pasha.tatashin@soleen.com>
 <20191122022406.590141-4-pasha.tatashin@soleen.com>
 <20191127151154.GC51937@lakrids.cambridge.arm.com>
 <CA+CK2bDDom_pwLC-ABwDw66ynyELH3f3NdjUEdhr1LYLkgWJvg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+CK2bDDom_pwLC-ABwDw66ynyELH3f3NdjUEdhr1LYLkgWJvg@mail.gmail.com>
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

T24gV2VkLCBOb3YgMjcsIDIwMTkgYXQgMTA6MzE6NTRBTSAtMDUwMCwgUGF2ZWwgVGF0YXNoaW4g
d3JvdGU6Cj4gT24gV2VkLCBOb3YgMjcsIDIwMTkgYXQgMTA6MTIgQU0gTWFyayBSdXRsYW5kIDxt
YXJrLnJ1dGxhbmRAYXJtLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gVGh1LCBOb3YgMjEsIDIwMTkg
YXQgMDk6MjQ6MDZQTSAtMDUwMCwgUGF2ZWwgVGF0YXNoaW4gd3JvdGU6Cj4gPiA+IFRoZSBfX3Vh
Y2Nlc3NfdHRicjBfZGlzYWJsZSBhbmQgX191YWNjZXNzX3R0YnIwX2VuYWJsZSwKPiA+ID4gYXJl
IHRoZSBsYXN0IHR3byBtYWNyb3MgZGVmaW5lZCBpbiBhc20tdWFjY2Vzcy5oLgo+ID4gPgo+ID4g
PiBSZXBsYWNlIHRoZW0gd2l0aCBDIHdyYXBwZXJzIGFuZCBjYWxsIEMgZnVuY3Rpb25zIGZyb20K
PiA+ID4ga2VybmVsX2VudHJ5IGFuZCBrZXJuZWxfZXhpdC4KPiA+Cj4gPiBGb3Igbm93LCBwbGVh
c2UgbGVhdmUgdGhvc2UgYXMtaXMuCj4gPgo+ID4gSSBkb24ndCB0aGluayB3ZSB3YW50IHRvIGhh
dmUgb3V0LW9mLWxpbmUgQyB3cmFwcGVycyBpbiB0aGUgbWlkZGxlIG9mCj4gPiB0aGUgZW50cnkg
YXNzZW1ibHkgd2hlcmUgd2UgZG9uJ3QgaGF2ZSBhIGNvbXBsZXRlIGtlcm5lbCBlbnZpcm9ubWVu
dC4KPiA+IFRoZSB1c2UgaW4gZW50cnkgY29kZSBjYW4gYWxzbyBhc3N1bWUgbm9uLXByZWVtcHRp
YmlsaXR5LCB3aGlsZSB0aGUgQwo+ID4gZnVuY3Rpb25zIGhhdmUgdG8gZXhwbGNpdGlseSBkaXNh
YmxlIHRoYXQuCj4gCj4gSSBkbyBub3QgdW5kZXJzdGFuZCwgaWYgQyBmdW5jdGlvbiBpcyBjYWxs
ZWQgZm9ybSBub24tcHJlZW1wdGlibGUKPiBjb250ZXh0IGl0IHN0YXlzIG5vbi1wcmVlbXB0aWJs
ZS4ga2VybmVsX2V4aXQgYWxyZWFkeSBtYXkgY2FsbCBDCj4gZnVuY3Rpb25zIGFyb3VuZCB0aGUg
dGltZSBfX3VhY2Nlc3NfdHRicjBfZW5hYmxlIGlzIGNhbGxlZCAoaXQgbWF5Cj4gY2FsbCBwb3N0
X3R0YnJfdXBkYXRlX3dvcmthcm91bmQpLCBhbmQgdGhhdCBDIGZ1bmN0aW9ucyBkb2VzIG5vdCBk
bwo+IGV4cGxpY2l0IHByZWVtcHQgZGlzYWJsZToKClNvcnJ5LCBJIG1lYW50IHRoYXQgSVJRcyBh
cmUgZGlzYWJsZWQgaGVyZS4KClRoZSBDIHdyYXBwZXIgY2FsbHMgX191YWNjZXNzX3R0YnIwX2Vu
YWJsZSgpLCB3aGljaCBjYWxscwpsb2NhbF9pcnFfc2F2ZSgpIGFuZCBsb2NhbF9pcnFfcmVzdG9y
ZSgpLiBUaG9zZSBhcmUgcG9pbnRsZXNzIGluIHRoZQpib3dlbHMgb2YgdGhlIGVudHJ5IGNvZGUs
IGFuZCBwb3RlbnRpYWxseSBleHBlbnNpdmUgaWYgSVJRIHByaW8gbWFza2luZwppcyBpbiB1c2Uu
CgpJJ2QgcmF0aGVyIG5vdCBhZGQgbW9yZSBvdXQtb2YtbGluZSBDIGNvZGUgY2FsbHMgaGVyZSBy
aWdodCBub3cgYXMgSSdkCnByZWZlciB0byBmYWN0b3Igb3V0IHRoZSBsb2dpYyB0byBDIGluIGEg
YmV0dGVyIHdheS4KCj4gPiBXZSBjYW4gY2VydGFpbmx5IHJlbW92ZSB0aGUgaW5jbHVkZXMgb2Yg
PGFzbS9hc20tdWFjY2Vzcy5oPiBlbHNld2hlcmUsCj4gPiBhbmQgbWF5YmUgZm9sZCB0aGUgbWFj
cm9zIGludG8gZW50cnkuUyBpZiBpdCdzIG5vdCB0b28gY3Jvd2RlZC4KPiAKPiBJIGNhbiBkbyB0
aGlzIGFzIGEgc2VwYXJhdGUgcGF0Y2guCgpUaGF0IHNvdW5kcyBmaW5lIHRvIG1lLAoKVGhhbmtz
LApNYXJrLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B83BC380A
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 16:50:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFJQc-0003PR-1E; Tue, 01 Oct 2019 14:47:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FRxR=X2=arm.com=mark.rutland@srs-us1.protection.inumbo.net>)
 id 1iFJQa-0003PK-P9
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 14:47:00 +0000
X-Inumbo-ID: 52ca2534-e45a-11e9-97fb-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id 52ca2534-e45a-11e9-97fb-bc764e2007e4;
 Tue, 01 Oct 2019 14:46:59 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9C4491000;
 Tue,  1 Oct 2019 07:46:59 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1298E3F71A;
 Tue,  1 Oct 2019 07:46:57 -0700 (PDT)
Date: Tue, 1 Oct 2019 15:46:50 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <20191001144650.GA22655@lakrids.cambridge.arm.com>
References: <20190906153948.2160342-1-arnd@arndb.de>
 <7abad95e-ea47-c068-d91c-ba503f2530b9@citrix.com>
 <CAK8P3a1qkMLW_Wnn-N0seUw4N5bPwTU7Dy7CwOWxzS6NTnTmiQ@mail.gmail.com>
 <bda2a05b-e2d0-feee-761b-88deeeac2449@citrix.com>
 <95dbd972-fe78-d0ca-f7b4-1a6bdd418eab@arm.com>
 <20191001143334.GA46651@lakrids.cambridge.arm.com>
 <9e04485f-2d4a-81a2-c7e1-e50dd888930f@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9e04485f-2d4a-81a2-c7e1-e50dd888930f@arm.com>
User-Agent: Mutt/1.11.1+11 (2f07cb52) (2018-12-01)
Subject: Re: [Xen-devel] [PATCH] ARM: xen: unexport HYPERVISOR_platform_op
 function
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
Cc: Arnd Bergmann <arnd@arndb.de>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Emil Velikov <emil.l.velikov@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Denis Efremov <efremov@linux.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Will Deacon <will@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBPY3QgMDEsIDIwMTkgYXQgMDM6Mzk6NDFQTSArMDEwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+IE9uIDAxLzEwLzIwMTkgMTU6MzMsIE1hcmsgUnV0bGFuZCB3cm90ZToKPiA+IE9uIFNh
dCwgU2VwIDA3LCAyMDE5IGF0IDExOjA1OjQ1QU0gKzAxMDAsIEp1bGllbiBHcmFsbCB3cm90ZToK
PiA+ID4gT24gOS82LzE5IDY6MjAgUE0sIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gPiA+ID4gT24g
MDYvMDkvMjAxOSAxNzowMCwgQXJuZCBCZXJnbWFubiB3cm90ZToKPiA+ID4gPiA+IE9uIEZyaSwg
U2VwIDYsIDIwMTkgYXQgNTo1NSBQTSBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRy
aXguY29tPiB3cm90ZToKPiA+ID4gPiA+ID4gT24gMDYvMDkvMjAxOSAxNjozOSwgQXJuZCBCZXJn
bWFubiB3cm90ZToKPiA+ID4gPiA+ID4gPiBIWVBFUlZJU09SX3BsYXRmb3JtX29wKCkgaXMgYW4g
aW5saW5lIGZ1bmN0aW9uIGFuZCBzaG91bGQgbm90Cj4gPiA+ID4gPiA+ID4gYmUgZXhwb3J0ZWQu
IFNpbmNlIGNvbW1pdCAxNWJmYzIzNDhkNTQgKCJtb2Rwb3N0OiBjaGVjayBmb3IKPiA+ID4gPiA+
ID4gPiBzdGF0aWMgRVhQT1JUX1NZTUJPTCogZnVuY3Rpb25zIiksIHRoaXMgY2F1c2VzIGEgd2Fy
bmluZzoKPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiBXQVJOSU5HOiAiSFlQRVJWSVNPUl9w
bGF0Zm9ybV9vcCIgW3ZtbGludXhdIGlzIGEgc3RhdGljIEVYUE9SVF9TWU1CT0xfR1BMCj4gPiA+
ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gUmVtb3ZlIHRoZSBleHRyYW5lb3VzIGV4cG9ydC4KPiA+
ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiBGaXhlczogMTViZmMyMzQ4ZDU0ICgibW9kcG9zdDog
Y2hlY2sgZm9yIHN0YXRpYyBFWFBPUlRfU1lNQk9MKiBmdW5jdGlvbnMiKQo+ID4gPiA+ID4gPiA+
IFNpZ25lZC1vZmYtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+CgpbLi4uXQoKPiA+
ID4gV2hpbGUgbG9va2luZyBhdCB0aGUgY29kZSwgSSBhbHNvIHJlYWxpemVkIHRoYXQgdGhlIGlt
cGxlbWVudGF0aW9uIG9mCj4gPiA+IEhZUEVSQ0FMTF9kbV9vcCBtaWdodCBiZSBpbmNvcnJlY3Qg
Zm9yIEFybTMyLiBTaW1pbGFybHkgZG8gcHJpdmNtZCBjYWxsLCBJCj4gPiA+IHRoaW5rIGRtX29w
IGNhbGwgc2hvdWxkIGVuYWJsZSB1c2VyIGFjY2VzcyBhcyB0aGV5IHdpbGwgYmUgdXNlZCBieQo+
ID4gPiB1c2Vyc3BhY2UuCj4gPiA+IAo+ID4gPiBXZSBkb24ndCB1c2UgZG1fb3Agb24gQXJtIHNv
IGZhciwgaGVuY2Ugd2h5IEkgdGhpbmsgdGhpcyB3YXMgdW5ub3RpY2VkLiBJCj4gPiA+IHdpbGwg
c2VlIGlmIEkgY2FuIHJlcHJvZHVjZSBpdCBhbmQgc2VuZCBhIHBhdGNoLgo+ID4gCj4gPiBJJ20g
c2VlaW5nIHRoaXMgd2hlbiBidWlsZGluZyBhcm02NCBkZWZjb25maWcgdjUuNC1yYzE6Cj4gPiAK
PiA+IHwgW21hcmtAbGFrcmlkczp+L3NyYy9saW51eF0lIHVzZWtvcmcgOC4xLjAgIG1ha2UgQVJD
SD1hcm02NCBDUk9TU19DT01QSUxFPWFhcmNoNjQtbGludXgtIC1qNTYgLXMKPiA+IHwgYXJjaC9h
cm02NC9NYWtlZmlsZTo2MjogQ1JPU1NfQ09NUElMRV9DT01QQVQgbm90IGRlZmluZWQgb3IgZW1w
dHksIHRoZSBjb21wYXQgdkRTTyB3aWxsIG5vdCBiZSBidWlsdAo+ID4gfCBXQVJOSU5HOiAiSFlQ
RVJWSVNPUl9wbGF0Zm9ybV9vcCIgW3ZtbGludXhdIGlzIGEgc3RhdGljIEVYUE9SVF9TWU1CT0xf
R1BMCj4gPiB8IFdBUk5JTkc6ICJIWVBFUlZJU09SX3BsYXRmb3JtX29wIiBbdm1saW51eF0gaXMg
YSBzdGF0aWMgRVhQT1JUX1NZTUJPTF9HUEwKPiA+IAo+ID4gSSBjb3VsZG4ndCBzZWUgYSBmb2xs
b3ctdXA7IGRvIHlvdSBoYXZlIGEgcGF0Y2ggZm9yIHRoaXM/Cj4gCj4gVGhlIGZpcnN0IGUtbWFp
bCBvZiB0aGUgdGhyZWFkIHNob3VsZCBjb250YWluIGEgcGF0Y2ggdG8gYWRkcmVzcyB0aGUgd2Fy
bmluZwo+IChzZWUgWzFdKS4gQnV0IGl0IGlzIHN0aWxsIHdhaXRpbmcgb24gYW4gQWNrIGZyb20g
U3RlZmFubyBzbyBpdCBjYW4gZ2V0Cj4gbWVyZ2VkLgoKQWgsIHNvcnJ5LiBJIG1pc3VuZGVyc3Rv
b2Qgd2hhdCB5b3Ugd2VyZSBwbGFubmluZyB0byBzZW5kIGEgcGF0Y2ggZm9yLAphbmQgYXNzdW1l
ZCB5b3Ugd2VyZSBnb2luZyB0byBwcm9wb3NlIGFuIGFsdGVybmF0aXZlIHRvIEFybmQncyBwYXRj
aC4KClN0ZWZhbm8sIGRvIHlvdSBzZWUgYW55IHByb2JsZW0gd2l0aCBBcm5kJ3MgcGF0Y2g/IElm
IG5vdCwgaXQgd291bGQgYmUKZ29vZCB0byBnZXQgdGhpcyBtZXJnZWQgc29vbi4KClRoYW5rcywK
TWFyay4KCj4gCj4gQ2hlZXJzLAo+IAo+IFsxXSBodHRwczovL3BhdGNod29yay5rZXJuZWwub3Jn
L3BhdGNoLzExMTM1NjAxLwo+IAo+IC0tIAo+IEp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA894C37E0
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 16:42:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFJJc-0002Wa-3T; Tue, 01 Oct 2019 14:39:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=T/b7=X2=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iFJJa-0002WL-9y
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 14:39:46 +0000
X-Inumbo-ID: 4f5fa5e6-e459-11e9-9702-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id 4f5fa5e6-e459-11e9-9702-12813bfff9fa;
 Tue, 01 Oct 2019 14:39:44 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 65EB01570;
 Tue,  1 Oct 2019 07:39:44 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EA9323F71A;
 Tue,  1 Oct 2019 07:39:42 -0700 (PDT)
To: Mark Rutland <mark.rutland@arm.com>
References: <20190906153948.2160342-1-arnd@arndb.de>
 <7abad95e-ea47-c068-d91c-ba503f2530b9@citrix.com>
 <CAK8P3a1qkMLW_Wnn-N0seUw4N5bPwTU7Dy7CwOWxzS6NTnTmiQ@mail.gmail.com>
 <bda2a05b-e2d0-feee-761b-88deeeac2449@citrix.com>
 <95dbd972-fe78-d0ca-f7b4-1a6bdd418eab@arm.com>
 <20191001143334.GA46651@lakrids.cambridge.arm.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <9e04485f-2d4a-81a2-c7e1-e50dd888930f@arm.com>
Date: Tue, 1 Oct 2019 15:39:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191001143334.GA46651@lakrids.cambridge.arm.com>
Content-Language: en-US
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Emil Velikov <emil.l.velikov@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Denis Efremov <efremov@linux.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Will Deacon <will@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDAxLzEwLzIwMTkgMTU6MzMsIE1hcmsgUnV0bGFuZCB3cm90ZToKPiBIaSBKdWxpZW4sCgpI
aSBNYXJrLAoKPiAKPiBPbiBTYXQsIFNlcCAwNywgMjAxOSBhdCAxMTowNTo0NUFNICswMTAwLCBK
dWxpZW4gR3JhbGwgd3JvdGU6Cj4+IE9uIDkvNi8xOSA2OjIwIFBNLCBBbmRyZXcgQ29vcGVyIHdy
b3RlOgo+Pj4gT24gMDYvMDkvMjAxOSAxNzowMCwgQXJuZCBCZXJnbWFubiB3cm90ZToKPj4+PiBP
biBGcmksIFNlcCA2LCAyMDE5IGF0IDU6NTUgUE0gQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3Bl
cjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+Pj4+IE9uIDA2LzA5LzIwMTkgMTY6MzksIEFybmQgQmVy
Z21hbm4gd3JvdGU6Cj4+Pj4+PiBIWVBFUlZJU09SX3BsYXRmb3JtX29wKCkgaXMgYW4gaW5saW5l
IGZ1bmN0aW9uIGFuZCBzaG91bGQgbm90Cj4+Pj4+PiBiZSBleHBvcnRlZC4gU2luY2UgY29tbWl0
IDE1YmZjMjM0OGQ1NCAoIm1vZHBvc3Q6IGNoZWNrIGZvcgo+Pj4+Pj4gc3RhdGljIEVYUE9SVF9T
WU1CT0wqIGZ1bmN0aW9ucyIpLCB0aGlzIGNhdXNlcyBhIHdhcm5pbmc6Cj4+Pj4+Pgo+Pj4+Pj4g
V0FSTklORzogIkhZUEVSVklTT1JfcGxhdGZvcm1fb3AiIFt2bWxpbnV4XSBpcyBhIHN0YXRpYyBF
WFBPUlRfU1lNQk9MX0dQTAo+Pj4+Pj4KPj4+Pj4+IFJlbW92ZSB0aGUgZXh0cmFuZW91cyBleHBv
cnQuCj4+Pj4+Pgo+Pj4+Pj4gRml4ZXM6IDE1YmZjMjM0OGQ1NCAoIm1vZHBvc3Q6IGNoZWNrIGZv
ciBzdGF0aWMgRVhQT1JUX1NZTUJPTCogZnVuY3Rpb25zIikKPj4+Pj4+IFNpZ25lZC1vZmYtYnk6
IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Cj4+Pj4+IFNvbWV0aGluZyBpcyB3b25reS4g
IFRoYXQgc3ltYm9sIGlzICgvIHJlYWxseSBvdWdodCB0byBiZSkgaW4gdGhlCj4+Pj4+IGh5cGVy
Y2FsbCBwYWdlIGFuZCBtb3N0IGRlZmluaXRlbHkgbm90IGlubGluZS4KPj4+Pj4KPj4+Pj4gV2hp
Y2ggdHJlZSBpcyB0aGF0IGNoYW5nZXNldCBmcm9tPyAgSSBjYW4ndCBmaW5kIHRoZSBTSEEuCj4+
Pj4gVGhpcyBpcyBmcm9tIGxpbnV4LW5leHQsIEkgdGhpbmsgZnJvbSB0aGUga2J1aWxkIHRyZWUu
Cj4+Pgo+Pj4gVGhhbmtzLgo+Pj4KPj4+IEp1bGllbi9TdGVmYW5vOiBXaHkgYXJlIGFueSBvZiB0
aGVzZSBoeXBlcmNhbGxzIG91dC1vZi1saW5lP8KgIEFSTQo+Pj4gZG9lc24ndCB1c2UgdGhlIGh5
cGVyY2FsbCBwYWdlLCBhbmQgdGhlcmUgaXMgbm8gYXJndW1lbnQgdHJhbnNsYXRpb24KPj4+IChu
b3QgZXZlbiBpbiBhcm0zMiBhcyB0aGVyZSBhcmUgbm8gNS1hcmd1bWVudCBoeXBlcmNhbGxzIGRl
Y2xhcmVkKS4KPj4KPj4gSSBhbSBub3Qgc3VyZSBob3cgdGhlIGh5cGVyY2FsbCBwYWdlIG1ha2Vz
IHRoaW5ncyBkaWZmZXJlbnQuIFlvdSBzdGlsbCBoYXZlCj4+IHRvIHN0b3JlIHRoZSBhcmd1bWVu
dHMgaW4gdGhlIGNvcnJlY3QgcmVnaXN0ZXIgc28uLi4KPj4KPj4+Cj4+PiBUaGV5J2Qgc3VyZWx5
IGJlIGVhc2llciB0byBpbXBsZW1lbnQgd2l0aCBhIGZldyBzdGF0aWMgaW5saW5lcyBhbmQgc29t
ZQo+Pj4gY29tbW9uIGNvZGUsIHRoYW4gdG8gdHJ5IGFuZCByZXBsaWNhdGUgdGhlIHg4NiBzaWRl
IGh5cGVyY2FsbF9wYWdlCj4+PiBpbnRlcmZhY2UgPwo+Pgo+PiAuLi4gSSBkb24ndCB0aGluayB0
aGV5IHdpbGwgYmUgZWFzaWVyIHRvIGltcGxlbWVudCB3aXRoIGEgZmV3IHN0YXRpYwo+PiBpbmxp
bmVzLiBUaGUgaW1wbGVtZW50YXRpb24gd2lsbCBsaWtlbHkgZW5kIHVwIHRvIGJlIHNpbWlsYXIg
dG8KPj4gYXJjaC94ODYvYXNtL3hlbi9oeXBlcmNhbGwuaC4KPj4KPj4gRnVydGhlcm1vcmUsIG9u
ZSBvZiB0aGUgZG93bnNpZGUgb2YgcGVyLWFyY2ggc3RhdGljIGlubGluZSBpcyBpdCBpcyBtb3Jl
Cj4+IGRpZmZpY3VsdCB0byBlbnN1cmUgdGhlIHByb3RvdHlwZSBtYXRjaCBmb3IgYWxsIHRoZSBh
cmNoaXRlY3R1cmVzLiBBbHRob3VnaCwKPj4gaXQgbWlnaHQgYmUgcG9zc2libGUgdG8gbWFrZSB0
aGVtIGNvbW1vbiBieSBvbmx5IHJlcXVlc3RpbmcgcGVyLWFyY2ggdG8KPj4gaW1wbGVtZW50IEhZ
UEVSQ0FMTF9OKC4uLikuCj4+Cj4+IFNvIEkgdGhpbmsgdGhlIGNvZGUgaXMgYmV0dGVyIGFzIGl0
IGlzLgo+Pgo+PiBXaGlsZSBsb29raW5nIGF0IHRoZSBjb2RlLCBJIGFsc28gcmVhbGl6ZWQgdGhh
dCB0aGUgaW1wbGVtZW50YXRpb24gb2YKPj4gSFlQRVJDQUxMX2RtX29wIG1pZ2h0IGJlIGluY29y
cmVjdCBmb3IgQXJtMzIuIFNpbWlsYXJseSBkbyBwcml2Y21kIGNhbGwsIEkKPj4gdGhpbmsgZG1f
b3AgY2FsbCBzaG91bGQgZW5hYmxlIHVzZXIgYWNjZXNzIGFzIHRoZXkgd2lsbCBiZSB1c2VkIGJ5
Cj4+IHVzZXJzcGFjZS4KPj4KPj4gV2UgZG9uJ3QgdXNlIGRtX29wIG9uIEFybSBzbyBmYXIsIGhl
bmNlIHdoeSBJIHRoaW5rIHRoaXMgd2FzIHVubm90aWNlZC4gSQo+PiB3aWxsIHNlZSBpZiBJIGNh
biByZXByb2R1Y2UgaXQgYW5kIHNlbmQgYSBwYXRjaC4KPiAKPiBJJ20gc2VlaW5nIHRoaXMgd2hl
biBidWlsZGluZyBhcm02NCBkZWZjb25maWcgdjUuNC1yYzE6Cj4gCj4gfCBbbWFya0BsYWtyaWRz
On4vc3JjL2xpbnV4XSUgdXNla29yZyA4LjEuMCAgbWFrZSBBUkNIPWFybTY0IENST1NTX0NPTVBJ
TEU9YWFyY2g2NC1saW51eC0gLWo1NiAtcwo+IHwgYXJjaC9hcm02NC9NYWtlZmlsZTo2MjogQ1JP
U1NfQ09NUElMRV9DT01QQVQgbm90IGRlZmluZWQgb3IgZW1wdHksIHRoZSBjb21wYXQgdkRTTyB3
aWxsIG5vdCBiZSBidWlsdAo+IHwgV0FSTklORzogIkhZUEVSVklTT1JfcGxhdGZvcm1fb3AiIFt2
bWxpbnV4XSBpcyBhIHN0YXRpYyBFWFBPUlRfU1lNQk9MX0dQTAo+IHwgV0FSTklORzogIkhZUEVS
VklTT1JfcGxhdGZvcm1fb3AiIFt2bWxpbnV4XSBpcyBhIHN0YXRpYyBFWFBPUlRfU1lNQk9MX0dQ
TAo+IAo+IEkgY291bGRuJ3Qgc2VlIGEgZm9sbG93LXVwOyBkbyB5b3UgaGF2ZSBhIHBhdGNoIGZv
ciB0aGlzPwoKVGhlIGZpcnN0IGUtbWFpbCBvZiB0aGUgdGhyZWFkIHNob3VsZCBjb250YWluIGEg
cGF0Y2ggdG8gYWRkcmVzcyB0aGUgd2FybmluZyAKKHNlZSBbMV0pLiBCdXQgaXQgaXMgc3RpbGwg
d2FpdGluZyBvbiBhbiBBY2sgZnJvbSBTdGVmYW5vIHNvIGl0IGNhbiBnZXQgbWVyZ2VkLgoKQ2hl
ZXJzLAoKWzFdIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTExMzU2MDEvCgot
LSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs

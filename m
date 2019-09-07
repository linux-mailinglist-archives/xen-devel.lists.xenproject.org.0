Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C95FEAC602
	for <lists+xen-devel@lfdr.de>; Sat,  7 Sep 2019 12:10:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i6XbO-0003VQ-Es; Sat, 07 Sep 2019 10:05:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1qDq=XC=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1i6XbM-0003VL-Id
 for xen-devel@lists.xenproject.org; Sat, 07 Sep 2019 10:05:52 +0000
X-Inumbo-ID: 113d68b2-d157-11e9-abfd-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 113d68b2-d157-11e9-abfd-12813bfff9fa;
 Sat, 07 Sep 2019 10:05:49 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DA1641576;
 Sat,  7 Sep 2019 03:05:48 -0700 (PDT)
Received: from [10.37.12.3] (unknown [10.37.12.3])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 85A3F3F59C;
 Sat,  7 Sep 2019 03:05:46 -0700 (PDT)
To: Andrew Cooper <andrew.cooper3@citrix.com>, Arnd Bergmann <arnd@arndb.de>
References: <20190906153948.2160342-1-arnd@arndb.de>
 <7abad95e-ea47-c068-d91c-ba503f2530b9@citrix.com>
 <CAK8P3a1qkMLW_Wnn-N0seUw4N5bPwTU7Dy7CwOWxzS6NTnTmiQ@mail.gmail.com>
 <bda2a05b-e2d0-feee-761b-88deeeac2449@citrix.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <95dbd972-fe78-d0ca-f7b4-1a6bdd418eab@arm.com>
Date: Sat, 7 Sep 2019 11:05:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <bda2a05b-e2d0-feee-761b-88deeeac2449@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Emil Velikov <emil.l.velikov@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Denis Efremov <efremov@linux.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgQW5kcmV3LAoKT24gOS82LzE5IDY6MjAgUE0sIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gT24g
MDYvMDkvMjAxOSAxNzowMCwgQXJuZCBCZXJnbWFubiB3cm90ZToKPj4gT24gRnJpLCBTZXAgNiwg
MjAxOSBhdCA1OjU1IFBNIEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+
IHdyb3RlOgo+Pj4gT24gMDYvMDkvMjAxOSAxNjozOSwgQXJuZCBCZXJnbWFubiB3cm90ZToKPj4+
PiBIWVBFUlZJU09SX3BsYXRmb3JtX29wKCkgaXMgYW4gaW5saW5lIGZ1bmN0aW9uIGFuZCBzaG91
bGQgbm90Cj4+Pj4gYmUgZXhwb3J0ZWQuIFNpbmNlIGNvbW1pdCAxNWJmYzIzNDhkNTQgKCJtb2Rw
b3N0OiBjaGVjayBmb3IKPj4+PiBzdGF0aWMgRVhQT1JUX1NZTUJPTCogZnVuY3Rpb25zIiksIHRo
aXMgY2F1c2VzIGEgd2FybmluZzoKPj4+Pgo+Pj4+IFdBUk5JTkc6ICJIWVBFUlZJU09SX3BsYXRm
b3JtX29wIiBbdm1saW51eF0gaXMgYSBzdGF0aWMgRVhQT1JUX1NZTUJPTF9HUEwKPj4+Pgo+Pj4+
IFJlbW92ZSB0aGUgZXh0cmFuZW91cyBleHBvcnQuCj4+Pj4KPj4+PiBGaXhlczogMTViZmMyMzQ4
ZDU0ICgibW9kcG9zdDogY2hlY2sgZm9yIHN0YXRpYyBFWFBPUlRfU1lNQk9MKiBmdW5jdGlvbnMi
KQo+Pj4+IFNpZ25lZC1vZmYtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Cj4+PiBT
b21ldGhpbmcgaXMgd29ua3kuICBUaGF0IHN5bWJvbCBpcyAoLyByZWFsbHkgb3VnaHQgdG8gYmUp
IGluIHRoZQo+Pj4gaHlwZXJjYWxsIHBhZ2UgYW5kIG1vc3QgZGVmaW5pdGVseSBub3QgaW5saW5l
Lgo+Pj4KPj4+IFdoaWNoIHRyZWUgaXMgdGhhdCBjaGFuZ2VzZXQgZnJvbT8gIEkgY2FuJ3QgZmlu
ZCB0aGUgU0hBLgo+PiBUaGlzIGlzIGZyb20gbGludXgtbmV4dCwgSSB0aGluayBmcm9tIHRoZSBr
YnVpbGQgdHJlZS4KPiAKPiBUaGFua3MuCj4gCj4gSnVsaWVuL1N0ZWZhbm86IFdoeSBhcmUgYW55
IG9mIHRoZXNlIGh5cGVyY2FsbHMgb3V0LW9mLWxpbmU/wqAgQVJNCj4gZG9lc24ndCB1c2UgdGhl
IGh5cGVyY2FsbCBwYWdlLCBhbmQgdGhlcmUgaXMgbm8gYXJndW1lbnQgdHJhbnNsYXRpb24KPiAo
bm90IGV2ZW4gaW4gYXJtMzIgYXMgdGhlcmUgYXJlIG5vIDUtYXJndW1lbnQgaHlwZXJjYWxscyBk
ZWNsYXJlZCkuCgpJIGFtIG5vdCBzdXJlIGhvdyB0aGUgaHlwZXJjYWxsIHBhZ2UgbWFrZXMgdGhp
bmdzIGRpZmZlcmVudC4gWW91IHN0aWxsIApoYXZlIHRvIHN0b3JlIHRoZSBhcmd1bWVudHMgaW4g
dGhlIGNvcnJlY3QgcmVnaXN0ZXIgc28uLi4KCj4gCj4gVGhleSdkIHN1cmVseSBiZSBlYXNpZXIg
dG8gaW1wbGVtZW50IHdpdGggYSBmZXcgc3RhdGljIGlubGluZXMgYW5kIHNvbWUKPiBjb21tb24g
Y29kZSwgdGhhbiB0byB0cnkgYW5kIHJlcGxpY2F0ZSB0aGUgeDg2IHNpZGUgaHlwZXJjYWxsX3Bh
Z2UKPiBpbnRlcmZhY2UgPwoKLi4uIEkgZG9uJ3QgdGhpbmsgdGhleSB3aWxsIGJlIGVhc2llciB0
byBpbXBsZW1lbnQgd2l0aCBhIGZldyBzdGF0aWMgCmlubGluZXMuIFRoZSBpbXBsZW1lbnRhdGlv
biB3aWxsIGxpa2VseSBlbmQgdXAgdG8gYmUgc2ltaWxhciB0byAKYXJjaC94ODYvYXNtL3hlbi9o
eXBlcmNhbGwuaC4KCkZ1cnRoZXJtb3JlLCBvbmUgb2YgdGhlIGRvd25zaWRlIG9mIHBlci1hcmNo
IHN0YXRpYyBpbmxpbmUgaXMgaXQgaXMgbW9yZSAKZGlmZmljdWx0IHRvIGVuc3VyZSB0aGUgcHJv
dG90eXBlIG1hdGNoIGZvciBhbGwgdGhlIGFyY2hpdGVjdHVyZXMuIApBbHRob3VnaCwgaXQgbWln
aHQgYmUgcG9zc2libGUgdG8gbWFrZSB0aGVtIGNvbW1vbiBieSBvbmx5IHJlcXVlc3RpbmcgCnBl
ci1hcmNoIHRvIGltcGxlbWVudCBIWVBFUkNBTExfTiguLi4pLgoKU28gSSB0aGluayB0aGUgY29k
ZSBpcyBiZXR0ZXIgYXMgaXQgaXMuCgpXaGlsZSBsb29raW5nIGF0IHRoZSBjb2RlLCBJIGFsc28g
cmVhbGl6ZWQgdGhhdCB0aGUgaW1wbGVtZW50YXRpb24gb2YgCkhZUEVSQ0FMTF9kbV9vcCBtaWdo
dCBiZSBpbmNvcnJlY3QgZm9yIEFybTMyLiBTaW1pbGFybHkgZG8gcHJpdmNtZCBjYWxsLCAKSSB0
aGluayBkbV9vcCBjYWxsIHNob3VsZCBlbmFibGUgdXNlciBhY2Nlc3MgYXMgdGhleSB3aWxsIGJl
IHVzZWQgYnkgCnVzZXJzcGFjZS4KCldlIGRvbid0IHVzZSBkbV9vcCBvbiBBcm0gc28gZmFyLCBo
ZW5jZSB3aHkgSSB0aGluayB0aGlzIHdhcyB1bm5vdGljZWQuIApJIHdpbGwgc2VlIGlmIEkgY2Fu
IHJlcHJvZHVjZSBpdCBhbmQgc2VuZCBhIHBhdGNoLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFs
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6FF26442
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2019 15:03:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hTQrM-0006V5-15; Wed, 22 May 2019 13:00:44 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2jZt=TW=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hTQrK-0006Uy-Sp
 for xen-devel@lists.xenproject.org; Wed, 22 May 2019 13:00:42 +0000
X-Inumbo-ID: 9a611c0b-7c91-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 9a611c0b-7c91-11e9-8980-bc764e045a96;
 Wed, 22 May 2019 13:00:41 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2D0B180D;
 Wed, 22 May 2019 06:00:41 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EBB3F3F575;
 Wed, 22 May 2019 06:00:39 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>
References: <20190520181250.17404-1-julien.grall@arm.com>
 <5CE3C45A0200007800230E0E@prv1-mh.provo.novell.com>
 <1c7f43ce-7df2-24c9-ecb2-d8be1afebfa5@arm.com>
 <5CE3C8370200007800230E40@prv1-mh.provo.novell.com>
 <f2f912ac-a1c6-1f07-f708-cf2935c0270f@arm.com>
 <83c1a4f7-0714-0ee5-e225-835126d92c5d@arm.com>
 <5CE540960200007800231571@prv1-mh.provo.novell.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <109e62db-9ed6-309b-44cc-63e7cffa2c67@arm.com>
Date: Wed, 22 May 2019 14:00:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CE540960200007800231571@prv1-mh.provo.novell.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/public: arch-arm: Restrict the
 visibility of struct vcpu_guest_core_regs
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
Cc: Artem Mygaiev <Artem_Mygaiev@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

KCtBcnRlbSkKCkhpIEphbiwKCk9uIDIyLzA1LzIwMTkgMTM6MjksIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+Pj4+IE9uIDIyLjA1LjE5IGF0IDE0OjIwLCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3Rl
Ogo+IAo+Pgo+PiBPbiAyMS8wNS8yMDE5IDEwOjU1LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+PiBI
aSBKYW4sCj4+Pgo+Pj4gT24gNS8yMS8xOSAxMDo0MyBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+
Pj4+Pj4gT24gMjEuMDUuMTkgYXQgMTE6MzUsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6
Cj4+Pj4+IE9uIDUvMjEvMTkgMTA6MjYgQU0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4+Pj4g
T24gMjAuMDUuMTkgYXQgMjA6MTIsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4+Pj4+
Pj4gICAgICAgIEFzIHRoaXMgaXMgbm93IFhlbiBhbmQgdG9vbHMgb25seSwgSSBhbSB3b25kZXJp
bmcgd2hldGhlciB0aGUgY2hlY2sgb24KPj4+Pj4+PiAgICAgICAgR05VX0MgaXMgc3RpbGwgbmVj
ZXNzYXJ5LiBJIGFtIGhhcHB5IHRvIHNlbmQgYSBmb2xsb3ctdXAgcGF0Y2ggKG9yIGZvbGQKPj4+
Pj4+PiAgICAgICAgaW4gdGhpcyBvbmUpIGlmIGl0IGNhbiBiZSByZW1vdmVkLgo+Pj4+Pj4KPj4+
Pj4+IEkgdGhpbmsgdGhpcyBzaG91bGQgYmUgZHJvcHBlZCBpZiBpdCBjYW4gYmUgd2l0aG91dCBi
cmVha2luZyBhbnkKPj4+Pj4+IHBhcnQgb2YgdGhlIGJ1aWxkLgo+Pj4+PiBUaGlzIGlzIGJlY2F1
c2UgYWxsIHRoZSB0b29scyBhcmUgcGFydCBvZiB4ZW4uZ2l0LCByaWdodD8KPj4+Pgo+Pj4+IFJp
Z2h0IC0gbm8tb25lIGVsc2UgaXMgc3VwcG9zZWQgdG8gZGVmaW5lIF9fWEVOX1RPT0xTX18sIG9y
Cj4+Pj4gaWYgYW55b25lIGRvZXMsIHRoZXkncmUgb24gdGhlaXIgb3duLgo+Pj4KPj4+IFRoYW5r
cyBmb3IgdGhlIGluZm9ybWF0aW9uLiBJIHdpbGwgZG8gYSBmdWxsIGJ1aWxkIGNoZWNrLgo+Pgo+
PiBJIHRob3VnaHQgYWJvdXQgdGhpcyBhZ2FpbiwgbG9uZyB0ZXJtIHRoZXJlIGFyZSBhbiBhdHRl
bXB0IHRvIGJ1aWxkIHhlbiB3aXRoCj4+IG90aGVyIGNvbXBpbGVyIG5vdCBuZWNlc3NhcmlseSBz
dXBwb3J0aW5nIEdOVSBDIGV4dGVuc2lvbi4KPj4gV2hpbGUgdGhpcyB3b3VsZCBwcm9iYWJseSBu
b3QgYmUgdGhlIG9ubHkgcGxhY2UgdGhhdCBuZWVkIHRvIGJlIHJld29ya2VkLCB3ZQo+PiB3b3Vs
ZCBoYXZlIHRvIHJldmVydCBwYXJ0IG9mIHRoaXMgY2hhbmdlLiBTbyBJIHdpbGwgbm90IGRyb3Ag
dGhlICNpZmRlZiBoZXJlLgo+IAo+IFdlbGwsIEkgZG9uJ3Qga25vdyBob3cgaXQgaXMgZm9yIEFy
bSwgYnV0IG9uIHg4NiB3ZSBhY3R1YWxseSB1c2UgdGhlCj4gImV4dGVuZGVkIiBuYW1pbmcgcXVp
dGUgZXh0ZW5zaXZlbHksIHNvIGJ1aWxkaW5nIHdpdGggYSBjb21waWxlcgo+IHRoYXQgZG9lc24n
dCBzdXBwb3J0IHRoaXMgZXh0ZW5zaW9uIGlzIG5vdCByZWFsbHkgYW4gb3B0aW9uIHRoZXJlLgoK
Rm9yIHRoZSBBcm0sIEkgdGhpbmsgb25seSBjcHVfdXNlcl9yZWdzIGlzIHVzaW5nICJleHRlbmRl
ZCIgbmFtaW5nLiBJdCBzaG91bGQgYmUgCnBvc3NpYmxlIHRvIHJlbW92ZSBpdCB3aXRob3V0IHRv
byBtdWNoIHRyb3VibGUgaGVyZS4KCkBBcnRlbSwgaXMgdGhlcmUgYW55IHJlc3RyaWN0aW9uIHRv
IHVzZSBhbm9ueW1vdXMgdW5pb24gaW4gZnVuY3Rpb25hbCBzYWZldHk/CgpDaGVlcnMsCgotLSAK
SnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

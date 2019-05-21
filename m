Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A00C724C0F
	for <lists+xen-devel@lfdr.de>; Tue, 21 May 2019 11:58:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hT1Ux-0002Kt-Dn; Tue, 21 May 2019 09:55:55 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YYEG=TV=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hT1Uv-0002Ko-Qx
 for xen-devel@lists.xenproject.org; Tue, 21 May 2019 09:55:53 +0000
X-Inumbo-ID: 9e368b8f-7bae-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 9e368b8f-7bae-11e9-8980-bc764e045a96;
 Tue, 21 May 2019 09:55:52 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BAAC2374;
 Tue, 21 May 2019 02:55:51 -0700 (PDT)
Received: from [10.37.13.11] (unknown [10.37.13.11])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7FD623F575;
 Tue, 21 May 2019 02:55:50 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>
References: <20190520181250.17404-1-julien.grall@arm.com>
 <5CE3C45A0200007800230E0E@prv1-mh.provo.novell.com>
 <1c7f43ce-7df2-24c9-ecb2-d8be1afebfa5@arm.com>
 <5CE3C8370200007800230E40@prv1-mh.provo.novell.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <f2f912ac-a1c6-1f07-f708-cf2935c0270f@arm.com>
Date: Tue, 21 May 2019 10:55:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CE3C8370200007800230E40@prv1-mh.provo.novell.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLAoKT24gNS8yMS8xOSAxMDo0MyBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24g
MjEuMDUuMTkgYXQgMTE6MzUsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4+IE9uIDUv
MjEvMTkgMTA6MjYgQU0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gT24gMjAuMDUuMTkgYXQg
MjA6MTIsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4+Pj4gICAgICAgQXMgdGhpcyBp
cyBub3cgWGVuIGFuZCB0b29scyBvbmx5LCBJIGFtIHdvbmRlcmluZyB3aGV0aGVyIHRoZSBjaGVj
ayBvbgo+Pj4+ICAgICAgIEdOVV9DIGlzIHN0aWxsIG5lY2Vzc2FyeS4gSSBhbSBoYXBweSB0byBz
ZW5kIGEgZm9sbG93LXVwIHBhdGNoIChvciBmb2xkCj4+Pj4gICAgICAgaW4gdGhpcyBvbmUpIGlm
IGl0IGNhbiBiZSByZW1vdmVkLgo+Pj4KPj4+IEkgdGhpbmsgdGhpcyBzaG91bGQgYmUgZHJvcHBl
ZCBpZiBpdCBjYW4gYmUgd2l0aG91dCBicmVha2luZyBhbnkKPj4+IHBhcnQgb2YgdGhlIGJ1aWxk
Lgo+PiBUaGlzIGlzIGJlY2F1c2UgYWxsIHRoZSB0b29scyBhcmUgcGFydCBvZiB4ZW4uZ2l0LCBy
aWdodD8KPiAKPiBSaWdodCAtIG5vLW9uZSBlbHNlIGlzIHN1cHBvc2VkIHRvIGRlZmluZSBfX1hF
Tl9UT09MU19fLCBvcgo+IGlmIGFueW9uZSBkb2VzLCB0aGV5J3JlIG9uIHRoZWlyIG93bi4KClRo
YW5rcyBmb3IgdGhlIGluZm9ybWF0aW9uLiBJIHdpbGwgZG8gYSBmdWxsIGJ1aWxkIGNoZWNrLgoK
PiAKPj4+PiAtLS0gYS94ZW4vaW5jbHVkZS9wdWJsaWMvYXJjaC1hcm0uaAo+Pj4+ICsrKyBiL3hl
bi9pbmNsdWRlL3B1YmxpYy9hcmNoLWFybS5oCj4+Pj4gQEAgLTE5Nyw2ICsxOTcsNyBAQAo+Pj4+
ICAgICAgICB9IHdoaWxlICggMCApCj4+Pj4gICAgI2RlZmluZSBzZXRfeGVuX2d1ZXN0X2hhbmRs
ZShobmQsIHZhbCkgc2V0X3hlbl9ndWVzdF9oYW5kbGVfcmF3KGhuZCwgdmFsKQo+Pj4+ICAgIAo+
Pj4+ICsjaWYgZGVmaW5lZChfX1hFTl9fKSB8fCBkZWZpbmVkKF9fWEVOX1RPT0xTX18pCj4+Pj4g
ICAgI2lmIGRlZmluZWQoX19HTlVDX18pICYmICFkZWZpbmVkKF9fU1RSSUNUX0FOU0lfXykKPj4+
PiAgICAvKiBBbm9ueW1vdXMgdW5pb24gaW5jbHVkZXMgYm90aCAzMi0gYW5kIDY0LWJpdCBuYW1l
cyAoZS5nLiwgcjAveDApLiAqLwo+Pj4+ICAgICMgZGVmaW5lIF9fREVDTF9SRUcobjY0LCBuMzIp
IHVuaW9uIHsgICAgICAgICAgXAo+Pj4+IEBAIC0yNzIsNiArMjczLDggQEAgREVGSU5FX1hFTl9H
VUVTVF9IQU5ETEUodmNwdV9ndWVzdF9jb3JlX3JlZ3NfdCk7Cj4+Pj4gICAgCj4+Pj4gICAgI3Vu
ZGVmIF9fREVDTF9SRUcKPj4+PiAgICAKPj4+PiArI2VuZGlmCj4+Pgo+Pj4gSWYgSSB3YXMgdGhl
IG1haW50YWluZXIgb2YgdGhpcyBjb2RlLCBJJ2QgYXNrIGZvciB0aGUgc3RydWN0IGRlY2xhcmF0
aW9uCj4+PiB0byBiZSBtb3ZlZCAoaW50byB0aGUgZXhpc3RpbmcgI2lmKSByYXRoZXIgdGhhbiBh
ZGRpbmcgYSAybmQgI2lmLgo+Pgo+PiBzLzJuZC8zcmQvIDspCj4+Cj4+IFRoZSByZWFzb24gSSBo
YXZlbid0IGRvbmUgdGhhdCBpcyBnaXQgd2lsbCBnZW5lcmF0ZSBhIGNvbXBsZXRlbHkKPj4gdW5y
ZWxhdGVkIGRpZmYuIFNvIGl0IG1ha2VzIHF1aXRlIGRpZmZpY3VsdCB0byB1bmRlcnN0YW5kIHRo
ZSBwdXJwb3NlIG9mCj4+IHRoZSBwYXRjaC4KPiAKPiBXZWxsLCBhcyBzYWlkIC0geW91J3JlIHRo
ZSBtYWludGFpbmVyLiBJIHdvdWxkbid0IGJlIGJvdGhlcmVkIG92ZXJseQo+IG11Y2ggYnkgYSBz
dHJhbmdlIGRpZmYgdGhhdCBtaWdodCByZXN1bHQuCgpJIHdpbGwgd2FpdCBvbiBTdGVmYW5vJ3Mg
aW5wdXQuCgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

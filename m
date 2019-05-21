Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C70F324BD3
	for <lists+xen-devel@lfdr.de>; Tue, 21 May 2019 11:40:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hT1Bj-0000Ra-D7; Tue, 21 May 2019 09:36:03 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YYEG=TV=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hT1Bi-0000RV-1v
 for xen-devel@lists.xenproject.org; Tue, 21 May 2019 09:36:02 +0000
X-Inumbo-ID: d7d10bd8-7bab-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id d7d10bd8-7bab-11e9-8980-bc764e045a96;
 Tue, 21 May 2019 09:36:00 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E6493374;
 Tue, 21 May 2019 02:35:59 -0700 (PDT)
Received: from [10.37.13.11] (unknown [10.37.13.11])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8839D3F575;
 Tue, 21 May 2019 02:35:58 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>
References: <20190520181250.17404-1-julien.grall@arm.com>
 <5CE3C45A0200007800230E0E@prv1-mh.provo.novell.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <1c7f43ce-7df2-24c9-ecb2-d8be1afebfa5@arm.com>
Date: Tue, 21 May 2019 10:35:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CE3C45A0200007800230E0E@prv1-mh.provo.novell.com>
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

SGkgSmFuLAoKT24gNS8yMS8xOSAxMDoyNiBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24g
MjAuMDUuMTkgYXQgMjA6MTIsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4+ICAgICAg
QXMgdGhpcyBpcyBub3cgWGVuIGFuZCB0b29scyBvbmx5LCBJIGFtIHdvbmRlcmluZyB3aGV0aGVy
IHRoZSBjaGVjayBvbgo+PiAgICAgIEdOVV9DIGlzIHN0aWxsIG5lY2Vzc2FyeS4gSSBhbSBoYXBw
eSB0byBzZW5kIGEgZm9sbG93LXVwIHBhdGNoIChvciBmb2xkCj4+ICAgICAgaW4gdGhpcyBvbmUp
IGlmIGl0IGNhbiBiZSByZW1vdmVkLgo+IAo+IEkgdGhpbmsgdGhpcyBzaG91bGQgYmUgZHJvcHBl
ZCBpZiBpdCBjYW4gYmUgd2l0aG91dCBicmVha2luZyBhbnkKPiBwYXJ0IG9mIHRoZSBidWlsZC4K
VGhpcyBpcyBiZWNhdXNlIGFsbCB0aGUgdG9vbHMgYXJlIHBhcnQgb2YgeGVuLmdpdCwgcmlnaHQ/
Cgo+PiAtLS0gYS94ZW4vaW5jbHVkZS9wdWJsaWMvYXJjaC1hcm0uaAo+PiArKysgYi94ZW4vaW5j
bHVkZS9wdWJsaWMvYXJjaC1hcm0uaAo+PiBAQCAtMTk3LDYgKzE5Nyw3IEBACj4+ICAgICAgIH0g
d2hpbGUgKCAwICkKPj4gICAjZGVmaW5lIHNldF94ZW5fZ3Vlc3RfaGFuZGxlKGhuZCwgdmFsKSBz
ZXRfeGVuX2d1ZXN0X2hhbmRsZV9yYXcoaG5kLCB2YWwpCj4+ICAgCj4+ICsjaWYgZGVmaW5lZChf
X1hFTl9fKSB8fCBkZWZpbmVkKF9fWEVOX1RPT0xTX18pCj4+ICAgI2lmIGRlZmluZWQoX19HTlVD
X18pICYmICFkZWZpbmVkKF9fU1RSSUNUX0FOU0lfXykKPj4gICAvKiBBbm9ueW1vdXMgdW5pb24g
aW5jbHVkZXMgYm90aCAzMi0gYW5kIDY0LWJpdCBuYW1lcyAoZS5nLiwgcjAveDApLiAqLwo+PiAg
ICMgZGVmaW5lIF9fREVDTF9SRUcobjY0LCBuMzIpIHVuaW9uIHsgICAgICAgICAgXAo+PiBAQCAt
MjcyLDYgKzI3Myw4IEBAIERFRklORV9YRU5fR1VFU1RfSEFORExFKHZjcHVfZ3Vlc3RfY29yZV9y
ZWdzX3QpOwo+PiAgIAo+PiAgICN1bmRlZiBfX0RFQ0xfUkVHCj4+ICAgCj4+ICsjZW5kaWYKPiAK
PiBJZiBJIHdhcyB0aGUgbWFpbnRhaW5lciBvZiB0aGlzIGNvZGUsIEknZCBhc2sgZm9yIHRoZSBz
dHJ1Y3QgZGVjbGFyYXRpb24KPiB0byBiZSBtb3ZlZCAoaW50byB0aGUgZXhpc3RpbmcgI2lmKSBy
YXRoZXIgdGhhbiBhZGRpbmcgYSAybmQgI2lmLgoKcy8ybmQvM3JkLyA7KQoKVGhlIHJlYXNvbiBJ
IGhhdmVuJ3QgZG9uZSB0aGF0IGlzIGdpdCB3aWxsIGdlbmVyYXRlIGEgY29tcGxldGVseSAKdW5y
ZWxhdGVkIGRpZmYuIFNvIGl0IG1ha2VzIHF1aXRlIGRpZmZpY3VsdCB0byB1bmRlcnN0YW5kIHRo
ZSBwdXJwb3NlIG9mIAp0aGUgcGF0Y2guCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

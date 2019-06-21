Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB5B4E309
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2019 11:16:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1heFca-0005G9-Ey; Fri, 21 Jun 2019 09:14:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xCuY=UU=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1heFcY-0005G4-CH
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2019 09:14:10 +0000
X-Inumbo-ID: eb40c6de-9404-11e9-9376-f7091f9c9e41
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id eb40c6de-9404-11e9-9376-f7091f9c9e41;
 Fri, 21 Jun 2019 09:14:05 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8DB4B142F;
 Fri, 21 Jun 2019 02:14:05 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 014A23F246;
 Fri, 21 Jun 2019 02:14:04 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <2B31D2BD02000066A2327079@prv1-mh.provo.novell.com>
 <5D09E4310200007800239852@prv1-mh.provo.novell.com>
 <60ff0360-50be-8545-45d8-799ef9fcb95b@arm.com>
 <5de0325f-0782-34c5-3118-5ac9a2fafcb9@arm.com>
 <alpine.DEB.2.21.1906190943500.2072@sstabellini-ThinkPad-T480s>
 <f1dbb360-1946-83c8-128e-caf179b5681d@arm.com>
 <5D0C9C440200007800239FC5@prv1-mh.provo.novell.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <87cf1036-c492-4126-0e3a-f0b839d32d39@arm.com>
Date: Fri, 21 Jun 2019 10:14:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <5D0C9C440200007800239FC5@prv1-mh.provo.novell.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Fwd: [xen-4.10-testing bisection] complete
 test-armhf-armhf-xl-arndale
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLAoKT24gMjEvMDYvMjAxOSAwOTo1OCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24g
MjAuMDYuMTkgYXQgMTk6MjQsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4+IEFjdHVh
bGx5IEkgbWF5IGhhdmUgZm91bmQgdGhlIGVycm9yLiBJIGZlZWwgcXVpdGUgYXNoYW1lZCBJIGRp
ZG4ndCBzcG90Cj4+IHRoaXMgZHVyaW5nIHJldmlldyBhbmQgd2hlbiB0aGUgYmlzZWN0b3IgZmlu
Z2VyZWQgaXQuCj4+Cj4+IHN0YWdpbmctNC4xMSBhbmQgc3RhZ2luZy40LjEyIGRpZG4ndCBoYXZl
IGdldF9jeWNsZXMgaW1wbGVtZW50ZWQgKGkuZSBpdAo+PiByZXR1cm5lZCAwKS4gRHVyaW5nIHRo
ZSBiYWNrcG9ydCwgZ2V0X2N5Y2xlcygpIGdvdCBzdWRkZW5seSBpbXBsZW1lbnRlZAo+PiAoYXNp
ZGUgdGhlIGlzYigpKSBzbyBpdCBub3cgcmV0dXJucyB0aGUgbnVtYmVyIG9mIGN5Y2xlcy4KPiAK
PiBTdGVmYW5vLCBob3cgY2FuIHRoaXMgYmUgYSB2YWxpZCBiYWNrcG9ydCB1bmRlciB0aGUgZ2l2
ZW4gdGl0bGU/IFRoZQo+IChpbW8pIG9ubHkgY29ycmVjdCB3YXkgb2YgYmFja3BvcnRpbmcgdGhh
dCBodW5rIHdvdWxkIGhhdmUgYmVlbiB0bwo+IHNpbXBseSBkcm9wIGl0LCBhZGRpbmcgaXNiKCkg
aW5zdGVhZCBvZiB0aGUgc3dpdGNoIHRvIGNhbGwgdGhlIGZ1bmN0aW9uCj4gaW4gdGhlIHR3byBv
dGhlciBwbGFjZXMuCj4gCj4gVG8gYm90aCBvZiB5b3U6IEhvdyBjZXJ0YWluIGFyZSB5b3UgdGhh
dCB0aGUgc3Vic2VxdWVudCB0eXBlCj4gY2hhbmdlIGlzIHJlYWxseSBhbGwgdGhhdCdzIG5lZWRl
ZCwgYW5kIHRoYXQgdGhlIHN1ZGRlbiBjaGFuZ2UgaW4KPiBiZWhhdmlvciBvZiBnZXRfY3ljbGVz
KCkgd29uJ3QgaGF2ZSBvdGhlciB1bmR1ZSBzaWRlIGVmZmVjdHM/CgpIZXJlIHRoZSBjdXJyZW50
IGNhbGxlcnM6Cgo0MnNoPiBhY2sgZ2V0X2N5Y2xlcwoKaW5jbHVkZS9hc20tYXJtL3RpbWUuaAox
MjpzdGF0aWMgaW5saW5lIGN5Y2xlc190IGdldF9jeWNsZXMgKHZvaWQpCgppbmNsdWRlL2FzbS14
ODYvdGltZS5oCjI5OnN0YXRpYyBpbmxpbmUgY3ljbGVzX3QgZ2V0X2N5Y2xlcyh2b2lkKQoKYXJj
aC9hcm0vdGltZS5jCjE1MjogICAgYm9vdF9jb3VudCA9IGdldF9jeWNsZXMoKTsKMTkzOiAgICB1
aW50NjRfdCB0aWNrcyA9IGdldF9jeWNsZXMoKSAtIGJvb3RfY291bnQ7CgphcmNoL3g4Ni9pcnEu
Ywo4OTg6ICAgICAgICB0c2NfaW4gPSB0Yl9pbml0X2RvbmUgPyBnZXRfY3ljbGVzKCkgOiAwOwo5
MDA6ICAgICAgICBUUkFDRV8zRChUUkNfSFdfSVJRX0hBTkRMRUQsIGlycSwgdHNjX2luLCBnZXRf
Y3ljbGVzKCkpOwo5MjE6ICAgICAgICB0c2NfaW4gPSB0Yl9pbml0X2RvbmUgPyBnZXRfY3ljbGVz
KCkgOiAwOwo5MjM6ICAgICAgICBUUkFDRV8zRChUUkNfSFdfSVJRX0hBTkRMRUQsIGlycSwgdHNj
X2luLCBnZXRfY3ljbGVzKCkpOwoKY29tbW9uL3RtZW0uYwoyNzU6ICAgIHBncC0+dGltZXN0YW1w
ID0gZ2V0X2N5Y2xlcygpOwozODk6ICAgIGxpZmUgPSBnZXRfY3ljbGVzKCkgLSBwZ3AtPnRpbWVz
dGFtcDsKCmNvbW1vbi9rZXloYW5kbGVyLmMKMzg5OiAgICBwZXJfY3B1KHJlYWRfY3ljbGVzX3Rp
bWUsIGNwdSkgPSBnZXRfY3ljbGVzKCk7CjQxMjogICAgcGVyX2NwdShyZWFkX2N5Y2xlc190aW1l
LCBjcHUpID0gZ2V0X2N5Y2xlcygpOwoKY29tbW9uL3RyYWNlLmMKNTk1OiAgICAgICAgdTY0IHRz
YyA9ICh1NjQpZ2V0X2N5Y2xlcygpOwo3Nzg6ICAgICAgICAgICAgdGhpc19jcHUobG9zdF9yZWNv
cmRzX2ZpcnN0X3RzYyk9KHU2NClnZXRfY3ljbGVzKCk7CgpUaGUgdHdvIGNhbGxlcnMgd2UgY2Fy
ZSB0aGUgbW9zdCBhcmUgaW4gYXJjaC9hcm0vdGltZS5jLiBUaGV5IHdlcmUgYWRkZWQgd2l0aCAK
dGhlIHBhdGNoIGJhY2twb3J0ZWQgYW5kIEkga25vdyB0aGlzIGlzIGZpbmUgYmVjYXVzZSB0aGUg
dmFsdWUgYmVmb3JlIHdhcyA2NC1iaXQgCmFzIHdlbGwuIFNvIHRoZXJlIGFyZSBubyBjaGFuZ2Ug
ZXhjZXB0IGZvciB0aGUgaXNiKCkgaGVyZS4KCkkgYW0gbm90IHN1cmUgYW55b25lIGV2ZXIgdGVz
dGVkL3VzZWQgdG1lbS5jIG9uIEFybSAoYW5kIGl0IGlzIGRyb3BwZWQgb24gcmVjZW50IApyZWxl
YXNlKS4gU28gdGhhdCdzIG5vdCBnb2luZyB0byBtYWtlIG11Y2ggZGlmZmVyZW5jZS4KCmNvbW1v
bi9rZXloYW5kbGVyLmMsIHRoaXMgaXMgbW9zdGx5IGZvciBkZWJ1Z2dpbmcuCgpjb21tb24vdHJh
Y2UuYyBkb2VzIG5vdCBtYXR0ZXIgYXMgdHJhY2luZyBkb2VzIG5vdCB3b3JrIG9uIEFybSBiZWZv
cmUgNC4xMi4KClNvIEkgYW0gcHJldHR5IGNvbmZpZGVudCB0aGF0IHRoaXMgY2hhbmdlIHdpbGwg
bm90IHByb3Zva2UgbW9yZSBzaWRlIGVmZmVjdHMgCnRoYW4gYW4gaXNiKCkgZGlyZWN0bHkgaW4g
dGhlIGNvZGUuCgpDaGVlcnMsCgotLQpKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

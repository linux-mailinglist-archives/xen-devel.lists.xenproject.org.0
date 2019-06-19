Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 595224C336
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2019 23:43:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdiJk-0002Rb-NS; Wed, 19 Jun 2019 21:40:32 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hb7b=US=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hdiJj-0002RV-RO
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2019 21:40:31 +0000
X-Inumbo-ID: dc253c77-92da-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id dc253c77-92da-11e9-8980-bc764e045a96;
 Wed, 19 Jun 2019 21:40:30 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 44366344;
 Wed, 19 Jun 2019 14:40:30 -0700 (PDT)
Received: from [10.37.8.153] (unknown [10.37.8.153])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 494DE3F738;
 Wed, 19 Jun 2019 14:40:29 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.21.1906191422170.2072@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <a29aa125-bb95-d178-0f74-0804d8ad6f91@arm.com>
Date: Wed, 19 Jun 2019 22:40:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1906191422170.2072@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/arm: fix build after 2e35cdf
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
Cc: andrew.cooper3@citrix.com, Volodymyr_Babchuk@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKClRpdGxlOiBZb3Ugc2hvdWxkIGF0IGxlYXN0IG1lbnRpb24gdGhpcyBpcyBm
b3Igb3AtdGVlLgoKQWxzbywgbW9zdGx5IGxpa2VseSB0aGUgc2hhMSBpcyB0b28gc21hbGwgYW5k
IGxpa2VseSB0byBtYXRjaCBtdWx0aXBsZSAKY29tbWl0IGluIHRoZSBmdXR1cmUuIFNvIHlvdSB3
YW50IHRvIHNwZWNpZnkgdGhlIHRpdGxlIG9mIHRoZSBjb21taXQuCgpPbiA2LzE5LzE5IDEwOjI0
IFBNLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gT3B0ZWUgYnJlYWtzIHRoZSBidWlsZCB3
aXRoOgo+IAo+IG9wdGVlLmM6IEluIGZ1bmN0aW9uIOKAmHRyYW5zbGF0ZV9ub25jb250aWcuaXNy
YS404oCZOgo+IG9wdGVlLmM6NzQzOjM4OiBlcnJvcjog4oCYeGVuX2RhdGHigJkgbWF5IGJlIHVz
ZWQgdW5pbml0aWFsaXplZCBpbiB0aGlzIGZ1bmN0aW9uIFstV2Vycm9yPW1heWJlLXVuaW5pdGlh
bGl6ZWRdCj4gICAgICAgICAgICAgICB4ZW5fZGF0YS0+bmV4dF9wYWdlX2RhdGEgPSBwYWdlX3Rv
X21hZGRyKHhlbl9wZ3MgKyAxKTsKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBeCj4gb3B0ZWUuYzo3MzI6NzE6IGVycm9yOiDigJhndWVzdF9kYXRh4oCZIG1heSBiZSB1
c2VkIHVuaW5pdGlhbGl6ZWQgaW4gdGhpcyBmdW5jdGlvbiBbLVdlcnJvcj1tYXliZS11bmluaXRp
YWxpemVkXQo+ICAgICAgICAgICBwYWdlID0gZ2V0X2RvbWFpbl9yYW1fcGFnZShnYWRkcl90b19n
Zm4oZ3Vlc3RfZGF0YS0+cGFnZXNfbGlzdFtpZHhdKSk7Cj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXgo+IG9w
dGVlLmM6NzUwOjIxOiBlcnJvcjog4oCYZ3Vlc3RfcGfigJkgbWF5IGJlIHVzZWQgdW5pbml0aWFs
aXplZCBpbiB0aGlzIGZ1bmN0aW9uIFstV2Vycm9yPW1heWJlLXVuaW5pdGlhbGl6ZWRdCj4gICAg
ICAgICAgICAgICBwdXRfcGFnZShndWVzdF9wZyk7Cj4gICAgICAgICAgICAgICAgICAgICAgIF4K
PiBjYzE6IGFsbCB3YXJuaW5ncyBiZWluZyB0cmVhdGVkIGFzIGVycm9ycwo+IAo+IEZpeCBpdCBi
eSBpbml0aWFsaXppbmcgeGVuX2RhdGEsIGd1ZXN0X2RhdGEsIGd1ZXN0X3BnIHRvIE5VTEwuIEFs
c28gc2V0Cj4geGVuX3BncyB0byBOVUxMIGZvciBjb25zaXN0ZW5jeS4KCldpdGhvdXQgbW9yZSBl
eHBsYW5hdGlvbiBJIHRoaW5rIHRoaXMgaXMgYW4gdW53aXNlIGNob2ljZS4gSWYgR0NDIHRoaW5r
cyAKaXQgaXMgZ29pbmcgdG8gYmUgdXNlZCB1bml0aWFsaXplZCwgdGhlbiBtb3N0bHkgbGlrZWx5
IHlvdSBzaWxlbnQgYW4gCmVycm9yIHRoYXQgY291bGQgZW5kIHVwIHRvIGRlcmVmZXJlbmNlIE5V
TEwuCgpBbHNvLCBzZXR0aW5nIHhlbl9wZ3MgZm9yIGNvbnNpc3RlbmN5IHdpbGwgb25seSBkZWZl
YXQgdGhlIGNvbXBpbGVyLiAKTGVhZGluZyB0byBkZXJlZmVyZW5jaW5nIE5VTEwgYW5kIGNyYXNo
IFhlbi4uLgoKRm9yIHhlbl9wZ3MsIHRoaXMgc2hvdWxkIGRlZmluaXRlbHkgbm90IGJlIE5VTEwu
IEZvciB0aGUgdHdvIG90aGVycywgeW91IApuZWVkIHRvIGV4cGxhaW4gd2h5IHRoaXMgaXMgZmlu
ZSAoaWYgdGhpcyBpcyBqdXN0IGJlY2F1c2UgdGhlIGNvbXBpbGVyIApjYW4ndCBmaW5kIHRoZSBy
ZWFzb24sIHRoZW4geW91IHNob3VsZCBhZGQgYSBjb21tZW50IGluIHRoZSBjb2RlIHRvIApleHBs
YWluIGl0KS4KCj4gCj4gU2lnbmVkLW9mZi1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzdGVmYW5v
c0B4aWxpbnguY29tPgo+IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vdGVlL29wdGVlLmMg
Yi94ZW4vYXJjaC9hcm0vdGVlL29wdGVlLmMKPiBpbmRleCAyOGQzNDM2MGZjLi40ODI1Y2M1NDEw
IDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL2FybS90ZWUvb3B0ZWUuYwo+ICsrKyBiL3hlbi9hcmNo
L2FybS90ZWUvb3B0ZWUuYwo+IEBAIC02NjMsNyArNjYzLDcgQEAgc3RhdGljIGludCB0cmFuc2xh
dGVfbm9uY29udGlnKHN0cnVjdCBvcHRlZV9kb21haW4gKmN0eCwKPiAgICAgICB1bnNpZ25lZCBp
bnQgb3JkZXI7Cj4gICAgICAgdW5zaWduZWQgaW50IGlkeCA9IDA7Cj4gICAgICAgZ2ZuX3QgZ2Zu
Owo+IC0gICAgc3RydWN0IHBhZ2VfaW5mbyAqZ3Vlc3RfcGcsICp4ZW5fcGdzOwo+ICsgICAgc3Ry
dWN0IHBhZ2VfaW5mbyAqZ3Vlc3RfcGcgPSBOVUxMLCAqeGVuX3BncyA9IE5VTEw7Cj4gICAgICAg
c3RydWN0IG9wdGVlX3NobV9idWYgKm9wdGVlX3NobV9idWY7Cj4gICAgICAgLyoKPiAgICAgICAg
KiBUaGlzIGlzIG1lbW9yeSBsYXlvdXQgZm9yIHBhZ2UgbGlzdC4gQmFzaWNhbGx5IGxpc3QgY29u
c2lzdHMgb2YgNGsgcGFnZXMsCj4gQEAgLTY3NSw3ICs2NzUsNyBAQCBzdGF0aWMgaW50IHRyYW5z
bGF0ZV9ub25jb250aWcoc3RydWN0IG9wdGVlX2RvbWFpbiAqY3R4LAo+ICAgICAgIHN0cnVjdCB7
Cj4gICAgICAgICAgIHVpbnQ2NF90IHBhZ2VzX2xpc3RbUEFHRUxJU1RfRU5UUklFU19QRVJfUEFH
RV07Cj4gICAgICAgICAgIHVpbnQ2NF90IG5leHRfcGFnZV9kYXRhOwo+IC0gICAgfSAqZ3Vlc3Rf
ZGF0YSwgKnhlbl9kYXRhOwo+ICsgICAgfSAqZ3Vlc3RfZGF0YSA9IE5VTEwsICp4ZW5fZGF0YSA9
IE5VTEw7Cj4gICAKPiAgICAgICAvKiBPZmZzZXQgb2YgdXNlciBidWZmZXIgd2l0aGluZyBPUFRF
RV9NU0dfTk9OQ09OVElHX1BBR0VfU0laRS1zaXplZCBwYWdlICovCj4gICAgICAgb2Zmc2V0ID0g
cGFyYW0tPnUudG1lbS5idWZfcHRyICYgKE9QVEVFX01TR19OT05DT05USUdfUEFHRV9TSVpFIC0g
MSk7Cj4gCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 935EF83E13
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 02:01:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hv9L0-0001xM-7n; Tue, 06 Aug 2019 23:57:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/mMd=WC=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hv9Ky-0001xH-Nz
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2019 23:57:52 +0000
X-Inumbo-ID: ffc4b9a6-b8a5-11e9-8580-d3636c36d4a1
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ffc4b9a6-b8a5-11e9-8580-d3636c36d4a1;
 Tue, 06 Aug 2019 23:57:51 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 982B320663;
 Tue,  6 Aug 2019 23:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565135870;
 bh=avAilBG9fEfYf8c8jjdWZLMswz+xwKXu/XSkGryyBWE=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=A5ncaxhUYUGm1vHzjSV79ItFXNqW6K/K3YZDXVM72VCI7G+/PUxXLiOqk3lRZH/+S
 M/MuDHP/4CgmZVzPcDjFfreguQOYVKmaVSgcv2YJxiZyRvxRmscFR0mOvQSLyyArJf
 3gN9A5aut+A8ES8GXE06M8JVtxiP7n6cuf7YWjZM=
Date: Tue, 6 Aug 2019 16:57:50 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <JBeulich@suse.com>
In-Reply-To: <5D09E8CB020000780023987F@prv1-mh.provo.novell.com>
Message-ID: <alpine.DEB.2.21.1908061644200.2451@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1906181618130.2072@sstabellini-ThinkPad-T480s>
 <20190618232019.26425-2-sstabellini@kernel.org>
 <5D09E8CB020000780023987F@prv1-mh.provo.novell.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v3 2/5] xen: extend
 XEN_DOMCTL_memory_mapping to handle memory policy
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
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stefano Stabellini <stefanos@xilinx.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCAxOSBKdW4gMjAxOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPj4+IE9uIDE5LjA2LjE5
IGF0IDAxOjIwLCA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiAtLS0gYS90b29s
cy9saWJ4Yy94Y19kb21haW4uYwo+ID4gKysrIGIvdG9vbHMvbGlieGMveGNfZG9tYWluLmMKPiA+
IEBAIC0yMDcwLDYgKzIwNzAsNyBAQCBpbnQgeGNfZG9tYWluX21lbW9yeV9tYXBwaW5nKAo+ID4g
ICAgICBkb21jdGwuY21kID0gWEVOX0RPTUNUTF9tZW1vcnlfbWFwcGluZzsKPiA+ICAgICAgZG9t
Y3RsLmRvbWFpbiA9IGRvbWlkOwo+ID4gICAgICBkb21jdGwudS5tZW1vcnlfbWFwcGluZy5hZGRf
bWFwcGluZyA9IGFkZF9tYXBwaW5nOwo+ID4gKyAgICBkb21jdGwudS5tZW1vcnlfbWFwcGluZy5t
ZW1vcnlfcG9saWN5ID0gMDsKPiAKPiBXaHkgbm90IE1FTU9SWV9QT0xJQ1lfREVGQVVMVD8KCk9L
CgoKPiA+IC0tLSBhL3hlbi9jb21tb24vZG9tY3RsLmMKPiA+ICsrKyBiL3hlbi9jb21tb24vZG9t
Y3RsLmMKPiA+IEBAIC05MjgsNiArOTI4LDcgQEAgbG9uZyBkb19kb21jdGwoWEVOX0dVRVNUX0hB
TkRMRV9QQVJBTSh4ZW5fZG9tY3RsX3QpIHVfZG9tY3RsKQo+ID4gICAgICAgICAgdW5zaWduZWQg
bG9uZyBtZm5fZW5kID0gbWZuICsgbnJfbWZucyAtIDE7Cj4gPiAgICAgICAgICBpbnQgYWRkID0g
b3AtPnUubWVtb3J5X21hcHBpbmcuYWRkX21hcHBpbmc7Cj4gPiAgICAgICAgICBwMm1fdHlwZV90
IHAybXQ7Cj4gPiArICAgICAgICB1aW50MzJfdCBtZW1vcnlfcG9saWN5ID0gb3AtPnUubWVtb3J5
X21hcHBpbmcubWVtb3J5X3BvbGljeTsKPiAKPiBJIGNhbid0IHNlZSB0aGUgbmVlZCBmb3IgYSBm
aXhlZC13aWR0aCB0eXBlIGhlcmUuCgpPSwoKCj4gPiBAQCAtOTU4LDkgKzk1OSwyOCBAQCBsb25n
IGRvX2RvbWN0bChYRU5fR1VFU1RfSEFORExFX1BBUkFNKHhlbl9kb21jdGxfdCkgdV9kb21jdGwp
Cj4gPiAgICAgICAgICBpZiAoIGFkZCApCj4gPiAgICAgICAgICB7Cj4gPiAgICAgICAgICAgICAg
cHJpbnRrKFhFTkxPR19HX0RFQlVHCj4gPiAtICAgICAgICAgICAgICAgICAgICJtZW1vcnlfbWFw
OmFkZDogZG9tJWQgZ2ZuPSVseCBtZm49JWx4IG5yPSVseFxuIiwKPiA+IC0gICAgICAgICAgICAg
ICAgICAgZC0+ZG9tYWluX2lkLCBnZm4sIG1mbiwgbnJfbWZucyk7Cj4gPiArICAgICAgICAgICAg
ICAgICAgICJtZW1vcnlfbWFwOmFkZDogZG9tJWQgZ2ZuPSVseCBtZm49JWx4IG5yPSVseCBjYWNo
ZT0ldVxuIiwKPiA+ICsgICAgICAgICAgICAgICAgICAgZC0+ZG9tYWluX2lkLCBnZm4sIG1mbiwg
bnJfbWZucywgbWVtb3J5X3BvbGljeSk7Cj4gCj4gV2h5ICJjYWNoZT0iIHdoZW4gaXQncyBhICJw
b2xpY3kiIHZhbHVlPwoKT0sKCgo+ID4gKyAgICAgICAgICAgIHN3aXRjaCAoIG1lbW9yeV9wb2xp
Y3kgKQo+ID4gKyAgICAgICAgICAgIHsKPiA+ICsjaWZkZWYgQ09ORklHX0FSTQo+ID4gKyAgICAg
ICAgICAgICAgICBjYXNlIE1FTU9SWV9QT0xJQ1lfQVJNX01FTV9XQjoKPiA+ICsgICAgICAgICAg
ICAgICAgICAgIHAybXQgPSBwMm1fbW1pb19kaXJlY3RfYzsKPiA+ICsgICAgICAgICAgICAgICAg
ICAgIGJyZWFrOwo+ID4gKyAgICAgICAgICAgICAgICBjYXNlIE1FTU9SWV9QT0xJQ1lfQVJNX0RF
Vl9uR25SRToKPiA+ICsgICAgICAgICAgICAgICAgICAgIHAybXQgPSBwMm1fbW1pb19kaXJlY3Rf
ZGV2Owo+ID4gKyAgICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gPiArI2VuZGlmCj4gPiArI2lm
ZGVmIENPTkZJR19YODYKPiA+ICsgICAgICAgICAgICAgICAgY2FzZSBNRU1PUllfUE9MSUNZX1g4
Nl9VQ19NSU5VUzoKPiAKPiBGVFIgLSBJIGNvdWxkIGNlcnRhaW5seSBsaXZlIHdpdGggdGhpcyBi
ZWNvbWluZyBNRU1PUllfUE9MSUNZX0RFRkFVTFQKPiBmb3Igbm93LCBpZiB0aGF0J3MgcmVhbGx5
IHdoYXQgQW5kcmV3IHByZWZlcnMgZm9yIHg4Ni4KCkFsbCByaWdodCwgSSdsbCByZW1vdmUgTUVN
T1JZX1BPTElDWV9YODZfVUNfTUlOVVMgdGhlbi4KCgo+ID4gLS0tIGEveGVuL2luY2x1ZGUvcHVi
bGljL2RvbWN0bC5oCj4gPiArKysgYi94ZW4vaW5jbHVkZS9wdWJsaWMvZG9tY3RsLmgKPiA+IEBA
IC01NzEsMTIgKzU3MSwzMyBAQCBzdHJ1Y3QgeGVuX2RvbWN0bF9iaW5kX3B0X2lycSB7Cj4gPiAg
Ki8KPiA+ICAjZGVmaW5lIERQQ0lfQUREX01BUFBJTkcgICAgICAgICAxCj4gPiAgI2RlZmluZSBE
UENJX1JFTU9WRV9NQVBQSU5HICAgICAgMAo+ID4gKy8qCj4gPiArICogRGVmYXVsdCBtZW1vcnkg
cG9saWN5LiBDb3JyZXNwb25kcyB0bzoKPiA+ICsgKiBBcm06IE1FTU9SWV9QT0xJQ1lfQVJNX0RF
Vl9uR25SRQo+ID4gKyAqIHg4NjogTUVNT1JZX1BPTElDWV9YODZfVUNfTUlOVVMKPiA+ICsgKi8K
PiA+ICsjZGVmaW5lIE1FTU9SWV9QT0xJQ1lfREVGQVVMVCAgICAgICAgIDAKPiA+ICsjaWYgZGVm
aW5lZChfX2kzODZfXykgfHwgZGVmaW5lZChfX3g4Nl82NF9fKQo+ID4gKy8qIHg4NiBvbmx5LiBN
ZW1vcnkgdHlwZSBVTkNBQ0hBQkxFICovCj4gPiArIyBkZWZpbmUgTUVNT1JZX1BPTElDWV9YODZf
VUNfTUlOVVMgICAgMAo+ID4gKyNlbGlmIGRlZmluZWQoX19hcm1fXykgfHwgZGVmaW5lZCAoX19h
YXJjaDY0X18pCj4gPiArLyogQXJtIG9ubHkuIE91dGVyIFNoYXJlYWJsZSwgRGV2aWNlLW5HblJF
IG1lbW9yeSAoRGV2aWNlIE1lbW9yeSBvbiBBcm12NykgCj4gPiAqLwo+ID4gKyMgZGVmaW5lIE1F
TU9SWV9QT0xJQ1lfQVJNX0RFVl9uR25SRSAgICAgIDAKPiA+ICsvKiBBcm0gb25seS4gT3V0ZXIg
U2hhcmVhYmxlLCBPdXRlci9Jbm5lciBXcml0ZS1CYWNrIENhY2hlYWJsZSBtZW1vcnkgKi8KPiA+
ICsjIGRlZmluZSBNRU1PUllfUE9MSUNZX0FSTV9NRU1fV0IgICAgICAgICAxCj4gPiArLyoKPiA+
ICsgKiBPbiBBUk0sIE1FTU9SWV9QT0xJQ1kgc2VsZWN0cyB0aGUgc3RhZ2UtMiBtZW1vcnkgYXR0
cmlidXRlcywgYnV0IG5vdGUKPiAKPiBGdXJ0aGVyIHVwIGl0J3MgQXJtIC0gd2h5IGFsbCB1cHBl
ciBjYXNlIGhlcmU/CgpJIGZpeGVkIGl0CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs

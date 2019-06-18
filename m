Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C53B49D97
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2019 11:40:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdAYZ-0007pD-Ry; Tue, 18 Jun 2019 09:37:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=/6v3=UR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hdAYY-0007p7-Ok
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2019 09:37:34 +0000
X-Inumbo-ID: b129c126-91ac-11e9-8252-ffa67c0d7de9
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b129c126-91ac-11e9-8252-ffa67c0d7de9;
 Tue, 18 Jun 2019 09:37:31 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 18 Jun 2019 03:37:30 -0600
Message-Id: <5D08B0D802000078002392C5@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Tue, 18 Jun 2019 03:37:28 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Brian Woods" <brian.woods@amd.com>
References: <5D024C500200007800237DD8@prv1-mh.provo.novell.com>
 <5D024E170200007800237DFD@prv1-mh.provo.novell.com>
 <20190617190712.GA11864@amd.com>
In-Reply-To: <20190617190712.GA11864@amd.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 1/9] AMD/IOMMU: use bit field for extended
 feature register
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
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDE3LjA2LjE5IGF0IDIxOjA3LCA8QnJpYW4uV29vZHNAYW1kLmNvbT4gd3JvdGU6Cj4g
T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMDc6MjI6MzFBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL3N2bS9hbWQtaW9tbXUtZGVmcy5o
Cj4+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL3N2bS9hbWQtaW9tbXUtZGVmcy5oCj4+
IEBAIC0zNDYsMjYgKzM0Niw1NyBAQCBzdHJ1Y3QgYW1kX2lvbW11X2R0ZSB7Cj4+ICAjZGVmaW5l
IElPTU1VX0VYQ0xVU0lPTl9MSU1JVF9ISUdIX01BU0sJCTB4RkZGRkZGRkYKPj4gICNkZWZpbmUg
SU9NTVVfRVhDTFVTSU9OX0xJTUlUX0hJR0hfU0hJRlQJMAo+PiAgCj4+IC0vKiBFeHRlbmRlZCBG
ZWF0dXJlIFJlZ2lzdGVyKi8KPj4gKy8qIEV4dGVuZGVkIEZlYXR1cmUgUmVnaXN0ZXIgKi8KPj4g
ICNkZWZpbmUgSU9NTVVfRVhUX0ZFQVRVUkVfTU1JT19PRkZTRVQgICAgICAgICAgICAgICAgICAg
MHgzMAo+PiAtI2RlZmluZSBJT01NVV9FWFRfRkVBVFVSRV9QUkVGU1VQX1NISUZUICAgICAgICAg
ICAgICAgICAweDAKPj4gLSNkZWZpbmUgSU9NTVVfRVhUX0ZFQVRVUkVfUFBSU1VQX1NISUZUICAg
ICAgICAgICAgICAgICAgMHgxCj4+IC0jZGVmaW5lIElPTU1VX0VYVF9GRUFUVVJFX1hUU1VQX1NI
SUZUICAgICAgICAgICAgICAgICAgIDB4Mgo+PiAtI2RlZmluZSBJT01NVV9FWFRfRkVBVFVSRV9O
WFNVUF9TSElGVCAgICAgICAgICAgICAgICAgICAweDMKPj4gLSNkZWZpbmUgSU9NTVVfRVhUX0ZF
QVRVUkVfR1RTVVBfU0hJRlQgICAgICAgICAgICAgICAgICAgMHg0Cj4+IC0jZGVmaW5lIElPTU1V
X0VYVF9GRUFUVVJFX0lBU1VQX1NISUZUICAgICAgICAgICAgICAgICAgIDB4Ngo+PiAtI2RlZmlu
ZSBJT01NVV9FWFRfRkVBVFVSRV9HQVNVUF9TSElGVCAgICAgICAgICAgICAgICAgICAweDcKPj4g
LSNkZWZpbmUgSU9NTVVfRVhUX0ZFQVRVUkVfSEVTVVBfU0hJRlQgICAgICAgICAgICAgICAgICAg
MHg4Cj4+IC0jZGVmaW5lIElPTU1VX0VYVF9GRUFUVVJFX1BDU1VQX1NISUZUICAgICAgICAgICAg
ICAgICAgIDB4OQo+PiAtI2RlZmluZSBJT01NVV9FWFRfRkVBVFVSRV9IQVRTX1NISUZUICAgICAg
ICAgICAgICAgICAgICAweDEwCj4+IC0jZGVmaW5lIElPTU1VX0VYVF9GRUFUVVJFX0hBVFNfTUFT
SyAgICAgICAgICAgICAgICAgICAgIDB4MDAwMDBDMDAKPj4gLSNkZWZpbmUgSU9NTVVfRVhUX0ZF
QVRVUkVfR0FUU19TSElGVCAgICAgICAgICAgICAgICAgICAgMHgxMgo+PiAtI2RlZmluZSBJT01N
VV9FWFRfRkVBVFVSRV9HQVRTX01BU0sgICAgICAgICAgICAgICAgICAgICAweDAwMDAzMDAwCj4+
IC0jZGVmaW5lIElPTU1VX0VYVF9GRUFUVVJFX0dMWFNVUF9TSElGVCAgICAgICAgICAgICAgICAg
IDB4MTQKPj4gLSNkZWZpbmUgSU9NTVVfRVhUX0ZFQVRVUkVfR0xYU1VQX01BU0sgICAgICAgICAg
ICAgICAgICAgMHgwMDAwQzAwMAo+PiAgCj4+IC0jZGVmaW5lIElPTU1VX0VYVF9GRUFUVVJFX1BB
U01BWF9TSElGVCAgICAgICAgICAgICAgICAgIDB4MAo+PiAtI2RlZmluZSBJT01NVV9FWFRfRkVB
VFVSRV9QQVNNQVhfTUFTSyAgICAgICAgICAgICAgICAgICAweDAwMDAwMDFGCj4+ICt1bmlvbiBh
bWRfaW9tbXVfZXh0X2ZlYXR1cmVzIHsKPj4gKyAgICB1aW50NjRfdCByYXc7Cj4+ICsgICAgc3Ry
dWN0IHsKPj4gKyAgICAgICAgdW5zaWduZWQgaW50IHByZWZfc3VwOjE7Cj4+ICsgICAgICAgIHVu
c2lnbmVkIGludCBwcHJfc3VwOjE7Cj4+ICsgICAgICAgIHVuc2lnbmVkIGludCB4dF9zdXA6MTsK
Pj4gKyAgICAgICAgdW5zaWduZWQgaW50IG54X3N1cDoxOwo+PiArICAgICAgICB1bnNpZ25lZCBp
bnQgZ3Rfc3VwOjE7Cj4+ICsgICAgICAgIHVuc2lnbmVkIGludCBnYXBwaV9zdXA6MTsKPj4gKyAg
ICAgICAgdW5zaWduZWQgaW50IGlhX3N1cDoxOwo+PiArICAgICAgICB1bnNpZ25lZCBpbnQgZ2Ff
c3VwOjE7Cj4+ICsgICAgICAgIHVuc2lnbmVkIGludCBoZV9zdXA6MTsKPj4gKyAgICAgICAgdW5z
aWduZWQgaW50IHBjX3N1cDoxOwo+PiArICAgICAgICB1bnNpZ25lZCBpbnQgaGF0czoyOwo+PiAr
ICAgICAgICB1bnNpZ25lZCBpbnQgZ2F0czoyOwo+PiArICAgICAgICB1bnNpZ25lZCBpbnQgZ2x4
X3N1cDoyOwo+PiArICAgICAgICB1bnNpZ25lZCBpbnQgc21pZl9zdXA6MjsKPj4gKyAgICAgICAg
dW5zaWduZWQgaW50IHNtaWZfcmM6MzsKPj4gKyAgICAgICAgdW5zaWduZWQgaW50IGdhbV9zdXA6
MzsKPj4gKyAgICAgICAgdW5zaWduZWQgaW50IGR1YWxfcHByX2xvZ19zdXA6MjsKPj4gKyAgICAg
ICAgdW5zaWduZWQgaW50IDoyOwo+PiArICAgICAgICB1bnNpZ25lZCBpbnQgZHVhbF9ldmVudF9s
b2dfc3VwOjI7Cj4gCj4+ICsgICAgICAgIHVuc2lnbmVkIGludCBzYXRfc3VwOjE7Cj4+ICsgICAg
ICAgIHVuc2lnbmVkIGludCA6MTsKPiBJIHRoaW5rIHRoZXNlIG1pZ2h0IGJlIGZsaXBwZWQuCgpP
aCwgaW5kZWVkLiBBbmQgSSd2ZSBhbHNvIG9taXR0ZWQgYW4gJ3MnIGZyb20gdGhlIG5hbWUuIFRo
YW5rcyBmb3IKbm90aWNpbmcuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==

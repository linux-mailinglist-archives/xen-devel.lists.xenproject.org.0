Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D7E4B360
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2019 09:51:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdVKf-00031R-Bj; Wed, 19 Jun 2019 07:48:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=tFry=US=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hdVKd-00031M-IR
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2019 07:48:35 +0000
X-Inumbo-ID: a1418982-9266-11e9-9df7-df78e9cfecf6
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a1418982-9266-11e9-9df7-df78e9cfecf6;
 Wed, 19 Jun 2019 07:48:30 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 19 Jun 2019 01:48:29 -0600
Message-Id: <5D09E8CB020000780023987F@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Wed, 19 Jun 2019 01:48:27 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Stefano Stabellini" <sstabellini@kernel.org>
References: <alpine.DEB.2.21.1906181618130.2072@sstabellini-ThinkPad-T480s>
 <20190618232019.26425-2-sstabellini@kernel.org>
In-Reply-To: <20190618232019.26425-2-sstabellini@kernel.org>
Mime-Version: 1.0
Content-Disposition: inline
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
 Julien Grall <julien.grall@arm.com>, Stefano Stabellini <stefanos@xilinx.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDE5LjA2LjE5IGF0IDAxOjIwLCA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6
Cj4gLS0tIGEvdG9vbHMvbGlieGMveGNfZG9tYWluLmMKPiArKysgYi90b29scy9saWJ4Yy94Y19k
b21haW4uYwo+IEBAIC0yMDcwLDYgKzIwNzAsNyBAQCBpbnQgeGNfZG9tYWluX21lbW9yeV9tYXBw
aW5nKAo+ICAgICAgZG9tY3RsLmNtZCA9IFhFTl9ET01DVExfbWVtb3J5X21hcHBpbmc7Cj4gICAg
ICBkb21jdGwuZG9tYWluID0gZG9taWQ7Cj4gICAgICBkb21jdGwudS5tZW1vcnlfbWFwcGluZy5h
ZGRfbWFwcGluZyA9IGFkZF9tYXBwaW5nOwo+ICsgICAgZG9tY3RsLnUubWVtb3J5X21hcHBpbmcu
bWVtb3J5X3BvbGljeSA9IDA7CgpXaHkgbm90IE1FTU9SWV9QT0xJQ1lfREVGQVVMVD8KCj4gLS0t
IGEveGVuL2NvbW1vbi9kb21jdGwuYwo+ICsrKyBiL3hlbi9jb21tb24vZG9tY3RsLmMKPiBAQCAt
OTI4LDYgKzkyOCw3IEBAIGxvbmcgZG9fZG9tY3RsKFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0oeGVu
X2RvbWN0bF90KSB1X2RvbWN0bCkKPiAgICAgICAgICB1bnNpZ25lZCBsb25nIG1mbl9lbmQgPSBt
Zm4gKyBucl9tZm5zIC0gMTsKPiAgICAgICAgICBpbnQgYWRkID0gb3AtPnUubWVtb3J5X21hcHBp
bmcuYWRkX21hcHBpbmc7Cj4gICAgICAgICAgcDJtX3R5cGVfdCBwMm10Owo+ICsgICAgICAgIHVp
bnQzMl90IG1lbW9yeV9wb2xpY3kgPSBvcC0+dS5tZW1vcnlfbWFwcGluZy5tZW1vcnlfcG9saWN5
OwoKSSBjYW4ndCBzZWUgdGhlIG5lZWQgZm9yIGEgZml4ZWQtd2lkdGggdHlwZSBoZXJlLgoKPiBA
QCAtOTU4LDkgKzk1OSwyOCBAQCBsb25nIGRvX2RvbWN0bChYRU5fR1VFU1RfSEFORExFX1BBUkFN
KHhlbl9kb21jdGxfdCkgdV9kb21jdGwpCj4gICAgICAgICAgaWYgKCBhZGQgKQo+ICAgICAgICAg
IHsKPiAgICAgICAgICAgICAgcHJpbnRrKFhFTkxPR19HX0RFQlVHCj4gLSAgICAgICAgICAgICAg
ICAgICAibWVtb3J5X21hcDphZGQ6IGRvbSVkIGdmbj0lbHggbWZuPSVseCBucj0lbHhcbiIsCj4g
LSAgICAgICAgICAgICAgICAgICBkLT5kb21haW5faWQsIGdmbiwgbWZuLCBucl9tZm5zKTsKPiAr
ICAgICAgICAgICAgICAgICAgICJtZW1vcnlfbWFwOmFkZDogZG9tJWQgZ2ZuPSVseCBtZm49JWx4
IG5yPSVseCBjYWNoZT0ldVxuIiwKPiArICAgICAgICAgICAgICAgICAgIGQtPmRvbWFpbl9pZCwg
Z2ZuLCBtZm4sIG5yX21mbnMsIG1lbW9yeV9wb2xpY3kpOwoKV2h5ICJjYWNoZT0iIHdoZW4gaXQn
cyBhICJwb2xpY3kiIHZhbHVlPwoKPiArICAgICAgICAgICAgc3dpdGNoICggbWVtb3J5X3BvbGlj
eSApCj4gKyAgICAgICAgICAgIHsKPiArI2lmZGVmIENPTkZJR19BUk0KPiArICAgICAgICAgICAg
ICAgIGNhc2UgTUVNT1JZX1BPTElDWV9BUk1fTUVNX1dCOgo+ICsgICAgICAgICAgICAgICAgICAg
IHAybXQgPSBwMm1fbW1pb19kaXJlY3RfYzsKPiArICAgICAgICAgICAgICAgICAgICBicmVhazsK
PiArICAgICAgICAgICAgICAgIGNhc2UgTUVNT1JZX1BPTElDWV9BUk1fREVWX25HblJFOgo+ICsg
ICAgICAgICAgICAgICAgICAgIHAybXQgPSBwMm1fbW1pb19kaXJlY3RfZGV2Owo+ICsgICAgICAg
ICAgICAgICAgICAgIGJyZWFrOwo+ICsjZW5kaWYKPiArI2lmZGVmIENPTkZJR19YODYKPiArICAg
ICAgICAgICAgICAgIGNhc2UgTUVNT1JZX1BPTElDWV9YODZfVUNfTUlOVVM6CgpGVFIgLSBJIGNv
dWxkIGNlcnRhaW5seSBsaXZlIHdpdGggdGhpcyBiZWNvbWluZyBNRU1PUllfUE9MSUNZX0RFRkFV
TFQKZm9yIG5vdywgaWYgdGhhdCdzIHJlYWxseSB3aGF0IEFuZHJldyBwcmVmZXJzIGZvciB4ODYu
Cgo+IC0tLSBhL3hlbi9pbmNsdWRlL3B1YmxpYy9kb21jdGwuaAo+ICsrKyBiL3hlbi9pbmNsdWRl
L3B1YmxpYy9kb21jdGwuaAo+IEBAIC01NzEsMTIgKzU3MSwzMyBAQCBzdHJ1Y3QgeGVuX2RvbWN0
bF9iaW5kX3B0X2lycSB7Cj4gICovCj4gICNkZWZpbmUgRFBDSV9BRERfTUFQUElORyAgICAgICAg
IDEKPiAgI2RlZmluZSBEUENJX1JFTU9WRV9NQVBQSU5HICAgICAgMAo+ICsvKgo+ICsgKiBEZWZh
dWx0IG1lbW9yeSBwb2xpY3kuIENvcnJlc3BvbmRzIHRvOgo+ICsgKiBBcm06IE1FTU9SWV9QT0xJ
Q1lfQVJNX0RFVl9uR25SRQo+ICsgKiB4ODY6IE1FTU9SWV9QT0xJQ1lfWDg2X1VDX01JTlVTCj4g
KyAqLwo+ICsjZGVmaW5lIE1FTU9SWV9QT0xJQ1lfREVGQVVMVCAgICAgICAgIDAKPiArI2lmIGRl
ZmluZWQoX19pMzg2X18pIHx8IGRlZmluZWQoX194ODZfNjRfXykKPiArLyogeDg2IG9ubHkuIE1l
bW9yeSB0eXBlIFVOQ0FDSEFCTEUgKi8KPiArIyBkZWZpbmUgTUVNT1JZX1BPTElDWV9YODZfVUNf
TUlOVVMgICAgMAo+ICsjZWxpZiBkZWZpbmVkKF9fYXJtX18pIHx8IGRlZmluZWQgKF9fYWFyY2g2
NF9fKQo+ICsvKiBBcm0gb25seS4gT3V0ZXIgU2hhcmVhYmxlLCBEZXZpY2UtbkduUkUgbWVtb3J5
IChEZXZpY2UgTWVtb3J5IG9uIEFybXY3KSAKPiAqLwo+ICsjIGRlZmluZSBNRU1PUllfUE9MSUNZ
X0FSTV9ERVZfbkduUkUgICAgICAwCj4gKy8qIEFybSBvbmx5LiBPdXRlciBTaGFyZWFibGUsIE91
dGVyL0lubmVyIFdyaXRlLUJhY2sgQ2FjaGVhYmxlIG1lbW9yeSAqLwo+ICsjIGRlZmluZSBNRU1P
UllfUE9MSUNZX0FSTV9NRU1fV0IgICAgICAgICAxCj4gKy8qCj4gKyAqIE9uIEFSTSwgTUVNT1JZ
X1BPTElDWSBzZWxlY3RzIHRoZSBzdGFnZS0yIG1lbW9yeSBhdHRyaWJ1dGVzLCBidXQgbm90ZQoK
RnVydGhlciB1cCBpdCdzIEFybSAtIHdoeSBhbGwgdXBwZXIgY2FzZSBoZXJlPwoKSmFuCgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

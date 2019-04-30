Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B10FE07
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2019 18:40:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLVk7-0002Iy-0H; Tue, 30 Apr 2019 16:36:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=buJQ=TA=citrix.com=prvs=01609d005=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hLVk4-0002Is-K1
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2019 16:36:28 +0000
X-Inumbo-ID: 186cba22-6b66-11e9-9e75-c36da2d323ff
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 186cba22-6b66-11e9-9e75-c36da2d323ff;
 Tue, 30 Apr 2019 16:36:26 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,414,1549929600"; d="scan'208";a="84777940"
Date: Tue, 30 Apr 2019 17:35:51 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Laszlo Ersek <lersek@redhat.com>
Message-ID: <20190430163551.GA1264@perard.uk.xensource.com>
References: <1556223838-5176-1-git-send-email-igor.druzhinin@citrix.com>
 <1556223838-5176-4-git-send-email-igor.druzhinin@citrix.com>
 <b999513b-b843-e440-d1f2-c49589506a65@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b999513b-b843-e440-d1f2-c49589506a65@redhat.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Subject: Re: [Xen-devel] [PATCH v3 3/3] OvmfPkg/XenSupport: turn off address
 decoding before BAR sizing
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
Cc: Igor Druzhinin <igor.druzhinin@citrix.com>, ard.biesheuvel@linaro.org,
 jordan.l.justen@intel.com, devel@edk2.groups.io, julien.grall@arm.com,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBBcHIgMjYsIDIwMTkgYXQgMDg6MTU6MDdQTSArMDIwMCwgTGFzemxvIEVyc2VrIHdy
b3RlOgo+IE9uIDA0LzI1LzE5IDIyOjIzLCBJZ29yIERydXpoaW5pbiB3cm90ZToKPiA+IE9uIFhl
biwgaHZtbG9hZGVyIGZpcm13YXJlIGxlYXZlcyBhZGRyZXNzIGRlY29kaW5nIGVuYWJsZWQgZm9y
Cj4gPiBlbnVtZXJhdGVkIFBDSSBkZXZpY2UgYmVmb3JlIGp1bXBpbmcgaW50byBPVk1GLiBPVk1G
IHNlZW1zIHRvCj4gPiBleHBlY3QgaXQgdG8gYmUgZGlzYWJsZWQgYW5kIHRyaWVzIHRvIHNpemUg
UENJIEJBUnMgaW4gc2V2ZXJhbCBwbGFjZXMKPiA+IHdpdGhvdXQgZGlzYWJsaW5nIGl0IHdoaWNo
IGNhdXNlcyBCQVI2NCwgZm9yIGV4YW1wbGUsIGJlaW5nCj4gPiBpbmNvcnJlY3RseSBwbGFjZWQg
YnkgUUVNVS4KPiA+IAo+ID4gRml4IGl0IGJ5IGRpc2FibGluZyBQQ0kgYWRkcmVzcyBkZWNvZGlu
ZyBleHBsaWNpdGx5IGJlZm9yZSB0aGUKPiA+IGZpcnN0IGF0dGVtcHQgdG8gc2l6ZSBCQVJzIG9u
IFhlbi4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogSWdvciBEcnV6aGluaW4gPGlnb3IuZHJ1emhp
bmluQGNpdHJpeC5jb20+Cj4gPiAtLS0KPiA+IENoYW5nZXMgaW4gdjM6Cj4gPiAtIGRyb3BwZWQg
dW51c2VkIGFyZ3VtZW50cyBhbmQgcmVuYW1lIFBjYXRQY2lSb290QnJpZGdlRGVjb2RpbmcgZnVu
Y3Rpb24KPiA+IC0gbWFrZSBtYXNrIGFwcGxpY2F0aW9uIG1vcmUgY2xlYXIgYXMgc3VnZ2VzdGVk
Cj4gPiAtLS0KPiA+ICBPdm1mUGtnL0xpYnJhcnkvUGNpSG9zdEJyaWRnZUxpYi9YZW5TdXBwb3J0
LmMgfCAyMSArKysrKysrKysrKysrKysrKysrKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgMjEgaW5z
ZXJ0aW9ucygrKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvT3ZtZlBrZy9MaWJyYXJ5L1BjaUhvc3RC
cmlkZ2VMaWIvWGVuU3VwcG9ydC5jIGIvT3ZtZlBrZy9MaWJyYXJ5L1BjaUhvc3RCcmlkZ2VMaWIv
WGVuU3VwcG9ydC5jCj4gPiBpbmRleCA3NmZjYTUzLi5iNDFiZDZiIDEwMDY0NAo+ID4gLS0tIGEv
T3ZtZlBrZy9MaWJyYXJ5L1BjaUhvc3RCcmlkZ2VMaWIvWGVuU3VwcG9ydC5jCj4gPiArKysgYi9P
dm1mUGtnL0xpYnJhcnkvUGNpSG9zdEJyaWRnZUxpYi9YZW5TdXBwb3J0LmMKPiA+IEBAIC00OSw2
ICs0OSwyMiBAQCBQY2F0UGNpUm9vdEJyaWRnZUJhckV4aXN0ZWQgKAo+ID4gICAgRW5hYmxlSW50
ZXJydXB0cyAoKTsKPiA+ICB9Cj4gPiAgCj4gPiArI2RlZmluZSBQQ0lfQ09NTUFORF9ERUNPREUg
KChVSU5UMTYpKEVGSV9QQ0lfQ09NTUFORF9JT19TUEFDRSB8IFwKPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgRUZJX1BDSV9DT01NQU5EX01FTU9SWV9TUEFDRSkpCj4g
PiArU1RBVElDCj4gPiArVk9JRAo+ID4gK1BjYXRQY2lSb290QnJpZGdlRGVjb2RpbmdEaXNhYmxl
ICgKPiA+ICsgIElOICBVSU5UTiAgICAgICAgICAgICAgICAgICAgICAgICAgQWRkcmVzcwo+ID4g
KyAgKQo+ID4gK3sKPiA+ICsgIFVJTlQxNiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgVmFs
dWU7Cj4gPiArCj4gPiArICBWYWx1ZSA9IFBjaVJlYWQxNiAoQWRkcmVzcyk7Cj4gPiArICBpZiAo
VmFsdWUgJiBQQ0lfQ09NTUFORF9ERUNPREUpIHsKPiA+ICsgICAgUGNpV3JpdGUxNiAoQWRkcmVz
cywgVmFsdWUgJiB+KFVJTlQzMilQQ0lfQ09NTUFORF9ERUNPREUpOwo+ID4gKyAgfQo+ID4gK30K
PiA+ICsKPiA+ICBTVEFUSUMKPiA+ICBWT0lECj4gPiAgUGNhdFBjaVJvb3RCcmlkZ2VQYXJzZUJh
cnMgKAo+ID4gQEAgLTc1LDYgKzkxLDExIEBAIFBjYXRQY2lSb290QnJpZGdlUGFyc2VCYXJzICgK
PiA+ICAgIFVJTlQ2NCAgICAgICAgICAgICAgICAgICAgICAgICAgICBMaW1pdDsKPiA+ICAgIFBD
SV9ST09UX0JSSURHRV9BUEVSVFVSRSAgICAgICAgICAqTWVtQXBlcnR1cmU7Cj4gPiAgCj4gPiAr
ICAvLyBEaXNhYmxlIGFkZHJlc3MgZGVjb2RpbmcgZm9yIGV2ZXJ5IGRldmljZSBiZWZvcmUgT1ZN
RiBzdGFydHMgc2l6aW5nIGl0Cj4gPiArICBQY2F0UGNpUm9vdEJyaWRnZURlY29kaW5nRGlzYWJs
ZSAoCj4gPiArICAgIFBDSV9MSUJfQUREUkVTUyAoQnVzLCBEZXZpY2UsIEZ1bmN0aW9uLCBQQ0lf
Q09NTUFORF9PRkZTRVQpCj4gPiArICApOwo+ID4gKwo+ID4gICAgZm9yIChPZmZzZXQgPSBCYXJP
ZmZzZXRCYXNlOyBPZmZzZXQgPCBCYXJPZmZzZXRFbmQ7IE9mZnNldCArPSBzaXplb2YgKFVJTlQz
MikpIHsKPiA+ICAgICAgUGNhdFBjaVJvb3RCcmlkZ2VCYXJFeGlzdGVkICgKPiA+ICAgICAgICBQ
Q0lfTElCX0FERFJFU1MgKEJ1cywgRGV2aWNlLCBGdW5jdGlvbiwgT2Zmc2V0KSwKPiA+IAo+IAo+
IEFja2VkLWJ5OiBMYXN6bG8gRXJzZWsgPGxlcnNla0ByZWRoYXQuY29tPgo+IAo+IFNvbWVvbmUg
ZnJvbSB0aGUgWGVuIGNvbW11bml0eSBwbGVhc2UgQUNLIHRoaXMgdG9vLCBhbmQgdGhlbiB3ZSBj
YW4gcHVzaAo+IHRoZSBzZXJpZXMuCgpBY2tlZC1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnku
cGVyYXJkQGNpdHJpeC5jb20+CgpUaGFua3MsCgotLSAKQW50aG9ueSBQRVJBUkQKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

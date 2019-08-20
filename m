Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4A6952BC
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2019 02:26:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hzrvf-0002Tg-1t; Tue, 20 Aug 2019 00:23:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=oenM=WQ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hzrve-0002Tb-82
 for xen-devel@lists.xen.org; Tue, 20 Aug 2019 00:23:14 +0000
X-Inumbo-ID: b2304e68-c2e0-11e9-8bf0-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b2304e68-c2e0-11e9-8bf0-12813bfff9fa;
 Tue, 20 Aug 2019 00:23:13 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1E91A20644;
 Tue, 20 Aug 2019 00:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566260592;
 bh=C8TTGUKYADR3hA6JT1IKCN0UyyYenzT0Huzl2ZI/+Zs=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=z38Q1ViPxzqrY4k/NshtxCcBW6V6qbaEeDciRhi92W3MCN/o1cboatuVDTqg8ttco
 44c1weXiubPBk5Gs2fSuCRhgZYPVvf67XAmk6lEGSbeaP6df5wTJpZ2pp27a9JWZp5
 BE6MT4aXMaIYuPxAD3kAyhVf5KJqQ5gfK7fO/x6o=
Date: Mon, 19 Aug 2019 17:23:11 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
In-Reply-To: <87k1bmgpg6.fsf@epam.com>
Message-ID: <alpine.DEB.2.21.1908191722550.20094@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1908081609510.22196@sstabellini-ThinkPad-T480s>
 <20190808231242.26424-4-sstabellini@kernel.org> <87k1bmgpg6.fsf@epam.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v3 4/6] xen/arm: handle "multiboot,
 device-tree" compatible nodes
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
Cc: Stefano Stabellini <stefanos@xilinx.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <Andrii_Anisov@epam.com>,
 "Achin.Gupta@arm.com" <Achin.Gupta@arm.com>,
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>,
 "julien.grall@arm.com" <julien.grall@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCA5IEF1ZyAyMDE5LCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToKPiBTdGVmYW5vIFN0
YWJlbGxpbmkgd3JpdGVzOgo+IAo+ID4gRGV0ZWN0ICJtdWx0aWJvb3QsZGV2aWNlLXRyZWUiIGNv
bXBhdGlibGUgbm9kZXMuIEFkZCB0aGVtIHRvIHRoZSBib290bW9kCj4gPiBhcnJheSBhcyBCT09U
TU9EX0dVRVNUX0RUQi4gIEluIGtlcm5lbF9wcm9iZSwgZmluZCB0aGUgcmlnaHQKPiA+IEJPT1RN
T0RfR1VFU1RfRFRCIGFuZCBzdG9yZSBhIHBvaW50ZXIgdG8gaXQgaW4gZHRiX2Jvb3Rtb2R1bGUu
Cj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzdGVmYW5vc0B4aWxp
bnguY29tPgo+ID4KPiA+IC0tLQo+ID4gQ2hhbmdlcyBpbiB2MjoKPiA+IC0gcmVuYW1lIEJPT1RN
T0RfRFRCIHRvIEJPT1RNT0RfR1VFU1RfRFRCCj4gPiAtIHJlbmFtZSBtdWx0aWJvb3QsZHRiIHRv
IG11bHRpYm9vdCxkZXZpY2UtdHJlZQo+ID4gLS0tCj4gPiAgeGVuL2FyY2gvYXJtL2Jvb3RmZHQu
YyAgICAgIHwgIDIgKysKPiA+ICB4ZW4vYXJjaC9hcm0va2VybmVsLmMgICAgICAgfCAxMiArKysr
KysrKysrKy0KPiA+ICB4ZW4vYXJjaC9hcm0vc2V0dXAuYyAgICAgICAgfCAgMSArCj4gPiAgeGVu
L2luY2x1ZGUvYXNtLWFybS9zZXR1cC5oIHwgIDEgKwo+ID4gIDQgZmlsZXMgY2hhbmdlZCwgMTUg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS94ZW4vYXJj
aC9hcm0vYm9vdGZkdC5jIGIveGVuL2FyY2gvYXJtL2Jvb3RmZHQuYwo+ID4gaW5kZXggODkxYjRi
NjZmZi4uNGVlMWJjMzE0ZSAxMDA2NDQKPiA+IC0tLSBhL3hlbi9hcmNoL2FybS9ib290ZmR0LmMK
PiA+ICsrKyBiL3hlbi9hcmNoL2FybS9ib290ZmR0LmMKPiA+IEBAIC0yMDUsNiArMjA1LDggQEAg
c3RhdGljIHZvaWQgX19pbml0IHByb2Nlc3NfbXVsdGlib290X25vZGUoY29uc3Qgdm9pZCAqZmR0
LCBpbnQgbm9kZSwKPiA+ICAgICAgICAgIGtpbmQgPSBCT09UTU9EX1JBTURJU0s7Cj4gPiAgICAg
IGVsc2UgaWYgKCBmZHRfbm9kZV9jaGVja19jb21wYXRpYmxlKGZkdCwgbm9kZSwgInhlbix4c20t
cG9saWN5IikgPT0gMCApCj4gPiAgICAgICAgICBraW5kID0gQk9PVE1PRF9YU007Cj4gPiArICAg
IGVsc2UgaWYgKCBmZHRfbm9kZV9jaGVja19jb21wYXRpYmxlKGZkdCwgbm9kZSwgIm11bHRpYm9v
dCxkZXZpY2UtdHJlZSIpID09IDAgKQo+ID4gKyAgICAgICAga2luZCA9IEJPT1RNT0RfR1VFU1Rf
RFRCOwo+ID4gICAgICBlbHNlCj4gPiAgICAgICAgICBraW5kID0gQk9PVE1PRF9VTktOT1dOOwo+
ID4gIAo+ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9rZXJuZWwuYyBiL3hlbi9hcmNoL2Fy
bS9rZXJuZWwuYwo+ID4gaW5kZXggMzg5YmVmMmFmYS4uOTk3YTg3MWY2MiAxMDA2NDQKPiA+IC0t
LSBhL3hlbi9hcmNoL2FybS9rZXJuZWwuYwo+ID4gKysrIGIveGVuL2FyY2gvYXJtL2tlcm5lbC5j
Cj4gPiBAQCAtNDI1LDcgKzQyNSw3IEBAIGludCBfX2luaXQga2VybmVsX3Byb2JlKHN0cnVjdCBr
ZXJuZWxfaW5mbyAqaW5mbywKPiA+ICAgICAgc3RydWN0IGJvb3Rtb2R1bGUgKm1vZCA9IE5VTEw7
Cj4gPiAgICAgIHN0cnVjdCBib290Y21kbGluZSAqY21kID0gTlVMTDsKPiA+ICAgICAgc3RydWN0
IGR0X2RldmljZV9ub2RlICpub2RlOwo+ID4gLSAgICB1NjQga2VybmVsX2FkZHIsIGluaXRyZF9h
ZGRyLCBzaXplOwo+ID4gKyAgICB1NjQga2VybmVsX2FkZHIgPSAwLCBpbml0cmRfYWRkciA9IDAs
IGR0Yl9hZGRyID0gMCwgc2l6ZTsKPiBJdCBpcyB1bmNsZWFyIGZvciBteSB3aHkgYXJlIHlvdSBp
bml0aWFsaXplIHRob3NlIHZhcmlhYmxlcyB3aXRoIDAKCkdvb2QgcG9pbnQsIHRoZXkgYXJlIHVu
bmVjZXNzYXJ5CgoKPiA+ICAgICAgaW50IHJjOwo+ID4gIAo+ID4gICAgICAvKiBkb21haW4gaXMg
TlVMTCBvbmx5IGZvciB0aGUgaGFyZHdhcmUgZG9tYWluICovCj4gPiBAQCAtNDY5LDYgKzQ2OSwx
NiBAQCBpbnQgX19pbml0IGtlcm5lbF9wcm9iZShzdHJ1Y3Qga2VybmVsX2luZm8gKmluZm8sCj4g
PiAgICAgICAgICAgICAgICAgIGluZm8tPmluaXRyZF9ib290bW9kdWxlID0gYm9vdF9tb2R1bGVf
ZmluZF9ieV9hZGRyX2FuZF9raW5kKAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgIEJPT1RN
T0RfUkFNRElTSywgaW5pdHJkX2FkZHIpOwo+ID4gICAgICAgICAgICAgIH0KPiA+ICsgICAgICAg
ICAgICBlbHNlIGlmICggZHRfZGV2aWNlX2lzX2NvbXBhdGlibGUobm9kZSwgIm11bHRpYm9vdCxk
ZXZpY2UtdHJlZSIpICkKPiA+ICsgICAgICAgICAgICB7Cj4gPiArICAgICAgICAgICAgICAgIHUz
MiBsZW47Cj4gPiArICAgICAgICAgICAgICAgIGNvbnN0IF9fYmUzMiAqdmFsOwo+ID4gKwo+ID4g
KyAgICAgICAgICAgICAgICB2YWwgPSBkdF9nZXRfcHJvcGVydHkobm9kZSwgInJlZyIsICZsZW4p
Owo+IERvIHlvdSBuZWVkIHRvIGNoZWNrIHJldHVybiB2YWx1ZSB0aGVyZT8KCkknbGwgYWRkIGEg
Y2hlY2sKCgo+ID4gKyAgICAgICAgICAgICAgICBkdF9nZXRfcmFuZ2UoJnZhbCwgbm9kZSwgJmR0
Yl9hZGRyLCAmc2l6ZSk7Cj4gPiArICAgICAgICAgICAgICAgIGluZm8tPmR0Yl9ib290bW9kdWxl
ID0gYm9vdF9tb2R1bGVfZmluZF9ieV9hZGRyX2FuZF9raW5kKAo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgIEJPT1RNT0RfR1VFU1RfRFRCLCBkdGJfYWRkcik7Cj4gPiArICAgICAgICAgICAg
fQo+ID4gICAgICAgICAgICAgIGVsc2UKPiA+ICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4g
PiAgICAgICAgICB9Cj4gPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3NldHVwLmMgYi94ZW4v
YXJjaC9hcm0vc2V0dXAuYwo+ID4gaW5kZXggMjE1NzQ2YTVjMy4uZjkzYThiZWQwNCAxMDA2NDQK
PiA+IC0tLSBhL3hlbi9hcmNoL2FybS9zZXR1cC5jCj4gPiArKysgYi94ZW4vYXJjaC9hcm0vc2V0
dXAuYwo+ID4gQEAgLTM0Nyw2ICszNDcsNyBAQCBjb25zdCBjaGFyICogX19pbml0IGJvb3RfbW9k
dWxlX2tpbmRfYXNfc3RyaW5nKGJvb3Rtb2R1bGVfa2luZCBraW5kKQo+ID4gICAgICBjYXNlIEJP
T1RNT0RfS0VSTkVMOiAgcmV0dXJuICJLZXJuZWwiOwo+ID4gICAgICBjYXNlIEJPT1RNT0RfUkFN
RElTSzogcmV0dXJuICJSYW1kaXNrIjsKPiA+ICAgICAgY2FzZSBCT09UTU9EX1hTTTogICAgIHJl
dHVybiAiWFNNIjsKPiA+ICsgICAgY2FzZSBCT09UTU9EX0dVRVNUX0RUQjogICAgIHJldHVybiAi
RFRCIjsKPiA+ICAgICAgY2FzZSBCT09UTU9EX1VOS05PV046IHJldHVybiAiVW5rbm93biI7Cj4g
PiAgICAgIGRlZmF1bHQ6IEJVRygpOwo+ID4gICAgICB9Cj4gPiBkaWZmIC0tZ2l0IGEveGVuL2lu
Y2x1ZGUvYXNtLWFybS9zZXR1cC5oIGIveGVuL2luY2x1ZGUvYXNtLWFybS9zZXR1cC5oCj4gPiBp
bmRleCA4YmYzZDU5MTBhLi41YWFmMDdiZjk3IDEwMDY0NAo+ID4gLS0tIGEveGVuL2luY2x1ZGUv
YXNtLWFybS9zZXR1cC5oCj4gPiArKysgYi94ZW4vaW5jbHVkZS9hc20tYXJtL3NldHVwLmgKPiA+
IEBAIC0xNiw2ICsxNiw3IEBAIHR5cGVkZWYgZW51bSB7Cj4gPiAgICAgIEJPT1RNT0RfS0VSTkVM
LAo+ID4gICAgICBCT09UTU9EX1JBTURJU0ssCj4gPiAgICAgIEJPT1RNT0RfWFNNLAo+ID4gKyAg
ICBCT09UTU9EX0dVRVNUX0RUQiwKPiA+ICAgICAgQk9PVE1PRF9VTktOT1dOCj4gPiAgfSAgYm9v
dG1vZHVsZV9raW5kOwo+IAo+IAo+IC0tIAo+IFZvbG9keW15ciBCYWJjaHVrIGF0IEVQQU0KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33AE114DC6E
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 15:06:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixAQL-0006rV-Lb; Thu, 30 Jan 2020 14:04:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ezal=3T=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1ixAQJ-0006rO-LH
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 14:03:59 +0000
X-Inumbo-ID: 5c78fbfa-4369-11ea-8a76-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5c78fbfa-4369-11ea-8a76-12813bfff9fa;
 Thu, 30 Jan 2020 14:03:59 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1ixAQI-0005tv-Co; Thu, 30 Jan 2020 14:03:58 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1ixAQI-0006qu-3H; Thu, 30 Jan 2020 14:03:58 +0000
Date: Thu, 30 Jan 2020 14:03:55 +0000
From: Wei Liu <wl@xen.org>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Message-ID: <20200130140355.m5eidbe36qoyow73@debian>
References: <20200129202034.15052-1-liuwe@microsoft.com>
 <20200129202034.15052-13-liuwe@microsoft.com>
 <20200130124229.GN4679@Air-de-Roger>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200130124229.GN4679@Air-de-Roger>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v5 12/12] x86/hyperv: setup VP assist page
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
Cc: Wei Liu <liuwe@microsoft.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKYW4gMzAsIDIwMjAgYXQgMDE6NDI6MjlQTSArMDEwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBXZWQsIEphbiAyOSwgMjAyMCBhdCAwODoyMDozNFBNICswMDAwLCBXZWkg
TGl1IHdyb3RlOgo+ID4gVlAgYXNzaXN0IHBhZ2UgaXMgcmF0aGVyIGltcG9ydGFudCBhcyB3ZSBu
ZWVkIHRvIHRvZ2dsZSBzb21lIGJpdHMgaW4gaXQKPiA+IGZvciBlZmZpY2llbnQgbmVzdGVkIHZp
cnR1YWxpc2F0aW9uLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDxsaXV3ZUBtaWNy
b3NvZnQuY29tPgo+ID4gLS0tCj4gPiB2NToKPiA+IDEuIERlYWwgd2l0aCBlcnJvciBwcm9wZXJs
eSBpbnN0ZWFkIG9mIGFsd2F5cyBwYW5pY2tpbmcKPiA+IDIuIFN3YXAgcGVyY3B1IHZhcmlhYmxl
cyBkZWNsYXJhdGlvbnMnIGxvY2F0aW9uCj4gPiAKPiA+IHY0Ogo+ID4gMS4gVXNlIHByaXZhdGUu
aAo+ID4gMi4gUHJldmVudCBsZWFrCj4gPiAKPiA+IHYzOgo+ID4gMS4gVXNlIHhlbmhlYXAgcGFn
ZQo+ID4gMi4gRHJvcCBzZXRfdnBfYXNzaXN0Cj4gPiAKPiA+IHYyOgo+ID4gMS4gVXNlIEhWX0hZ
UF9QQUdFX1NISUZUIGluc3RlYWQKPiA+IC0tLQo+ID4gIHhlbi9hcmNoL3g4Ni9ndWVzdC9oeXBl
cnYvaHlwZXJ2LmMgIHwgNDQgKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0KPiA+ICB4ZW4v
YXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L3ByaXZhdGUuaCB8ICAxICsKPiA+ICAyIGZpbGVzIGNoYW5n
ZWQsIDQ0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBh
L3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMgYi94ZW4vYXJjaC94ODYvZ3Vlc3Qv
aHlwZXJ2L2h5cGVydi5jCj4gPiBpbmRleCBhZjBkNmVkNjkyLi5iYzQwYTNkMzM4IDEwMDY0NAo+
ID4gLS0tIGEveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9oeXBlcnYuYwo+ID4gKysrIGIveGVu
L2FyY2gveDg2L2d1ZXN0L2h5cGVydi9oeXBlcnYuYwo+ID4gQEAgLTMxLDYgKzMxLDcgQEAKPiA+
ICAKPiA+ICBzdHJ1Y3QgbXNfaHlwZXJ2X2luZm8gX19yZWFkX21vc3RseSBtc19oeXBlcnY7Cj4g
PiAgREVGSU5FX1BFUl9DUFVfUkVBRF9NT1NUTFkodm9pZCAqLCBodl9wY3B1X2lucHV0X3BhZ2Up
Owo+ID4gK0RFRklORV9QRVJfQ1BVX1JFQURfTU9TVExZKHZvaWQgKiwgaHZfdnBfYXNzaXN0KTsK
PiA+ICBERUZJTkVfUEVSX0NQVV9SRUFEX01PU1RMWSh1bnNpZ25lZCBpbnQsIGh2X3ZwX2luZGV4
KTsKPiA+ICAKPiA+ICBzdGF0aWMgdWludDY0X3QgZ2VuZXJhdGVfZ3Vlc3RfaWQodm9pZCkKPiA+
IEBAIC0xNTUsMTYgKzE1Niw1NyBAQCBzdGF0aWMgaW50IHNldHVwX2h5cGVyY2FsbF9wY3B1X2Fy
Zyh2b2lkKQo+ID4gICAgICByZXR1cm4gMDsKPiA+ICB9Cj4gPiAgCj4gPiArc3RhdGljIGludCBz
ZXR1cF92cF9hc3Npc3Qodm9pZCkKPiA+ICt7Cj4gPiArICAgIHZvaWQgKm1hcHBpbmc7Cj4gPiAr
ICAgIHVpbnQ2NF90IHZhbDsKPiA+ICsKPiA+ICsgICAgbWFwcGluZyA9IHRoaXNfY3B1KGh2X3Zw
X2Fzc2lzdCk7Cj4gCj4gWW91IGNvdWxkIGFsc28gYXZvaWQgdGhlIHVzYWdlIG9mIHRoZSBsb2Nh
bCBtYXBwaW5nIHZhcmlhYmxlIGhlcmUuCgp0aGlzX2NwdSguLi4pIGlzIGxvbmdlciB0aGFuIG1h
cHBpbmcuIEJ1dCBzaW5jZSB5b3UgYXNrIGZvciB0aGUgY2hhbmdlLApJIGhhdmUgbWFkZSB0aGUg
Y2hhbmdlLgoKPiAKPiA+ICsKPiA+ICsgICAgaWYgKCAhbWFwcGluZyApCj4gPiArICAgIHsKPiA+
ICsgICAgICAgIG1hcHBpbmcgPSBhbGxvY194ZW5oZWFwX3BhZ2UoKTsKPiA+ICsgICAgICAgIGlm
ICggIW1hcHBpbmcgKQo+ID4gKyAgICAgICAgewo+ID4gKyAgICAgICAgICAgIHByaW50aygiRmFp
bGVkIHRvIGFsbG9jYXRlIHZwX2Fzc2lzdCBwYWdlIGZvciBDUFUldVxuIiwKPiA+ICsgICAgICAg
ICAgICAgICAgICAgc21wX3Byb2Nlc3Nvcl9pZCgpKTsKPiA+ICsgICAgICAgICAgICByZXR1cm4g
LUVOT01FTTsKPiA+ICsgICAgICAgIH0KPiA+ICsKPiA+ICsgICAgICAgIGNsZWFyX3BhZ2UobWFw
cGluZyk7Cj4gPiArICAgICAgICB0aGlzX2NwdShodl92cF9hc3Npc3QpID0gbWFwcGluZzsKPiA+
ICsgICAgfQo+ID4gKwo+ID4gKyAgICB2YWwgPSAodmlydF90b19tZm4obWFwcGluZykgPDwgSFZf
SFlQX1BBR0VfU0hJRlQpCj4gCj4gVGhlcmUncyB2aXJ0X3RvX21hZGRyIHdoaWNoIHdvdWxkIGF2
b2lkIHRoZSBzaGlmdC4KClRoaXMgbGluZSBpcyBnb25lLgoKPiAKPiA+ICsgICAgICAgIHwgSFZf
WDY0X01TUl9WUF9BU1NJU1RfUEFHRV9FTkFCTEU7Cj4gPiArICAgIHdybXNybChIVl9YNjRfTVNS
X1ZQX0FTU0lTVF9QQUdFLCB2YWwpOwo+ID4gKwo+ID4gKyAgICByZXR1cm4gMDsKPiA+ICt9Cj4g
PiArCj4gPiAgc3RhdGljIHZvaWQgX19pbml0IHNldHVwKHZvaWQpCj4gPiAgewo+ID4gICAgICBz
ZXR1cF9oeXBlcmNhbGxfcGFnZSgpOwo+ID4gKwo+ID4gICAgICBpZiAoIHNldHVwX2h5cGVyY2Fs
bF9wY3B1X2FyZygpICkKPiA+ICAgICAgICAgIHBhbmljKCJIeXBlcmNhbGwgcGVyY3B1IGFyZyBz
ZXR1cCBmYWlsZWRcbiIpOwo+ID4gKwo+ID4gKyAgICBpZiAoIHNldHVwX3ZwX2Fzc2lzdCgpICkK
PiA+ICsgICAgICAgIHBhbmljKCJWUCBhc3Npc3QgcGFnZSBzZXR1cCBmYWlsZWRcbiIpOwo+ID4g
IH0KPiA+ICAKPiA+ICBzdGF0aWMgaW50IGFwX3NldHVwKHZvaWQpCj4gPiAgewo+ID4gLSAgICBy
ZXR1cm4gc2V0dXBfaHlwZXJjYWxsX3BjcHVfYXJnKCk7Cj4gPiArICAgIGludCByYzsKPiA+ICsK
PiA+ICsgICAgcmMgPSBzZXR1cF9oeXBlcmNhbGxfcGNwdV9hcmcoKTsKPiA+ICsgICAgaWYgKCBy
YyApCj4gPiArICAgICAgICBnb3RvIG91dDsKPiAKPiBObyBuZWVkIGZvciBhIGxhYmVsLCBhcyBq
dXN0IHJldHVybmluZyBoZXJlIHdvdWxkIG1ha2UgdGhlIGZ1bmN0aW9uCj4gc2hvcnRlcjoKPiAK
PiByYyA9IHNldHVwX2h5cGVyY2FsbF9wY3B1X2FyZygpOwo+IGlmICggcmMgKQo+ICAgICByZXR1
cm4gcmM7Cj4gCj4gcmV0dXJuIHNldHVwX3ZwX2Fzc2lzdCgpOwoKRG9uZS4KCldlaS4KCj4gCj4g
VGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=

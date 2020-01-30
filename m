Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A53A14DB98
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 14:27:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ix9ok-0003F1-Cp; Thu, 30 Jan 2020 13:25:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ezal=3T=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1ix9oj-0003Ew-27
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 13:25:09 +0000
X-Inumbo-ID: ef60688c-4363-11ea-b211-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ef60688c-4363-11ea-b211-bc764e2007e4;
 Thu, 30 Jan 2020 13:25:08 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1ix9oi-00052o-3D; Thu, 30 Jan 2020 13:25:08 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1ix9oh-0004O0-Pc; Thu, 30 Jan 2020 13:25:08 +0000
Date: Thu, 30 Jan 2020 13:25:04 +0000
From: Wei Liu <wl@xen.org>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Message-ID: <20200130132504.dtlotymlkfelkkpk@debian>
References: <20200129202034.15052-1-liuwe@microsoft.com>
 <20200129202034.15052-3-liuwe@microsoft.com>
 <20200130100129.GD4679@Air-de-Roger>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200130100129.GD4679@Air-de-Roger>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v5 02/12] x86/hypervisor: make
 hypervisor_ap_setup return an error code
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

T24gVGh1LCBKYW4gMzAsIDIwMjAgYXQgMTE6MDE6MjlBTSArMDEwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBXZWQsIEphbiAyOSwgMjAyMCBhdCAwODoyMDoyNFBNICswMDAwLCBXZWkg
TGl1IHdyb3RlOgo+ID4gV2Ugd2FudCB0byBiZSBhYmxlIHRvIGhhbmRsZSBBUCBzZXR1cCBlcnJv
ciBpbiB0aGUgdXBwZXIgbGF5ZXIuCj4gCj4gVGhhbmtzLCBzb21lIGNvbW1lbnRzIGJlbG93Lgo+
IAo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDxsaXV3ZUBtaWNyb3NvZnQuY29tPgo+
ID4gLS0tCj4gPiAgeGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydmlzb3IuYyAgICAgICAgfCAgNiAr
KysrLS0KPiA+ICB4ZW4vYXJjaC94ODYvZ3Vlc3QveGVuL3hlbi5jICAgICAgICAgICB8IDExICsr
KysrKysrKy0tCj4gPiAgeGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC9oeXBlcnZpc29yLmggfCAg
NiArKystLS0KPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDcgZGVsZXRp
b25zKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2aXNv
ci5jIGIveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydmlzb3IuYwo+ID4gaW5kZXggNGYyN2I5ODc0
MC4uZTcyYzkyZmZkZiAxMDA2NDQKPiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnZp
c29yLmMKPiA+ICsrKyBiL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnZpc29yLmMKPiA+IEBAIC01
MiwxMCArNTIsMTIgQEAgdm9pZCBfX2luaXQgaHlwZXJ2aXNvcl9zZXR1cCh2b2lkKQo+ID4gICAg
ICAgICAgb3BzLT5zZXR1cCgpOwo+ID4gIH0KPiA+ICAKPiA+IC12b2lkIGh5cGVydmlzb3JfYXBf
c2V0dXAodm9pZCkKPiA+ICtpbnQgaHlwZXJ2aXNvcl9hcF9zZXR1cCh2b2lkKQo+ID4gIHsKPiA+
ICAgICAgaWYgKCBvcHMgJiYgb3BzLT5hcF9zZXR1cCApCj4gPiAtICAgICAgICBvcHMtPmFwX3Nl
dHVwKCk7Cj4gPiArICAgICAgICByZXR1cm4gb3BzLT5hcF9zZXR1cCgpOwo+ID4gKwo+ID4gKyAg
ICByZXR1cm4gMDsKPiA+ICB9Cj4gPiAgCj4gPiAgdm9pZCBoeXBlcnZpc29yX3Jlc3VtZSh2b2lk
KQo+ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9ndWVzdC94ZW4veGVuLmMgYi94ZW4vYXJj
aC94ODYvZ3Vlc3QveGVuL3hlbi5jCj4gPiBpbmRleCA2ZGJjNWY5NTNmLi5lZWQ4YTZlZGFlIDEw
MDY0NAo+ID4gLS0tIGEveGVuL2FyY2gveDg2L2d1ZXN0L3hlbi94ZW4uYwo+ID4gKysrIGIveGVu
L2FyY2gveDg2L2d1ZXN0L3hlbi94ZW4uYwo+ID4gQEAgLTI1NywxMSArMjU3LDE4IEBAIHN0YXRp
YyB2b2lkIF9faW5pdCBzZXR1cCh2b2lkKQo+ID4gICAgICBpbml0X2V2dGNobigpOwo+ID4gIH0K
PiA+ICAKPiA+IC1zdGF0aWMgdm9pZCBhcF9zZXR1cCh2b2lkKQo+ID4gK3N0YXRpYyBpbnQgYXBf
c2V0dXAodm9pZCkKPiA+ICB7Cj4gPiArICAgIGludCByYzsKPiA+ICsKPiA+ICAgICAgc2V0X3Zj
cHVfaWQoKTsKPiA+IC0gICAgbWFwX3ZjcHVpbmZvKCk7Cj4gPiArICAgIHJjID0gbWFwX3ZjcHVp
bmZvKCk7Cj4gCj4gbWFwX3ZjcHVpbmZvIHNob3VsZCBiZSBjaGFuZ2VkIHNvIHRoYXQgdGhlIEJV
R19PTiBpcyByZW1vdmVkLCBhbmQgYW4KPiBlcnJvciBpcyBvbmx5IHJldHVybmVkIGlmIFZDUFVP
UF9yZWdpc3Rlcl92Y3B1X2luZm8gZmFpbHMgYW5kIHZjcHUgPj0KPiBYRU5fTEVHQUNZX01BWF9W
Q1BVUywgZWxzZSBubyBlcnJvciBzaG91bGQgYmUgcmV0dXJuZWQuCgpEb25lLgoKPiAKPiA+ICsg
ICAgaWYgKCByYyApCj4gPiArICAgICAgICByZXR1cm4gcmM7Cj4gPiArCj4gPiAgICAgIGluaXRf
ZXZ0Y2huKCk7Cj4gPiArCj4gPiArICAgIHJldHVybiAwOwo+IAo+IEluIG9yZGVyIHRvIGtlZXAg
dGhpcyBzaG9ydGVyLCB5b3UgY291bGQgZG86Cj4gCj4gaWYgKCAhcmMgKQo+ICAgICBpbml0X2V2
dGNobigpOwo+IAo+IHJldHVybiByYzsKCkRvbmUuCgpXZWkuCgo+IAo+IFRoYW5rcywgUm9nZXIu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

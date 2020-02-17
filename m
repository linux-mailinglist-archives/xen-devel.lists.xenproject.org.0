Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC16161139
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2020 12:38:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j3efp-0008WO-7k; Mon, 17 Feb 2020 11:34:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Vo74=4F=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1j3efn-0008WJ-78
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2020 11:34:47 +0000
X-Inumbo-ID: 7fc04640-5179-11ea-ade5-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7fc04640-5179-11ea-ade5-bc764e2007e4;
 Mon, 17 Feb 2020 11:34:46 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j3efk-0000de-QV; Mon, 17 Feb 2020 11:34:44 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j3efk-0003oA-H4; Mon, 17 Feb 2020 11:34:44 +0000
Date: Mon, 17 Feb 2020 11:34:41 +0000
From: Wei Liu <wl@xen.org>
To: "Durrant, Paul" <pdurrant@amazon.co.uk>
Message-ID: <20200217113441.c7q2uclargvrleyo@debian>
References: <20200214123430.4942-1-liuwe@microsoft.com>
 <20200214123430.4942-3-liuwe@microsoft.com>
 <b27c6b19151b412aaa2dc33366e71ae7@EX13D32EUC003.ant.amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b27c6b19151b412aaa2dc33366e71ae7@EX13D32EUC003.ant.amazon.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v2 2/3] x86/hyperv: skeleton for L0 assisted
 TLB flush
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBGZWIgMTQsIDIwMjAgYXQgMDQ6NTU6NDRQTSArMDAwMCwgRHVycmFudCwgUGF1bCB3
cm90ZToKPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gPiBGcm9tOiBXZWkgTGl1IDx3
ZWkubGl1LnhlbkBnbWFpbC5jb20+IE9uIEJlaGFsZiBPZiBXZWkgTGl1Cj4gPiBTZW50OiAxNCBG
ZWJydWFyeSAyMDIwIDEzOjM0Cj4gPiBUbzogWGVuIERldmVsb3BtZW50IExpc3QgPHhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZz4KPiA+IENjOiBNaWNoYWVsIEtlbGxleSA8bWlrZWxsZXlA
bWljcm9zb2Z0LmNvbT47IER1cnJhbnQsIFBhdWwKPiA+IDxwZHVycmFudEBhbWF6b24uY28udWs+
OyBXZWkgTGl1IDxsaXV3ZUBtaWNyb3NvZnQuY29tPjsgV2VpIExpdQo+ID4gPHdsQHhlbi5vcmc+
OyBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+OyBBbmRyZXcgQ29vcGVyCj4gPiA8YW5k
cmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRy
aXguY29tPgo+ID4gU3ViamVjdDogW1BBVENIIHYyIDIvM10geDg2L2h5cGVydjogc2tlbGV0b24g
Zm9yIEwwIGFzc2lzdGVkIFRMQiBmbHVzaAo+ID4gCj4gPiBJbXBsZW1lbnQgYSBiYXNpYyBob29r
IGZvciBMMCBhc3Npc3RlZCBUTEIgZmx1c2guIFRoZSBob29rIG5lZWRzIHRvCj4gPiBjaGVjayBp
ZiBwcmVyZXF1aXNpdGVzIGFyZSBtZXQuIElmIHRoZXkgYXJlIG5vdCBtZXQsIGl0IHJldHVybnMg
YW4gZXJyb3IKPiA+IG51bWJlciB0byBmYWxsIGJhY2sgdG8gbmF0aXZlIGZsdXNoZXMuCj4gPiAK
PiA+IEludHJvZHVjZSBhIG5ldyB2YXJpYWJsZSB0byBpbmRpY2F0ZSBpZiBoeXBlcmNhbGwgcGFn
ZSBpcyByZWFkeS4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8bGl1d2VAbWljcm9z
b2Z0LmNvbT4KPiA+IC0tLQo+ID4gIHhlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvTWFrZWZpbGUg
IHwgIDEgKwo+ID4gIHhlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMgIHwgMTcgKysr
KysrKysrKysrCj4gPiAgeGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9wcml2YXRlLmggfCAgNCAr
KysKPiA+ICB4ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L3RsYi5jICAgICB8IDQxICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrCj4gPiAgNCBmaWxlcyBjaGFuZ2VkLCA2MyBpbnNlcnRpb25z
KCspCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHhlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvdGxi
LmMKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvTWFrZWZp
bGUKPiA+IGIveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9NYWtlZmlsZQo+ID4gaW5kZXggNjgx
NzAxMDlhOS4uMTg5MDJjMzNlOSAxMDA2NDQKPiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9ndWVzdC9o
eXBlcnYvTWFrZWZpbGUKPiA+ICsrKyBiL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvTWFrZWZp
bGUKPiA+IEBAIC0xICsxLDIgQEAKPiA+ICBvYmoteSArPSBoeXBlcnYubwo+ID4gK29iai15ICs9
IHRsYi5vCj4gPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9oeXBlcnYu
Ywo+ID4gYi94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVydi5jCj4gPiBpbmRleCA3MGY0
Y2Q1YWUwLi5mOWQxZjExYWUzIDEwMDY0NAo+ID4gLS0tIGEveGVuL2FyY2gveDg2L2d1ZXN0L2h5
cGVydi9oeXBlcnYuYwo+ID4gKysrIGIveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9oeXBlcnYu
Ywo+ID4gQEAgLTMzLDYgKzMzLDggQEAgREVGSU5FX1BFUl9DUFVfUkVBRF9NT1NUTFkodm9pZCAq
LCBodl9pbnB1dF9wYWdlKTsKPiA+ICBERUZJTkVfUEVSX0NQVV9SRUFEX01PU1RMWSh2b2lkICos
IGh2X3ZwX2Fzc2lzdCk7Cj4gPiAgREVGSU5FX1BFUl9DUFVfUkVBRF9NT1NUTFkodW5zaWduZWQg
aW50LCBodl92cF9pbmRleCk7Cj4gPiAKPiA+ICtzdGF0aWMgYm9vbCBfX3JlYWRfbW9zdGx5IGh2
X2hjYWxsX3BhZ2VfcmVhZHk7Cj4gPiArCj4gPiAgc3RhdGljIHVpbnQ2NF90IGdlbmVyYXRlX2d1
ZXN0X2lkKHZvaWQpCj4gPiAgewo+ID4gICAgICB1bmlvbiBodl9ndWVzdF9vc19pZCBpZCA9IHt9
Owo+ID4gQEAgLTExOSw2ICsxMjEsOCBAQCBzdGF0aWMgdm9pZCBfX2luaXQgc2V0dXBfaHlwZXJj
YWxsX3BhZ2Uodm9pZCkKPiA+ICAgICAgQlVHX09OKCFoeXBlcmNhbGxfbXNyLmVuYWJsZSk7Cj4g
PiAKPiA+ICAgICAgc2V0X2ZpeG1hcF94KEZJWF9YX0hZUEVSVl9IQ0FMTCwgbWZuIDw8IFBBR0Vf
U0hJRlQpOwo+IAo+IFNob3VsZG4ndCB0aGlzIGhhdmUgYXQgbGVhc3QgYSBjb21waWxlciBiYXJy
aWVyIGhlcmU/Cj4gCgpPSy4gSSB3aWxsIGFkZCBhIHdyaXRlIGJhcnJpZXIgaGVyZS4KCldlaS4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

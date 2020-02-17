Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F31916123F
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2020 13:41:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j3fg1-0007Of-CT; Mon, 17 Feb 2020 12:39:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Vo74=4F=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1j3fg0-0007Oa-19
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2020 12:39:04 +0000
X-Inumbo-ID: 7aa11366-5182-11ea-ade5-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7aa11366-5182-11ea-ade5-bc764e2007e4;
 Mon, 17 Feb 2020 12:39:03 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j3ffy-00021I-3q; Mon, 17 Feb 2020 12:39:02 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j3ffx-0007SO-QF; Mon, 17 Feb 2020 12:39:02 +0000
Date: Mon, 17 Feb 2020 12:38:58 +0000
From: Wei Liu <wl@xen.org>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Message-ID: <20200217123858.4ftpjuhx47gbss3x@debian>
References: <20200214123430.4942-1-liuwe@microsoft.com>
 <20200214123430.4942-3-liuwe@microsoft.com>
 <b27c6b19151b412aaa2dc33366e71ae7@EX13D32EUC003.ant.amazon.com>
 <20200217113441.c7q2uclargvrleyo@debian>
 <20200217114031.GF4679@Air-de-Roger>
 <20200217114538.s34hqiaq35kfv2sf@debian>
 <20200217120054.GG4679@Air-de-Roger>
 <20200217120801.btsfkomxgt3aed6t@debian>
 <20200217121328.GI4679@Air-de-Roger>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200217121328.GI4679@Air-de-Roger>
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
 Xen Development List <xen-devel@lists.xenproject.org>, "Durrant,
 Paul" <pdurrant@amazon.co.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBGZWIgMTcsIDIwMjAgYXQgMDE6MTM6MjhQTSArMDEwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBNb24sIEZlYiAxNywgMjAyMCBhdCAxMjowODowMVBNICswMDAwLCBXZWkg
TGl1IHdyb3RlOgo+ID4gT24gTW9uLCBGZWIgMTcsIDIwMjAgYXQgMDE6MDA6NTRQTSArMDEwMCwg
Um9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+ID4gT24gTW9uLCBGZWIgMTcsIDIwMjAgYXQgMTE6
NDU6MzhBTSArMDAwMCwgV2VpIExpdSB3cm90ZToKPiA+ID4gPiBPbiBNb24sIEZlYiAxNywgMjAy
MCBhdCAxMjo0MDozMVBNICswMTAwLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+ID4gPiA+ID4g
T24gTW9uLCBGZWIgMTcsIDIwMjAgYXQgMTE6MzQ6NDFBTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiA+ID4gPiA+ID4gT24gRnJpLCBGZWIgMTQsIDIwMjAgYXQgMDQ6NTU6NDRQTSArMDAwMCwgRHVy
cmFudCwgUGF1bCB3cm90ZToKPiA+ID4gPiA+ID4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tCj4gPiA+ID4gPiA+ID4gPiBGcm9tOiBXZWkgTGl1IDx3ZWkubGl1LnhlbkBnbWFpbC5jb20+
IE9uIEJlaGFsZiBPZiBXZWkgTGl1Cj4gPiA+ID4gPiA+ID4gPiBTZW50OiAxNCBGZWJydWFyeSAy
MDIwIDEzOjM0Cj4gPiA+ID4gPiA+ID4gPiBUbzogWGVuIERldmVsb3BtZW50IExpc3QgPHhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZz4KPiA+ID4gPiA+ID4gPiA+IENjOiBNaWNoYWVsIEtl
bGxleSA8bWlrZWxsZXlAbWljcm9zb2Z0LmNvbT47IER1cnJhbnQsIFBhdWwKPiA+ID4gPiA+ID4g
PiA+IDxwZHVycmFudEBhbWF6b24uY28udWs+OyBXZWkgTGl1IDxsaXV3ZUBtaWNyb3NvZnQuY29t
PjsgV2VpIExpdQo+ID4gPiA+ID4gPiA+ID4gPHdsQHhlbi5vcmc+OyBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+OyBBbmRyZXcgQ29vcGVyCj4gPiA+ID4gPiA+ID4gPiA8YW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbT47IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29t
Pgo+ID4gPiA+ID4gPiA+ID4gU3ViamVjdDogW1BBVENIIHYyIDIvM10geDg2L2h5cGVydjogc2tl
bGV0b24gZm9yIEwwIGFzc2lzdGVkIFRMQiBmbHVzaAo+ID4gPiA+ID4gPiA+ID4gCj4gPiA+ID4g
PiA+ID4gPiBJbXBsZW1lbnQgYSBiYXNpYyBob29rIGZvciBMMCBhc3Npc3RlZCBUTEIgZmx1c2gu
IFRoZSBob29rIG5lZWRzIHRvCj4gPiA+ID4gPiA+ID4gPiBjaGVjayBpZiBwcmVyZXF1aXNpdGVz
IGFyZSBtZXQuIElmIHRoZXkgYXJlIG5vdCBtZXQsIGl0IHJldHVybnMgYW4gZXJyb3IKPiA+ID4g
PiA+ID4gPiA+IG51bWJlciB0byBmYWxsIGJhY2sgdG8gbmF0aXZlIGZsdXNoZXMuCj4gPiA+ID4g
PiA+ID4gPiAKPiA+ID4gPiA+ID4gPiA+IEludHJvZHVjZSBhIG5ldyB2YXJpYWJsZSB0byBpbmRp
Y2F0ZSBpZiBoeXBlcmNhbGwgcGFnZSBpcyByZWFkeS4KPiA+ID4gPiA+ID4gPiA+IAo+ID4gPiA+
ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8bGl1d2VAbWljcm9zb2Z0LmNvbT4KPiA+
ID4gPiA+ID4gPiA+IC0tLQo+ID4gPiA+ID4gPiA+ID4gIHhlbi9hcmNoL3g4Ni9ndWVzdC9oeXBl
cnYvTWFrZWZpbGUgIHwgIDEgKwo+ID4gPiA+ID4gPiA+ID4gIHhlbi9hcmNoL3g4Ni9ndWVzdC9o
eXBlcnYvaHlwZXJ2LmMgIHwgMTcgKysrKysrKysrKysrCj4gPiA+ID4gPiA+ID4gPiAgeGVuL2Fy
Y2gveDg2L2d1ZXN0L2h5cGVydi9wcml2YXRlLmggfCAgNCArKysKPiA+ID4gPiA+ID4gPiA+ICB4
ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L3RsYi5jICAgICB8IDQxICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrCj4gPiA+ID4gPiA+ID4gPiAgNCBmaWxlcyBjaGFuZ2VkLCA2MyBpbnNlcnRp
b25zKCspCj4gPiA+ID4gPiA+ID4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHhlbi9hcmNoL3g4Ni9n
dWVzdC9oeXBlcnYvdGxiLmMKPiA+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+ID4gZGlmZiAt
LWdpdCBhL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvTWFrZWZpbGUKPiA+ID4gPiA+ID4gPiA+
IGIveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9NYWtlZmlsZQo+ID4gPiA+ID4gPiA+ID4gaW5k
ZXggNjgxNzAxMDlhOS4uMTg5MDJjMzNlOSAxMDA2NDQKPiA+ID4gPiA+ID4gPiA+IC0tLSBhL3hl
bi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvTWFrZWZpbGUKPiA+ID4gPiA+ID4gPiA+ICsrKyBiL3hl
bi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvTWFrZWZpbGUKPiA+ID4gPiA+ID4gPiA+IEBAIC0xICsx
LDIgQEAKPiA+ID4gPiA+ID4gPiA+ICBvYmoteSArPSBoeXBlcnYubwo+ID4gPiA+ID4gPiA+ID4g
K29iai15ICs9IHRsYi5vCj4gPiA+ID4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2
L2d1ZXN0L2h5cGVydi9oeXBlcnYuYwo+ID4gPiA+ID4gPiA+ID4gYi94ZW4vYXJjaC94ODYvZ3Vl
c3QvaHlwZXJ2L2h5cGVydi5jCj4gPiA+ID4gPiA+ID4gPiBpbmRleCA3MGY0Y2Q1YWUwLi5mOWQx
ZjExYWUzIDEwMDY0NAo+ID4gPiA+ID4gPiA+ID4gLS0tIGEveGVuL2FyY2gveDg2L2d1ZXN0L2h5
cGVydi9oeXBlcnYuYwo+ID4gPiA+ID4gPiA+ID4gKysrIGIveGVuL2FyY2gveDg2L2d1ZXN0L2h5
cGVydi9oeXBlcnYuYwo+ID4gPiA+ID4gPiA+ID4gQEAgLTMzLDYgKzMzLDggQEAgREVGSU5FX1BF
Ul9DUFVfUkVBRF9NT1NUTFkodm9pZCAqLCBodl9pbnB1dF9wYWdlKTsKPiA+ID4gPiA+ID4gPiA+
ICBERUZJTkVfUEVSX0NQVV9SRUFEX01PU1RMWSh2b2lkICosIGh2X3ZwX2Fzc2lzdCk7Cj4gPiA+
ID4gPiA+ID4gPiAgREVGSU5FX1BFUl9DUFVfUkVBRF9NT1NUTFkodW5zaWduZWQgaW50LCBodl92
cF9pbmRleCk7Cj4gPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiA+ICtzdGF0aWMgYm9vbCBf
X3JlYWRfbW9zdGx5IGh2X2hjYWxsX3BhZ2VfcmVhZHk7Cj4gPiA+ID4gPiA+ID4gPiArCj4gPiA+
ID4gPiA+ID4gPiAgc3RhdGljIHVpbnQ2NF90IGdlbmVyYXRlX2d1ZXN0X2lkKHZvaWQpCj4gPiA+
ID4gPiA+ID4gPiAgewo+ID4gPiA+ID4gPiA+ID4gICAgICB1bmlvbiBodl9ndWVzdF9vc19pZCBp
ZCA9IHt9Owo+ID4gPiA+ID4gPiA+ID4gQEAgLTExOSw2ICsxMjEsOCBAQCBzdGF0aWMgdm9pZCBf
X2luaXQgc2V0dXBfaHlwZXJjYWxsX3BhZ2Uodm9pZCkKPiA+ID4gPiA+ID4gPiA+ICAgICAgQlVH
X09OKCFoeXBlcmNhbGxfbXNyLmVuYWJsZSk7Cj4gPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4g
PiA+ICAgICAgc2V0X2ZpeG1hcF94KEZJWF9YX0hZUEVSVl9IQ0FMTCwgbWZuIDw8IFBBR0VfU0hJ
RlQpOwo+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+IFNob3VsZG4ndCB0aGlzIGhhdmUgYXQg
bGVhc3QgYSBjb21waWxlciBiYXJyaWVyIGhlcmU/Cj4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+
IAo+ID4gPiA+ID4gPiBPSy4gSSB3aWxsIGFkZCBhIHdyaXRlIGJhcnJpZXIgaGVyZS4KPiA+ID4g
PiA+IAo+ID4gPiA+ID4gSG0sIHNob3VsZG4ndCBzdWNoIGJhcnJpZXIgYmUgcGFydCBvZiBzZXRf
Zml4bWFwX3ggaXRzZWxmPwo+ID4gPiA+ID4gCj4gPiA+ID4gPiBOb3RlIHRoYXQgbWFwX3BhZ2Vz
X3RvX3hlbiBhbHJlYWR5IHBlcmZvcm1zIGF0b21pYyB3cml0ZXMuCj4gPiA+ID4gCj4gPiA+ID4g
SSBkb24ndCBtaW5kIG1ha2luZyB0aGluZ3MgbW9yZSBleHBsaWNpdCB0aG91Z2guIEhvd2V2ZXIg
dW5saWtlbHksIEkKPiA+ID4gPiBtYXkgZW5kIHVwIHB1dHRpbmcgc29tZXRoaW5nIGluIGJldHdl
ZW4gc2V0X2ZpeG1hcF94IGFuZCBzZXR0aW5nCj4gPiA+ID4gaGNhbGxfcGFnZV9yZWFkeSwgSSB3
aWxsIG5lZWQgdGhlIGJhcnJpZXIgYnkgdGhlbiwgSSBtYXkgYXMgd2VsbCBwdXQgaXQKPiA+ID4g
PiBpbiBub3cuCj4gPiA+IAo+ID4gPiBJTU8gc2V0X2ZpeG1hcF94IHNob3VsZCBoYXZlIHRoZSBu
ZWNlc3NhcnkgYmFycmllcnMgKG9yIG90aGVyCj4gPiA+IHN5bmNocm9uaXphdGlvbiBtZXRob2Rz
KSBzbyB0aGF0IG9uIHJldHVybiB0aGUgYWRkcmVzcyBpcyBjb3JyZWN0bHkKPiA+ID4gbWFwcGVk
IGFjcm9zcyBhbGwgcHJvY2Vzc29ycywgYW5kIHRoYXQgaXQgcHJldmVudHMgdGhlIGNvbXBpbGVy
IGZyb20KPiA+ID4gbW92aW5nIGFjY2Vzc2VzIHBhc3QgaXQuIEkgd291bGQgY29uc2lkZXIgYSBi
dWcgb2Ygc2V0X2ZpeG1hcF94Cj4gPiA+IG5vdCBoYXZpbmcgdGhpcyBiZWhhdmlvciBhbmQgcmVx
dWlyaW5nIGNhbGxlcnMgdG8gZG8gZXh0cmEgd29yayBpbgo+ID4gPiBvcmRlciB0byBlbnN1cmUg
dGhpcy4KPiA+ID4gCj4gPiA+IEllOiBzb21ldGhpbmcgbGlrZSB0aGUgc25pcHBlZCBiZWxvdyBz
aG91bGQgbm90IHJlcXVpcmUgYW4gZXh0cmEKPiA+ID4gYmFycmllciBJTU86Cj4gPiA+IAo+ID4g
PiBzZXRfZml4bWFwX3goRklYX1hfSFlQRVJWX0hDQUxMLCBtZm4gPDwgUEFHRV9TSElGVCk7Cj4g
PiA+ICooKHVuc2lnbmVkIGludCAqKWZpeF94X3RvX3ZpcnQoRklYX1hfSFlQRVJWX0hDQUxMKSkg
PSAwOwo+ID4gCj4gPiBUaGF0J3MgZGlmZmVyZW50IHRob3VnaC4gQ29tcGlsZXIgY2FuJ3QgbWFr
ZSB0aGUgY29ubmVjdGlvbiBiZXR3ZWVuCj4gPiBoY2FsbF9wYWdlX3JlYWR5IGFuZCB0aGUgYWRk
cmVzcyByZXR1cm5lZCBieSBzZXRfZml4bWFwX3guCj4gCj4gSSdtIG5vdCBzdXJlIHRoZSBjb21w
aWxlciBjYW4gbWFrZSBhIGNvbm5lY3Rpb24gYmV0d2VlbiBzZXRfZml4bWFwX3gKPiBhbmQgZml4
X3hfdG9fdmlydCBlaXRoZXIgKGFzIGZpeF94X3RvX3ZpcnQgaXMgYSBzaW1wbGUgbWF0aGVtYXRp
Y2FsCj4gb3BlcmF0aW9uIGFuZCBGSVhfWF9IWVBFUlZfSENBTEwgaXMgYSBjb25zdGFudCBrbm93
biBhdCBidWlsZCB0aW1lKS4KCk9oLCBJIG1pc3JlYWQgeW91ciBleGFtcGxlLCBzb3JyeS4KCldl
aS4KCj4gCj4gUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs

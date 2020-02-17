Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B6116115D
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2020 12:48:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j3eqP-00014i-Mf; Mon, 17 Feb 2020 11:45:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Vo74=4F=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1j3eqO-00014d-8n
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2020 11:45:44 +0000
X-Inumbo-ID: 074595ce-517b-11ea-bfd4-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 074595ce-517b-11ea-bfd4-12813bfff9fa;
 Mon, 17 Feb 2020 11:45:43 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j3eqM-0000qh-4z; Mon, 17 Feb 2020 11:45:42 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j3eqL-0004YA-Rg; Mon, 17 Feb 2020 11:45:42 +0000
Date: Mon, 17 Feb 2020 11:45:38 +0000
From: Wei Liu <wl@xen.org>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Message-ID: <20200217114538.s34hqiaq35kfv2sf@debian>
References: <20200214123430.4942-1-liuwe@microsoft.com>
 <20200214123430.4942-3-liuwe@microsoft.com>
 <b27c6b19151b412aaa2dc33366e71ae7@EX13D32EUC003.ant.amazon.com>
 <20200217113441.c7q2uclargvrleyo@debian>
 <20200217114031.GF4679@Air-de-Roger>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200217114031.GF4679@Air-de-Roger>
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

T24gTW9uLCBGZWIgMTcsIDIwMjAgYXQgMTI6NDA6MzFQTSArMDEwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBNb24sIEZlYiAxNywgMjAyMCBhdCAxMTozNDo0MUFNICswMDAwLCBXZWkg
TGl1IHdyb3RlOgo+ID4gT24gRnJpLCBGZWIgMTQsIDIwMjAgYXQgMDQ6NTU6NDRQTSArMDAwMCwg
RHVycmFudCwgUGF1bCB3cm90ZToKPiA+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+
ID4gPiA+IEZyb206IFdlaSBMaXUgPHdlaS5saXUueGVuQGdtYWlsLmNvbT4gT24gQmVoYWxmIE9m
IFdlaSBMaXUKPiA+ID4gPiBTZW50OiAxNCBGZWJydWFyeSAyMDIwIDEzOjM0Cj4gPiA+ID4gVG86
IFhlbiBEZXZlbG9wbWVudCBMaXN0IDx4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc+Cj4g
PiA+ID4gQ2M6IE1pY2hhZWwgS2VsbGV5IDxtaWtlbGxleUBtaWNyb3NvZnQuY29tPjsgRHVycmFu
dCwgUGF1bAo+ID4gPiA+IDxwZHVycmFudEBhbWF6b24uY28udWs+OyBXZWkgTGl1IDxsaXV3ZUBt
aWNyb3NvZnQuY29tPjsgV2VpIExpdQo+ID4gPiA+IDx3bEB4ZW4ub3JnPjsgSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPjsgQW5kcmV3IENvb3Blcgo+ID4gPiA+IDxhbmRyZXcuY29vcGVy
M0BjaXRyaXguY29tPjsgUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4g
PiA+ID4gU3ViamVjdDogW1BBVENIIHYyIDIvM10geDg2L2h5cGVydjogc2tlbGV0b24gZm9yIEww
IGFzc2lzdGVkIFRMQiBmbHVzaAo+ID4gPiA+IAo+ID4gPiA+IEltcGxlbWVudCBhIGJhc2ljIGhv
b2sgZm9yIEwwIGFzc2lzdGVkIFRMQiBmbHVzaC4gVGhlIGhvb2sgbmVlZHMgdG8KPiA+ID4gPiBj
aGVjayBpZiBwcmVyZXF1aXNpdGVzIGFyZSBtZXQuIElmIHRoZXkgYXJlIG5vdCBtZXQsIGl0IHJl
dHVybnMgYW4gZXJyb3IKPiA+ID4gPiBudW1iZXIgdG8gZmFsbCBiYWNrIHRvIG5hdGl2ZSBmbHVz
aGVzLgo+ID4gPiA+IAo+ID4gPiA+IEludHJvZHVjZSBhIG5ldyB2YXJpYWJsZSB0byBpbmRpY2F0
ZSBpZiBoeXBlcmNhbGwgcGFnZSBpcyByZWFkeS4KPiA+ID4gPiAKPiA+ID4gPiBTaWduZWQtb2Zm
LWJ5OiBXZWkgTGl1IDxsaXV3ZUBtaWNyb3NvZnQuY29tPgo+ID4gPiA+IC0tLQo+ID4gPiA+ICB4
ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L01ha2VmaWxlICB8ICAxICsKPiA+ID4gPiAgeGVuL2Fy
Y2gveDg2L2d1ZXN0L2h5cGVydi9oeXBlcnYuYyAgfCAxNyArKysrKysrKysrKysKPiA+ID4gPiAg
eGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9wcml2YXRlLmggfCAgNCArKysKPiA+ID4gPiAgeGVu
L2FyY2gveDg2L2d1ZXN0L2h5cGVydi90bGIuYyAgICAgfCA0MSArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKwo+ID4gPiA+ICA0IGZpbGVzIGNoYW5nZWQsIDYzIGluc2VydGlvbnMoKykKPiA+
ID4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHhlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvdGxiLmMK
PiA+ID4gPiAKPiA+ID4gPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9N
YWtlZmlsZQo+ID4gPiA+IGIveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9NYWtlZmlsZQo+ID4g
PiA+IGluZGV4IDY4MTcwMTA5YTkuLjE4OTAyYzMzZTkgMTAwNjQ0Cj4gPiA+ID4gLS0tIGEveGVu
L2FyY2gveDg2L2d1ZXN0L2h5cGVydi9NYWtlZmlsZQo+ID4gPiA+ICsrKyBiL3hlbi9hcmNoL3g4
Ni9ndWVzdC9oeXBlcnYvTWFrZWZpbGUKPiA+ID4gPiBAQCAtMSArMSwyIEBACj4gPiA+ID4gIG9i
ai15ICs9IGh5cGVydi5vCj4gPiA+ID4gK29iai15ICs9IHRsYi5vCj4gPiA+ID4gZGlmZiAtLWdp
dCBhL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMKPiA+ID4gPiBiL3hlbi9hcmNo
L3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMKPiA+ID4gPiBpbmRleCA3MGY0Y2Q1YWUwLi5mOWQx
ZjExYWUzIDEwMDY0NAo+ID4gPiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlw
ZXJ2LmMKPiA+ID4gPiArKysgYi94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVydi5jCj4g
PiA+ID4gQEAgLTMzLDYgKzMzLDggQEAgREVGSU5FX1BFUl9DUFVfUkVBRF9NT1NUTFkodm9pZCAq
LCBodl9pbnB1dF9wYWdlKTsKPiA+ID4gPiAgREVGSU5FX1BFUl9DUFVfUkVBRF9NT1NUTFkodm9p
ZCAqLCBodl92cF9hc3Npc3QpOwo+ID4gPiA+ICBERUZJTkVfUEVSX0NQVV9SRUFEX01PU1RMWSh1
bnNpZ25lZCBpbnQsIGh2X3ZwX2luZGV4KTsKPiA+ID4gPiAKPiA+ID4gPiArc3RhdGljIGJvb2wg
X19yZWFkX21vc3RseSBodl9oY2FsbF9wYWdlX3JlYWR5Owo+ID4gPiA+ICsKPiA+ID4gPiAgc3Rh
dGljIHVpbnQ2NF90IGdlbmVyYXRlX2d1ZXN0X2lkKHZvaWQpCj4gPiA+ID4gIHsKPiA+ID4gPiAg
ICAgIHVuaW9uIGh2X2d1ZXN0X29zX2lkIGlkID0ge307Cj4gPiA+ID4gQEAgLTExOSw2ICsxMjEs
OCBAQCBzdGF0aWMgdm9pZCBfX2luaXQgc2V0dXBfaHlwZXJjYWxsX3BhZ2Uodm9pZCkKPiA+ID4g
PiAgICAgIEJVR19PTighaHlwZXJjYWxsX21zci5lbmFibGUpOwo+ID4gPiA+IAo+ID4gPiA+ICAg
ICAgc2V0X2ZpeG1hcF94KEZJWF9YX0hZUEVSVl9IQ0FMTCwgbWZuIDw8IFBBR0VfU0hJRlQpOwo+
ID4gPiAKPiA+ID4gU2hvdWxkbid0IHRoaXMgaGF2ZSBhdCBsZWFzdCBhIGNvbXBpbGVyIGJhcnJp
ZXIgaGVyZT8KPiA+ID4gCj4gPiAKPiA+IE9LLiBJIHdpbGwgYWRkIGEgd3JpdGUgYmFycmllciBo
ZXJlLgo+IAo+IEhtLCBzaG91bGRuJ3Qgc3VjaCBiYXJyaWVyIGJlIHBhcnQgb2Ygc2V0X2ZpeG1h
cF94IGl0c2VsZj8KPiAKPiBOb3RlIHRoYXQgbWFwX3BhZ2VzX3RvX3hlbiBhbHJlYWR5IHBlcmZv
cm1zIGF0b21pYyB3cml0ZXMuCgpJIGRvbid0IG1pbmQgbWFraW5nIHRoaW5ncyBtb3JlIGV4cGxp
Y2l0IHRob3VnaC4gSG93ZXZlciB1bmxpa2VseSwgSQptYXkgZW5kIHVwIHB1dHRpbmcgc29tZXRo
aW5nIGluIGJldHdlZW4gc2V0X2ZpeG1hcF94IGFuZCBzZXR0aW5nCmhjYWxsX3BhZ2VfcmVhZHks
IEkgd2lsbCBuZWVkIHRoZSBiYXJyaWVyIGJ5IHRoZW4sIEkgbWF5IGFzIHdlbGwgcHV0IGl0Cmlu
IG5vdy4KCldlaS4KCj4gCj4gUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E4B161259
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2020 13:51:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j3fpB-0008LI-EH; Mon, 17 Feb 2020 12:48:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Vo74=4F=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1j3fpA-0008LB-Lj
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2020 12:48:32 +0000
X-Inumbo-ID: cd767170-5183-11ea-ade5-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cd767170-5183-11ea-ade5-bc764e2007e4;
 Mon, 17 Feb 2020 12:48:31 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j3fp8-0002Ca-OG; Mon, 17 Feb 2020 12:48:30 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j3fp8-0007uH-E1; Mon, 17 Feb 2020 12:48:30 +0000
Date: Mon, 17 Feb 2020 12:48:27 +0000
From: Wei Liu <wl@xen.org>
To: "Durrant, Paul" <pdurrant@amazon.co.uk>
Message-ID: <20200217124827.crnzaukfbnk5yxgw@debian>
References: <20200214123430.4942-1-liuwe@microsoft.com>
 <20200214123430.4942-3-liuwe@microsoft.com>
 <b27c6b19151b412aaa2dc33366e71ae7@EX13D32EUC003.ant.amazon.com>
 <20200217113441.c7q2uclargvrleyo@debian>
 <20200217114031.GF4679@Air-de-Roger>
 <c568cdaedbc346de8d7956796f757ef5@EX13D32EUC003.ant.amazon.com>
 <20200217120813.GH4679@Air-de-Roger>
 <f712911e0b344bb1a260652b96260363@EX13D32EUC003.ant.amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f712911e0b344bb1a260652b96260363@EX13D32EUC003.ant.amazon.com>
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

T24gTW9uLCBGZWIgMTcsIDIwMjAgYXQgMTI6MjE6MDlQTSArMDAwMCwgRHVycmFudCwgUGF1bCB3
cm90ZToKPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gPiBGcm9tOiBSb2dlciBQYXUg
TW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiA+IFNlbnQ6IDE3IEZlYnJ1YXJ5IDIwMjAg
MTI6MDgKPiA+IFRvOiBEdXJyYW50LCBQYXVsIDxwZHVycmFudEBhbWF6b24uY28udWs+Cj4gPiBD
YzogV2VpIExpdSA8d2xAeGVuLm9yZz47IFhlbiBEZXZlbG9wbWVudCBMaXN0IDx4ZW4tCj4gPiBk
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZz47IE1pY2hhZWwgS2VsbGV5IDxtaWtlbGxleUBtaWNy
b3NvZnQuY29tPjsgV2VpCj4gPiBMaXUgPGxpdXdlQG1pY3Jvc29mdC5jb20+OyBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+OyBBbmRyZXcgQ29vcGVyCj4gPiA8YW5kcmV3LmNvb3BlcjNA
Y2l0cml4LmNvbT4KPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMi8zXSB4ODYvaHlwZXJ2OiBz
a2VsZXRvbiBmb3IgTDAgYXNzaXN0ZWQgVExCIGZsdXNoCj4gPiAKPiA+IE9uIE1vbiwgRmViIDE3
LCAyMDIwIGF0IDEyOjAxOjIzUE0gKzAwMDAsIER1cnJhbnQsIFBhdWwgd3JvdGU6Cj4gPiA+ID4g
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiA+ID4gPiBGcm9tOiBSb2dlciBQYXUgTW9ubsOp
IDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiA+ID4gPiBTZW50OiAxNyBGZWJydWFyeSAyMDIwIDEx
OjQxCj4gPiA+ID4gVG86IFdlaSBMaXUgPHdsQHhlbi5vcmc+Cj4gPiA+ID4gQ2M6IER1cnJhbnQs
IFBhdWwgPHBkdXJyYW50QGFtYXpvbi5jby51az47IFhlbiBEZXZlbG9wbWVudCBMaXN0IDx4ZW4t
Cj4gPiA+ID4gZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc+OyBNaWNoYWVsIEtlbGxleSA8bWlr
ZWxsZXlAbWljcm9zb2Z0LmNvbT47Cj4gPiBXZWkKPiA+ID4gPiBMaXUgPGxpdXdlQG1pY3Jvc29m
dC5jb20+OyBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+OyBBbmRyZXcKPiA+IENvb3Bl
cgo+ID4gPiA+IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+ID4gPiA+IFN1YmplY3Q6IFJl
OiBbUEFUQ0ggdjIgMi8zXSB4ODYvaHlwZXJ2OiBza2VsZXRvbiBmb3IgTDAgYXNzaXN0ZWQgVExC
Cj4gPiBmbHVzaAo+ID4gPiA+Cj4gPiA+ID4gT24gTW9uLCBGZWIgMTcsIDIwMjAgYXQgMTE6MzQ6
NDFBTSArMDAwMCwgV2VpIExpdSB3cm90ZToKPiA+ID4gPiA+IE9uIEZyaSwgRmViIDE0LCAyMDIw
IGF0IDA0OjU1OjQ0UE0gKzAwMDAsIER1cnJhbnQsIFBhdWwgd3JvdGU6Cj4gPiA+ID4gPiA+ID4g
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiA+ID4gPiA+ID4gPiBGcm9tOiBXZWkgTGl1IDx3
ZWkubGl1LnhlbkBnbWFpbC5jb20+IE9uIEJlaGFsZiBPZiBXZWkgTGl1Cj4gPiA+ID4gPiA+ID4g
U2VudDogMTQgRmVicnVhcnkgMjAyMCAxMzozNAo+ID4gPiA+ID4gPiA+IFRvOiBYZW4gRGV2ZWxv
cG1lbnQgTGlzdCA8eGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnPgo+ID4gPiA+ID4gPiA+
IENjOiBNaWNoYWVsIEtlbGxleSA8bWlrZWxsZXlAbWljcm9zb2Z0LmNvbT47IER1cnJhbnQsIFBh
dWwKPiA+ID4gPiA+ID4gPiA8cGR1cnJhbnRAYW1hem9uLmNvLnVrPjsgV2VpIExpdSA8bGl1d2VA
bWljcm9zb2Z0LmNvbT47IFdlaSBMaXUKPiA+ID4gPiA+ID4gPiA8d2xAeGVuLm9yZz47IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT47IEFuZHJldyBDb29wZXIKPiA+ID4gPiA+ID4gPiA8
YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IFJvZ2VyIFBhdSBNb25uw6kKPiA+IDxyb2dlci5w
YXVAY2l0cml4LmNvbT4KPiA+ID4gPiA+ID4gPiBTdWJqZWN0OiBbUEFUQ0ggdjIgMi8zXSB4ODYv
aHlwZXJ2OiBza2VsZXRvbiBmb3IgTDAgYXNzaXN0ZWQgVExCCj4gPiA+ID4gZmx1c2gKPiA+ID4g
PiA+ID4gPgo+ID4gPiA+ID4gPiA+IEltcGxlbWVudCBhIGJhc2ljIGhvb2sgZm9yIEwwIGFzc2lz
dGVkIFRMQiBmbHVzaC4gVGhlIGhvb2sgbmVlZHMKPiA+IHRvCj4gPiA+ID4gPiA+ID4gY2hlY2sg
aWYgcHJlcmVxdWlzaXRlcyBhcmUgbWV0LiBJZiB0aGV5IGFyZSBub3QgbWV0LCBpdCByZXR1cm5z
Cj4gPiBhbgo+ID4gPiA+IGVycm9yCj4gPiA+ID4gPiA+ID4gbnVtYmVyIHRvIGZhbGwgYmFjayB0
byBuYXRpdmUgZmx1c2hlcy4KPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+IEludHJvZHVjZSBh
IG5ldyB2YXJpYWJsZSB0byBpbmRpY2F0ZSBpZiBoeXBlcmNhbGwgcGFnZSBpcyByZWFkeS4KPiA+
ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPGxpdXdlQG1p
Y3Jvc29mdC5jb20+Cj4gPiA+ID4gPiA+ID4gLS0tCj4gPiA+ID4gPiA+ID4gIHhlbi9hcmNoL3g4
Ni9ndWVzdC9oeXBlcnYvTWFrZWZpbGUgIHwgIDEgKwo+ID4gPiA+ID4gPiA+ICB4ZW4vYXJjaC94
ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVydi5jICB8IDE3ICsrKysrKysrKysrKwo+ID4gPiA+ID4gPiA+
ICB4ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L3ByaXZhdGUuaCB8ICA0ICsrKwo+ID4gPiA+ID4g
PiA+ICB4ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L3RsYi5jICAgICB8IDQxCj4gPiA+ID4gKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysKPiA+ID4gPiA+ID4gPiAgNCBmaWxlcyBjaGFuZ2Vk
LCA2MyBpbnNlcnRpb25zKCspCj4gPiA+ID4gPiA+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCB4ZW4v
YXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L3RsYi5jCj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiBk
aWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9NYWtlZmlsZQo+ID4gPiA+ID4g
PiA+IGIveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9NYWtlZmlsZQo+ID4gPiA+ID4gPiA+IGlu
ZGV4IDY4MTcwMTA5YTkuLjE4OTAyYzMzZTkgMTAwNjQ0Cj4gPiA+ID4gPiA+ID4gLS0tIGEveGVu
L2FyY2gveDg2L2d1ZXN0L2h5cGVydi9NYWtlZmlsZQo+ID4gPiA+ID4gPiA+ICsrKyBiL3hlbi9h
cmNoL3g4Ni9ndWVzdC9oeXBlcnYvTWFrZWZpbGUKPiA+ID4gPiA+ID4gPiBAQCAtMSArMSwyIEBA
Cj4gPiA+ID4gPiA+ID4gIG9iai15ICs9IGh5cGVydi5vCj4gPiA+ID4gPiA+ID4gK29iai15ICs9
IHRsYi5vCj4gPiA+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBl
cnYvaHlwZXJ2LmMKPiA+ID4gPiA+ID4gPiBiL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlw
ZXJ2LmMKPiA+ID4gPiA+ID4gPiBpbmRleCA3MGY0Y2Q1YWUwLi5mOWQxZjExYWUzIDEwMDY0NAo+
ID4gPiA+ID4gPiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMKPiA+
ID4gPiA+ID4gPiArKysgYi94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVydi5jCj4gPiA+
ID4gPiA+ID4gQEAgLTMzLDYgKzMzLDggQEAgREVGSU5FX1BFUl9DUFVfUkVBRF9NT1NUTFkodm9p
ZCAqLAo+ID4gaHZfaW5wdXRfcGFnZSk7Cj4gPiA+ID4gPiA+ID4gIERFRklORV9QRVJfQ1BVX1JF
QURfTU9TVExZKHZvaWQgKiwgaHZfdnBfYXNzaXN0KTsKPiA+ID4gPiA+ID4gPiAgREVGSU5FX1BF
Ul9DUFVfUkVBRF9NT1NUTFkodW5zaWduZWQgaW50LCBodl92cF9pbmRleCk7Cj4gPiA+ID4gPiA+
ID4KPiA+ID4gPiA+ID4gPiArc3RhdGljIGJvb2wgX19yZWFkX21vc3RseSBodl9oY2FsbF9wYWdl
X3JlYWR5Owo+ID4gPiA+ID4gPiA+ICsKPiA+ID4gPiA+ID4gPiAgc3RhdGljIHVpbnQ2NF90IGdl
bmVyYXRlX2d1ZXN0X2lkKHZvaWQpCj4gPiA+ID4gPiA+ID4gIHsKPiA+ID4gPiA+ID4gPiAgICAg
IHVuaW9uIGh2X2d1ZXN0X29zX2lkIGlkID0ge307Cj4gPiA+ID4gPiA+ID4gQEAgLTExOSw2ICsx
MjEsOCBAQCBzdGF0aWMgdm9pZCBfX2luaXQKPiA+IHNldHVwX2h5cGVyY2FsbF9wYWdlKHZvaWQp
Cj4gPiA+ID4gPiA+ID4gICAgICBCVUdfT04oIWh5cGVyY2FsbF9tc3IuZW5hYmxlKTsKPiA+ID4g
PiA+ID4gPgo+ID4gPiA+ID4gPiA+ICAgICAgc2V0X2ZpeG1hcF94KEZJWF9YX0hZUEVSVl9IQ0FM
TCwgbWZuIDw8IFBBR0VfU0hJRlQpOwo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBTaG91bGRuJ3Qg
dGhpcyBoYXZlIGF0IGxlYXN0IGEgY29tcGlsZXIgYmFycmllciBoZXJlPwo+ID4gPiA+ID4gPgo+
ID4gPiA+ID4KPiA+ID4gPiA+IE9LLiBJIHdpbGwgYWRkIGEgd3JpdGUgYmFycmllciBoZXJlLgo+
ID4gPiA+Cj4gPiA+ID4gSG0sIHNob3VsZG4ndCBzdWNoIGJhcnJpZXIgYmUgcGFydCBvZiBzZXRf
Zml4bWFwX3ggaXRzZWxmPwo+ID4gPiA+Cj4gPiA+Cj4gPiA+IE5vdCByZWFsbHksIGZvciB0aGUg
cHVycG9zZSBJIGhhZCBpbiBtaW5kLiBUaGUgaHZfaGNhbGxfcGFnZV9yZWFkeQo+ID4gZ2xvYmFs
IGlzIHNwZWNpZmljIHRvIHRoaXMgY29kZSBhbmQgd2UgbmVlZCB0byBtYWtlIHN1cmUgdGhlIHBh
Z2UgaXMKPiA+IGFjdHVhbGx5IHJlYWR5IGJlZm9yZSB0aGUgY29kZSBzYXlzIGl0IGlzLgo+ID4g
Cj4gPiBCdXQgYW55dGhpbmcgdGhhdCBtb2RpZmllcyB0aGUgcGFnZSB0YWJsZXMgc2hvdWxkIGFs
cmVhZHkgaGF2ZSBhCj4gPiBiYXJyaWVyIGlmIHJlcXVpcmVkIGluIG9yZGVyIHRvIHByZXZlbnQg
YWNjZXNzZXMgZnJvbSBiZWluZyBtb3ZlZAo+ID4gYWhlYWQgb2YgaXQsIG9yIGVsc2UgdGhpbmdz
IHdvdWxkIGNlcnRhaW5seSBnbyB3cm9uZyBpbiBtYW55IG90aGVyCj4gPiBwbGFjZXM/Cj4gCj4g
T2guIEknbSBub3Qgc2F5aW5nIHRoYXQgd2UgZG9uJ3QgbmVlZCBhIGJhcnJpZXIgdGhlcmUgdG9v
IChhbmQgbW9yZQo+IHRoYW4gYSBjb21waWxlciBvbmUgaW4gdGhhdCBjYXNlKS4KPiAKClRoZSBh
cmd1bWVudCBSb2dlciBoYXMgaXMgdGhhdCBzZXRfZml4bWFwX3ggYWxzbyBjb250YWlucyBzdHJv
bmcgZW5vdWdoCmJhcnJpZXJzIHRvIHByZXZlbnQgaGNhbGxfcGFnZV9yZWFkeSB0byBiZSBzZXQg
YmVmb3JlIHBhZ2UgdGFibGUgaXMKY29ycmVjdGx5IHNldCB1cC4KClNpbmNlIHlvdSBhc2tlZCBm
b3IgaXQsIHRoZXJlIG11c3QgYmUgc29tZXRoaW5nIG9uIHlvdXIgbWluZCB0aGF0CnByb21wdGVk
IHRoaXMgKG1heWJlIGl0IGlzIHNpbXBseSBiZWNhdXNlIHlvdSB3ZXJlIGJpdHRlbiBieSBzaW1p
bGFyCnRoaW5ncyBhbmQgd2FudHMgdG8gYmUgZXh0cmEgc3VyZSwgbWF5YmUgeW91IHRoaW5rIGl0
IGlzIGhhcmRlciB0byBncmFzcAp0aGUgc2lkZSBlZmZlY3Qgb2Ygc2V0X2ZpeG1hcF94LCBtYXli
ZSBzb21ldGhpbmcgZWxzZSkuCgpDb2RlIGlzIHdyaXR0ZW4gdG8gYmUgcmVhZCBieSBodW1hbnMg
YWZ0ZXIgYWxsLiBJIHdvdWxkIHJhdGhlciBiZSBtb3JlCmV4cGxpY2l0IC8gcmVkdW5kYW50IHRv
IG1ha2UgaHVtYW5zIGhhcHB5IHRoYW4gdG8gc2F2ZSBhIHBvdGVudGlhbApiYXJyaWVyIC8gc29t
ZSB0eXBpbmcgaW4gYSBjb2RlIHBhdGguCgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs

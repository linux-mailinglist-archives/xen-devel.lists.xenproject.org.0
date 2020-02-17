Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC361611AF
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2020 13:10:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j3fC4-0003qP-BB; Mon, 17 Feb 2020 12:08:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Vo74=4F=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1j3fC2-0003qK-N9
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2020 12:08:06 +0000
X-Inumbo-ID: 277ef9fe-517e-11ea-aa99-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 277ef9fe-517e-11ea-aa99-bc764e2007e4;
 Mon, 17 Feb 2020 12:08:06 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j3fC0-0001Lu-Qg; Mon, 17 Feb 2020 12:08:04 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j3fC0-0005cq-HE; Mon, 17 Feb 2020 12:08:04 +0000
Date: Mon, 17 Feb 2020 12:08:01 +0000
From: Wei Liu <wl@xen.org>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Message-ID: <20200217120801.btsfkomxgt3aed6t@debian>
References: <20200214123430.4942-1-liuwe@microsoft.com>
 <20200214123430.4942-3-liuwe@microsoft.com>
 <b27c6b19151b412aaa2dc33366e71ae7@EX13D32EUC003.ant.amazon.com>
 <20200217113441.c7q2uclargvrleyo@debian>
 <20200217114031.GF4679@Air-de-Roger>
 <20200217114538.s34hqiaq35kfv2sf@debian>
 <20200217120054.GG4679@Air-de-Roger>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200217120054.GG4679@Air-de-Roger>
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

T24gTW9uLCBGZWIgMTcsIDIwMjAgYXQgMDE6MDA6NTRQTSArMDEwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBNb24sIEZlYiAxNywgMjAyMCBhdCAxMTo0NTozOEFNICswMDAwLCBXZWkg
TGl1IHdyb3RlOgo+ID4gT24gTW9uLCBGZWIgMTcsIDIwMjAgYXQgMTI6NDA6MzFQTSArMDEwMCwg
Um9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+ID4gT24gTW9uLCBGZWIgMTcsIDIwMjAgYXQgMTE6
MzQ6NDFBTSArMDAwMCwgV2VpIExpdSB3cm90ZToKPiA+ID4gPiBPbiBGcmksIEZlYiAxNCwgMjAy
MCBhdCAwNDo1NTo0NFBNICswMDAwLCBEdXJyYW50LCBQYXVsIHdyb3RlOgo+ID4gPiA+ID4gPiAt
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+ID4gPiA+ID4gPiBGcm9tOiBXZWkgTGl1IDx3ZWku
bGl1LnhlbkBnbWFpbC5jb20+IE9uIEJlaGFsZiBPZiBXZWkgTGl1Cj4gPiA+ID4gPiA+IFNlbnQ6
IDE0IEZlYnJ1YXJ5IDIwMjAgMTM6MzQKPiA+ID4gPiA+ID4gVG86IFhlbiBEZXZlbG9wbWVudCBM
aXN0IDx4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc+Cj4gPiA+ID4gPiA+IENjOiBNaWNo
YWVsIEtlbGxleSA8bWlrZWxsZXlAbWljcm9zb2Z0LmNvbT47IER1cnJhbnQsIFBhdWwKPiA+ID4g
PiA+ID4gPHBkdXJyYW50QGFtYXpvbi5jby51az47IFdlaSBMaXUgPGxpdXdlQG1pY3Jvc29mdC5j
b20+OyBXZWkgTGl1Cj4gPiA+ID4gPiA+IDx3bEB4ZW4ub3JnPjsgSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPjsgQW5kcmV3IENvb3Blcgo+ID4gPiA+ID4gPiA8YW5kcmV3LmNvb3BlcjNA
Y2l0cml4LmNvbT47IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+ID4g
PiA+ID4gPiBTdWJqZWN0OiBbUEFUQ0ggdjIgMi8zXSB4ODYvaHlwZXJ2OiBza2VsZXRvbiBmb3Ig
TDAgYXNzaXN0ZWQgVExCIGZsdXNoCj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBJbXBsZW1lbnQg
YSBiYXNpYyBob29rIGZvciBMMCBhc3Npc3RlZCBUTEIgZmx1c2guIFRoZSBob29rIG5lZWRzIHRv
Cj4gPiA+ID4gPiA+IGNoZWNrIGlmIHByZXJlcXVpc2l0ZXMgYXJlIG1ldC4gSWYgdGhleSBhcmUg
bm90IG1ldCwgaXQgcmV0dXJucyBhbiBlcnJvcgo+ID4gPiA+ID4gPiBudW1iZXIgdG8gZmFsbCBi
YWNrIHRvIG5hdGl2ZSBmbHVzaGVzLgo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gSW50cm9kdWNl
IGEgbmV3IHZhcmlhYmxlIHRvIGluZGljYXRlIGlmIGh5cGVyY2FsbCBwYWdlIGlzIHJlYWR5Lgo+
ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8bGl1d2VAbWlj
cm9zb2Z0LmNvbT4KPiA+ID4gPiA+ID4gLS0tCj4gPiA+ID4gPiA+ICB4ZW4vYXJjaC94ODYvZ3Vl
c3QvaHlwZXJ2L01ha2VmaWxlICB8ICAxICsKPiA+ID4gPiA+ID4gIHhlbi9hcmNoL3g4Ni9ndWVz
dC9oeXBlcnYvaHlwZXJ2LmMgIHwgMTcgKysrKysrKysrKysrCj4gPiA+ID4gPiA+ICB4ZW4vYXJj
aC94ODYvZ3Vlc3QvaHlwZXJ2L3ByaXZhdGUuaCB8ICA0ICsrKwo+ID4gPiA+ID4gPiAgeGVuL2Fy
Y2gveDg2L2d1ZXN0L2h5cGVydi90bGIuYyAgICAgfCA0MSArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKwo+ID4gPiA+ID4gPiAgNCBmaWxlcyBjaGFuZ2VkLCA2MyBpbnNlcnRpb25zKCspCj4g
PiA+ID4gPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgeGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi90
bGIuYwo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9n
dWVzdC9oeXBlcnYvTWFrZWZpbGUKPiA+ID4gPiA+ID4gYi94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlw
ZXJ2L01ha2VmaWxlCj4gPiA+ID4gPiA+IGluZGV4IDY4MTcwMTA5YTkuLjE4OTAyYzMzZTkgMTAw
NjQ0Cj4gPiA+ID4gPiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvTWFrZWZpbGUK
PiA+ID4gPiA+ID4gKysrIGIveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9NYWtlZmlsZQo+ID4g
PiA+ID4gPiBAQCAtMSArMSwyIEBACj4gPiA+ID4gPiA+ICBvYmoteSArPSBoeXBlcnYubwo+ID4g
PiA+ID4gPiArb2JqLXkgKz0gdGxiLm8KPiA+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNo
L3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMKPiA+ID4gPiA+ID4gYi94ZW4vYXJjaC94ODYvZ3Vl
c3QvaHlwZXJ2L2h5cGVydi5jCj4gPiA+ID4gPiA+IGluZGV4IDcwZjRjZDVhZTAuLmY5ZDFmMTFh
ZTMgMTAwNjQ0Cj4gPiA+ID4gPiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlw
ZXJ2LmMKPiA+ID4gPiA+ID4gKysrIGIveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9oeXBlcnYu
Ywo+ID4gPiA+ID4gPiBAQCAtMzMsNiArMzMsOCBAQCBERUZJTkVfUEVSX0NQVV9SRUFEX01PU1RM
WSh2b2lkICosIGh2X2lucHV0X3BhZ2UpOwo+ID4gPiA+ID4gPiAgREVGSU5FX1BFUl9DUFVfUkVB
RF9NT1NUTFkodm9pZCAqLCBodl92cF9hc3Npc3QpOwo+ID4gPiA+ID4gPiAgREVGSU5FX1BFUl9D
UFVfUkVBRF9NT1NUTFkodW5zaWduZWQgaW50LCBodl92cF9pbmRleCk7Cj4gPiA+ID4gPiA+IAo+
ID4gPiA+ID4gPiArc3RhdGljIGJvb2wgX19yZWFkX21vc3RseSBodl9oY2FsbF9wYWdlX3JlYWR5
Owo+ID4gPiA+ID4gPiArCj4gPiA+ID4gPiA+ICBzdGF0aWMgdWludDY0X3QgZ2VuZXJhdGVfZ3Vl
c3RfaWQodm9pZCkKPiA+ID4gPiA+ID4gIHsKPiA+ID4gPiA+ID4gICAgICB1bmlvbiBodl9ndWVz
dF9vc19pZCBpZCA9IHt9Owo+ID4gPiA+ID4gPiBAQCAtMTE5LDYgKzEyMSw4IEBAIHN0YXRpYyB2
b2lkIF9faW5pdCBzZXR1cF9oeXBlcmNhbGxfcGFnZSh2b2lkKQo+ID4gPiA+ID4gPiAgICAgIEJV
R19PTighaHlwZXJjYWxsX21zci5lbmFibGUpOwo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gICAg
ICBzZXRfZml4bWFwX3goRklYX1hfSFlQRVJWX0hDQUxMLCBtZm4gPDwgUEFHRV9TSElGVCk7Cj4g
PiA+ID4gPiAKPiA+ID4gPiA+IFNob3VsZG4ndCB0aGlzIGhhdmUgYXQgbGVhc3QgYSBjb21waWxl
ciBiYXJyaWVyIGhlcmU/Cj4gPiA+ID4gPiAKPiA+ID4gPiAKPiA+ID4gPiBPSy4gSSB3aWxsIGFk
ZCBhIHdyaXRlIGJhcnJpZXIgaGVyZS4KPiA+ID4gCj4gPiA+IEhtLCBzaG91bGRuJ3Qgc3VjaCBi
YXJyaWVyIGJlIHBhcnQgb2Ygc2V0X2ZpeG1hcF94IGl0c2VsZj8KPiA+ID4gCj4gPiA+IE5vdGUg
dGhhdCBtYXBfcGFnZXNfdG9feGVuIGFscmVhZHkgcGVyZm9ybXMgYXRvbWljIHdyaXRlcy4KPiA+
IAo+ID4gSSBkb24ndCBtaW5kIG1ha2luZyB0aGluZ3MgbW9yZSBleHBsaWNpdCB0aG91Z2guIEhv
d2V2ZXIgdW5saWtlbHksIEkKPiA+IG1heSBlbmQgdXAgcHV0dGluZyBzb21ldGhpbmcgaW4gYmV0
d2VlbiBzZXRfZml4bWFwX3ggYW5kIHNldHRpbmcKPiA+IGhjYWxsX3BhZ2VfcmVhZHksIEkgd2ls
bCBuZWVkIHRoZSBiYXJyaWVyIGJ5IHRoZW4sIEkgbWF5IGFzIHdlbGwgcHV0IGl0Cj4gPiBpbiBu
b3cuCj4gCj4gSU1PIHNldF9maXhtYXBfeCBzaG91bGQgaGF2ZSB0aGUgbmVjZXNzYXJ5IGJhcnJp
ZXJzIChvciBvdGhlcgo+IHN5bmNocm9uaXphdGlvbiBtZXRob2RzKSBzbyB0aGF0IG9uIHJldHVy
biB0aGUgYWRkcmVzcyBpcyBjb3JyZWN0bHkKPiBtYXBwZWQgYWNyb3NzIGFsbCBwcm9jZXNzb3Jz
LCBhbmQgdGhhdCBpdCBwcmV2ZW50cyB0aGUgY29tcGlsZXIgZnJvbQo+IG1vdmluZyBhY2Nlc3Nl
cyBwYXN0IGl0LiBJIHdvdWxkIGNvbnNpZGVyIGEgYnVnIG9mIHNldF9maXhtYXBfeAo+IG5vdCBo
YXZpbmcgdGhpcyBiZWhhdmlvciBhbmQgcmVxdWlyaW5nIGNhbGxlcnMgdG8gZG8gZXh0cmEgd29y
ayBpbgo+IG9yZGVyIHRvIGVuc3VyZSB0aGlzLgo+IAo+IEllOiBzb21ldGhpbmcgbGlrZSB0aGUg
c25pcHBlZCBiZWxvdyBzaG91bGQgbm90IHJlcXVpcmUgYW4gZXh0cmEKPiBiYXJyaWVyIElNTzoK
PiAKPiBzZXRfZml4bWFwX3goRklYX1hfSFlQRVJWX0hDQUxMLCBtZm4gPDwgUEFHRV9TSElGVCk7
Cj4gKigodW5zaWduZWQgaW50ICopZml4X3hfdG9fdmlydChGSVhfWF9IWVBFUlZfSENBTEwpKSA9
IDA7CgpUaGF0J3MgZGlmZmVyZW50IHRob3VnaC4gQ29tcGlsZXIgY2FuJ3QgbWFrZSB0aGUgY29u
bmVjdGlvbiBiZXR3ZWVuCmhjYWxsX3BhZ2VfcmVhZHkgYW5kIHRoZSBhZGRyZXNzIHJldHVybmVk
IGJ5IHNldF9maXhtYXBfeC4KCldlaS4KCj4gCj4gUm9nZXIuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C89814DCC7
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 15:28:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixAlA-0000M1-Iw; Thu, 30 Jan 2020 14:25:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ezal=3T=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1ixAl9-0000Lw-Nr
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 14:25:31 +0000
X-Inumbo-ID: 5ea325ba-436c-11ea-8a81-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5ea325ba-436c-11ea-8a81-12813bfff9fa;
 Thu, 30 Jan 2020 14:25:31 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1ixAl8-0006MD-88; Thu, 30 Jan 2020 14:25:30 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1ixAl7-00087B-UN; Thu, 30 Jan 2020 14:25:30 +0000
Date: Thu, 30 Jan 2020 14:25:26 +0000
From: Wei Liu <wl@xen.org>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Message-ID: <20200130142526.en7vs26dsugbcq4k@debian>
References: <20200129202034.15052-1-liuwe@microsoft.com>
 <20200129202034.15052-9-liuwe@microsoft.com>
 <20200130120807.GJ4679@Air-de-Roger>
 <20200130122836.ccexm2c2j5i7umas@debian>
 <20200130123226.GM4679@Air-de-Roger>
 <20200130123920.3akihbn4zvnigp7q@debian>
 <20200130142201.GO4679@Air-de-Roger>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200130142201.GO4679@Air-de-Roger>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v5 08/12] x86/hyperv: provide Hyper-V
 hypercall functions
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
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <liuwe@microsoft.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKYW4gMzAsIDIwMjAgYXQgMDM6MjI6MDFQTSArMDEwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBUaHUsIEphbiAzMCwgMjAyMCBhdCAxMjozOToyMFBNICswMDAwLCBXZWkg
TGl1IHdyb3RlOgo+ID4gT24gVGh1LCBKYW4gMzAsIDIwMjAgYXQgMDE6MzI6MjZQTSArMDEwMCwg
Um9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+ID4gT24gVGh1LCBKYW4gMzAsIDIwMjAgYXQgMTI6
Mjg6MzZQTSArMDAwMCwgV2VpIExpdSB3cm90ZToKPiA+ID4gPiBPbiBUaHUsIEphbiAzMCwgMjAy
MCBhdCAwMTowODowN1BNICswMTAwLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+ID4gPiA+ID4g
Cj4gPiA+ID4gPiA+ICt9Cj4gPiA+ID4gPiA+ICsKPiA+ID4gPiA+ID4gIC8qCj4gPiA+ID4gPiA+
ICAgKiBMb2NhbCB2YXJpYWJsZXM6Cj4gPiA+ID4gPiA+ICAgKiBtb2RlOiBDCj4gPiA+ID4gPiA+
IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYveGVuLmxkcy5TIGIveGVuL2FyY2gveDg2L3hlbi5s
ZHMuUwo+ID4gPiA+ID4gPiBpbmRleCA5N2Y5YzA3ODkxLi44ZTAyYjRjNjQ4IDEwMDY0NAo+ID4g
PiA+ID4gPiAtLS0gYS94ZW4vYXJjaC94ODYveGVuLmxkcy5TCj4gPiA+ID4gPiA+ICsrKyBiL3hl
bi9hcmNoL3g4Ni94ZW4ubGRzLlMKPiA+ID4gPiA+ID4gQEAgLTMyOSw2ICszMjksMTAgQEAgU0VD
VElPTlMKPiA+ID4gPiA+ID4gICAgZWZpID0gLjsKPiA+ID4gPiA+ID4gICNlbmRpZgo+ID4gPiA+
ID4gPiAgCj4gPiA+ID4gPiA+ICsjaWZkZWYgQ09ORklHX0hZUEVSVl9HVUVTVAo+ID4gPiA+ID4g
PiArICBodl9oY2FsbF9wYWdlID0gQUJTT0xVVEUoX19maXhfeF90b192aXJ0KDEpKTsKPiA+ID4g
PiA+IAo+ID4gPiA+ID4gSSBhc3N1bWUgdGhlcmUncyBubyB3YXkgdG8gdXNlIEZJWF9YX0hZUEVS
Vl9IQ0FMTCBiZWNhdXNlIGl0J3MgYW4KPiA+ID4gPiA+IGVudW0/Cj4gPiA+ID4gPiAKPiA+ID4g
PiAKPiA+ID4gPiBZZXMuCj4gPiA+ID4gCj4gPiA+ID4gQW5kIHRoZSB0cmljayB0byBnZW5lcmF0
ZSBhIHN5bWJvbCBkaWRuJ3Qgd29yayBlaXRoZXIuCj4gPiA+IAo+ID4gPiBBbmQgeW91IG11c3Qg
ZGVmaW5lIHRoYXQgc3ltYm9sIGluIHRoZSBsaW5rZXIgc2NyaXB0PyBJdCBkb2Vzbid0IHNlZW0K
PiA+ID4gdG8gYmUgdXNlZCBhdCBsaW5rIHRpbWUuCj4gPiA+IAo+ID4gCj4gPiBJIGRvbid0IGZv
bGxvdy4gSSB3aXNoIEkgY291bGQgZGVmaW5lIGFuZCB1c2UgYSBzeW1ib2wgaW4gdGhlIGxpbmtl
cgo+ID4gc2NyaXB0IGJ1dCBjb3VsZG4ndC4KPiAKPiBJdCdzIGxpa2VseSBteSBmYXVsdCwgYXMg
SSBoYXZlbid0IGJlZW4gZm9sbG93aW5nIHRoZSBwYXRjaCBzZXJpZXMgaW4KPiB0aGF0IG11Y2gg
ZGV0YWlsLiBJIGFzc3VtZSB0aGlzIGlzIGRvbmUgaW4gb3JkZXIgdG8gZ2VuZXJhdGUgYmV0dGVy
Cj4gY29kZSwgcmF0aGVyIHRoYW4gZG9pbmcgc29tZXRoaW5nIGxpa2U6Cj4gCj4gdm9pZCAqaHZf
aGNhbGxfcGFnZSA9IGZpeF94X3RvX3ZpcnQoRklYX1hfSFlQRVJWX0hDQUxMKTsKPiAKPiBJbiBh
IEMgZmlsZSBzb21ld2hlcmUgd2hlbiB0aGUgaHlwZXJjYWxsIHBhZ2UgaXMgc2V0dXA/CgpBbmRy
ZXcgd2FudGVkIGJhZGx5IHRvIGJlIGFibGUgdG8gdXNlIGRpcmVjdCBjYWxsIGluIHRoZSBoeXBl
cmNhbGwKZnVuY3Rpb25zLiBUaGlzIGlzIHdoYXQgd2UgbWFuYWdlZCB0byBjb21lIHVwIHdpdGgg
c28gZmFyLgoKSSB0aGluayB3aGF0IHlvdSB3cm90ZSB3aWxsIHN0aWxsIHJlc3VsdCBpbiBhbiBp
bmRpcmVjdCBjYWxsLgoKKFRoZSBtYWpvcml0eSBvZiBteSB0aW1lIHNwZW50IG9uIHRoaXMgc2Vy
aWVzIGhhcyBiZWVuIGV4dGVuZGluZyBYZW4gdG8KZG8gbW9yZSB0aGFuIGl0IGNvdWxkIGJlZm9y
ZS4pCgpXZWkuCgo+IAo+IFRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs

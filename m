Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6CD14DE60
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 17:06:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixCHU-00035C-FS; Thu, 30 Jan 2020 16:03:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ezal=3T=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1ixCHS-000357-V1
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 16:02:58 +0000
X-Inumbo-ID: fb8f14e5-4379-11ea-8aa8-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fb8f14e5-4379-11ea-8aa8-12813bfff9fa;
 Thu, 30 Jan 2020 16:02:58 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1ixCHR-0000Td-A4; Thu, 30 Jan 2020 16:02:57 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1ixCHQ-0004YM-Vv; Thu, 30 Jan 2020 16:02:57 +0000
Date: Thu, 30 Jan 2020 16:02:53 +0000
From: Wei Liu <wl@xen.org>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Message-ID: <20200130160253.jpjdbmubxn6zo2pn@debian>
References: <20200129202034.15052-9-liuwe@microsoft.com>
 <20200130120807.GJ4679@Air-de-Roger>
 <20200130122836.ccexm2c2j5i7umas@debian>
 <20200130123226.GM4679@Air-de-Roger>
 <20200130123920.3akihbn4zvnigp7q@debian>
 <20200130142201.GO4679@Air-de-Roger>
 <20200130142526.en7vs26dsugbcq4k@debian>
 <20200130144704.GP4679@Air-de-Roger>
 <20200130150303.6ruexjz46grqdrxq@debian>
 <20200130152544.GQ4679@Air-de-Roger>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200130152544.GQ4679@Air-de-Roger>
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

T24gVGh1LCBKYW4gMzAsIDIwMjAgYXQgMDQ6MjU6NDRQTSArMDEwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBUaHUsIEphbiAzMCwgMjAyMCBhdCAwMzowMzowM1BNICswMDAwLCBXZWkg
TGl1IHdyb3RlOgo+ID4gT24gVGh1LCBKYW4gMzAsIDIwMjAgYXQgMDM6NDc6MDRQTSArMDEwMCwg
Um9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+ID4gT24gVGh1LCBKYW4gMzAsIDIwMjAgYXQgMDI6
MjU6MjZQTSArMDAwMCwgV2VpIExpdSB3cm90ZToKPiA+ID4gPiBPbiBUaHUsIEphbiAzMCwgMjAy
MCBhdCAwMzoyMjowMVBNICswMTAwLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+ID4gPiA+ID4g
T24gVGh1LCBKYW4gMzAsIDIwMjAgYXQgMTI6Mzk6MjBQTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiA+ID4gPiA+ID4gT24gVGh1LCBKYW4gMzAsIDIwMjAgYXQgMDE6MzI6MjZQTSArMDEwMCwgUm9n
ZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+ID4gPiA+ID4gPiBPbiBUaHUsIEphbiAzMCwgMjAyMCBh
dCAxMjoyODozNlBNICswMDAwLCBXZWkgTGl1IHdyb3RlOgo+ID4gPiA+ID4gPiA+ID4gT24gVGh1
LCBKYW4gMzAsIDIwMjAgYXQgMDE6MDg6MDdQTSArMDEwMCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90
ZToKPiA+ID4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gPiA+ID4gK30KPiA+ID4gPiA+ID4g
PiA+ID4gPiArCj4gPiA+ID4gPiA+ID4gPiA+ID4gIC8qCj4gPiA+ID4gPiA+ID4gPiA+ID4gICAq
IExvY2FsIHZhcmlhYmxlczoKPiA+ID4gPiA+ID4gPiA+ID4gPiAgICogbW9kZTogQwo+ID4gPiA+
ID4gPiA+ID4gPiA+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYveGVuLmxkcy5TIGIveGVuL2Fy
Y2gveDg2L3hlbi5sZHMuUwo+ID4gPiA+ID4gPiA+ID4gPiA+IGluZGV4IDk3ZjljMDc4OTEuLjhl
MDJiNGM2NDggMTAwNjQ0Cj4gPiA+ID4gPiA+ID4gPiA+ID4gLS0tIGEveGVuL2FyY2gveDg2L3hl
bi5sZHMuUwo+ID4gPiA+ID4gPiA+ID4gPiA+ICsrKyBiL3hlbi9hcmNoL3g4Ni94ZW4ubGRzLlMK
PiA+ID4gPiA+ID4gPiA+ID4gPiBAQCAtMzI5LDYgKzMyOSwxMCBAQCBTRUNUSU9OUwo+ID4gPiA+
ID4gPiA+ID4gPiA+ICAgIGVmaSA9IC47Cj4gPiA+ID4gPiA+ID4gPiA+ID4gICNlbmRpZgo+ID4g
PiA+ID4gPiA+ID4gPiA+ICAKPiA+ID4gPiA+ID4gPiA+ID4gPiArI2lmZGVmIENPTkZJR19IWVBF
UlZfR1VFU1QKPiA+ID4gPiA+ID4gPiA+ID4gPiArICBodl9oY2FsbF9wYWdlID0gQUJTT0xVVEUo
X19maXhfeF90b192aXJ0KDEpKTsKPiA+ID4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gPiA+
IEkgYXNzdW1lIHRoZXJlJ3Mgbm8gd2F5IHRvIHVzZSBGSVhfWF9IWVBFUlZfSENBTEwgYmVjYXVz
ZSBpdCdzIGFuCj4gPiA+ID4gPiA+ID4gPiA+IGVudW0/Cj4gPiA+ID4gPiA+ID4gPiA+IAo+ID4g
PiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gPiBZZXMuCj4gPiA+ID4gPiA+ID4gPiAKPiA+ID4g
PiA+ID4gPiA+IEFuZCB0aGUgdHJpY2sgdG8gZ2VuZXJhdGUgYSBzeW1ib2wgZGlkbid0IHdvcmsg
ZWl0aGVyLgo+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+IEFuZCB5b3UgbXVzdCBkZWZpbmUg
dGhhdCBzeW1ib2wgaW4gdGhlIGxpbmtlciBzY3JpcHQ/IEl0IGRvZXNuJ3Qgc2VlbQo+ID4gPiA+
ID4gPiA+IHRvIGJlIHVzZWQgYXQgbGluayB0aW1lLgo+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4g
PiAKPiA+ID4gPiA+ID4gSSBkb24ndCBmb2xsb3cuIEkgd2lzaCBJIGNvdWxkIGRlZmluZSBhbmQg
dXNlIGEgc3ltYm9sIGluIHRoZSBsaW5rZXIKPiA+ID4gPiA+ID4gc2NyaXB0IGJ1dCBjb3VsZG4n
dC4KPiA+ID4gPiA+IAo+ID4gPiA+ID4gSXQncyBsaWtlbHkgbXkgZmF1bHQsIGFzIEkgaGF2ZW4n
dCBiZWVuIGZvbGxvd2luZyB0aGUgcGF0Y2ggc2VyaWVzIGluCj4gPiA+ID4gPiB0aGF0IG11Y2gg
ZGV0YWlsLiBJIGFzc3VtZSB0aGlzIGlzIGRvbmUgaW4gb3JkZXIgdG8gZ2VuZXJhdGUgYmV0dGVy
Cj4gPiA+ID4gPiBjb2RlLCByYXRoZXIgdGhhbiBkb2luZyBzb21ldGhpbmcgbGlrZToKPiA+ID4g
PiA+IAo+ID4gPiA+ID4gdm9pZCAqaHZfaGNhbGxfcGFnZSA9IGZpeF94X3RvX3ZpcnQoRklYX1hf
SFlQRVJWX0hDQUxMKTsKPiA+ID4gPiA+IAo+ID4gPiA+ID4gSW4gYSBDIGZpbGUgc29tZXdoZXJl
IHdoZW4gdGhlIGh5cGVyY2FsbCBwYWdlIGlzIHNldHVwPwo+ID4gPiA+IAo+ID4gPiA+IEFuZHJl
dyB3YW50ZWQgYmFkbHkgdG8gYmUgYWJsZSB0byB1c2UgZGlyZWN0IGNhbGwgaW4gdGhlIGh5cGVy
Y2FsbAo+ID4gPiA+IGZ1bmN0aW9ucy4gVGhpcyBpcyB3aGF0IHdlIG1hbmFnZWQgdG8gY29tZSB1
cCB3aXRoIHNvIGZhci4KPiA+ID4gPiAKPiA+ID4gPiBJIHRoaW5rIHdoYXQgeW91IHdyb3RlIHdp
bGwgc3RpbGwgcmVzdWx0IGluIGFuIGluZGlyZWN0IGNhbGwuCj4gPiA+ID4gCj4gPiA+ID4gKFRo
ZSBtYWpvcml0eSBvZiBteSB0aW1lIHNwZW50IG9uIHRoaXMgc2VyaWVzIGhhcyBiZWVuIGV4dGVu
ZGluZyBYZW4gdG8KPiA+ID4gPiBkbyBtb3JlIHRoYW4gaXQgY291bGQgYmVmb3JlLikKPiA+ID4g
Cj4gPiA+IEFjaywgc29ycnkgdG8gYm90aGVyIHlvdSB3aXRoIHF1ZXN0aW9ucyB5b3UgaGF2ZSBh
bHJlYWR5IGFuc3dlcmVkLiBOb3QKPiA+IAo+ID4gTm8gd29ycmllcy4gSSB2YWx1ZSB5b3VyIGZl
ZWRiYWNrLiBBbmQgaGF2aW5nIG1vcmUgcGVvcGxlIHVuZGVyc3RhbmQKPiA+IHdoYXQgaXMgZ29p
bmcgb24gaXMgaW1wb3J0YW50IHRvIHRoZSBwcm9qZWN0Lgo+ID4gCj4gPiA+IHN1cmUgd2hldGhl
ciBkZWZpbmluZyBodl9oY2FsbF9wYWdlIGFzIGEgZ2xvYmFsIGNvbnN0IHdvdWxkIG1ha2UgbXVj
aAo+ID4gPiBkaWZmZXJlbmNlLiBDb3VsZCB5b3UgbWF5YmUgdXNlIHNvbWV0aGluZyBsaWtlIGFs
dGVybmF0aXZlX3ZjYWxsCj4gPiA+IHBhdGNoaW5nIHRvIGdldCByaWQgb2YgdGhlIGluZGlyZWN0
aW9uPwo+ID4gCj4gPiBUcmllZCB0aGF0IGFuZCBkaWRuJ3Qgd29yayBlaXRoZXIuIDotKAo+IAo+
IEhvdyBkbyB5b3UgY2hlY2sgd2hldGhlciB0aGVyZSdzIGFuIGluZGlyZWN0IGNhbGwgb3Igbm90
IHdoZW4gdXNpbmcKPiBhbHRlcm5hdGl2ZV92Y2FsbD8KPiAKCkkgZGlkbid0IGNoZWNrLCBiZWNh
dXNlIGFsdGVybmF0aXZlX3ZjYWxsIGRpZG4ndCBjb21waWxlIGluIHRoYXQgY2FzZS4KCj4gSXQn
cyBteSB1bmRlcnN0YW5kaW5nIHRoYXQgaW4gdGhhdCBjYXNlIHRoZSBwYXRjaGluZyB3aWxsIGhh
cHBlbiBhdAo+IHJ1bnRpbWUsIGFuZCBoZW5jZSB0aGUgZ2VuZXJhdGVkIGFzc2VtYmx5IGNvZGUg
d291bGQgc3RpbGwgdXNlIGFuCj4gaW5kaXJlY3QgY2FsbCwgYnV0IG9uY2UgcGF0Y2hlZCBhdCBy
dW50aW1lIGl0IHNob3VsZCBiZWNvbWUgYSBkaXJlY3QKPiBjYWxsLgoKSXQgZGlkbid0IGV2ZW4g
Y29tcGlsZS4gOi0oCgpXZWkuCgo+IAo+IFRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

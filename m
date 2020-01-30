Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D9414DD85
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 16:05:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixBLa-00054L-FE; Thu, 30 Jan 2020 15:03:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ezal=3T=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1ixBLY-00054E-7w
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 15:03:08 +0000
X-Inumbo-ID: 9f8ff602-4371-11ea-b211-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9f8ff602-4371-11ea-b211-bc764e2007e4;
 Thu, 30 Jan 2020 15:03:07 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1ixBLW-0007B6-RL; Thu, 30 Jan 2020 15:03:06 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1ixBLW-0001UB-HV; Thu, 30 Jan 2020 15:03:06 +0000
Date: Thu, 30 Jan 2020 15:03:03 +0000
From: Wei Liu <wl@xen.org>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Message-ID: <20200130150303.6ruexjz46grqdrxq@debian>
References: <20200129202034.15052-1-liuwe@microsoft.com>
 <20200129202034.15052-9-liuwe@microsoft.com>
 <20200130120807.GJ4679@Air-de-Roger>
 <20200130122836.ccexm2c2j5i7umas@debian>
 <20200130123226.GM4679@Air-de-Roger>
 <20200130123920.3akihbn4zvnigp7q@debian>
 <20200130142201.GO4679@Air-de-Roger>
 <20200130142526.en7vs26dsugbcq4k@debian>
 <20200130144704.GP4679@Air-de-Roger>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200130144704.GP4679@Air-de-Roger>
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

T24gVGh1LCBKYW4gMzAsIDIwMjAgYXQgMDM6NDc6MDRQTSArMDEwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBUaHUsIEphbiAzMCwgMjAyMCBhdCAwMjoyNToyNlBNICswMDAwLCBXZWkg
TGl1IHdyb3RlOgo+ID4gT24gVGh1LCBKYW4gMzAsIDIwMjAgYXQgMDM6MjI6MDFQTSArMDEwMCwg
Um9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+ID4gT24gVGh1LCBKYW4gMzAsIDIwMjAgYXQgMTI6
Mzk6MjBQTSArMDAwMCwgV2VpIExpdSB3cm90ZToKPiA+ID4gPiBPbiBUaHUsIEphbiAzMCwgMjAy
MCBhdCAwMTozMjoyNlBNICswMTAwLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+ID4gPiA+ID4g
T24gVGh1LCBKYW4gMzAsIDIwMjAgYXQgMTI6Mjg6MzZQTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiA+ID4gPiA+ID4gT24gVGh1LCBKYW4gMzAsIDIwMjAgYXQgMDE6MDg6MDdQTSArMDEwMCwgUm9n
ZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiA+ICt9Cj4g
PiA+ID4gPiA+ID4gPiArCj4gPiA+ID4gPiA+ID4gPiAgLyoKPiA+ID4gPiA+ID4gPiA+ICAgKiBM
b2NhbCB2YXJpYWJsZXM6Cj4gPiA+ID4gPiA+ID4gPiAgICogbW9kZTogQwo+ID4gPiA+ID4gPiA+
ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni94ZW4ubGRzLlMgYi94ZW4vYXJjaC94ODYveGVu
Lmxkcy5TCj4gPiA+ID4gPiA+ID4gPiBpbmRleCA5N2Y5YzA3ODkxLi44ZTAyYjRjNjQ4IDEwMDY0
NAo+ID4gPiA+ID4gPiA+ID4gLS0tIGEveGVuL2FyY2gveDg2L3hlbi5sZHMuUwo+ID4gPiA+ID4g
PiA+ID4gKysrIGIveGVuL2FyY2gveDg2L3hlbi5sZHMuUwo+ID4gPiA+ID4gPiA+ID4gQEAgLTMy
OSw2ICszMjksMTAgQEAgU0VDVElPTlMKPiA+ID4gPiA+ID4gPiA+ICAgIGVmaSA9IC47Cj4gPiA+
ID4gPiA+ID4gPiAgI2VuZGlmCj4gPiA+ID4gPiA+ID4gPiAgCj4gPiA+ID4gPiA+ID4gPiArI2lm
ZGVmIENPTkZJR19IWVBFUlZfR1VFU1QKPiA+ID4gPiA+ID4gPiA+ICsgIGh2X2hjYWxsX3BhZ2Ug
PSBBQlNPTFVURShfX2ZpeF94X3RvX3ZpcnQoMSkpOwo+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4g
PiA+IEkgYXNzdW1lIHRoZXJlJ3Mgbm8gd2F5IHRvIHVzZSBGSVhfWF9IWVBFUlZfSENBTEwgYmVj
YXVzZSBpdCdzIGFuCj4gPiA+ID4gPiA+ID4gZW51bT8KPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+
ID4gCj4gPiA+ID4gPiA+IFllcy4KPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IEFuZCB0aGUgdHJp
Y2sgdG8gZ2VuZXJhdGUgYSBzeW1ib2wgZGlkbid0IHdvcmsgZWl0aGVyLgo+ID4gPiA+ID4gCj4g
PiA+ID4gPiBBbmQgeW91IG11c3QgZGVmaW5lIHRoYXQgc3ltYm9sIGluIHRoZSBsaW5rZXIgc2Ny
aXB0PyBJdCBkb2Vzbid0IHNlZW0KPiA+ID4gPiA+IHRvIGJlIHVzZWQgYXQgbGluayB0aW1lLgo+
ID4gPiA+ID4gCj4gPiA+ID4gCj4gPiA+ID4gSSBkb24ndCBmb2xsb3cuIEkgd2lzaCBJIGNvdWxk
IGRlZmluZSBhbmQgdXNlIGEgc3ltYm9sIGluIHRoZSBsaW5rZXIKPiA+ID4gPiBzY3JpcHQgYnV0
IGNvdWxkbid0Lgo+ID4gPiAKPiA+ID4gSXQncyBsaWtlbHkgbXkgZmF1bHQsIGFzIEkgaGF2ZW4n
dCBiZWVuIGZvbGxvd2luZyB0aGUgcGF0Y2ggc2VyaWVzIGluCj4gPiA+IHRoYXQgbXVjaCBkZXRh
aWwuIEkgYXNzdW1lIHRoaXMgaXMgZG9uZSBpbiBvcmRlciB0byBnZW5lcmF0ZSBiZXR0ZXIKPiA+
ID4gY29kZSwgcmF0aGVyIHRoYW4gZG9pbmcgc29tZXRoaW5nIGxpa2U6Cj4gPiA+IAo+ID4gPiB2
b2lkICpodl9oY2FsbF9wYWdlID0gZml4X3hfdG9fdmlydChGSVhfWF9IWVBFUlZfSENBTEwpOwo+
ID4gPiAKPiA+ID4gSW4gYSBDIGZpbGUgc29tZXdoZXJlIHdoZW4gdGhlIGh5cGVyY2FsbCBwYWdl
IGlzIHNldHVwPwo+ID4gCj4gPiBBbmRyZXcgd2FudGVkIGJhZGx5IHRvIGJlIGFibGUgdG8gdXNl
IGRpcmVjdCBjYWxsIGluIHRoZSBoeXBlcmNhbGwKPiA+IGZ1bmN0aW9ucy4gVGhpcyBpcyB3aGF0
IHdlIG1hbmFnZWQgdG8gY29tZSB1cCB3aXRoIHNvIGZhci4KPiA+IAo+ID4gSSB0aGluayB3aGF0
IHlvdSB3cm90ZSB3aWxsIHN0aWxsIHJlc3VsdCBpbiBhbiBpbmRpcmVjdCBjYWxsLgo+ID4gCj4g
PiAoVGhlIG1ham9yaXR5IG9mIG15IHRpbWUgc3BlbnQgb24gdGhpcyBzZXJpZXMgaGFzIGJlZW4g
ZXh0ZW5kaW5nIFhlbiB0bwo+ID4gZG8gbW9yZSB0aGFuIGl0IGNvdWxkIGJlZm9yZS4pCj4gCj4g
QWNrLCBzb3JyeSB0byBib3RoZXIgeW91IHdpdGggcXVlc3Rpb25zIHlvdSBoYXZlIGFscmVhZHkg
YW5zd2VyZWQuIE5vdAoKTm8gd29ycmllcy4gSSB2YWx1ZSB5b3VyIGZlZWRiYWNrLiBBbmQgaGF2
aW5nIG1vcmUgcGVvcGxlIHVuZGVyc3RhbmQKd2hhdCBpcyBnb2luZyBvbiBpcyBpbXBvcnRhbnQg
dG8gdGhlIHByb2plY3QuCgo+IHN1cmUgd2hldGhlciBkZWZpbmluZyBodl9oY2FsbF9wYWdlIGFz
IGEgZ2xvYmFsIGNvbnN0IHdvdWxkIG1ha2UgbXVjaAo+IGRpZmZlcmVuY2UuIENvdWxkIHlvdSBt
YXliZSB1c2Ugc29tZXRoaW5nIGxpa2UgYWx0ZXJuYXRpdmVfdmNhbGwKPiBwYXRjaGluZyB0byBn
ZXQgcmlkIG9mIHRoZSBpbmRpcmVjdGlvbj8KClRyaWVkIHRoYXQgYW5kIGRpZG4ndCB3b3JrIGVp
dGhlci4gOi0oCgo+IAo+IEkgaGF2ZSB0byBhZG1pdCBJIGZpbmQgdGhpcyBhbGwgcXVpdGUgaGFy
ZCB0byBmb2xsb3cgYW5kIHJlYXNvbiBhYm91dCwKPiBsaWtlbHkgYmVjYXVzZSBvZiB0aGUgbWl4
IG9mIEMsIGFzc2VtYmx5LCBhbmQgbGlua2VyIHNjcmlwdCB0byBidWlsZAo+IHRoaXMgbWFjaGlu
ZXJ5LCBidXQgdGhhdCBkb2Vzbid0IG1lYW4gdGhpcyBpc24ndCB0aGUgYmVzdCB3YXkuCj4gCgpZ
ZXMsIGEgbG90IG9mIHRyaWNrZXJpZXMgYXJlIHVzZWQgdG8gbWFrZSB0aGlzIHdvcmsuIE5vdCB0
aGUgbW9zdAplbGVnYW50IGNvbWJpbmF0aW9uIEkgd291bGQgc2F5LCBidXQgaXQgZG9lcyBhY2hp
ZXZlIHdoYXQgaXMgZGVzaXJlZC4KCldlaS4KCj4gVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

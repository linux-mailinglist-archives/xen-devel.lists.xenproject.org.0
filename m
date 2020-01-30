Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA7C14DAD4
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 13:42:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ix96W-00077x-CH; Thu, 30 Jan 2020 12:39:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ezal=3T=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1ix96U-00077q-7B
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 12:39:26 +0000
X-Inumbo-ID: 8c6d4976-435d-11ea-b211-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8c6d4976-435d-11ea-b211-bc764e2007e4;
 Thu, 30 Jan 2020 12:39:25 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1ix96S-00047Q-CH; Thu, 30 Jan 2020 12:39:24 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1ix96S-0001J8-1n; Thu, 30 Jan 2020 12:39:24 +0000
Date: Thu, 30 Jan 2020 12:39:20 +0000
From: Wei Liu <wl@xen.org>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Message-ID: <20200130123920.3akihbn4zvnigp7q@debian>
References: <20200129202034.15052-1-liuwe@microsoft.com>
 <20200129202034.15052-9-liuwe@microsoft.com>
 <20200130120807.GJ4679@Air-de-Roger>
 <20200130122836.ccexm2c2j5i7umas@debian>
 <20200130123226.GM4679@Air-de-Roger>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200130123226.GM4679@Air-de-Roger>
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

T24gVGh1LCBKYW4gMzAsIDIwMjAgYXQgMDE6MzI6MjZQTSArMDEwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBUaHUsIEphbiAzMCwgMjAyMCBhdCAxMjoyODozNlBNICswMDAwLCBXZWkg
TGl1IHdyb3RlOgo+ID4gT24gVGh1LCBKYW4gMzAsIDIwMjAgYXQgMDE6MDg6MDdQTSArMDEwMCwg
Um9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+ID4gCj4gPiA+ID4gK30KPiA+ID4gPiArCj4gPiA+
ID4gIC8qCj4gPiA+ID4gICAqIExvY2FsIHZhcmlhYmxlczoKPiA+ID4gPiAgICogbW9kZTogQwo+
ID4gPiA+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYveGVuLmxkcy5TIGIveGVuL2FyY2gveDg2
L3hlbi5sZHMuUwo+ID4gPiA+IGluZGV4IDk3ZjljMDc4OTEuLjhlMDJiNGM2NDggMTAwNjQ0Cj4g
PiA+ID4gLS0tIGEveGVuL2FyY2gveDg2L3hlbi5sZHMuUwo+ID4gPiA+ICsrKyBiL3hlbi9hcmNo
L3g4Ni94ZW4ubGRzLlMKPiA+ID4gPiBAQCAtMzI5LDYgKzMyOSwxMCBAQCBTRUNUSU9OUwo+ID4g
PiA+ICAgIGVmaSA9IC47Cj4gPiA+ID4gICNlbmRpZgo+ID4gPiA+ICAKPiA+ID4gPiArI2lmZGVm
IENPTkZJR19IWVBFUlZfR1VFU1QKPiA+ID4gPiArICBodl9oY2FsbF9wYWdlID0gQUJTT0xVVEUo
X19maXhfeF90b192aXJ0KDEpKTsKPiA+ID4gCj4gPiA+IEkgYXNzdW1lIHRoZXJlJ3Mgbm8gd2F5
IHRvIHVzZSBGSVhfWF9IWVBFUlZfSENBTEwgYmVjYXVzZSBpdCdzIGFuCj4gPiA+IGVudW0/Cj4g
PiA+IAo+ID4gCj4gPiBZZXMuCj4gPiAKPiA+IEFuZCB0aGUgdHJpY2sgdG8gZ2VuZXJhdGUgYSBz
eW1ib2wgZGlkbid0IHdvcmsgZWl0aGVyLgo+IAo+IEFuZCB5b3UgbXVzdCBkZWZpbmUgdGhhdCBz
eW1ib2wgaW4gdGhlIGxpbmtlciBzY3JpcHQ/IEl0IGRvZXNuJ3Qgc2VlbQo+IHRvIGJlIHVzZWQg
YXQgbGluayB0aW1lLgo+IAoKSSBkb24ndCBmb2xsb3cuIEkgd2lzaCBJIGNvdWxkIGRlZmluZSBh
bmQgdXNlIGEgc3ltYm9sIGluIHRoZSBsaW5rZXIKc2NyaXB0IGJ1dCBjb3VsZG4ndC4KCkFzIGZv
ciBkZWZpbmluZyBhIHN5bWJvbCwgc2VlIHRoZSBwYXRjaCB0aGF0IGludHJvZHVjZXMgdGhlIGV4
ZWN1dGFibGUKZml4bWFwIGZhY2lsaXR5LCBpbiBmdW5jdGlvbiBfX3NldF9maXhtYXBfeC4KCj4g
PiA+ID4gKyNlbmRpZgo+ID4gPiA+ICsKPiA+ID4gPiAgICAvKiBTZWN0aW9ucyB0byBiZSBkaXNj
YXJkZWQgKi8KPiA+ID4gPiAgICAvRElTQ0FSRC8gOiB7Cj4gPiA+ID4gICAgICAgICAqKC5leGl0
LnRleHQpCj4gPiA+ID4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS14ODYvZml4bWFwLmgg
Yi94ZW4vaW5jbHVkZS9hc20teDg2L2ZpeG1hcC5oCj4gPiA+ID4gaW5kZXggODA5NDU0NmI3NS4u
YTliY2IwNjhjYiAxMDA2NDQKPiA+ID4gPiAtLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L2ZpeG1h
cC5oCj4gPiA+ID4gKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9maXhtYXAuaAo+ID4gPiA+IEBA
IC0xNiw2ICsxNiw3IEBACj4gPiA+ID4gIAo+ID4gPiA+ICAjZGVmaW5lIEZJWEFERFJfVE9QIChW
TUFQX1ZJUlRfRU5EIC0gUEFHRV9TSVpFKQo+ID4gPiA+ICAjZGVmaW5lIEZJWEFERFJfWF9UT1Ag
KFhFTl9WSVJUX0VORCAtIFBBR0VfU0laRSkKPiA+ID4gPiArI2RlZmluZSBfX2ZpeF94X3RvX3Zp
cnQoeCkgKEZJWEFERFJfWF9UT1AgLSAoKHgpIDw8IFBBR0VfU0hJRlQpKQo+ID4gPiA+ICAKPiA+
ID4gPiAgI2lmbmRlZiBfX0FTU0VNQkxZX18KPiA+ID4gPiAgCj4gPiA+ID4gQEAgLTExMCw4ICsx
MTEsNiBAQCBleHRlcm4gdm9pZCBfX3NldF9maXhtYXBfeCgKPiA+ID4gPiAgCj4gPiA+ID4gICNk
ZWZpbmUgY2xlYXJfZml4bWFwX3goaWR4KSBfX3NldF9maXhtYXBfeChpZHgsIDAsIDApCj4gPiA+
ID4gIAo+ID4gPiA+IC0jZGVmaW5lIF9fZml4X3hfdG9fdmlydCh4KSAoRklYQUREUl9YX1RPUCAt
ICgoeCkgPDwgUEFHRV9TSElGVCkpCj4gPiA+ID4gLQo+ID4gPiA+ICAjZGVmaW5lIGZpeF94X3Rv
X3ZpcnQoeCkgICAoKHZvaWQgKilfX2ZpeF94X3RvX3ZpcnQoeCkpCj4gPiA+IAo+ID4gPiBUaGlz
IHNlZW1zIGxpa2Ugc29tZSB1bnJlbGF0ZWQgY29kZSBtb3ZlbWVudD8KPiA+ID4gCj4gPiAKPiA+
IEl0IGlzIHJlcXVpcmVkLiBUaGlzIHNlY3Rpb24gaXMgbm90IHN1cHBvc2VkIHRvIGJlIHVzZWQg
aW4gbGlua2VyCj4gPiBzY3JpcHQuIEkgaGF2ZSB0byBtb3ZlIHRoYXQgbWFjcm8gYWhlYWQuCj4g
Cj4gT2gsIGJ1dCB5b3UgaW50cm9kdWNlIHRoYXQgbWFjcm8gaW4gcGF0Y2ggIzUsIGNhbiB5b3Ug
cGxhY2UgaXQgYXQgdGhlCj4gcmlnaHQgcG9zaXRpb24gd2hlbiBpbnRyb2R1Y2VkPwoKSXQgd2Fz
bid0IG5lZWRlZCBpbiB0aGUgbGlua2VyIHNjcmlwdCB1bnRpbCBub3cuIEkgZG9uJ3QgbWluZCBk
b2luZyBpdAp0aGF0IHdheSwgYnV0IHNvbWV0aW1lcyBJJ20gdG9sZCB0byBub3cgaW50cm9kdWNl
IHNvbWV0aGluZyB1bnRpbCBpdCBpcwp1c2VkLiBJIHdpc2ggd2UgY291bGQgYmUgbW9yZSBjb25z
aXN0ZW50IG9uIHRoaXMgc29ydCBvZiB0aGluZ3MuCgpBbmQgZnJhbmtseSB0aGlzIHNvcnQgb2Yg
Y2hhbmdlIGFkZHMgbm8gcGFydGljdWxhciB2YWx1ZSBpbiB0aGlzIHNlcmllcwp3aGF0c29ldmVy
LgoKV2VpLgoKPiAKPiBUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==

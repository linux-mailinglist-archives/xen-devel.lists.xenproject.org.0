Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8AA14D99A
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 12:20:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ix7q7-0007bA-Qk; Thu, 30 Jan 2020 11:18:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ezal=3T=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1ix7q7-0007b5-2O
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 11:18:27 +0000
X-Inumbo-ID: 3bb416dc-4352-11ea-8a39-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3bb416dc-4352-11ea-8a39-12813bfff9fa;
 Thu, 30 Jan 2020 11:18:25 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1ix7q5-0002Sm-1I; Thu, 30 Jan 2020 11:18:25 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1ix7q4-0004mL-Ni; Thu, 30 Jan 2020 11:18:24 +0000
Date: Thu, 30 Jan 2020 11:18:21 +0000
From: Wei Liu <wl@xen.org>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Message-ID: <20200130111821.zmzp7ykg4slqpa5y@debian>
References: <20200129202034.15052-1-liuwe@microsoft.com>
 <20200129202034.15052-8-liuwe@microsoft.com>
 <20200130104143.GH4679@Air-de-Roger>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200130104143.GH4679@Air-de-Roger>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v5 07/12] x86/hyperv: setup hypercall page
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

T24gVGh1LCBKYW4gMzAsIDIwMjAgYXQgMTE6NDE6NDNBTSArMDEwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBXZWQsIEphbiAyOSwgMjAyMCBhdCAwODoyMDoyOVBNICswMDAwLCBXZWkg
TGl1IHdyb3RlOgo+ID4gSHlwZXItViB1c2VzIGEgdGVjaG5pcXVlIGNhbGxlZCBvdmVybGF5IHBh
Z2UgZm9yIGl0cyBoeXBlcmNhbGwgcGFnZS4gSXQKPiA+IHdpbGwgaW5zZXJ0IGEgYmFja2luZyBw
YWdlIHRvIHRoZSBndWVzdCB3aGVuIHRoZSBoeXBlcmNhbGwgZnVuY3Rpb25hbGl0eQo+ID4gaXMg
ZW5hYmxlZC4gVGhhdCBtZWFucyB3ZSBjYW4gdXNlIGEgcGFnZSB0aGF0IGlzIG5vdCBiYWNrZWQg
YnkgcmVhbAo+ID4gbWVtb3J5IGZvciBoeXBlcmNhbGwgcGFnZS4KPiA+IAo+ID4gVXNlIHRoZSB0
b3AtbW9zdCBhZGRyZXNzYWJsZSBwYWdlIGZvciB0aGF0IHB1cnBvc2UuIEFkanVzdCBlODIwIGNv
ZGUKPiA+IGFjY29yZGluZ2x5Lgo+ID4gCj4gPiBXZSBhbHNvIG5lZWQgdG8gcmVnaXN0ZXIgWGVu
J3MgZ3Vlc3QgT1MgSUQgdG8gSHlwZXItVi4gVXNlIDB4MyBhcyB0aGUKPiA+IHZlbmRvciBJRC4g
Rml4IHRoZSBjb21tZW50IGluIGh5cGVydi10bGZzLmggd2hpbGUgYXQgaXQuCj4gPiAKPiA+IFNp
Z25lZC1vZmYtYnk6IFdlaSBMaXUgPGxpdXdlQG1pY3Jvc29mdC5jb20+Cj4gPiAtLS0KPiA+IHY1
Ogo+ID4gMS4gdXNlIGh5cGVydmlzb3JfcmVzZXJ2ZV90b3BfcGFnZXMKPiA+IDIuIGFkZCBhIG1h
Y3JvIGZvciBoeXBlcmNhbGwgcGFnZSBtZm4KPiA+IDMuIGFkZHJlc3Mgb3RoZXIgbWlzYyBjb21t
ZW50cwo+ID4gCj4gPiB2NDoKPiA+IDEuIFVzZSBmaXhtYXAKPiA+IDIuIEZvbGxvdyByb3V0aW5l
cyBsaXN0ZWQgaW4gVExGUwo+ID4gLS0tCj4gPiAgeGVuL2FyY2gveDg2L2U4MjAuYyAgICAgICAg
ICAgICAgICAgICAgIHwgIDUgKysrCj4gPiAgeGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9oeXBl
cnYuYyAgICAgIHwgNTcgKysrKysrKysrKysrKysrKysrKysrKystLQo+ID4gIHhlbi9pbmNsdWRl
L2FzbS14ODYvZ3Vlc3QvaHlwZXJ2LXRsZnMuaCB8ICA1ICsrLQo+ID4gIHhlbi9pbmNsdWRlL2Fz
bS14ODYvZ3Vlc3QvaHlwZXJ2LmggICAgICB8ICAzICsrCj4gPiAgNCBmaWxlcyBjaGFuZ2VkLCA2
NSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEveGVu
L2FyY2gveDg2L2U4MjAuYyBiL3hlbi9hcmNoL3g4Ni9lODIwLmMKPiA+IGluZGV4IDM4OTJjOWNm
YjcuLjk5NjQzZjNlYTAgMTAwNjQ0Cj4gPiAtLS0gYS94ZW4vYXJjaC94ODYvZTgyMC5jCj4gPiAr
KysgYi94ZW4vYXJjaC94ODYvZTgyMC5jCj4gPiBAQCAtMzQzLDYgKzM0Myw3IEBAIHN0YXRpYyB1
bnNpZ25lZCBsb25nIF9faW5pdCBmaW5kX21heF9wZm4odm9pZCkKPiA+ICB7Cj4gPiAgICAgIHVu
c2lnbmVkIGludCBpOwo+ID4gICAgICB1bnNpZ25lZCBsb25nIG1heF9wZm4gPSAwOwo+ID4gKyAg
ICB1bnNpZ25lZCBsb25nIHRvcF9wZm4gPSAoKDF1bGwgPDwgcGFkZHJfYml0cykgLSAxKSA+PiBQ
QUdFX1NISUZUOwo+ID4gIAo+ID4gICAgICBmb3IgKGkgPSAwOyBpIDwgZTgyMC5ucl9tYXA7IGkr
Kykgewo+ID4gICAgICAgICAgdW5zaWduZWQgbG9uZyBzdGFydCwgZW5kOwo+ID4gQEAgLTM1Nyw2
ICszNTgsMTAgQEAgc3RhdGljIHVuc2lnbmVkIGxvbmcgX19pbml0IGZpbmRfbWF4X3Bmbih2b2lk
KQo+ID4gICAgICAgICAgICAgIG1heF9wZm4gPSBlbmQ7Cj4gPiAgICAgIH0KPiA+ICAKPiA+ICsg
ICAgdG9wX3BmbiAtPSBoeXBlcnZpc29yX3Jlc2VydmVfdG9wX3BhZ2VzKCk7Cj4gPiArICAgIGlm
ICggbWF4X3BmbiA+PSB0b3BfcGZuICkKPiA+ICsgICAgICAgIG1heF9wZm4gPSB0b3BfcGZuOwo+
IAo+IEhtLCBJJ20gbm90IHN1cmUgSSBzZWUgdGhlIHBvaW50IG9mIHRoaXMuIFRoZSB2YWx1ZSBy
ZXR1cm5lZCBieQo+IGZpbmRfbWF4X3BmbiBpcyB0aGUgbWF4aW11bSBSQU0gYWRkcmVzcyBmb3Vu
ZCBpbiB0aGUgbWVtb3J5IG1hcCwgYnV0Cj4gdGhlIHBoeXNpY2FsIGFkZHJlc3MgeW91IGFyZSB1
c2luZyB0byBtYXAgdGhlIGh5cGVyY2FsbCBwYWdlIGlzIGFsbW9zdAo+IGNlcnRhaW5seSBtdWNo
IGhpZ2hlciB0aGFuIHRoZSBtYXhpbXVtIGFkZHJlc3MgZm91bmQgaW4gdGhlIHBoeXNtYXAKPiAo
YW5kIGNlcnRhaW5seSBub3QgUkFNKSwgYW5kIGhlbmNlIEknbSBub3Qgc3VyZSB3aGF0J3MgdGhl
IHBvaW50IG9mCj4gdGhpcy4KClllcywgdGhlIGtleXdvcmQgaXMgImFsbW9zdCBjZXJ0YWlubHki
LiA6LSkKClRoaXMgaXMgZG9uZSBmb3IgY29ycmVjdG5lc3MncyBzYWtlLiBJIGRvbid0IGV4cGVj
dCBpbiBwcmFjdGljZSB0aGVyZQp3b3VsZCBiZSBhIGNvbmZpZ3VyYXRpb24gdGhhdCBoYXMgdGhh
dCBtdWNoIG1lbW9yeSwgYnV0IGNvcnJlY3RuZXNzIGlzCnN0aWxsIGltcG9ydGFudC4KCkl0IGFs
c28gZ3VhcmRzIGFnYWluc3Qgd2VpcmQgY29uZmlndXJhdGlvbiBpbiB3aGljaCBtZW1vcnkgaXMg
cHV0IGludG8KdGhhdCBwYXJ0IG9mIHRoZSBwaHlzaWNhbCBhZGRyZXNzIHNwYWNlIGZvciB3aGF0
ZXZlciByZWFzb24uIEkgZG9uJ3QKa25vdyB3aHkgYW55b25lIHdvdWxkIGRvIHRoYXQsIGJ1dCBh
Z2Fpbiwgd2Ugc2hvdWxkIGJlIHByZXBhcmVkIGZvcgp0aGF0LgoKCj4gCj4gQWxzbyB5b3UgaGF2
ZW4ndCBpbnRyb2R1Y2VkIGEgSHlwZXJWIGltcGxlbWVudGF0aW9uIG9mCj4gaHlwZXJ2aXNvcl9y
ZXNlcnZlX3RvcF9wYWdlcyBzbyBmYXIsIHNvIGl0J3MgaGFyZCB0byB0ZWxsIHRoZSBpbnRlbmQK
PiBvZiB0aGlzLgoKRCdvaC4gVGhhdCB3YXMgc3VwcG9zZWQgdG8gYmUgaW4gdGhpcyBwYXRjaC4g
SSBndWVzcyBJIGZvcmdvdCB0byBjb21taXQKdGhhdCBodW5rIQoKVGhhdCBmdW5jdGlvbiBmb3Ig
SHlwZXItViBpcyBnb2luZyB0byByZXR1cm4gMSAocGFnZSkuCgo+IAo+ID4gKwo+ID4gICAgICBy
ZXR1cm4gbWF4X3BmbjsKPiA+ICB9Cj4gPiAgClsuLi5dCj4gPiBkaWZmIC0tZ2l0IGEveGVuL2lu
Y2x1ZGUvYXNtLXg4Ni9ndWVzdC9oeXBlcnYuaCBiL3hlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3Qv
aHlwZXJ2LmgKPiA+IGluZGV4IGM3YTdmMzJiZDUuLjBkY2Q4MDgyYWQgMTAwNjQ0Cj4gPiAtLS0g
YS94ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5cGVydi5oCj4gPiArKysgYi94ZW4vaW5jbHVk
ZS9hc20teDg2L2d1ZXN0L2h5cGVydi5oCj4gPiBAQCAtMjEsNiArMjEsOSBAQAo+ID4gIAo+ID4g
ICNpbmNsdWRlIDx4ZW4vdHlwZXMuaD4KPiA+ICAKPiA+ICsvKiBVc2UgdG9wLW1vc3QgTUZOIGZv
ciBoeXBlcmNhbGwgcGFnZSAqLwo+ID4gKyNkZWZpbmUgSFZfSENBTExfTUZOICgoKDF1bGwgPDwg
cGFkZHJfYml0cykgLSAxKSA+PiBIVl9IWVBfUEFHRV9TSElGVCkKPiAKPiBJIHRoaW5rIHlvdSBz
aG91bGQgdXNlIFBBR0VfU0hJRlQgaGVyZSwgb3IgZWxzZSB5b3UgYWxzbyBuZWVkIHRvIG1ha2UK
PiBzdXJlIHRoZSBmaXhtYXAgcmVzZXJ2ZWQgZW50cnkgaXMgb2Ygc2l6ZSAoKDEgPDwgSFZfSFlQ
X1BBR0VfU0hJRlQpIC0KPiAxKSwgYW5kIHRoZSBjYWxsIHRvIHNldF9maXhtYXBfeCBpbiBzZXR1
cF9oeXBlcmNhbGxfcGFnZSBuZWVkcyB0byB0YWtlCj4gdGhpcyBpbnRvIGFjY291bnQgQUZBSUNU
IGFuZCBub3QgdXNlIFBBR0VfU0hJRlQuCgpQQUdFX1NISUZUIGFuZCBIVl9IWVBfUEFHRV9TSElG
VCBhcmUgaW4gZmFjdCB0aGUgc2FtZS4KCkkgY2FuIGFkZCBhIEJVSUxEX0JVR19PTiBzb21ld2hl
cmUuCgpXZWkuCgo+IAo+IFRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs

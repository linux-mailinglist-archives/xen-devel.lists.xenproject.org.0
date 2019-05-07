Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E178615ED4
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2019 10:08:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNv5x-00075X-Va; Tue, 07 May 2019 08:05:01 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PNGO=TH=citrix.com=prvs=023f6069a=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hNv5w-00075S-3w
 for xen-devel@lists.xenproject.org; Tue, 07 May 2019 08:05:00 +0000
X-Inumbo-ID: cdf6e45c-709e-11e9-843c-bc764e045a96
Received: from SMTP.EU.CITRIX.COM (unknown [185.25.65.24])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id cdf6e45c-709e-11e9-843c-bc764e045a96;
 Tue, 07 May 2019 08:04:58 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,441,1549929600"; d="scan'208";a="89675289"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Jan Beulich' <JBeulich@suse.com>
Thread-Topic: [xen-unstable bisection] complete
 test-amd64-i386-xl-qemut-ws16-amd64
Thread-Index: AQHVA+3ShALyENQ6K0+zhkWenyhQfaZfTt6g
Date: Tue, 7 May 2019 08:04:56 +0000
Message-ID: <60d027a5e4dd4caaabc214994ee3e054@AMSPEX02CL03.citrite.net>
References: <7AA9A73D020000CCA2327079@prv1-mh.provo.novell.com>
 <5CCFFDCE020000780022C193@prv1-mh.provo.novell.com>
In-Reply-To: <5CCFFDCE020000780022C193@prv1-mh.provo.novell.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [xen-unstable bisection] complete
 test-amd64-i386-xl-qemut-ws16-amd64
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 osstest service owner <osstest-admin@xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEphbiBCZXVsaWNoIFttYWlsdG86
SkJldWxpY2hAc3VzZS5jb21dCj4gU2VudDogMDYgTWF5IDIwMTkgMTA6MjcKPiBUbzogUGF1bCBE
dXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4KPiBDYzogeGVuLWRldmVsIDx4ZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmc+OyBvc3N0ZXN0IHNlcnZpY2Ugb3duZXIgPG9zc3Rlc3Qt
YWRtaW5AeGVucHJvamVjdC5vcmc+Cj4gU3ViamVjdDogRndkOiBbeGVuLXVuc3RhYmxlIGJpc2Vj
dGlvbl0gY29tcGxldGUgdGVzdC1hbWQ2NC1pMzg2LXhsLXFlbXV0LXdzMTYtYW1kNjQKPiAKPiBQ
YXVsLAo+IAo+ID4+PiBPbiAwNS4wNS4xOSBhdCAxMjo1NCwgPG9zc3Rlc3QtYWRtaW5AeGVucHJv
amVjdC5vcmc+IHdyb3RlOgo+ID4gYnJhbmNoIHhlbi11bnN0YWJsZQo+ID4geGVuYnJhbmNoIHhl
bi11bnN0YWJsZQo+ID4gam9iIHRlc3QtYW1kNjQtaTM4Ni14bC1xZW11dC13czE2LWFtZDY0Cj4g
PiB0ZXN0aWQgd2luZG93cy1pbnN0YWxsCj4gPgo+ID4gVHJlZTogbGludXggZ2l0Oi8veGVuYml0
cy54ZW4ub3JnL2xpbnV4LXB2b3BzLmdpdAo+ID4gVHJlZTogbGludXhmaXJtd2FyZSBnaXQ6Ly94
ZW5iaXRzLnhlbi5vcmcvb3NzdGVzdC9saW51eC1maXJtd2FyZS5naXQKPiA+IFRyZWU6IHFlbXUg
Z2l0Oi8veGVuYml0cy54ZW4ub3JnL3FlbXUteGVuLXRyYWRpdGlvbmFsLmdpdAo+ID4gVHJlZTog
cWVtdXUgZ2l0Oi8veGVuYml0cy54ZW4ub3JnL3FlbXUteGVuLmdpdAo+ID4gVHJlZTogeGVuIGdp
dDovL3hlbmJpdHMueGVuLm9yZy94ZW4uZ2l0Cj4gPgo+ID4gKioqIEZvdW5kIGFuZCByZXByb2R1
Y2VkIHByb2JsZW0gY2hhbmdlc2V0ICoqKgo+ID4KPiA+ICAgQnVnIGlzIGluIHRyZWU6ICB4ZW4g
Z2l0Oi8veGVuYml0cy54ZW4ub3JnL3hlbi5naXQKPiA+ICAgQnVnIGludHJvZHVjZWQ6ICAyNmZi
YTNjODU1NzEzNTRlY2IxYTFhM2RkZTc3ZmIzODYzMzUxNWQzCj4gPiAgIEJ1ZyBub3QgcHJlc2Vu
dDogYTg1MDg5ZDBlZjU3YTA4ZmU5Nzg2NDU3OWVlMDU1YzEyZmQ4YTkyOAo+ID4gICBMYXN0IGZh
aWwgcmVwcm86IGh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnByb2plY3Qub3JnL29zc3Rlc3QvbG9n
cy8xMzU3NDQvCj4gPgo+ID4KPiA+ICAgY29tbWl0IDI2ZmJhM2M4NTU3MTM1NGVjYjFhMWEzZGRl
NzdmYjM4NjMzNTE1ZDMKPiA+ICAgQXV0aG9yOiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBj
aXRyaXguY29tPgo+ID4gICBEYXRlOiAgIFR1ZSBNYXIgMTkgMTY6Mjk6MDAgMjAxOSArMDEwMAo+
ID4KPiA+ICAgICAgIHZpcmlkaWFuOiBhZGQgaW1wbGVtZW50YXRpb24gb2Ygc3ludGhldGljIHRp
bWVycwo+ID4KPiA+ICAgICAgIFRoaXMgcGF0Y2ggaW50cm9kdWNlcyBhbiBpbXBsZW1lbnRhdGlv
biBvZiB0aGUgU1RJTUVSMC0xNV9DT05GSUcvQ09VTlQgTVNScwo+ID4gICAgICAgYW5kIGhlbmNl
IGEgdGhlIGZpcnN0IFN5bklDIG1lc3NhZ2Ugc291cmNlLgo+ID4KPiA+ICAgICAgIFRoZSBuZXcg
KGFuZCBkb2N1bWVudGVkKSAnc3RpbWVyJyB2aXJpZGlhbiBlbmxpZ2h0ZW5tZW50IGdyb3VwIG1h
eSBiZQo+ID4gICAgICAgc3BlY2lmaWVkIHRvIGVuYWJsZSB0aGlzIGZlYXR1cmUuCj4gPgo+ID4g
ICAgICAgV2hpbGUgaW4gdGhlIG5laWdoYm91cmhvb2QsIHRoaXMgcGF0Y2ggYWRkcyBhIG1pc3Np
bmcgY2hlY2sgZm9yIGFuCj4gPiAgICAgICBhdHRlbXB0IHRvIHdyaXRlIHRoZSB0aW1lIHJlZmVy
ZW5jZSBjb3VudCBNU1IsIHdoaWNoIHNob3VsZCByZXN1bHQgaW4gYW4KPiA+ICAgICAgIGV4Y2Vw
dGlvbiAoYnV0IG5vdCBiZSByZXBvcnRlZCBhcyBhbiB1bmltcGxlbWVudGVkIE1TUikuCj4gPgo+
ID4gICAgICAgTk9URTogSXQgaXMgbmVjZXNzYXJ5IGZvciBjb3JyZWN0IG9wZXJhdGlvbiB0aGF0
IHRpbWVyIGV4cGlyYXRpb24gYW5kCj4gPiAgICAgICAgICAgICBtZXNzYWdlIGRlbGl2ZXJ5IHRp
bWUtc3RhbXBpbmcgdXNlIHRoZSBzYW1lIHRpbWUgc291cmNlIGFzIHRoZSBndWVzdC4KPiA+ICAg
ICAgICAgICAgIFRoZSBzcGVjaWZpY2F0aW9uIGlzIGFtYmlndW91cyBidXQgdGVzdGluZyB3aXRo
IGEgV2luZG93cyAxMCAxODAzCj4gPiAgICAgICAgICAgICBndWVzdCBoYXMgc2hvd24gdGhhdCB1
c2luZyB0aGUgcGFydGl0aW9uIHJlZmVyZW5jZSBjb3VudGVyIGFzIGEKPiA+ICAgICAgICAgICAg
IHNvdXJjZSB3aGlsc3QgdGhlIGd1ZXN0IGlzIHVzaW5nIFJEVFNDIGFuZCB0aGUgcmVmZXJlbmNl
IHRzYyBwYWdlCj4gPiAgICAgICAgICAgICBkb2VzIG5vdCB3b3JrIGNvcnJlY3RseS4gVGhlcmVm
b3JlIHRoZSB0aW1lX25vdygpIGZ1bmN0aW9uIGlzIHVzZWQuCj4gPiAgICAgICAgICAgICBUaGlz
IGltcGxlbWVudHMgdGhlIGFsZ29yaXRobSBmb3IgYWNxdWlyaW5nIHBhcnRpdGlvbiByZWZlcmVu
Y2UgdGltZQo+ID4gICAgICAgICAgICAgdGhhdCBpcyBkb2N1bWVudGVkIGluIHRoZSBzcGVjaWZp
Y3Rpb24uCj4gPgo+ID4gICAgICAgU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1
cnJhbnRAY2l0cml4LmNvbT4KPiA+ICAgICAgIEFja2VkLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBj
aXRyaXguY29tPgo+ID4gICAgICAgUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBz
dXNlLmNvbT4KPiAKPiBKdXN0IGluIGNhc2UgeW91J3ZlIG5vdCBub3RpY2VkIHRoaXMuCgpJIGhh
ZG4ndCBub3RpY2UuIFRoYW5rcyBmb3IgaGlnaGxpZ2h0aW5nLiBJJ20ga2luZCBvZiBzdXJwcmlz
ZWQgYXMgWGVuU2VydmVyIHRlc3Rpbmcgc2hvd2VkIG5vIG1ham9yIGlzc3VlcyB3aXRoIHN0aW1l
ciBhbmQgaW5kZWVkIGl0IGlzIG5vdyBvbiBieSBkZWZhdWx0IGluIHRoZSBsYXRlc3QgcmVsZWFz
ZS4gSSdsbCB0YWtlIGEgbG9vay4KCiAgUGF1bAoKPiAKPiBKYW4KPiAKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

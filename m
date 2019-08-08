Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8F0860AE
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 13:16:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvgMW-0006MH-3S; Thu, 08 Aug 2019 11:13:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nHR3=WE=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hvgMU-0006MC-Cm
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 11:13:38 +0000
X-Inumbo-ID: 8f33d39c-b9cd-11e9-a4c3-b7389e65996d
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8f33d39c-b9cd-11e9-a4c3-b7389e65996d;
 Thu, 08 Aug 2019 11:13:33 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: tDNMY0Y2rlfRYYjQxIXnbDDw2JLAkMdTB2NTVHJT8XRTMhHpNGlY91qwzx8kCpTj0R5FOHshHj
 zkJm8DhWCbjgXAXdn0Ov8fcHCqxJXS4r4PymiGxgL3ecXeGp2LzqSY98i37BPAQa85XvQSUUls
 HtPKunelrkaKWLa+kvvYmDkWRshw9ISY7xS0hPhP9VBaVUDQ/4uCOqlplGbP8Hm2nNVplqPZ8m
 Twi5oZ00O/WB4fenhPJM1kq+7SSNRPrAzve6O6ItMJ43SSeEImSM5sbefCAq7pIQCHXXQ5CpFo
 C9g=
X-SBRS: 2.7
X-MesageID: 4184311
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,360,1559534400"; 
   d="scan'208";a="4184311"
Date: Thu, 8 Aug 2019 12:13:30 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Message-ID: <20190808111330.GT1242@perard.uk.xensource.com>
References: <20190729153944.24239-1-anthony.perard@citrix.com>
 <20190729153944.24239-24-anthony.perard@citrix.com>
 <20190807152852.e47kogsxubbjkue5@Air-de-Roger>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190807152852.e47kogsxubbjkue5@Air-de-Roger>
User-Agent: Mutt/1.12.1 (2019-06-15)
Subject: Re: [Xen-devel] [PATCH v4 23/35] OvmfPkg/XenPlatformPei: Rework
 memory detection
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Jordan Justen <jordan.l.justen@intel.com>, devel@edk2.groups.io,
 Julien Grall <julien.grall@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, Laszlo Ersek <lersek@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBBdWcgMDcsIDIwMTkgYXQgMDU6MzQ6MzJQTSArMDIwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBNb24sIEp1bCAyOSwgMjAxOSBhdCAwNDozOTozMlBNICswMTAwLCBBbnRo
b255IFBFUkFSRCB3cm90ZToKPiA+IFdoZW4gcnVubmluZyBhcyBhIFhlbiBQVkggZ3Vlc3QsIHRo
ZXJlIGlzIG5vIENNT1MgdG8gcmVhZCB0aGUgbWVtb3J5Cj4gPiBzaXplIGZyb20uICBSZXdvcmsg
R2V0U3lzdGVtTWVtb3J5U2l6ZShCZWxvd3xBYm92ZSk0Z2IoKSBzbyB0aGV5IGNhbgo+ID4gd29y
ayB3aXRob3V0IENNT1MgYnkgcmVhZGluZyB0aGUgZTgyMCB0YWJsZS4KPiA+IAo+ID4gUmV3b3Jr
IFhlblB1Ymxpc2hSYW1SZWdpb25zIHRvIGFsc28gY2FyZSBmb3IgdGhlIHJlc2VydmVkIGFuZCBB
Q1BJCj4gPiBlbnRyeSBpbiB0aGUgZTgyMCB0YWJsZS4gVGhlIHJlZ2lvbiB0aGF0IHdhcyBhZGRl
ZCBieSBJbml0aWFsaXplWGVuKCkKPiA+IGlzbid0IG5lZWRlZCBhcyB0aGF0IHNhbWUgZW50cnkg
aXMgaW4gdGhlIGU4MjAgdGFibGUgcHJvdmlkZWQgYnkKPiA+IGh2bWxvYWRlci4KPiA+IAo+ID4g
TVRSUiBzZXR0aW5ncyBhcmVuJ3QgbW9kaWZpZWQgYW55bW9yZSwgb24gSFZNIGl0J3MgYWxyZWFk
eSBkb25lIGJ5Cj4gPiBodm1sb2FkZXIsIG9uIFBWSCBpdCBpcyBzdXBwb3NlZCB0byBoYXZlIHNh
bmUgZGVmYXVsdC4gTVRSUiB3aWxsIG5lZWQKPiA+IHRvIGJlIGRvbmUgcHJvcGVybHkgYnV0IGtl
ZXBpbmcgd2hhdCdzIGFscmVhZHkgYmVlbiBkb25lIGJ5IHByb2dyYW1tZXMKPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4gZmly
bXdhcmUKCkkndmUgdXNlZCBwcm9ncmFtbWVzIGluc3RlYWQgb2YgZmlybXdhcmUgYmVjYXVzZSBp
biBjYXNlIG9mIFBWSCwgT1ZNRiBpcwp0aGUgZmlyc3QgZmlybXdhcmUgdG8gcnVuLCBsaWJ4bCAo
YW5kIHdoYXQgZXZlciBpdCBjYWxsZWQpIGlzIHdoYXQKY2F1c2VzIGFuIE1UUlIgdG8gYmUgc2V0
dXAsIG5vIGZpcm13YXJlIGFyZSBpbnZvbHZlZCBpbiB0aGF0LgoKPiA+ICsgICAgLy8KPiA+ICsg
ICAgLy8gUm91bmQgdXAgdGhlIHN0YXJ0IGFkZHJlc3MsIGFuZCByb3VuZCBkb3duIHRoZSBlbmQg
YWRkcmVzcy4KPiA+ICsgICAgLy8KPiA+ICsgICAgQmFzZSA9IEFMSUdOX1ZBTFVFIChFbnRyeS0+
QmFzZUFkZHIsIChVSU5UNjQpRUZJX1BBR0VfU0laRSk7Cj4gPiArICAgIEVuZCA9IChFbnRyeS0+
QmFzZUFkZHIgKyBFbnRyeS0+TGVuZ3RoKSAmIH4oVUlOVDY0KUVGSV9QQUdFX01BU0s7Cj4gPiAr
Cj4gPiArICAgIHN3aXRjaCAoRW50cnktPlR5cGUpIHsKPiA+ICsgICAgY2FzZSBFZmlBY3BpQWRk
cmVzc1JhbmdlTWVtb3J5Ogo+ID4gKyAgICAgIEFkZE1lbW9yeVJhbmdlSG9iIChCYXNlLCBFbmQp
Owo+ID4gKyAgICAgIGJyZWFrOwo+ID4gKyAgICBjYXNlIEVmaUFjcGlBZGRyZXNzUmFuZ2VBQ1BJ
Ogo+ID4gKyAgICAgIEFkZFJlc2VydmVkTWVtb3J5UmFuZ2VIb2IgKEJhc2UsIEVuZCwgRkFMU0Up
Owo+ID4gKyAgICAgIGJyZWFrOwo+ID4gKyAgICBjYXNlIEVmaUFjcGlBZGRyZXNzUmFuZ2VSZXNl
cnZlZDoKPiA+ICsgICAgICBpZiAoQmFzZSA8IExvY2FsQXBpYyAmJiBMb2NhbEFwaWMgPCBFbmQp
IHsKPiAKPiBEb24ndCB5b3UgYWxzbyBuZWVkIHRvIGNoZWNrIGZvciBlcXVhbGl0eT8gSW4gY2Fz
ZSBzdWNoIHJlZ2lvbiBzdGFydHMKPiBhdCBCYXNlID09IExvY2FsQXBpYz8KPiAKPiBJIGd1ZXNz
IGl0IGRvZXNuJ3QgbWF0dGVyIHRoYXQgbXVjaCBzaW5jZSB0aGlzIGlzIHRvIHdvcmthcm91bmQg
YQo+IHNwZWNpZmljIGlzc3VlIHdpdGggaHZtbG9hZGVyLCBidXQgSSB3b3VsZCBsaWtlIHRvIHNl
ZSB0aGlzIHNvcnRlZCBvdXQKPiBpbiBodm1sb2FkZXIgc28gdGhhdCB0aGVyZSdzIG5vIGNsYXNo
IGFueW1vcmUuCgpJbmRlZWQsIGl0IGRvZXNuJ3QgbWF0dGVyIHRvIG11Y2gsIHNvIEkndmUgYmVl
biBsYXp5LiBCdXQgTGFzemxvIGhhdmUKcG9pbnRlZCB0aGF0IG91dCBhcyB3ZWxsLCBzbyB0aGVy
ZSB3ZXJlIGdvaW5nIHRvIGJlIGEgcGF0Y2ggdG8gbWFrZSB0aGUKd29ya2Fyb3VuZCBiZXR0ZXIu
IEJ1dCBJIGZlZWwgbGlrZSBJJ20gZ29pbmcgdG8gbmVlZCB0byByZXBvc3QgdGhlCnNlcmllcywg
c28gSSdtIHByb2JhYmx5IGdvaW5nIHRvIGZpeCB0aGF0IGFzIHdlbGwuCgpUaGFua3MsCgotLSAK
QW50aG9ueSBQRVJBUkQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=

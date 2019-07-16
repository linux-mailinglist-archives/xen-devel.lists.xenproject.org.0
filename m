Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5531A6A47C
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2019 11:02:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnJJm-0000p6-K9; Tue, 16 Jul 2019 09:00:14 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qSVG=VN=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hnJJk-0000p0-V9
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2019 09:00:13 +0000
X-Inumbo-ID: 1dc1ae31-a7a8-11e9-8980-bc764e045a96
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1dc1ae31-a7a8-11e9-8980-bc764e045a96;
 Tue, 16 Jul 2019 09:00:11 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=George.Dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 George.Dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: XafP5NX7Ex5rwQmHxql2ir5dxLfFixgjoPc4jcsviAsaWEAUDj2OhmnhXokjfVnQeGwCFcMiMV
 dnoQIsLS2ToU4RPLxLaK5wT4Ezw6Z8bQmOnJqXAxf6eT0ntsjucnhelyMDIrpqi60p7vb+PbW8
 GKdUbsKo0GQ2dvWKun06D4yL4EN8rrnYpbYI9XS8v5WXUXVb6HSmI5HSc2vVCoAa6osKCW6Afd
 9RH0jFlchdBdHYpOCtMRU4H96NeDpNCNsNNGvPlKU/UEKYK6U5eCVVvBK6WpjapiSbUuChC1o0
 HwI=
X-SBRS: 2.7
X-MesageID: 3025173
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,497,1557201600"; 
   d="scan'208";a="3025173"
From: George Dunlap <George.Dunlap@citrix.com>
To: Amit Shah <amit@infradead.org>
Thread-Topic: [Xen-devel] Design Session report: Toolstacks
Thread-Index: AQHVOxV+iqouYWvNZ0SNHpg3YWq5LqbL1bkAgAD8TgA=
Date: Tue, 16 Jul 2019 09:00:07 +0000
Message-ID: <B203C7BA-51D5-4A10-80C7-3C3EAB6327CC@citrix.com>
References: <3cc8ecd7-33a0-7128-c95e-90e39de6eeff@citrix.com>
 <ab346fb3974edcf9341d4f5d5d755587869ba932.camel@infradead.org>
In-Reply-To: <ab346fb3974edcf9341d4f5d5d755587869ba932.camel@infradead.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3445.104.11)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <3D1323C6C96C8D4A96F372DD7E71DDBE@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] Design Session report: Toolstacks
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gSnVsIDE1LCAyMDE5LCBhdCA2OjU3IFBNLCBBbWl0IFNoYWggPGFtaXRAaW5mcmFk
ZWFkLm9yZz4gd3JvdGU6DQo+IA0KPiBPbiBNb24sIDIwMTktMDctMTUgYXQgMTQ6NTkgKzAxMDAs
IEdlb3JnZSBEdW5sYXAgd3JvdGU6DQo+PiBMb29raW5nIHRocm91Z2ggdGhlIG5vdGVzLCBpdCBz
ZWVtcyBsaWtlIHRoZSBmaXJzdCBwYXJ0IG9mIHRoaXMNCj4+IGRpc2N1c3Npb24sIHJlIGh5cGVy
dmlzb3IgdXBncmFkZSAvIGRvd25ncmFkZSAmIGxpYnJhcmllcywgd2FzIHBhcnRseQ0KPj4gY292
ZXJlZCBpbiB0aGUgZGlzdHJvIHNlc3Npb24sIGluIHdoaWNoIERlYmlhbidzIFhlbiB2ZXJzaW9u
IGNvLQ0KPj4gaW5zdGFsbA0KPj4gd2FzIGRpc2N1c3NlZCBhbmQgZm91bmQgdXNlZnVsIGV2ZW4g
aWYgd2UgaGFkIGEgaHlwZXJ2aXNvciAsIElhbg0KPj4gSmFja3Nvbg0KPj4gYWdyZWVkIHRvIHBv
c3QgRGViaWFuJ3MgY28taW5zdGFsbCBwYXRjaGVzLg0KPiANCj4gWWVhLg0KPiANCj4gVGhhdCdz
IGFsc28gdXNlZnVsIGZvciB0aGUgbGl2ZS11cGRhdGUgcHJvamVjdCwgd2hlcmUgd2Ugd2FudCB0
byAoaW4NCj4gdGhlIGZ1dHVyZSkgdXNlIHRoZSB1c2Vyc3BhY2UgdG9vbHMgYW5kIGxpYnJhcmll
cyBkZXBlbmRpbmcgb24gd2hpY2gNCj4gWGVuIHZlcnNpb24gaXMgaW4gdXNlIGF0IGEgdGltZS4N
Cg0KSnVzdCB0byBjbGFyaWZ5IOKAlCBzZWVtcyBJIGhhZCBhbiBlZGl0aW5nIGZhaWwgYWJvdmU7
IGl0IHNob3VsZCBoYXZlIHNhaWQsIOKAnGV2ZW4gaWYgd2UgaGFkIGEgc3RhYmxlIEFCSSBiZXR3
ZWVuIHRoZSBoeXBlcnZpc29yIGFuZCB0aGUgdG9vbHPigJ0uICBJbiB0aGF0IGNhc2UsIHVwZ3Jh
ZGluZyB0byBhIG5ld2VyIHZlcnNpb24gb2YgWGVuIGJ1dCByZW1haW5pbmcgb24gdGhlIHNhbWUg
dXNlcnNwYWNlIHRvb2xzIHNob3VsZCBjb250aW51ZSB0byB3b3JrLCBhbmQgc28gaGF2aW5nIG11
bHRpcGxlIHZlcnNpb25zIHNob3VsZCBiZSBsZXNzIG9mIGFuIGlzc3VlIChhcyBJIHByZXN1bWUg
eW914oCZZCBiZSB1bmxpa2VseSB0byBkb3duZ3JhZGUgaW4gYSBsaXZlIHVwZGF0ZSkuDQoNCkJ1
dCB2ZXJzaW9uZWQgc3ViZGlyZWN0b3JpZXMgYW5kIHN5bWxpbmtzIGlzIGRlZmluaXRlbHkgc29t
ZXRoaW5nIHdvcnRoIGRvaW5nLg0KDQogLUdlb3JnZQ0KDQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs

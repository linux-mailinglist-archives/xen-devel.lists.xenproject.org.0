Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 687FC7F5D6
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 13:17:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htVWa-0006zU-O4; Fri, 02 Aug 2019 11:15:04 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=q7GY=V6=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1htVWZ-0006zN-AD
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 11:15:03 +0000
X-Inumbo-ID: c4fed0ee-b516-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c4fed0ee-b516-11e9-8980-bc764e045a96;
 Fri, 02 Aug 2019 11:15:01 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=lars.kurth@citrix.com;
 spf=Pass smtp.mailfrom=lars.kurth@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 lars.kurth@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 lars.kurth@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: YBPCAHPS5o1Wmy2df/gmn8Rtb8sx/k1Pdxp1DFeSufCo8pAfK2SitBDuPdnb2l6np5ns5Bq8PT
 jOT/j9rg3HoFY47ONbQb4Z/IHkr/kMWdsfVI6dtmWGTQ/4IdM1ModlfMzuYZN+BPc88QL8iNlD
 3khPDqEnPwLCNXu9O7CVGp14g8F8zueYVWrhiSs8FE7dVjztl3jpm0Kp5eAB1BZYk96Y0CGP3Q
 vGPzdTLrhEraqwMeCdDoQqcUcJ8RiFU3+gPR7+Iq3gi7XHlRb78uv5JRN49l5CO+iClnFDBuIY
 jvY=
X-SBRS: 2.7
X-MesageID: 3770869
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,337,1559534400"; 
   d="scan'208";a="3770869"
From: Lars Kurth <lars.kurth@citrix.com>
To: xen-devel <xen-devel@lists.xenproject.org>, "committers@xenproject.org"
 <committers@xenproject.org>
Thread-Topic: [RFC] Re-working the patch submission guide
Thread-Index: AQHVSSOEZYGRU/jgzkCxBUMn3iC9Og==
Date: Fri, 2 Aug 2019 11:14:57 +0000
Message-ID: <591E728E-F69D-46DB-88C2-3B47C4115644@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.c.190715
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <17906958C142A84BBDC48AB78F334A01@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [RFC] Re-working the patch submission guide
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
Cc: Viktor Mitin <viktor.mitin.19@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgYWxsLA0KDQpJbiBwcmVwYXJhdGlvbiBvZiBtaWdyYXRpbmcgZG9jcyB0byBzcGhpbngtZG9j
cywgSSBmaXJzdCB3YW50ZWQgdG8gY2xlYW4gdXAgaHR0cHM6Ly93aWtpLnhlbnByb2plY3Qub3Jn
L3dpa2kvU3VibWl0dGluZ19YZW5fUHJvamVjdF9QYXRjaGVzLiBCZWZvcmUgSSBkbyBzb21lIHdv
cmsgb24gaXQsIEkgd2FudGVkIHRvIG91dGxpbmUgbXkgdGhvdWdodHMgb24gdGhlIGNvbnRlbnQN
Cg0KPiAxIEhvdyBUbyBHZW5lcmF0ZSBhbmQgU3VibWl0IFBhdGNoZXMgdG8gdGhlIFhlbiBQcm9q
ZWN0IA0KDQo+IDEuMSBHZW5lcmF0aW5nIGEgcGF0Y2ggDQpUaGlzIHNlY3Rpb24gc2VlbXMgdG8g
YmUgZmFpcmx5IGdlbmVyaWMgYW5kIG1heWJlIHNob3VsZCBsaXZlIGVsc2V3aGVyZSBhbmQgbWF5
YmUgc2hvdWxkIGp1c3QgYmUgcmVmZXJyZWQgdG8gZnJvbSBoZXJlDQoNCkhvd2V2ZXIsIEkgdGhp
bmsgd2UgbmVlZCB0byBleHBsYWluIHRoZSBhbmF0b215IG9mIGEgcGF0Y2ggYW5kIHBhdGNoIHNl
cmllcyBoZXJlLiBNYXliZSByZS1uYW1lIHRoaXMgdG8gQW5hdG9teSBvZiBhIFBhdGNoIGFuZCBQ
YXRjaCBTZXJpZXMNCkl0IHNob3VsZCBtZW50aW9uIGF0IGxlYXN0IGNvdmVyIGxldHRlcnMgYW5k
IHByb2JhYmx5IGFsc28gY292ZXIgdGhyZWFkaW5nIG9mIHBhdGNoIHNlcmllcyAoYW5kIHdoeSBp
dCBpcyBpbXBvcnRhbnQpDQpSZWZlcmVuY2VzIHRvIEhnIHNob3VsZCBiZSBkZWxldGVkDQoNCj4g
MS4yIFNpZ25pbmcgb2ZmIGEgcGF0Y2ggDQo+IDEuMyBNYWtpbmcgZ29vZCBwYXRjaGVzIA0KPiAx
LjMuMSBCcmVhayBkb3duIHlvdXIgcGF0Y2hlcyANCj4gMS4zLjIgV3JpdGUgYSBnb29kIGRlc2Ny
aXB0aW9uIGZvciBlYWNoIHBhdGNoIA0KPiAxLjMuMyBDYyB0aGUgbWFpbnRhaW5lciBvZiB0aGUg
Y29kZSB5b3UgYXJlIG1vZGlmeWluZyANCj4gMS40IFByb3ZpZGluZyBhIGdpdCBicmFuY2gNCg0K
VGhpcyBlbnRpcmUgc2VjdGlvbiBuZWVkcyB0byBiZSByZS1zdHJ1Y3R1cmVzIGFuZCBvcmdhbmlz
ZWQgYWxvbmdzaWRlIHBhdGNoZXMgYW5kIHBhdGNoIHNlcmllcw0KLSBXaGF04oCZcyBpbiBhIHBh
dGNoOiBha2EgMS4yLiwgMS4zLjIsIDEuMy4zIHJlbGF0ZSB0byBpbmRpdmlkdWFsIHBhdGNoZXMg
IA0KLSBXaGF04oCZcyBpbiBhIHNlcmllczogZS5nLiBjb3ZlciBsZXR0ZXIgYW5kIHdoYXQgaXMg
ZXhwZWN0ZWQg4oCTIHNlY3Rpb24gMS4zLjEgd291bGQgbmF0dXJhbGx5IGFsc28gZml0IGludG8g
dGhlcmUgYW5kIHNvIHdvdWxkIDEuNC4gDQoNCj4gMS41IFNlbmRpbmcgdGhlIHBhdGNoZXMgdG8g
dGhlIGxpc3QgDQo+IDEuNS4xIFNldHRpbmcgdXAgZ2l0IHNlbmQtZW1haWwgDQpUaGlzIHNob3Vs
ZCBiZSBrZXB0DQoNCj4gMS41LjIgVXNpbmcgZ2l0IHNlbmQtZW1haWwgYWxvbmUgDQpUaGlzIHNo
b3VsZCBiZSByZW1vdmVkIGZyb20gdGhlIGRvY3VtZW50LiBJIGRvbuKAmXQgbWluZCBtb3Zpbmcg
aXQgaW50byBhIHNlcGFyYXRlIHBhZ2UgKHdoaWNoIGNhbiBiZSByZWZlcmVuY2VkIGZyb20gdGhl
IG5leHQgc2VjdGlvbikNCg0KPiAxLjUuMyBTaW1wbGVzdCB3b3JrZmxvdzogR2l0IGZvcm1hdC1w
YXRjaCwgYWRkX21haW50YWluZXJzLnBsL2dldF9tYWludGFpbmVyLnBsIGFuZCBnaXQgc2VuZC1l
bWFpbCANClRoaXMgc2hvdWxkIGJlIHRoZSBtYWluIHdvcmtmbG93IGFuZCBwcm9iYWJseSBvcHRp
b24gMiBzaG91bGQgYmUgcmVtb3ZlZA0KDQo+IDEuNS40IFNlbmRpbmcgUGF0Y2hlcyBNYW51YWxs
eSANClRoaXMgc2hvdWxkIGJlIHJlbW92ZWQgb3Igc3RhdGUgTk9UIFRPIERPIHRoaXMNCg0KPiAx
LjYgUmV2aWV3LCBSaW5zZSAmIFJlcGVhdCANCg0KPiAxLjcgV2hhdCBJZiANClRoaXMgc2hvdWxk
IGJlIG1vdmVkIGludG8gdGhlIG5ldyBzZWN0aW9uIChzZWUgYWJvdmUpIG9uIHBhdGNoIHNlcmll
cw0KDQo+IDEuOCBIb3cgdG8ga25vdyB3aGVuIGEgcGF0Y2ggaGFzIGJlZW4gY29tbWl0dGVkIA0K
U2hvdWxkIHByb2JhYmx5IHBvaW50IHRvIG91ciBwYXRjaHdvcmssIHBhdGNoZXcsIOKApiBpbnN0
YW5jZXMgYWxzbw0KDQo+IDEuOSBBZnRlciB5b3VyIHBhdGNoIGlzIGNvbW1pdHRlZCANCg0KPiAy
IEhvdyB0byBHZW5lcmF0ZSBhbmQgU3VibWl0IGEgUGF0Y2ggdG8gUWVtdS1YZW4gDQo+IDMgSG93
IHRvIEdlbmVyYXRlLCBhbmQgU3VibWl0IGEgWGVuIFByb2plY3QgUGF0Y2ggdG8gdGhlIExpbnV4
IFRyZWUgDQo+IDQgSG93IHRvIEdlbmVyYXRlIGFuZCBTdWJtaXQgYSBYZW4gcmVsYXRlZCBwYXRj
aCB0byBGcmVlQlNEIA0KPiA1IEhvdyB0byBHZW5lcmF0ZSwgYW5kIFN1Ym1pdCBhIFhlbiBQcm9q
ZWN0IFBhdGNoIHRvIE1pbmlPUyBhbmQgVW5pa3JhZnQgDQoNClRoZXNlIGNhbiBzdGF5IGFzIHRo
ZXkgYXJlDQoNClJlZ2FyZHMNCkxhcnMNCg0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs

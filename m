Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1524B14CB27
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 14:09:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwn43-000542-Sc; Wed, 29 Jan 2020 13:07:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xIWx=3S=amazon.co.uk=prvs=2906e62af=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iwn42-00053x-DZ
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 13:07:26 +0000
X-Inumbo-ID: 4baa6c91-4298-11ea-88b7-12813bfff9fa
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4baa6c91-4298-11ea-88b7-12813bfff9fa;
 Wed, 29 Jan 2020 13:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1580303246; x=1611839246;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QFuTU4Hspkx9Rvx/p+6w+6Bo32A3zl3HubtgIzrezDU=;
 b=H6m37+AnldMvROdp/MyA/sXZg38Z18AflpEA8F6d9zyB3t5DDdD36+H8
 CzIsZSRk5huMZ5xfPjlh+5EjvR41gUnTRht6sw+WlGQXnv01BqUr1Dpxy
 eRa0d49qrNcbpIKopJSgb6fxfVnSRng5B4hfcn5ar6hhaz9PCdIwt6Nr6 A=;
IronPort-SDR: 4wP2UPwYsR+LRqNO7ixEBO4DSGcWCVshZK0DDxAm39/4YTvAjifZ/7z8YsjeHKl1voGrjWfHHV
 ds34g8Rg7Hbg==
X-IronPort-AV: E=Sophos;i="5.70,377,1574121600"; d="scan'208";a="14675835"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1d-f273de60.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 29 Jan 2020 13:07:26 +0000
Received: from EX13MTAUEB002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1d-f273de60.us-east-1.amazon.com (Postfix) with ESMTPS
 id 986C4A29E6; Wed, 29 Jan 2020 13:07:23 +0000 (UTC)
Received: from EX13D08UEB004.ant.amazon.com (10.43.60.142) by
 EX13MTAUEB002.ant.amazon.com (10.43.60.12) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 29 Jan 2020 13:07:22 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D08UEB004.ant.amazon.com (10.43.60.142) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 29 Jan 2020 13:07:22 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Wed, 29 Jan 2020 13:07:21 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: David Woodhouse <dwmw2@infradead.org>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [ANNOUNCE] Xen 4.14 Development Update
Thread-Index: AQHV1qC3v/Fua/b59UacJxMyrVG64agBnBMAgAAAhZA=
Date: Wed, 29 Jan 2020 13:07:21 +0000
Message-ID: <fb88b9bd4d9941458cebd5b5ef66bbdc@EX13D32EUC003.ant.amazon.com>
References: <20200129123618.1202-1-pdurrant@amazon.com>
 <ed222d5dbc1036a5de2a4feb6960a4916d124de3.camel@infradead.org>
In-Reply-To: <ed222d5dbc1036a5de2a4feb6960a4916d124de3.camel@infradead.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.63]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [ANNOUNCE] Xen 4.14 Development Update
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "luwei.kang@intel.com" <luwei.kang@intel.com>,
 "marmarek@invisiblethingslab.com" <marmarek@invisiblethingslab.com>,
 "Woodhouse, David" <dwmw@amazon.co.uk>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBEYXZpZCBXb29kaG91c2UgPGR3
bXcyQGluZnJhZGVhZC5vcmc+DQo+IFNlbnQ6IDI5IEphbnVhcnkgMjAyMCAxMzowNQ0KPiBUbzog
eGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBEdXJyYW50LCBQYXVsIDxwZHVycmFudEBh
bWF6b24uY28udWs+DQo+IENjOiBXb29kaG91c2UsIERhdmlkIDxkd213QGFtYXpvbi5jby51az47
IGx1d2VpLmthbmdAaW50ZWwuY29tOw0KPiBtYXJtYXJla0BpbnZpc2libGV0aGluZ3NsYWIuY29t
OyBhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tOw0KPiByb2dlci5wYXVAY2l0cml4LmNvbQ0KPiBT
dWJqZWN0OiBSZTogW0FOTk9VTkNFXSBYZW4gNC4xNCBEZXZlbG9wbWVudCBVcGRhdGUNCj4gDQo+
IE9uIFdlZCwgMjAyMC0wMS0yOSBhdCAxMjozNiArMDAwMCwgUGF1bCBEdXJyYW50IHdyb3RlOg0K
PiA+IFRoaXMgZW1haWwgb25seSB0cmFja3MgYmlnIGl0ZW1zIGZvciB4ZW4uZ2l0IHRyZWUuIFBs
ZWFzZSByZXBseSBmb3INCj4gaXRlbXMNCj4gPiB5b3Ugd291bGQgbGlrZSB0byBzZWUgaW4gNC4x
NCBzbyB0aGF0IHBlb3BsZSBoYXZlIGFuIGlkZWEgd2hhdA0KPiA+IGlzIGdvaW5nIG9uIGFuZCBw
cmlvcml0aXNlIGFjY29yZGluZ2x5Lg0KPiA+DQo+ID4gWW91J3JlIHdlbGNvbWUgdG8gcHJvdmlk
ZSBkZXNjcmlwdGlvbiBhbmQgdXNlIGNhc2VzIG9mIHRoZSBmZWF0dXJlDQo+IHlvdSdyZQ0KPiA+
IHdvcmtpbmcgb24uDQo+ID4NCj4gPiA9IFRpbWVsaW5lID0NCj4gPg0KPiA+IFdlIG5vdyBhZG9w
dCBhIGZpeGVkIGN1dC1vZmYgZGF0ZSBzY2hlbWUuIFdlIHdpbGwgcmVsZWFzZSBhYm91dCBldmVy
eSA4DQo+ID4gIG1vbnRocy4NCj4gPiBUaGUgY3JpdGljYWwgZGF0ZXMgZm9yIFhlbiA0LjE0IGFy
ZSBhcyBmb2xsb3dzOg0KPiA+DQo+ID4gLS0tPiBXZSBhcmUgaGVyZQ0KPiA+ICogTGFzdCBwb3N0
aW5nIGRhdGU6IE1heSAxc3QsIDIwMjANCj4gPiAqIEhhcmQgY29kZSBmcmVlemU6IE1heSAyMm5k
LCAyMDIwDQo+ID4gKiBSZWxlYXNlOiBKdW5lIDI2dGgsIDIwMjANCj4gPg0KPiA+IE5vdGUgdGhh
dCB3ZSBkb24ndCBoYXZlIGEgZnJlZXplIGV4Y2VwdGlvbiBzY2hlbWUgYW55bW9yZS4gQWxsIHBh
dGNoZXMNCj4gPiB0aGF0IHdpc2ggdG8gZ28gaW50byA0LjE0IG11c3QgYmUgcG9zdGVkIGluaXRp
YWxseSBubyBsYXRlciB0aGFuIHRoZQ0KPiA+IGxhc3QgcG9zdGluZyBkYXRlIGFuZCBmaW5hbGx5
IG5vIGxhdGVyIHRoYW4gdGhlIGhhcmQgY29kZSBmcmVlemUuDQo+ID4gQWxsIHBhdGNoZXMgcG9z
dGVkIGFmdGVyIHRoYXQgZGF0ZSB3aWxsIGJlIGF1dG9tYXRpY2FsbHkgcXVldWVkIGludG8NCj4g
bmV4dA0KPiA+IHJlbGVhc2UuDQo+ID4NCj4gPiBSQ3Mgd2lsbCBiZSBhcnJhbmdlZCBpbW1lZGlh
dGVseSBhZnRlciBmcmVlemUuDQo+ID4NCj4gPiBUaGVyZSBpcyBhbHNvIGEgamlyYSBpbnN0YW5j
ZSB0byB0cmFjayBhbGwgdGhlIHRhc2tzIChub3Qgb25seSBiaWcpDQo+ID4gZm9yIHRoZSBwcm9q
ZWN0LiBTZWU6DQo+IGh0dHBzOi8veGVucHJvamVjdC5hdGxhc3NpYW4ubmV0L3Byb2plY3RzL1hF
Ti9pc3N1ZXMuDQo+ID4NCj4gPiBTb21lIG9mIHRoZSB0YXNrcyB0cmFja2VkIGJ5IHRoaXMgZS1t
YWlsIGFsc28gaGF2ZSBhIGNvcnJlc3BvbmRpbmcgamlyYQ0KPiB0YXNrDQo+ID4gcmVmZXJyZWQg
YnkgWEVOLU4uDQo+ID4NCj4gPiBUaGVyZSBpcyBhIHZlcnNpb24gbnVtYmVyIGZvciBwYXRjaCBz
ZXJpZXMgYXNzb2NpYXRlZCB0byBlYWNoIGZlYXR1cmUuDQo+ID4gQ2FuIGVhY2ggb3duZXIgc2Vu
ZCBhbiB1cGRhdGUgZ2l2aW5nIHRoZSBsYXRlc3QgdmVyc2lvbiBudW1iZXIgaWYgdGhlDQo+ID4g
c2VyaWVzIGhhcyBiZWVuIHJlLXBvc3RlZD8gQWxzbywgY2FuIHRoZSBvd25lcnMgb2YgYW55IGNv
bXBsZXRlZCBpdGVtcw0KPiA+IHBsZWFzZSByZXNwb25kIHNvIHRoYXQgdGhlIGl0ZW0gY2FuIGJl
IG1vdmVkIGludG8gdGhlICdDb21wbGV0ZWQnDQo+IHNlY3Rpb24uDQo+ID4NCj4gPiA9IFByb2pl
Y3RzID0NCj4gPg0KPiA+ID09IEh5cGVydmlzb3IgPT0NCj4gPg0KPiA+ICogIExpdmUtVXBkYXRp
bmcgWGVuDQo+ID4gICAtICBEYXZpZCBXb29kaG91c2UNCj4gDQo+IExhdGVzdCBSRkMgcGF0Y2hz
ZXQgcG9zdGVkIGlzIFtSRkMgdjJdIGF0DQo+IGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
YXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAyMC0wMS9tc2cwMTc2NC5odG1sDQo+IA0KPiBUaGUg
dHJlZSBhdA0KPiBodHRwczovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9cGVvcGxlL2R3bXcy
L3hlbi5naXQ7YT1zaG9ydGxvZztoPXJlZnMvaA0KPiBlYWRzL2x1LW1hc3Rlcg0KPiBhcyBtb3Zl
ZCBvbiBhIGxpdHRsZSBzaW5jZSB0aGVuLCBhbmQgSSdsbCBwb3N0IFtSRkMgdjNdIHNob3J0bHku
DQo+IA0KPiBTbyBmYXIgdGhpcyBpcyBtb3N0bHkganVzdCB0aGUgYmFzaWMgaGFuZG92ZXIgb2Yg
YSBzdHJlYW0gb2YgbWlncmF0aW9uDQo+IGRhdGEgZnJvbSBvbmUgWGVuIHRvIHRoZSBuZXh0LCBh
bmQgYWxsb3dpbmcgdGhlIG5ldyBYZW4gdG8gdm1hcCBhbmQNCj4gcHJvY2VzcyBpdCBlYXJseSBl
bm91Z2gsIGFuZCByZXNlcnZlIHRoZSBwYWdlcyB3aGljaCBhbHJlYWR5IGNvbnRhaW4NCj4gZG9t
YWluIGRhdGEgZHVyaW5nIGl0cyAiYm9vdCIuDQo+IA0KPiBJbiBvdXIgZGV2ZWxvcG1lbnQgdHJl
ZSwgd2UgaGF2ZSBhIFBWIERvbTAgc3Vydml2aW5nIHRoZSB0cmFuc2l0aW9uLg0KPiBXZSdyZSB3
b3JraW5nIG9uIHR1cm5pbmcgdGhvc2UgaGFja3MgaW50byBzb21ldGhpbmcgd2UgY2FuIHNob3cg
aW4NCj4gcHVibGljLg0KPiANCj4gSSBoYXZlIHVwZGF0ZWQgdGhlIHdpa2kgcGFnZSBhdCBodHRw
czovL3dpa2kueGVucHJvamVjdC5vcmcvd2lraS9MaXZlLQ0KPiBVcGRhdGluZ19YZW4NCj4gd2hp
Y2ggaW5jbHVkZXMgYSByZWZlcmVuY2UgdG8gdGhlIGhhbmRvdmVyIHByb3RvY29sIGRvY3VtZW50
YXRpb24uDQo+IA0KPiBUaGlzIGFsc28gZGVwZW5kcyBvbiB0aGUgaHlwZXJ2aXNvciBzaWRlIG9m
IG5vbi1jb29wZXJhdGl2ZSBsaXZlDQo+IG1pZ3JhdGlvbiwgbWVudGlvbmVkIGJlbG93LiBCdXQg
YXMgd2VsbCBhcyB0aGF0LCBwYXJ0cyBvZiB0aGUgbWVtb3J5DQo+IG1hbmFnZW1lbnQgYXJlIGdv
aW5nIHRvIGludGVyc2VjdCB3aXRoIHRoZSBzZWNyZXQgaGlkaW5nIHdvcmsgdGhhdCB5b3UNCj4g
KmRpZG4ndCogY2FsbCBvdXQgaW4gdGhpcyBlbWFpbCBBRkFJQ1QuDQoNClllcywgSSBvbWl0dGVk
IFNlY3JldCBIaWRpbmcuIEFncmVlZCBpdCBvdWdodCB0byBiZSB0cmFja2VkLg0KDQogIFBhdWwN
Cg0KPiANCj4gDQo+ID4gKiAgTm9uLUNvb3BlcmF0aXZlIExpdmUgTWlncmF0aW9uDQo+ID4gICAt
ICBQYXVsIER1cnJhbnQNCj4gPg0KPiA+ID09PSB4ODYgPT09DQo+ID4NCj4gPiAqICBJbnRlbCBQ
cm9jZXNzb3IgVHJhY2UgdmlydHVhbGl6YXRpb24gZW5hYmxpbmcgKHYxKQ0KPiA+ICAgLSAgTHV3
ZWkgS2FuZw0KPiA+DQo+ID4gKiAgTGludXggc3R1YiBkb21haW5zIChSRkMgdjIpDQo+ID4gICAt
ICBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kNCj4gPg0KPiA+ICogIEZpeGVzIHRvICNEQiBp
bmplY3Rpb24NCj4gPiAgIC0gIEFuZHJldyBDb29wZXINCj4gPg0KPiA+ICogIENQVUlEL01TUiBY
ZW4vdG9vbHN0YWNrIGltcHJvdmVtZW50cw0KPiA+ICAgLSAgQW5kcmV3IENvb3Blcg0KPiA+DQo+
ID4gKiAgSW1wcm92ZW1lbnRzIHRvIGRvbWFpbl9jcmFzaCgpDQo+ID4gICAtICBBbmRyZXcgQ29v
cGVyDQo+ID4NCj4gPiAqICBFSUJSUw0KPiA+ICAgLSAgQW5kcmV3IENvb3Blcg0KPiA+DQo+ID4g
KiAgWGVuIGlvcmVxIHNlcnZlciAodjMpDQo+ID4gICAtICBSb2dlciBQYXUgTW9ubmUNCj4gPg0K
PiA+ID09PSBBUk0gPT09DQo+ID4NCj4gPiA9PSBDb21wbGV0ZWQgPT0NCj4gPg0KPiA+DQo+ID4g
UGF1bCBEdXJyYW50DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=

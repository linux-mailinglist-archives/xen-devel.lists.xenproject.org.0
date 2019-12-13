Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C3011E728
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 16:58:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifnHc-0005bU-FK; Fri, 13 Dec 2019 15:55:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8pyZ=2D=amazon.com=prvs=24328bf02=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ifnHa-0005bP-Df
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 15:55:10 +0000
X-Inumbo-ID: f0d95eb2-1dc0-11ea-a1e1-bc764e2007e4
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f0d95eb2-1dc0-11ea-a1e1-bc764e2007e4;
 Fri, 13 Dec 2019 15:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1576252510; x=1607788510;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fDH81sjXFrIw9D9ZwrZihUFRDVDMezm+P+qOofqobgk=;
 b=v1WAWY2U5urqNHBY9fVH/0bBphgpTCBV3qoAn/wjxAjqfmQTtWzkjWM3
 l/Hr81eg4ILu91XJd6tCSLySd87lMiOeGtsZdVhlyXBUQtoXad+QjQvIo
 H6clZrhpnlwf77yRRzd4SZID/OJwhb2fDB6PDjkjnapVyB8OlK53tgLl6 s=;
IronPort-SDR: XruakLG3zqsryId5GnfIdxN+DhZH/JNDCxvUEI7N8KJSZDD9zYy86+8zMVNUxOzGV+VifNBLO3
 KnX8iUBdgpGg==
X-IronPort-AV: E=Sophos;i="5.69,309,1571702400"; 
   d="scan'208";a="8382268"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2b-55156cd4.us-west-2.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 13 Dec 2019 15:55:08 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-55156cd4.us-west-2.amazon.com (Postfix) with ESMTPS
 id 558E6A1DB8; Fri, 13 Dec 2019 15:55:06 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 13 Dec 2019 15:55:05 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 13 Dec 2019 15:55:05 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Fri, 13 Dec 2019 15:55:04 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: Julien Grall <julien@xen.org>, Ian Jackson <ian.jackson@citrix.com>
Thread-Topic: [Xen-devel] [xen-4.13-testing test] 144736: regressions - FAIL
Thread-Index: AQHVsTz+jTB8vYp/AU+57XLn6tqelae3vOqAgAAtpACAAAc0gIAAQhMAgAAEXhA=
Date: Fri, 13 Dec 2019 15:55:04 +0000
Message-ID: <a65ae7dca64f4f718f116b9174893730@EX13D32EUC003.ant.amazon.com>
References: <osstest-144736-mainreport@xen.org>
 <e05a3bc4-2c1d-7e71-af42-d6362c4f6d07@suse.com>
 <6ea2af3c-b277-1118-7c83-ebcb0809d449@xen.org>
 <24051.30893.31444.319978@mariner.uk.xensource.com>
 <7a0ef296-eb50-fbda-63e2-8d890fad5111@xen.org>
In-Reply-To: <7a0ef296-eb50-fbda-63e2-8d890fad5111@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.122]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [xen-4.13-testing test] 144736: regressions - FAIL
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>,
 osstest service owner <osstest-admin@xenproject.org>,
 Anthony Perard <anthony.perard@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZl
bC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YNCj4gSnVsaWVuIEdy
YWxsDQo+IFNlbnQ6IDEzIERlY2VtYmVyIDIwMTkgMTU6MzcNCj4gVG86IElhbiBKYWNrc29uIDxp
YW4uamFja3NvbkBjaXRyaXguY29tPg0KPiBDYzogSsO8cmdlbiBHcm/DnyA8amdyb3NzQHN1c2Uu
Y29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBTdGVmYW5vDQo+IFN0YWJlbGxp
bmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBvc3N0ZXN0IHNlcnZpY2Ugb3duZXIgPG9zc3Rl
c3QtDQo+IGFkbWluQHhlbnByb2plY3Qub3JnPjsgQW50aG9ueSBQZXJhcmQgPGFudGhvbnkucGVy
YXJkQGNpdHJpeC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbWGVuLWRldmVsXSBbeGVuLTQuMTMtdGVz
dGluZyB0ZXN0XSAxNDQ3MzY6IHJlZ3Jlc3Npb25zIC0NCj4gRkFJTA0KPiANCj4gK0FudGhvbnkN
Cj4gDQo+IE9uIDEzLzEyLzIwMTkgMTE6NDAsIElhbiBKYWNrc29uIHdyb3RlOg0KPiA+IEp1bGll
biBHcmFsbCB3cml0ZXMgKCJSZTogW1hlbi1kZXZlbF0gW3hlbi00LjEzLXRlc3RpbmcgdGVzdF0g
MTQ0NzM2Og0KPiByZWdyZXNzaW9ucyAtIEZBSUwiKToNCj4gPj4gQU1EIFNlYXR0bGUgYm9hcmRz
IChsYXh0b24qKSBhcmUga25vd24gdG8gZmFpbCBib290aW5nIHRpbWUgdG8gdGltZQ0KPiA+PiBi
ZWNhdXNlIG9mIFBDSSB0cmFpbmluZyBpc3N1ZS4gV2UgaGF2ZSB3b3JrYXJvdW5kIGZvciBpdCAo
aW52b2x2aW5nDQo+ID4+IGxvbmdlciBwb3dlciBjeWNsZSkgYnV0IHRoaXMgaXMgbm90IDEwMCUg
cmVsaWFibGUuDQo+ID4NCj4gPiBUaGlzIHdhc24ndCBhIHBvd2VyIGN5Y2xlLiAgSXQgd2FzIGEg
c29mdHdhcmUtaW5pdGlhdGVkIHJlYm9vdC4gIEl0DQo+ID4gZG9lcyBhcHBlYXIgdG8gaGFuZyBp
biB0aGUgZmlybXdhcmUgc29tZXdoZXJlLiAgRG8gd2UgZXhwZWN0IHRoZSBwY2kNCj4gPiB0cmFp
bmluZyBpc3N1ZSB0byBvY2N1ciBpbiB0aGlzIGNhc2UgPw0KPiANCj4gVGhlIFBDSSB0cmFpbmlu
ZyBoYXBwZW5zIGF0IGV2ZXJ5IHJlc2V0IChpbmNsdWRpbmcgc29mdHdhcmUpLiBTbyBJIG1heQ0K
PiBoYXZlIGNvbmZ1c2VkIHRoZSB3b3JrYXJvdW5kIGZvciBmaXJtd2FyZSBjb3JydXB0aW9uIHdp
dGggdGhlIFBDSQ0KPiB0cmFpbmluZy4gV2UgZGVmaW5pdGVseSBoYXZlIGEgd29ya2Zyb3VuZCBm
b3IgdGhlIGZvcm1lci4NCj4gDQo+IEZvciB0aGUgbGF0dGVyLCBJIGNhbid0IHJlbWVtYmVyIGlm
IHdlIGRpZCB1c2UgYSBuZXcgZmlybXdhcmUgb3IganVzdA0KPiBob3BlIGl0IGRvZXMgbm90IGhh
cHBlbiBvZnRlbi4NCj4gDQo+IEkgdGhpbmsgd2UgaGFkIGEgdGhyZWFkIG9uIGluZnJhQCBhYm91
dCB0aGUgd29ya2Fyb3VuZCBzb21lIHRpbWVzIGxhc3QNCj4geWVhci4gU2FkbHkgdGhpcyB3YXMg
c2VudCBvbiBteSBBcm0gZS1tYWlsIGFkZHJlc3MgYW5kIEkgZGlkbid0IGFyY2hpdmUNCj4gaXQg
YmVmb3JlIGxlYXZpbmcgOiguIENhbiB5b3UgaGF2ZSBhIGxvb2sgaWYgeW91IGNhbiBmaW5kIHRo
ZSB0aHJlYWQ/DQo+IA0KPiA+DQo+ID4+Pj4gIMKgIHRlc3QtYXJtaGYtYXJtaGYteGwtdmhkwqDC
oMKgwqDCoCAxOCBsZWFrLWNoZWNrL2NoZWNrwqDCoMKgwqDCoMKgwqDCoCBmYWlsDQo+IFJFR1Iu
DQo+ID4+Pj4gdnMuIDE0NDY3Mw0KPiA+Pj4NCj4gPj4+IFRoYXQgb25lIGlzIHN0cmFuZ2UuIEEg
cWVtdSBwcm9jZXNzIHNlZW1zIHRvIGhhdmUgaGF2ZSBkaWVkIHByb2R1Y2luZw0KPiA+Pj4gYSBj
b3JlIGZpbGUsIGJ1dCBJIGNvdWxkbid0IGZpbmQgYW55IGxvZyBjb250YWluaW5nIGFueSBvdGhl
cg0KPiBpbmRpY2F0aW9uDQo+ID4+PiBvZiBhIGNyYXNoZWQgcHJvZ3JhbS4NCj4gPj4NCj4gPj4g
SSBoYXZlbid0IGZvdW5kIGFueXRoaW5nIGludGVyZXN0aW5nIGluIHRoZSBsb2cuIEBJYW4gY291
bGQgeW91IHNldCB1cA0KPiA+PiBhIHJlcHJvIGZvciB0aGlzPw0KPiA+DQo+ID4gVGhlcmUgaXMg
c29tZSBoZWlzZW5idWcgd2hlcmUgcWVtdSBjcmFzaGVzIHdpdGggdmVyeSBsb3cgcHJvYmFiaWxp
dHkuDQo+ID4gKEkgZm9yZ2V0IHdoZXRoZXIgb25seSBvbiBhcm0gb3Igb24geDg2IHRvbykuICBU
aGlzIGhhcyBiZWVuIGFyb3VuZA0KPiA+IGZvciBhIGxpdHRsZSB3aGlsZS4gIEkgZG91YnQgdGhp
cyBwYXJ0aWN1bGFyIGZhaWx1cmUgd2lsbCBiZQ0KPiA+IHJlcHJvZHVjaWJsZS4NCj4gDQo+IEkg
Y2FuJ3QgcmVtZW1iZXIgc3VjaCBidWcgYmVlbiByZXBvcnRlZCBvbiBBcm0gYmVmb3JlLiBBbnl3
YXksIEkgbWFuYWdlZA0KPiB0byBnZXQgdGhlIHN0YWNrIHRyYWNlIGZyb20gZ2RiOg0KPiANCj4g
Q29yZSB3YXMgZ2VuZXJhdGVkIGJ5IGAvdXNyL2xvY2FsL2xpYi94ZW4vYmluL3FlbXUtc3lzdGVt
LWkzODYNCj4gLXhlbi1kb21pZCAxIC1jaGFyZGV2IHNvY2tldCxpZD1saWJ4bC1jJy4NCj4gUHJv
Z3JhbSB0ZXJtaW5hdGVkIHdpdGggc2lnbmFsIFNJR1NFR1YsIFNlZ21lbnRhdGlvbiBmYXVsdC4N
Cj4gIzAgIDB4MDA2MzQyYmUgaW4geGVuX2Jsb2NrX2hhbmRsZV9yZXF1ZXN0cyAoZGF0YXBsYW5l
PTB4MTA4ZTYwMCkgYXQNCj4gL2hvbWUvb3NzdGVzdC9idWlsZC4xNDQ3MzYuYnVpbGQtYXJtaGYv
eGVuL3Rvb2xzL3FlbXUteGVuLQ0KPiBkaXIvaHcvYmxvY2svZGF0YXBsYW5lL3hlbi1ibG9jay5j
OjUzMQ0KPiA1MzENCj4gL2hvbWUvb3NzdGVzdC9idWlsZC4xNDQ3MzYuYnVpbGQtYXJtaGYveGVu
L3Rvb2xzL3FlbXUteGVuLQ0KPiBkaXIvaHcvYmxvY2svZGF0YXBsYW5lL3hlbi1ibG9jay5jOg0K
PiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5Lg0KPiBbQ3VycmVudCB0aHJlYWQgaXMgMSAoTFdQ
IDE5ODcpXQ0KPiAoZ2RiKSBidA0KPiAjMCAgMHgwMDYzNDJiZSBpbiB4ZW5fYmxvY2tfaGFuZGxl
X3JlcXVlc3RzIChkYXRhcGxhbmU9MHgxMDhlNjAwKSBhdA0KPiAvaG9tZS9vc3N0ZXN0L2J1aWxk
LjE0NDczNi5idWlsZC1hcm1oZi94ZW4vdG9vbHMvcWVtdS14ZW4tDQo+IGRpci9ody9ibG9jay9k
YXRhcGxhbmUveGVuLWJsb2NrLmM6NTMxDQo+ICMxICAweDAwNjM0NDdjIGluIHhlbl9ibG9ja19k
YXRhcGxhbmVfZXZlbnQgKG9wYXF1ZT0weDEwOGU2MDApIGF0DQo+IC9ob21lL29zc3Rlc3QvYnVp
bGQuMTQ0NzM2LmJ1aWxkLWFybWhmL3hlbi90b29scy9xZW11LXhlbi0NCj4gZGlyL2h3L2Jsb2Nr
L2RhdGFwbGFuZS94ZW4tYmxvY2suYzo2MjYNCj4gIzIgIDB4MDA4ZDAwNWMgaW4geGVuX2Rldmlj
ZV9wb2xsIChvcGFxdWU9MHgxMDdhM2IwKSBhdA0KPiAvaG9tZS9vc3N0ZXN0L2J1aWxkLjE0NDcz
Ni5idWlsZC1hcm1oZi94ZW4vdG9vbHMvcWVtdS14ZW4tZGlyL2h3L3hlbi94ZW4tDQo+IGJ1cy5j
OjEwNzcNCj4gIzMgIDB4MDBhNDE3NWMgaW4gcnVuX3BvbGxfaGFuZGxlcnNfb25jZSAoY3R4PTB4
MTA3OTcwOCwNCj4gdGltZW91dD0weGIxYmExN2Y4KSBhdA0KPiAvaG9tZS9vc3N0ZXN0L2J1aWxk
LjE0NDczNi5idWlsZC1hcm1oZi94ZW4vdG9vbHMvcWVtdS14ZW4tZGlyL3V0aWwvYWlvLQ0KPiBw
b3NpeC5jOjUyMA0KPiAjNCAgMHgwMGE0MTgyNiBpbiBydW5fcG9sbF9oYW5kbGVycyAoY3R4PTB4
MTA3OTcwOCwgbWF4X25zPTgwMDAsDQo+IHRpbWVvdXQ9MHhiMWJhMTdmOCkgYXQNCj4gL2hvbWUv
b3NzdGVzdC9idWlsZC4xNDQ3MzYuYnVpbGQtYXJtaGYveGVuL3Rvb2xzL3FlbXUteGVuLWRpci91
dGlsL2Fpby0NCj4gcG9zaXguYzo1NjINCj4gIzUgIDB4MDBhNDE5NTYgaW4gdHJ5X3BvbGxfbW9k
ZSAoY3R4PTB4MTA3OTcwOCwgdGltZW91dD0weGIxYmExN2Y4KSBhdA0KPiAvaG9tZS9vc3N0ZXN0
L2J1aWxkLjE0NDczNi5idWlsZC1hcm1oZi94ZW4vdG9vbHMvcWVtdS14ZW4tZGlyL3V0aWwvYWlv
LQ0KPiBwb3NpeC5jOjU5Nw0KPiAjNiAgMHgwMGE0MWEyYyBpbiBhaW9fcG9sbCAoY3R4PTB4MTA3
OTcwOCwgYmxvY2tpbmc9dHJ1ZSkgYXQNCj4gL2hvbWUvb3NzdGVzdC9idWlsZC4xNDQ3MzYuYnVp
bGQtYXJtaGYveGVuL3Rvb2xzL3FlbXUteGVuLWRpci91dGlsL2Fpby0NCj4gcG9zaXguYzo2MzkN
Cj4gIzcgIDB4MDA3MWRjMTYgaW4gaW90aHJlYWRfcnVuIChvcGFxdWU9MHgxMDdkMzI4KSBhdA0K
PiAvaG9tZS9vc3N0ZXN0L2J1aWxkLjE0NDczNi5idWlsZC1hcm1oZi94ZW4vdG9vbHMvcWVtdS14
ZW4tDQo+IGRpci9pb3RocmVhZC5jOjc1DQo+ICM4ICAweDAwYTQ0YzgwIGluIHFlbXVfdGhyZWFk
X3N0YXJ0IChhcmdzPTB4MTA3OTUzOCkgYXQNCj4gL2hvbWUvb3NzdGVzdC9idWlsZC4xNDQ3MzYu
YnVpbGQtYXJtaGYveGVuL3Rvb2xzL3FlbXUteGVuLWRpci91dGlsL3FlbXUtDQo+IHRocmVhZC1w
b3NpeC5jOjUwMg0KPiAjOSAgMHhiNjdhZTVkOCBpbiA/PyAoKQ0KPiBCYWNrdHJhY2Ugc3RvcHBl
ZDogcHJldmlvdXMgZnJhbWUgaWRlbnRpY2FsIHRvIHRoaXMgZnJhbWUgKGNvcnJ1cHQgc3RhY2s/
KQ0KPiANCj4gVGhpcyBmZWVscyBsaWtlIGEgcmFjZSBjb25kaXRpb24gYmV0d2VlbiB0aGUgaW5p
dC9mcmVlIGNvZGUgd2l0aA0KPiBoYW5kbGVyLiBBbnRob255LCBkb2VzIGl0IHJpbmcgYW55IGJl
bGw/DQo+IA0KDQpGcm9tIHRoYXQgc3RhY2sgYnQgaXQgbG9va3MgbGlrZSBhbiBpb3RocmVhZCBt
YW5hZ2VkIHRvIHJ1biBhZnRlciB0aGUgc3Jpbmcgd2FzIE5VTExlZC4gVGhpcyBzaG91bGQgbm90
IGJlIGFibGUgaGFwcGVuIGFzIHRoZSBkYXRhcGxhbmUgc2hvdWxkIGhhdmUgYmVlbiBtb3ZlZCBi
YWNrIG9udG8gUUVNVSdzIG1haW4gdGhyZWFkIGNvbnRleHQgYmVmb3JlIHRoZSByaW5nIGlzIHVu
bWFwcGVkLg0KDQogIFBhdWwNCg0KPiBDaGVlcnMsDQo+IA0KPiAtLQ0KPiBKdWxpZW4gR3JhbGwN
Cj4gDQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+
IFhlbi1kZXZlbCBtYWlsaW5nIGxpc3QNCj4gWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
DQo+IGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWwNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

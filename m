Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E349B234798
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 16:17:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1VqR-0002vI-2p; Fri, 31 Jul 2020 14:17:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GLoN=BK=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1k1VqP-0002vC-Ek
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 14:17:09 +0000
X-Inumbo-ID: 8427b90c-d338-11ea-abbe-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8427b90c-d338-11ea-abbe-12813bfff9fa;
 Fri, 31 Jul 2020 14:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1596205028;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=wnkgz3lJcyGV8tNUyDz2X/De2tL0/HgOXTDiF4Sf7Fc=;
 b=CPJ13pVB1QLHd1GZmTOtp7Qrn2cPJ2Jufuqt8X8Jik2DiXtFZOtuLbNd
 VNTPHSVZPz9f2GJysUMwx1nO1tsZ2dizItVYi/HS0KKfdrtx51e4hiKBm
 NT6HsXtCG9zc0W/yjHGi409ksbX0zCsBTli5AyHxA4swvxspDkXd+j6nc 0=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: uBPa7bx6y3uZSXAYbB89HsRQifuJopnCiFIHfLxk/6QlvC0Vg7W2oSayCYRMZtIZQn6u+B7sBG
 lLm/Cw78Cd8BAhyPZGC0tJZkJJK4W0jgnjfAfj3m0DBBgt9RoSOUvEjo3RtMLf81lYih/b0V44
 5SEKGOGqiuWD4twpKgDiwFJcgs3kgfLIR+HR5YaxhQdl9W0HKyYFpgG+tdb26QRZYIdEDySwjK
 QVuiDX30FHXGqxUatnk2ZzOFRr+HG0ra5L1AcjyP7wH3Z+WXqhobopD/ynnvNPRlLRhUOel9UY
 u5Q=
X-SBRS: 3.7
X-MesageID: 23646781
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,418,1589256000"; d="scan'208";a="23646781"
From: George Dunlap <George.Dunlap@citrix.com>
To: Ian Jackson <Ian.Jackson@citrix.com>
Subject: Re: [OSSTEST PATCH v2 08/41] sg-report-flight: Ask the db for flights
 of interest
Thread-Topic: [OSSTEST PATCH v2 08/41] sg-report-flight: Ask the db for
 flights of interest
Thread-Index: AQHWZy8f+6AlWw+J2k+zDE+BIUpw1akhmqIA
Date: Fri, 31 Jul 2020 14:17:04 +0000
Message-ID: <391CB71B-3587-40C1-BE6E-F01A6473141D@citrix.com>
References: <20200731113820.5765-1-ian.jackson@eu.citrix.com>
 <20200731113820.5765-9-ian.jackson@eu.citrix.com>
In-Reply-To: <20200731113820.5765-9-ian.jackson@eu.citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.80.23.2.2)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <C8B6825660F566488DB0442233F58E21@citrix.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gSnVsIDMxLCAyMDIwLCBhdCAxMjozNyBQTSwgSWFuIEphY2tzb24gPGlhbi5qYWNr
c29uQGV1LmNpdHJpeC5jb20+IHdyb3RlOg0KPiANCj4gU3BlY2lmaWNhbGx5LCB3ZSBuYXJyb3cg
dGhlIGluaXRpYWwgcXVlcnkgdG8gZmxpZ2h0cyB3aGljaCBoYXZlIGF0DQo+IGxlYXN0IHNvbWUg
am9iIHdpdGggdGhlIGJ1aWx0X3JldmlzaW9uX2ZvbyB3ZSBhcmUgbG9va2luZyBmb3IuDQo+IA0K
PiBUaGlzIGNvbmRpdGlvbiBpcyBzdHJpY3RseSBicm9hZGVyIHRoYW4gdGhhdCBpbXBsZW1lbnRl
ZCBpbnNpZGUgdGhlDQo+IGZsaWdodCBzZWFyY2ggbG9vcCwgc28gdGhlcmUgaXMgbm8gZnVuY3Rp
b25hbCBjaGFuZ2UuDQoNCkFzc3VtaW5nIHRoaXMgaXMgdHJ1ZSwgdGhhdCBqb2IgLyBydW52YXIg
aXMgZmlsdGVyZWQgYWZ0ZXIgZXh0cmFjdGluZyB0aGlzIGluZm9ybWF0aW9uLCB0aGVuLi4uDQoN
Cj4gDQo+IFBlcmY6IHJ1bnRpbWUgb2YgbXkgdGVzdCBjYXNlIG5vdyB+MzAwcy01MDBzLg0KPiAN
Cj4gRXhhbXBsZSBxdWVyeSBiZWZvcmUgKGZyb20gdGhlIFBlcmwgREJJIHRyYWNlKToNCj4gDQo+
ICAgICAgU0VMRUNUICogRlJPTSAoDQo+ICAgICAgICBTRUxFQ1QgZmxpZ2h0LCBibGVzc2luZyBG
Uk9NIGZsaWdodHMNCj4gICAgICAgICAgICBXSEVSRSAoYnJhbmNoPSd4ZW4tdW5zdGFibGUnKQ0K
PiAgICAgICAgICAgICAgQU5EICAgICAgICAgICAgICAgICAgIEVYSVNUUyAoU0VMRUNUIDENCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgRlJPTSBqb2JzDQo+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgV0hFUkUgam9icy5mbGlnaHQgPSBmbGlnaHRzLmZsaWdodA0KPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgQU5EIGpvYnMuam9iID0gPykNCj4gDQo+ICAgICAgICAgICAgICBB
TkQgKCAoVFJVRSBBTkQgZmxpZ2h0IDw9IDE1MTkwMykgQU5EIChibGVzc2luZz0ncmVhbCcpICkN
Cj4gICAgICAgICAgICBPUkRFUiBCWSBmbGlnaHQgREVTQw0KPiAgICAgICAgICAgIExJTUlUIDEw
MDANCj4gICAgICApIEFTIHN1Yg0KPiAgICAgIE9SREVSIEJZIGJsZXNzaW5nIEFTQywgZmxpZ2h0
IERFU0MNCj4gDQo+IFdpdGggdGhlc2UgYmluZCB2YXJpYWJsZXM6DQo+IA0KPiAgICAidGVzdC1h
cm1oZi1hcm1oZi1saWJ2aXJ0Ig0KPiANCj4gQWZ0ZXI6DQo+IA0KPiAgICAgIFNFTEVDVCAqIEZS
T00gKA0KPiAgICAgICAgU0VMRUNUIERJU1RJTkNUIGZsaWdodCwgYmxlc3NpbmcNCj4gICAgICAg
ICAgICAgRlJPTSBmbGlnaHRzDQo+ICAgICAgICAgICAgIEpPSU4gcnVudmFycyByMSBVU0lORyAo
ZmxpZ2h0KQ0KPiANCj4gICAgICAgICAgICBXSEVSRSAoYnJhbmNoPSd4ZW4tdW5zdGFibGUnKQ0K
PiAgICAgICAgICAgICAgQU5EICggKFRSVUUgQU5EIGZsaWdodCA8PSAxNTE5MDMpIEFORCAoYmxl
c3Npbmc9J3JlYWwnKSApDQo+ICAgICAgICAgICAgICAgICAgQU5EIEVYSVNUUyAoU0VMRUNUIDEN
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgRlJPTSBqb2JzDQo+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgV0hFUkUgam9icy5mbGlnaHQgPSBmbGlnaHRzLmZsaWdodA0KPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgQU5EIGpvYnMuam9iID0gPykNCj4gDQo+ICAgICAgICAgICAg
ICBBTkQgcjEubmFtZSBMSUtFICdidWlsdFxfcmV2aXNpb25cXyUnDQo+ICAgICAgICAgICAgICBB
TkQgcjEubmFtZSA9ID8NCj4gICAgICAgICAgICAgIEFORCByMS52YWw9ID8NCj4gDQo+ICAgICAg
ICAgICAgT1JERVIgQlkgZmxpZ2h0IERFU0MNCj4gICAgICAgICAgICBMSU1JVCAxMDAwDQo+ICAg
ICAgKSBBUyBzdWINCj4gICAgICBPUkRFUiBCWSBibGVzc2luZyBBU0MsIGZsaWdodCBERVNDDQoN
CuKApkkgYWdyZWUgdGhhdCB0aGlzIHNob3VkIGludHJvZHVjZSBubyBvdGhlciBjaGFuZ2VzLg0K
DQpSZXZpZXdlZC1ieTogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPg==


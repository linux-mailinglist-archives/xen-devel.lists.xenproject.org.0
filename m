Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F7B2297EC
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jul 2020 14:10:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyDZh-0004qQ-QM; Wed, 22 Jul 2020 12:10:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0IpC=BB=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jyDZg-0004qL-4J
 for xen-devel@lists.xenproject.org; Wed, 22 Jul 2020 12:10:16 +0000
X-Inumbo-ID: 4c94de00-cc14-11ea-8637-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4c94de00-cc14-11ea-8637-bc764e2007e4;
 Wed, 22 Jul 2020 12:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595419814;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=GatcW2GReBb9SAiidFcPYWQ1tiOtO57bMcOdp2x5J+M=;
 b=gh6xHoRyM8zjBb2X1Mtn1ZRVjLYw9iFX7gN3L/ftH2iVxvkKeaDSLVPa
 iZT39EAsCPJ9TRuRgobYeepmMnClBH07h0/+fmarXYQou9DZ4sFFqVYqU
 D+PNou9ROtuGUtz1PPNRtXGBETbQ3VuY7fQ1rSMQk0A2p/SVw1Smc0dqi o=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: wMONTuKVxotu7eKAhnS/KMMe/Ha+QbI1HzN8xeQEHrdZ1+fqAXAtPqEkwIMsaOIIA/RrCfI2J/
 FFfKDy4pArZVFiPnIc3o+xqOQy64dLv6pblUN4SXmXZ+TRJiq8p0xBY0OpXhp3VGXSGJMSCUak
 W0MWn7xPU9T/mapSbi6nyHmjXkgX/C7Vk04oKZdFCIM1qbTWw+z8s3BLpXwg//E1DHS472dVPK
 TXzqUljkou0GskYcip3L/rFhz16S7t2n1UzUPCOMw7L5raGCi/tQmOlkW3nsngfWdUsGB+CDcx
 aWs=
X-SBRS: 2.7
X-MesageID: 23126084
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,381,1589256000"; d="scan'208";a="23126084"
From: George Dunlap <George.Dunlap@citrix.com>
To: Ian Jackson <Ian.Jackson@citrix.com>
Subject: Re: [OSSTEST PATCH 04/14] sg-report-flight: Ask the db for flights of
 interest
Thread-Topic: [OSSTEST PATCH 04/14] sg-report-flight: Ask the db for flights
 of interest
Thread-Index: AQHWX46tA1o7W5rW1EWGL27a+eUklakTYXSA
Date: Wed, 22 Jul 2020 12:10:11 +0000
Message-ID: <3966AFCB-7B7B-45BE-A3F1-7E04943EEEFA@citrix.com>
References: <20200721184205.15232-1-ian.jackson@eu.citrix.com>
 <20200721184205.15232-5-ian.jackson@eu.citrix.com>
In-Reply-To: <20200721184205.15232-5-ian.jackson@eu.citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.80.23.2.2)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <8B4B6CA882925742A43405C357AD1A1D@citrix.com>
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

DQoNCj4gT24gSnVsIDIxLCAyMDIwLCBhdCA3OjQxIFBNLCBJYW4gSmFja3NvbiA8aWFuLmphY2tz
b25AZXUuY2l0cml4LmNvbT4gd3JvdGU6DQo+IA0KPiBTcGVjaWZpY2FsbHksIHdlIG5hcnJvdyB0
aGUgaW5pdGlhbCBxdWVyeSB0byBmbGlnaHRzIHdoaWNoIGhhdmUgYXQNCj4gbGVhc3Qgc29tZSBq
b2Igd2l0aCB0aGUgYnVpbHRfcmV2aXNpb25fZm9vIHdlIGFyZSBsb29raW5nIGZvci4NCj4gDQo+
IFRoaXMgY29uZGl0aW9uIGlzIHN0cmljdGx5IGJyb2FkZXIgdGhhbiB0aGF0IGltcGxlbWVudGVk
IGluc2lkZSB0aGUNCj4gZmxpZ2h0IHNlYXJjaCBsb29wLCBzbyB0aGVyZSBpcyBubyBmdW5jdGlv
bmFsIGNoYW5nZS4NCj4gDQo+IFBlcmY6IHJ1bnRpbWUgb2YgbXkgdGVzdCBjYXNlIG5vdyB+MzAw
cy01MDBzLg0KPiANCj4gRXhhbXBsZSBxdWVyeSBiZWZvcmUgKGZyb20gdGhlIFBlcmwgREJJIHRy
YWNlKToNCj4gDQo+ICAgICAgU0VMRUNUICogRlJPTSAoDQo+ICAgICAgICBTRUxFQ1QgZmxpZ2h0
LCBibGVzc2luZyBGUk9NIGZsaWdodHMNCj4gICAgICAgICAgICBXSEVSRSAoYnJhbmNoPSd4ZW4t
dW5zdGFibGUnKQ0KPiAgICAgICAgICAgICAgQU5EICAgICAgICAgICAgICAgICAgIEVYSVNUUyAo
U0VMRUNUIDENCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgRlJPTSBqb2JzDQo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgV0hFUkUgam9icy5mbGlnaHQgPSBmbGlnaHRzLmZsaWdodA0K
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQU5EIGpvYnMuam9iID0gPykNCj4gDQo+ICAg
ICAgICAgICAgICBBTkQgKCAoVFJVRSBBTkQgZmxpZ2h0IDw9IDE1MTkwMykgQU5EIChibGVzc2lu
Zz0ncmVhbCcpICkNCj4gICAgICAgICAgICBPUkRFUiBCWSBmbGlnaHQgREVTQw0KPiAgICAgICAg
ICAgIExJTUlUIDEwMDANCj4gICAgICApIEFTIHN1Yg0KPiAgICAgIE9SREVSIEJZIGJsZXNzaW5n
IEFTQywgZmxpZ2h0IERFU0MNCg0KVGhpcyBvbmUgc2F5czoNCg0KRmluZCB0aGUgMTAwMCBtb3N0
IHJlY2VudCBmbGlnaHRzDQpXaGVyZSANCiAgYnJhbmNoIGlzICJ4ZW4tdW5zdGFibGXigJ0NCiAg
b25lIG9mIGl0cyBqb2JzIGlzICRqb2INCiAgQW5kIGJsZXNzaW5nIGlzIOKAnHJlYWzigJ0NCg0K
QnV0IHdoeSBhcmUgd2Ugc2VsZWN0aW5nIOKAmGJsZXNzaW5n4oCZIGZyb20gdGhlc2UsIGlmIHdl
4oCZdmUgc3BlY2lmaWVkIHRoYXQgYmxlc3NpbmcgPSDigJxyZWFs4oCdPyBJc27igJl0IHRoYXQg
cmVkdW5kYW50Pw0KDQo+IA0KPiBXaXRoIHRoZXNlIGJpbmQgdmFyaWFibGVzOg0KPiANCj4gICAg
InRlc3QtYXJtaGYtYXJtaGYtbGlidmlydCINCj4gDQo+IEFmdGVyOg0KPiANCj4gICAgICBTRUxF
Q1QgKiBGUk9NICgNCj4gICAgICAgIFNFTEVDVCBESVNUSU5DVCBmbGlnaHQsIGJsZXNzaW5nDQo+
ICAgICAgICAgICAgIEZST00gZmxpZ2h0cw0KPiAgICAgICAgICAgICBKT0lOIHJ1bnZhcnMgcjEg
VVNJTkcgKGZsaWdodCkNCj4gDQo+ICAgICAgICAgICAgV0hFUkUgKGJyYW5jaD0neGVuLXVuc3Rh
YmxlJykNCj4gICAgICAgICAgICAgIEFORCAoIChUUlVFIEFORCBmbGlnaHQgPD0gMTUxOTAzKSBB
TkQgKGJsZXNzaW5nPSdyZWFsJykgKQ0KPiAgICAgICAgICAgICAgICAgIEFORCBFWElTVFMgKFNF
TEVDVCAxDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgIEZST00gam9icw0KPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgIFdIRVJFIGpvYnMuZmxpZ2h0ID0gZmxpZ2h0cy5mbGlnaHQNCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIEFORCBqb2JzLmpvYiA9ID8pDQo+IA0KPiAgICAg
ICAgICAgICAgQU5EIHIxLm5hbWUgTElLRSAnYnVpbHRfcmV2aXNpb25fJScNCj4gICAgICAgICAg
ICAgIEFORCByMS5uYW1lID0gPw0KPiAgICAgICAgICAgICAgQU5EIHIxLnZhbD0gPw0KPiANCj4g
ICAgICAgICAgICBPUkRFUiBCWSBmbGlnaHQgREVTQw0KPiAgICAgICAgICAgIExJTUlUIDEwMDAN
Cj4gICAgICApIEFTIHN1Yg0KPiAgICAgIE9SREVSIEJZIGJsZXNzaW5nIEFTQywgZmxpZ2h0IERF
U0MNCg0KU28gdGhpcyBzYXlzOg0KDQpGaW5kIG1lIHRoZSBtb3N0IDEwMDAgcmVjZW50IGZsaWdo
dHMNCldoZXJlOg0KICBicmFuY2ggaXMg4oCceGVuLXVuc3RhYmxl4oCdDQogIGZsaWdodCA8PSAx
NTkwMw0KICBibGVzc2luZyBpcyDigJxyZWFs4oCdDQogIE9uZSBvZiBpdHMgam9icyBpcyAkam9i
DQogIEl0IGhhcyBhIHJ1bnZhciBtYXRjaGluZyBnaXZlbiAkbmFtZSBhbmQgJHZhbA0KDQpBbmQg
b2YgY291cnNlIGl0IHVzZXMgdGhlIOKAmW5hbWUgTElLRSDigJhidWlsdF9yZXZpc2lvbl8l4oCZ
IGluZGV4Lg0KDQpTdGlsbCBkb27igJl0IHVuZGVyc3RhbmQgdGhlIOKAmVRSVUUgQU5E4oCZIGFu
ZCDigJhBUyBzdWLigJkgYml0cywgYnV0IGl0IGxvb2tzIHRvIG1lIGxpa2UgaXTigJlzIHN1YnN0
YW50aWFsbHkgdGhlIHNhbWUgcXVlcnksIHdpdGggYWRkaXRpb25hbCAkbmFtZSA9ICR2YWwgcnVu
dmFyIHJlc3RyaWN0aW9uLg0KDQpBbmQgZ2l2ZW4gdGhhdCB5b3Ugc2F5LCAiVGhpcyBjb25kaXRp
b24gaXMgc3RyaWN0bHkgYnJvYWRlciB0aGFuIHRoYXQgaW1wbGVtZW50ZWQgaW5zaWRlIHRoZSBm
bGlnaHQgc2VhcmNoIGxvb3DigJ0sIEkgdGFrZSBpdCB0aGF0IGl04oCZcyBhZ2FpbiBtYWlubHkg
dG8gdGFrZSBhZHZhbnRhZ2Ugb2YgdGhlIG5ldyBpbmRleD8NCg0KIC1HZW9yZ2U=


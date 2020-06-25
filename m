Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0FDE209D4A
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2020 13:12:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1joPnQ-0008Vc-Uu; Thu, 25 Jun 2020 11:11:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bThV=AG=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1joPnP-0008VX-4R
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2020 11:11:55 +0000
X-Inumbo-ID: ac7f9350-b6d4-11ea-b7bb-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ac7f9350-b6d4-11ea-b7bb-bc764e2007e4;
 Thu, 25 Jun 2020 11:11:53 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 02LIdh77llNrgX3dSS0DEhchYIxzXcwH9bGbeso60Fy5irI5B4bDYroi+NYsrcyQHFbSS+jhKH
 jAo7CEndviVCKXy4wAQIw9bULCXJO3JIBTiGYED3i9PRoeXVAgAxBjQXNFPrJ7+3S4CGpiGLKF
 mkXSOeZnVKkjOLEeHaMX84ed9WEbjSapLAw/mkui5xIOUaIBux0/GqobcKPMZncZQmp5cXsxxF
 jHCFv/5mjX4lFsX2UrKozDEor1tNiFbva3WAPXFENPeKVLrdX+4neP0GJ5bxqEtsgYcgj8HkE1
 QvQ=
X-SBRS: 2.7
X-MesageID: 21213210
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,279,1589256000"; d="scan'208";a="21213210"
From: George Dunlap <George.Dunlap@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Subject: Re: Proposal: rename xen.git#master (to #trunk, perhaps)
Thread-Topic: Proposal: rename xen.git#master (to #trunk, perhaps)
Thread-Index: AQHWSkJf/KcO8yZ8r0St6dLs7upI+ajoQziAgADJk4A=
Date: Thu, 25 Jun 2020 11:11:49 +0000
Message-ID: <F75D6938-F069-48C0-981D-B3AE730B976E@citrix.com>
References: <24307.31637.214096.240023@mariner.uk.xensource.com>
 <fbe42e04-2c3d-5410-b202-eae3c21e9e87@citrix.com>
In-Reply-To: <fbe42e04-2c3d-5410-b202-eae3c21e9e87@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.80.23.2.2)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <547B57430786C845A83E38BDE1F9DB8E@citrix.com>
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
Cc: Ian Jackson <Ian.Jackson@citrix.com>,
 "committers@xenproject.org" <committers@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gSnVuIDI1LCAyMDIwLCBhdCAxMjoxMCBBTSwgQW5kcmV3IENvb3BlciA8YW5kcmV3
LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiAyNC8wNi8yMDIwIDE3OjEzLCBJ
YW4gSmFja3NvbiB3cm90ZToNCj4+IEkgdGhpbmsgaXQgd291bGQgYmUgYSBnb29kIGlkZWEgdG8g
cmVuYW1lIHRoaXMgYnJhbmNoIG5hbWUuDQoNCltzbmlwXQ0KDQo+IERlc2NyaWJpbmcgc29tZW9u
ZSBhcyBhICJtYXN0ZXIgb2YgdGhlaXIgdHJhZGUvc2tpbGwvb3RoZXIiLCBpcyBhDQo+IHRvdGFs
bHkgZGlmZmVyZW50IGNvbnRleHQsIGFuZCBpdCB3b3VsZCBiZSBleGNlc3NpdmUgdG8gc3VnZ2Vz
dCBjaGFuZ2luZw0KPiB0aGUgbGFuZ3VhZ2UgdXNlZCBpbiB0aGlzIHdheS4gIFNvIHRvbywgaW4g
bXkgb3BpbmlvbiwgaXMgbWFzdGVyIGFzIGluDQo+ICJtYXN0ZXIgY29weSIsIGEgZGlmZmVyZW50
IGNvbnRleHQgYW5kIGNvbm5vdGF0aW9uIHRvIG1hc3RlciBhcyBpbg0KPiBtYXN0ZXIvc2xhdmUu
DQoNCklhbiBhbHJlYWR5IG5vdGVkIHRoYXQgdGhlcmUgd2FzIGEgcXVlc3Rpb24gYWJvdXQgdGhl
IGV0eW1vbG9neSBvZiB0aGUgbmFtZSwgYnV0IGFyZ3VlZCB0aGF0IHdlIHNob3VsZCBjaGFuZ2Ug
dGhlIG5hbWUgYW55d2F5LiAgV2l0aCBteSBjb21taXR0ZXIgaGF0IG9uLCBJIGFncmVlLg0KDQpX
ZSBjb3VsZCBoYXZlIGEgbG9uZyBkaXNjdXNzaW9uIGFib3V0IHRoZSBvcmlnaW4gb2YgdmFyaW91
cyB0ZXJtcywgYW5kIGhvdyB3ZWxsIGVhY2ggb25lIGFwcGxpZXMgdG8gb3VyIG1haW4gZGV2ZWxv
cG1lbnQgYnJhbmNoLiAgKEZvciBpbnN0YW5jZSwgaWYg4oCcbWFzdGVyIC9jb3B54oCdIGlzIHRo
ZSByZWFsIGV0eW1vbG9neSBvZiB0aGUgZ2l0IG1hc3RlciBicmFuY2gsIEkgd291bGQgYXJndWUg
dGhhdCBpdCB3YXMgdXNlZCBpbmFwcHJvcHJpYXRlbHk6IOKAnG1hc3RlciAvIGNvcHnigJ0gaXMg
bW9zdCBhcHByb3ByaWF0ZSBpbiBhIHNpdHVhdGlvbiB3aGVyZSB0aGUgdGhpbmcgYmVpbmcgY29w
aWVkIGlzIG5lYXJseSBwZXJmZWN0IGFuZCBpcyByYXJlbHkgY2hhbmdlZC4gIFRoYXTigJlzIGNl
cnRhaW5seSBub3QgdHJ1ZSBvZiBvdXIgbWFzdGVyIGJyYW5jaC4pDQoNCkJ1dCByZWFkaW5nIHRo
ZSB3ZWF0aGVyLCBJIGhhdmUgdG8gY29uY2x1ZGUgdGhhdCBvdXIgaW5kdXN0cnkgaXMgZ29pbmcg
aW4gdGhpcyBkaXJlY3Rpb24sIHdoZXRoZXIgd2UgbGlrZSBpdCBvciBub3QuICAoU2VlIGZvciBp
bnN0YW5jZSBKb25hdGhhbiBDb3JiZXTigJlzIG9waW5pb24gcGllY2Ugb24gdGhlIHN1YmplY3Qg
WzFdLCBhbmQgdGhlIHN1YnNlcXVlbnQgZGlzY3Vzc2lvbi4pICBBdCB0aGF0IHBvaW50LCB0aGUg
Y29udGludWVkIHVzZSBvZiB0aGUgd29yZCDigJhtYXN0ZXLigJkgaXMgbm8gbG9uZ2VyIG5ldXRy
YWw6IGl0IHdpbGwgYmVjb21lIGEgZGVsaWJlcmF0ZSBjaG9pY2Ugd2hpY2ggd2lsbCBiZWdpbiB0
byBjb21tdW5pY2F0ZSBzb21ldGhpbmcgd2hpY2ggd2UgZG9u4oCZdCB3YW50IHRvIGNvbW11bmlj
YXRlLg0KDQpUaGVyZSBhcmUgdGltZXMgd2hlbiBzdGFuZGluZyBhZ2FpbnN0IHRoZSB0aWRlIGlz
IHRoZSByaWdodCB0aGluZyB0byBkbzsgYnV0IEkgZG9u4oCZdCB0aGluayB0aGlzIGlzIG9uZSBv
ZiB0aGVtLg0KDQpbMV0gaHR0cHM6Ly9sd24ubmV0L0FydGljbGVzLzgyMzIyNC8NCg0KPiBBIG11
Y2ggbW9yZSBtZWFuaW5nZnVsIHVzZSBvZiB0aW1lIHdvdWxkIGJlIHRvIGFkZHJlc3M6DQo+IA0K
PiB4ZW4uZ2l0JCBnaXQgZ3JlcCAtaSAtZSBzbGF2ZSAtZSB3aGl0ZWxpc3QgLWUgYmxhY2tsaXN0
IHwgd2MgLWwNCj4gMTk0DQoNCldlbGwsIGFuIGV2ZW4gKm1vcmUqIG1lYW5pbmdmdWwgdXNlIG9m
IG91ciB0aW1lIG1pZ2h0IGJlIGZvciBlYWNoIG9mIHVzIHRvIGxvb2sgaW50byB0aGUgYmVoYXZp
b3Igb2YgdGhlIHBvbGljZSBmb3JjZXMgb3ZlciB3aGljaCB3ZSBoYXZlIGluZmx1ZW5jZSwgYW5k
IGNvbnNpZGVyIHdoZXRoZXIgd2UgbmVlZCB0byBhZHZvY2F0ZSBmb3IgYW55IHN5c3RlbWF0aWMg
Y2hhbmdlcyBpbiB0aGUgd2F5IHRoZXnigJlyZSBydW4uDQoNCkx1Y2tpbHksIHdlIGRvbuKAmXQg
aGF2ZSB0byBjaG9vc2Ug4oCUIHdlIGNhbiBkbyBhbGwgb2YgdGhlbS4gOi0pDQoNCiAtR2Vvcmdl


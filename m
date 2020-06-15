Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D381F9C78
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2020 18:02:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jkrYs-0003in-J7; Mon, 15 Jun 2020 16:02:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7hlp=74=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jkrYr-0003ig-0T
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2020 16:02:13 +0000
X-Inumbo-ID: 92bcbff2-af21-11ea-8496-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 92bcbff2-af21-11ea-8496-bc764e2007e4;
 Mon, 15 Jun 2020 16:02:12 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 5riCwz4p1wnpEEZqAejU2zm+FaabhOI3cpkXyHaxAdWOdmVDcbFxAw/8jModYlzuhOa0goVPd9
 j0b44UAMwKSrdHNXKwarWWzkQCmdUeRKAcHyQvo6GilGI/p4KDpD3R+QpAf1KcAjNhFhFXqb4w
 SslpsunKoOuP77iBGP2senY14+v8GRx7tqNnZrw5rjlr5PvPD/ii0uVmULycuMXIuj6RtWfgVg
 /esenJNIKNxAMp6R3KG3vdNW63qo57ZlVzJq39os9hN+nbIhUVO2jYztUAjFhQKb1mVtbxIyzY
 gsM=
X-SBRS: 2.7
X-MesageID: 20311901
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,515,1583211600"; d="scan'208";a="20311901"
From: George Dunlap <George.Dunlap@citrix.com>
To: Ian Jackson <Ian.Jackson@citrix.com>
Subject: Re: [PATCH for-4.14] golang/xenlight: sort cases in switch statement
Thread-Topic: [PATCH for-4.14] golang/xenlight: sort cases in switch statement
Thread-Index: AQHWQys0M2jXFQanD0CJHiScvqapGKjZr4CAgAAFQ4A=
Date: Mon, 15 Jun 2020 16:02:05 +0000
Message-ID: <538130CB-BCAF-43A7-83E0-A1233A670D69@citrix.com>
References: <42ba06bc716cf91d25c8bb1d988cb1310219b8fe.1592234663.git.rosbrookn@ainfosec.com>
 <24295.38675.682397.522303@mariner.uk.xensource.com>
In-Reply-To: <24295.38675.682397.522303@mariner.uk.xensource.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.80.23.2.2)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <C3D12084D8B0CE47A442A44A76DBEA67@citrix.com>
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
Cc: Wei Liu <wl@xen.org>, "paul@xen.org" <paul@xen.org>, Andrew
 Cooper <Andrew.Cooper3@citrix.com>, Nick Rosbrook <rosbrookn@ainfosec.com>,
 Nick Rosbrook <rosbrookn@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gSnVuIDE1LCAyMDIwLCBhdCA0OjQzIFBNLCBJYW4gSmFja3NvbiA8aWFuLmphY2tz
b25AY2l0cml4LmNvbT4gd3JvdGU6DQo+IA0KPiBOaWNrIFJvc2Jyb29rIHdyaXRlcyAoIltQQVRD
SCBmb3ItNC4xNF0gZ29sYW5nL3hlbmxpZ2h0OiBzb3J0IGNhc2VzIGluIHN3aXRjaCBzdGF0ZW1l
bnQiKToNCj4+IFRoZSB4ZW5saWdodF9nb2xhbmdfdW5pb25fZnJvbV9DIGZ1bmN0aW9uIGl0ZXJh
dGVzIG92ZXIgYSBkaWN0IHRvDQo+PiBjb25zdHJ1Y3QgYSBzd2l0Y2ggc3RhdGVtZW50IHRoYXQg
bWFyc2hhbHMgYSBDIGtleWVkIHVuaW9uIGludG8gYSBHbw0KPj4gdHlwZS4gQmVjYXVzZSBweXRo
b24gZG9lcyBub3QgZ3VhcmFudGVlIGRpY3Qgb3JkZXJpbmcgYWNyb3NzIGFsbA0KPj4gdmVyc2lv
bnMsIHRoaXMgY2FuIHJlc3VsdCBpbiB0aGUgc3dpdGNoIHN0YXRlbWVudCBiZWluZyBnZW5lcmF0
ZWQgaW4gYQ0KPj4gZGlmZmVyZW50IG9yZGVyIGRlcGVuZGluZyBvbiB0aGUgdmVyc2lvbiBvZiBw
eXRob24gdXNlZC4gRm9yIGV4YW1wbGUsDQo+PiBydW5uaW5nIGdlbmdvdHlwZXMucHkgd2l0aCBw
eXRob24yLjcgYW5kIHB5dGhvbjMuNiB3aWxsIHlpZWxkIGRpZmZlcmVudA0KPj4gb3JkZXJpbmdz
Lg0KPj4gDQo+PiBJdGVyYXRlIG92ZXIgc29ydGVkKGNhc2VzLml0ZW1zKCkpIHJhdGhlciB0aGFu
IGNhc2VzLml0ZW1zKCkgdG8gZml4DQo+PiB0aGlzLg0KPj4gDQo+PiBUaGlzIHBhdGNoIGNoYW5n
ZXMgdGhlIG9yZGVyaW5nIGZyb20gd2hhdCB3YXMgcHJldmlvdXNseSBjaGVja2VkLWluLCBidXQN
Cj4+IHJ1bm5pbmcgZ2VuZ290eXBlcy5weSB3aXRoIGRpZmZlcmVudCB2ZXJzaW9ucyBvZiBweXRo
b24gd2lsbCBub3cgeWllbGQNCj4+IHRoZSBzYW1lIHJlc3VsdC4NCj4+IA0KPj4gU2lnbmVkLW9m
Zi1ieTogTmljayBSb3Nicm9vayA8cm9zYnJvb2tuQGFpbmZvc2VjLmNvbT4NCj4+IC0tLQ0KPj4g
QW5kcmV3IHJlcG9ydGVkIHRoaXMgaW4gWzFdLCBzbyBJIGludGVuZCB0aGlzIGFzIGEgYnVpbGQg
Zml4IGZvciA0LjE0Lg0KPj4gDQo+PiBbMV0gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9h
cmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDIwLTA2L21zZzAwODgxLmh0bWwNCj4+IC0tLQ0KPj4g
dG9vbHMvZ29sYW5nL3hlbmxpZ2h0L2dlbmdvdHlwZXMucHkgIHwgIDIgKy0NCj4+IHRvb2xzL2dv
bGFuZy94ZW5saWdodC9oZWxwZXJzLmdlbi5nbyB8IDMyICsrKysrKysrKysrKysrLS0tLS0tLS0t
LS0tLS0NCj4+IDIgZmlsZXMgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgMTcgZGVsZXRpb25z
KC0pDQo+PiANCj4+IGRpZmYgLS1naXQgYS90b29scy9nb2xhbmcveGVubGlnaHQvZ2VuZ290eXBl
cy5weSBiL3Rvb2xzL2dvbGFuZy94ZW5saWdodC9nZW5nb3R5cGVzLnB5DQo+PiBpbmRleCBlY2Nh
NTk3NDVmLi41NTdmZWNkMDdiIDEwMDY0NA0KPj4gLS0tIGEvdG9vbHMvZ29sYW5nL3hlbmxpZ2h0
L2dlbmdvdHlwZXMucHkNCj4+ICsrKyBiL3Rvb2xzL2dvbGFuZy94ZW5saWdodC9nZW5nb3R5cGVz
LnB5DQo+PiBAQCAtMzc5LDcgKzM3OSw3IEBAIGRlZiB4ZW5saWdodF9nb2xhbmdfdW5pb25fZnJv
bV9DKHR5ID0gTm9uZSwgdW5pb25fbmFtZSA9ICcnLCBzdHJ1Y3RfbmFtZSA9ICcnKToNCj4+IA0K
Pj4gICAgICMgQ3JlYXRlIHN3aXRjaCBzdGF0ZW1lbnQgdG8gZGV0ZXJtaW5lIHdoaWNoICd1bmlv
biBlbGVtZW50Jw0KPj4gICAgICMgdG8gcG9wdWxhdGUgaW4gdGhlIEdvIHN0cnVjdC4NCj4+IC0g
ICAgZm9yIGNhc2VfbmFtZSwgY2FzZV90dXBsZSBpbiBjYXNlcy5pdGVtcygpOg0KPj4gKyAgICBm
b3IgY2FzZV9uYW1lLCBjYXNlX3R1cGxlIGluIHNvcnRlZChjYXNlcy5pdGVtcygpKToNCj4+ICAg
ICAgICAgKGNhc2VfdmFsLCBjYXNlX3R5cGUpID0gY2FzZV90dXBsZQ0KPiANCj4gVGhpcyBwYXJ0
DQo+IA0KPiBBY2tlZC1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+
DQo+IA0KPiBCdXQgSSBkb24ndCB0aGluayBJIGhhdmUgdGhlIHJpZ2h0IGdvbGFuZyB0b29scyB0
byB2ZXJpZnkgdGhlDQo+IGF1dG9nZW5lcmF0ZWQgY29kZS4gIEdlb3JnZSwgY2FuIHlvdSBjaGVj
ayB0aGF0IHRoaXMgcGF0Y2ggaXMgcmlnaHQsDQo+IGFuZC9vciBkbyB0aGUgY29tbWl0IGFuZCBy
ZXJ1biB0aGUgZ2VuZXJhdGlvbiA/DQoNCkkgY2FuIGNvbmZpcm0gdGhhdCAxKSByZXJ1bm5pbmcg
dGhpcyBkb2VzbuKAmXQgY2F1c2UgYW55IGNoYW5nZXMgMikgdGhlIHJlc3VsdGluZyBjb2RlIGNv
bXBpbGVzLg0KDQpBY2tlZC1ieTogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXgu
Y29tPg0KDQpTaW5jZSBJ4oCZdmUgZ290IGl0IGluIG15IHRyZWUgSeKAmWxsIHB1c2ggaXQu


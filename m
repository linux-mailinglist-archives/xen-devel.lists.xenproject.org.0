Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A84D14C99F
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jun 2019 10:42:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdsbL-0005gL-1d; Thu, 20 Jun 2019 08:39:23 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ccEu=UT=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hdsbJ-0005gG-AI
 for xen-devel@lists.xenproject.org; Thu, 20 Jun 2019 08:39:21 +0000
X-Inumbo-ID: e4e07cfa-9336-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e4e07cfa-9336-11e9-8980-bc764e045a96;
 Thu, 20 Jun 2019 08:39:19 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: xdmDQSuOrmBU5z8iuMZLPjLF9xVWI+qJzPXHxMxSmuNyD+oXy7pPVIpRy2Z+rHCvvaEQR0J/50
 TsmDdgaFFtsm9rDSemGvJohnmdEbj7EurtwpANZkwT2lMR+1LZl80I0r9vIqhoWC8239zRUVll
 6QQAXG8pZ/y8k01wEZjAlLX5zBSnSt2x2vRHDv78Xd631JjvCNhSL6EQuIbwEl6aTNBfOQo43k
 IOjH+M6CG+5UNPQTstQT6BABppXZgwp8h377ehJqSBq08ZL9fKNhzkjQbB2hOmzD1n2S1TxeYI
 kMM=
X-SBRS: 2.7
X-MesageID: 1981478
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,396,1557201600"; 
   d="scan'208";a="1981478"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Juergen Gross' <jgross@suse.com>, Christopher Clark
 <christopher.w.clark@gmail.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [RFC 0/9] The Xen Blanket: hypervisor interface for
 PV drivers on nested Xen
Thread-Index: AQHVJv+l8M4CwYvTx0GWkdTuISXd3aajzuSAgABp/kA=
Date: Thu, 20 Jun 2019 08:39:14 +0000
Message-ID: <771ee293403646cfa137693e5406bf67@AMSPEX02CL03.citrite.net>
References: <20190620003053.21993-1-christopher.w.clark@gmail.com>
 <8046a124-9989-66b3-ae42-e9104f9f2ac8@suse.com>
In-Reply-To: <8046a124-9989-66b3-ae42-e9104f9f2ac8@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [RFC 0/9] The Xen Blanket: hypervisor interface for
 PV drivers on nested Xen
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
Cc: Julien
 Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Ankur
 Arora <ankur.a.arora@oracle.com>, Rich Persaud <persaur@gmail.com>,
 Jan Beulich <jbeulich@suse.com>, Ian
 Jackson <Ian.Jackson@citrix.com>, Daniel De
 Graaf <dgdegra@tycho.nsa.gov>, Christopher Clark <christopher.clark@starlab.io>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZl
bC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YgSnVlcmdlbiBHcm9z
cw0KPiBTZW50OiAyMCBKdW5lIDIwMTkgMDU6MTgNCj4gVG86IENocmlzdG9waGVyIENsYXJrIDxj
aHJpc3RvcGhlci53LmNsYXJrQGdtYWlsLmNvbT47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZw0KPiBDYzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsg
V2VpIExpdSA8d2xAeGVuLm9yZz47IEtvbnJhZCBSemVzenV0ZWsgV2lsaw0KPiA8a29ucmFkLndp
bGtAb3JhY2xlLmNvbT47IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAY2l0cml4LmNvbT47
IEFuZHJldyBDb29wZXINCj4gPEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+OyBJYW4gSmFja3Nv
biA8SWFuLkphY2tzb25AY2l0cml4LmNvbT47IFJpY2ggUGVyc2F1ZCA8cGVyc2F1ckBnbWFpbC5j
b20+Ow0KPiBBbmt1ciBBcm9yYSA8YW5rdXIuYS5hcm9yYUBvcmFjbGUuY29tPjsgVGltIChYZW4u
b3JnKSA8dGltQHhlbi5vcmc+OyBKdWxpZW4gR3JhbGwNCj4gPGp1bGllbi5ncmFsbEBhcm0uY29t
PjsgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPjsgRGFuaWVsIERlIEdyYWFmIDxkZ2Rl
Z3JhQHR5Y2hvLm5zYS5nb3Y+Ow0KPiBDaHJpc3RvcGhlciBDbGFyayA8Y2hyaXN0b3BoZXIuY2xh
cmtAc3RhcmxhYi5pbz47IFJvZ2VyIFBhdSBNb25uZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQo+
IFN1YmplY3Q6IFJlOiBbWGVuLWRldmVsXSBbUkZDIDAvOV0gVGhlIFhlbiBCbGFua2V0OiBoeXBl
cnZpc29yIGludGVyZmFjZSBmb3IgUFYgZHJpdmVycyBvbiBuZXN0ZWQgWGVuDQo+IA0KPiBPbiAy
MC4wNi4xOSAwMjozMCwgQ2hyaXN0b3BoZXIgQ2xhcmsgd3JvdGU6DQo+ID4gVGhpcyBSRkMgcGF0
Y2ggc2VyaWVzIGFkZHMgYSBuZXcgaHlwZXJ2aXNvciBpbnRlcmZhY2UgdG8gc3VwcG9ydCBydW5u
aW5nDQo+ID4gYSBzZXQgb2YgUFYgZnJvbnQgZW5kIGRldmljZSBkcml2ZXJzIHdpdGhpbiBkb20w
IG9mIGEgZ3Vlc3QgWGVuIHJ1bm5pbmcNCj4gPiBvbiBYZW4uDQo+ID4NCj4gPiBBIHByYWN0aWNh
bCBkZXBsb3ltZW50IHNjZW5hcmlvIGlzIGEgc3lzdGVtIHJ1bm5pbmcgUFYgZ3Vlc3QgVk1zIHRo
YXQgdXNlDQo+ID4gdW5tb2RpZmllZCBYZW4gUFYgZGV2aWNlIGRyaXZlcnMsIG9uIGEgZ3Vlc3Qg
WGVuIGh5cGVydmlzb3Igd2l0aCBhIGRvbTANCj4gPiB1c2luZyBQViBkcml2ZXJzIGl0c2VsZiwg
YWxsIHdpdGhpbiBhIEhWTSBndWVzdCBvZiBhIGhvc3RpbmcgWGVuDQo+ID4gaHlwZXJ2aXNvciAo
ZWcuIGZyb20gYSBjbG91ZCBwcm92aWRlcikuIE11bHRpcGxlIFBWIGd1ZXN0IFZNcyBjYW4gcmVz
aWRlDQo+ID4gd2l0aGluIGEgc2luZ2xlIGNsb3VkIGluc3RhbmNlOyBndWVzdHMgY2FuIGJlIGxp
dmUtbWlncmF0ZWQgYmV0d2Vlbg0KPiA+IGNsb3VkIGluc3RhbmNlcyB0aGF0IHJ1biBuZXN0ZWQg
WGVuLCBhbmQgdmlydHVhbCBtYWNoaW5lIGludHJvc3BlY3Rpb24NCj4gPiBvZiBndWVzdHMgY2Fu
IGJlIHBlcmZvcm1lZCB3aXRob3V0IHJlcXVpcmluZyBjbG91ZCBwcm92aWRlciBzdXBwb3J0Lg0K
PiA+DQo+ID4gVGhlIG5hbWUgIlRoZSBYZW4gQmxhbmtldCIgd2FzIGdpdmVuIGJ5IHJlc2VhcmNo
ZXJzIGZyb20gSUJNIGFuZCBDb3JuZWxsDQo+ID4gd2hlbiB0aGUgb3JpZ2luYWwgd29yayB3YXMg
cHVibGlzaGVkIGF0IHRoZSBBQ00gRXVyb3N5cyAyMDEyIGNvbmZlcmVuY2UuDQo+ID4gICAgICBo
dHRwOi8vd3d3MS51bmluZS5jaC9ldXJvc3lzMjAxMi9wcm9ncmFtL2NvbmZlcmVuY2UuaHRtbA0K
PiA+ICAgICAgaHR0cHM6Ly9kbC5hY20ub3JnL2NpdGF0aW9uLmNmbT9kb2lkPTIxNjg4MzYuMjE2
ODg0OQ0KPiA+IFRoaXMgcGF0Y2ggc2VyaWVzIGlzIGEgcmVpbXBsZW1lbnRhdGlvbiBvZiB0aGlz
IGFyY2hpdGVjdHVyZSBvbiBtb2Rlcm4gWGVuDQo+ID4gYnkgU3RhciBMYWIuDQo+ID4NCj4gPiBB
IHBhdGNoIHRvIHRoZSBMaW51eCBrZXJuZWwgdG8gYWRkIGRldmljZSBkcml2ZXJzIHVzaW5nIHRo
aXMgYmxhbmtldCBpbnRlcmZhY2UNCj4gPiBpcyBhdDoNCj4gPiAgICAgIGh0dHBzOi8vZ2l0aHVi
LmNvbS9zdGFybGFiLWlvL3hlbmJsYW5rZXQtbGludXgNCj4gPiAoVGhpcyBpcyBhbiBleGFtcGxl
LCBlbmFibGluZyBvcGVyYXRpb24gYW5kIHRlc3Rpbmcgb2YgYSBYZW4gQmxhbmtldCBuZXN0ZWQN
Cj4gPiBzeXN0ZW0uIEZ1cnRoZXIgd29yayB3b3VsZCBiZSBuZWNlc3NhcnkgZm9yIExpbnV4IHVw
c3RyZWFtaW5nLikNCj4gPiBSZWxldmFudCBvdGhlciBjdXJyZW50IExpbnV4IHdvcmsgaXMgb2Nj
dXJyaW5nIGhlcmU6DQo+ID4gICAgICBodHRwczovL2xrbWwub3JnL2xrbWwvMjAxOS80LzgvNjcN
Cj4gPiAgICAgIGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4t
ZGV2ZWwvMjAxOS0wNS9tc2cwMDc0My5odG1sDQo+ID4NCj4gPiB0aGFua3MsDQo+ID4NCj4gPiBD
aHJpc3RvcGhlcg0KPiA+DQo+ID4gQ2hyaXN0b3BoZXIgQ2xhcmsgKDkpOg0KPiA+ICAgIHg4Ni9n
dWVzdDogY29kZSBtb3ZlbWVudCB0byBzZXBhcmF0ZSBYZW4gZGV0ZWN0aW9uIGZyb20gZ3Vlc3QN
Cj4gPiAgICAgIGZ1bmN0aW9ucw0KPiA+ICAgIHg4NjogSW50cm9kdWNlIFhlbiBkZXRlY3Rpb24g
YXMgc2VwYXJhdGUgbG9naWMgZnJvbSBYZW4gR3Vlc3Qgc3VwcG9ydC4NCj4gPiAgICB4ODYvbmVz
dGVkOiBhZGQgbmVzdGVkX3hlbl92ZXJzaW9uIGh5cGVyY2FsbA0KPiA+ICAgIFhTTTogQWRkIGhv
b2sgZm9yIG5lc3RlZCB4ZW4gdmVyc2lvbiBvcDsgcmV2aXNlcyBub24tbmVzdGVkIHZlcnNpb24g
b3ANCj4gPiAgICB4ODYvbmVzdGVkLCB4c206IGFkZCBuZXN0ZWRfbWVtb3J5X29wIGh5cGVyY2Fs
bA0KPiA+ICAgIHg4Ni9uZXN0ZWQsIHhzbTogYWRkIG5lc3RlZF9odm1fb3AgaHlwZXJjYWxsDQo+
ID4gICAgeDg2L25lc3RlZCwgeHNtOiBhZGQgbmVzdGVkX2dyYW50X3RhYmxlX29wIGh5cGVyY2Fs
bA0KPiA+ICAgIHg4Ni9uZXN0ZWQsIHhzbTogYWRkIG5lc3RlZF9ldmVudF9jaGFubmVsX29wIGh5
cGVyY2FsbA0KPiA+ICAgIHg4Ni9uZXN0ZWQsIHhzbTogYWRkIG5lc3RlZF9zY2hlZG9wX3NodXRk
b3duIGh5cGVyY2FsbA0KPiA+DQo+ID4gICB0b29scy9mbGFzay9wb2xpY3kvbW9kdWxlcy9kb20w
LnRlICAgICAgICAgICB8ICAxNCArLQ0KPiA+ICAgdG9vbHMvZmxhc2svcG9saWN5L21vZHVsZXMv
Z3Vlc3RfZmVhdHVyZXMudGUgfCAgIDUgKy0NCj4gPiAgIHRvb2xzL2ZsYXNrL3BvbGljeS9tb2R1
bGVzL3hlbi50ZSAgICAgICAgICAgIHwgICAzICsNCj4gPiAgIHRvb2xzL2ZsYXNrL3BvbGljeS9w
b2xpY3kvaW5pdGlhbF9zaWRzICAgICAgIHwgICAzICsNCj4gPiAgIHhlbi9hcmNoL3g4Ni9LY29u
ZmlnICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDMzICstDQo+ID4gICB4ZW4vYXJjaC94ODYv
TWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMiArLQ0KPiA+ICAgeGVuL2FyY2gv
eDg2L2FwaWMuYyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDQgKy0NCj4gPiAgIHhlbi9h
cmNoL3g4Ni9ndWVzdC9NYWtlZmlsZSAgICAgICAgICAgICAgICAgIHwgICA0ICsNCj4gPiAgIHhl
bi9hcmNoL3g4Ni9ndWVzdC9oeXBlcmNhbGxfcGFnZS5TICAgICAgICAgIHwgICA2ICsNCj4gPiAg
IHhlbi9hcmNoL3g4Ni9ndWVzdC94ZW4tZ3Vlc3QuYyAgICAgICAgICAgICAgIHwgMzExICsrKysr
KysrKysrKysrKysNCj4gPiAgIHhlbi9hcmNoL3g4Ni9ndWVzdC94ZW4tbmVzdGVkLmMgICAgICAg
ICAgICAgIHwgMzUwICsrKysrKysrKysrKysrKysrKysNCj4gPiAgIHhlbi9hcmNoL3g4Ni9ndWVz
dC94ZW4uYyAgICAgICAgICAgICAgICAgICAgIHwgMjY0ICstLS0tLS0tLS0tLS0tDQo+ID4gICB4
ZW4vYXJjaC94ODYvaHlwZXJjYWxsLmMgICAgICAgICAgICAgICAgICAgICB8ICAgOCArDQo+ID4g
ICB4ZW4vYXJjaC94ODYvcHYvaHlwZXJjYWxsLmMgICAgICAgICAgICAgICAgICB8ICAgOCArDQo+
ID4gICB4ZW4vYXJjaC94ODYvc2V0dXAuYyAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMyAr
DQo+ID4gICB4ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5cGVyY2FsbC5oICAgICAgICB8ICAg
NyArLQ0KPiA+ICAgeGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC94ZW4uaCAgICAgICAgICAgICAg
fCAgMzYgKy0NCj4gPiAgIHhlbi9pbmNsdWRlL3B1YmxpYy94ZW4uaCAgICAgICAgICAgICAgICAg
ICAgIHwgICA2ICsNCj4gPiAgIHhlbi9pbmNsdWRlL3hlbi9oeXBlcmNhbGwuaCAgICAgICAgICAg
ICAgICAgIHwgIDMzICsrDQo+ID4gICB4ZW4vaW5jbHVkZS94c20vZHVtbXkuaCAgICAgICAgICAg
ICAgICAgICAgICB8ICA0OCArKy0NCj4gPiAgIHhlbi9pbmNsdWRlL3hzbS94c20uaCAgICAgICAg
ICAgICAgICAgICAgICAgIHwgIDQ5ICsrKw0KPiA+ICAgeGVuL3hzbS9kdW1teS5jICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAgIDggKw0KPiA+ICAgeGVuL3hzbS9mbGFzay9ob29rcy5j
ICAgICAgICAgICAgICAgICAgICAgICAgfCAxMzMgKysrKysrLQ0KPiA+ICAgeGVuL3hzbS9mbGFz
ay9wb2xpY3kvYWNjZXNzX3ZlY3RvcnMgICAgICAgICAgfCAgMjYgKysNCj4gPiAgIHhlbi94c20v
Zmxhc2svcG9saWN5L2luaXRpYWxfc2lkcyAgICAgICAgICAgIHwgICAxICsNCj4gPiAgIHhlbi94
c20vZmxhc2svcG9saWN5L3NlY3VyaXR5X2NsYXNzZXMgICAgICAgIHwgICAxICsNCj4gPiAgIDI2
IGZpbGVzIGNoYW5nZWQsIDEwODYgaW5zZXJ0aW9ucygrKSwgMjgwIGRlbGV0aW9ucygtKQ0KPiA+
ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IHhlbi9hcmNoL3g4Ni9ndWVzdC94ZW4tZ3Vlc3QuYw0KPiA+
ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IHhlbi9hcmNoL3g4Ni9ndWVzdC94ZW4tbmVzdGVkLmMNCj4g
Pg0KPiANCj4gSSB0aGluayB3ZSBzaG91bGQgZGlzY3VzcyB0aGF0IHRvcGljIGF0IHRoZSBYZW4g
ZGV2ZWxvcGVyIHN1bW1pdCBpbg0KPiBDaGljYWdvLiBTdWRkZW5seSB0aGVyZSBzZWVtcyB0byBi
ZSBhIHJ1c2ggaW4gbmVzdGVkIFhlbiBkZXZlbG9wbWVudA0KPiBhbmQgcmVsYXRlZCBhcmVhcywg
c28gc3luY2luZyB0aGUgZWZmb3J0cyBzZWVtcyB0byBiZSBhIGdvb2QgaWRlYS4NCj4gDQoNCisx
IGZyb20gbWUgb24gdGhhdC4uLg0KDQogIFBhdWwNCg0KPiANCj4gSnVlcmdlbg0KPiANCj4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gWGVuLWRldmVs
IG1haWxpbmcgbGlzdA0KPiBYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

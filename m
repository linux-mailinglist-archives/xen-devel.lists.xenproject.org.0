Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2523CC0B
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2019 14:47:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hag9j-0007di-Mr; Tue, 11 Jun 2019 12:45:39 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zcwS=UK=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hag9h-0007dc-SN
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2019 12:45:37 +0000
X-Inumbo-ID: cee80c4b-8c46-11e9-8980-bc764e045a96
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id cee80c4b-8c46-11e9-8980-bc764e045a96;
 Tue, 11 Jun 2019 12:45:36 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 0wFijMqMI7U3boXlMAa7zMEvLsDd6oUuomm6vlen5BFciKSFEnLl5sxxTKU86pRDixaXt14F/h
 l2tmKVMpkR7rm4l9gpqaHJmYi2surhXUa3dafhslzg/TCC469PGH0bdexhlwetxTaYqlH6PPPZ
 NKLK7YLCRpRO95weO77E5I1UKrUA781Kh94Yzhu+PsPJYnIqvtfsrgoFwvh+TTnDzDVUlsgRV1
 +QamGdyVLhcld0SQlCE5z6OYaUyjDamLeC7zc5tb3RHfc6UR2wfcd/Pl/uFSjELlp5w6KnX1la
 F84=
X-SBRS: 2.7
X-MesageID: 1580133
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,579,1557201600"; 
   d="scan'208";a="1580133"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Alexandru Stefan ISAILA' <aisaila@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v5] x86/emulate: Send vm_event from emulate
Thread-Index: AQHVGsuhtcaVOzv43UiBDvbMIKzJ0qaWbvig
Date: Tue, 11 Jun 2019 12:45:30 +0000
Message-ID: <df87ce2f7ffb471fb5b83f1b361083ee@AMSPEX02CL03.citrite.net>
References: <20190604114943.4840-1-aisaila@bitdefender.com>
In-Reply-To: <20190604114943.4840-1-aisaila@bitdefender.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v5] x86/emulate: Send vm_event from emulate
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 "tamas@tklengyel.com" <tamas@tklengyel.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>, "wl@xen.org" <wl@xen.org>,
 "jun.nakajima@intel.com" <jun.nakajima@intel.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 "rcojocaru@bitdefender.com" <rcojocaru@bitdefender.com>,
 George Dunlap <George.Dunlap@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 "suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
 "brian.woods@amd.com" <brian.woods@amd.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbGV4YW5kcnUgU3RlZmFuIElT
QUlMQSBbbWFpbHRvOmFpc2FpbGFAYml0ZGVmZW5kZXIuY29tXQ0KPiBTZW50OiAwNCBKdW5lIDIw
MTkgMTI6NTANCj4gVG86IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBDYzogUGF1
bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT47IGpiZXVsaWNoQHN1c2UuY29tOyBB
bmRyZXcgQ29vcGVyDQo+IDxBbmRyZXcuQ29vcGVyM0BjaXRyaXguY29tPjsgd2xAeGVuLm9yZzsg
Um9nZXIgUGF1IE1vbm5lIDxyb2dlci5wYXVAY2l0cml4LmNvbT47DQo+IGJvcmlzLm9zdHJvdnNr
eUBvcmFjbGUuY29tOyBzdXJhdmVlLnN1dGhpa3VscGFuaXRAYW1kLmNvbTsgYnJpYW4ud29vZHNA
YW1kLmNvbTsNCj4gcmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbTsgdGFtYXNAdGtsZW5neWVsLmNv
bTsganVuLm5ha2FqaW1hQGludGVsLmNvbTsgS2V2aW4gVGlhbg0KPiA8a2V2aW4udGlhbkBpbnRl
bC5jb20+OyBHZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVubGFwQGNpdHJpeC5jb20+OyBUaW0gKFhl
bi5vcmcpIDx0aW1AeGVuLm9yZz47DQo+IEFsZXhhbmRydSBTdGVmYW4gSVNBSUxBIDxhaXNhaWxh
QGJpdGRlZmVuZGVyLmNvbT4NCj4gU3ViamVjdDogW1BBVENIIHY1XSB4ODYvZW11bGF0ZTogU2Vu
ZCB2bV9ldmVudCBmcm9tIGVtdWxhdGUNCj4gDQo+IFRoaXMgcGF0Y2ggYWltcyB0byBoYXZlIG1l
bSBhY2Nlc3Mgdm0gZXZlbnRzIHNlbnQgZnJvbSB0aGUgZW11bGF0b3IuDQo+IFRoaXMgaXMgdXNl
ZnVsIHdoZXJlIHdlIHdhbnQgdG8gb25seSBlbXVsYXRlIGEgcGFnZSB3YWxrIHdpdGhvdXQNCj4g
Y2hlY2tpbmcgdGhlIEVQVCwgYnV0IHdlIHN0aWxsIHdhbnQgdG8gY2hlY2sgdGhlIEVQVCB3aGVu
IGVtdWxhdGluZw0KPiB0aGUgaW5zdHJ1Y3Rpb24gdGhhdCBjYXVzZWQgdGhlIHBhZ2Ugd2Fsay4g
SW4gdGhpcyBjYXNlLCB0aGUgb3JpZ2luYWwNCj4gRVBUIGZhdWx0IGlzIGNhdXNlZCBieSB0aGUg
d2FsayB0cnlpbmcgdG8gc2V0IHRoZSBhY2Nlc3NlZCBvciBkaXJ0eQ0KPiBiaXRzLCBidXQgZXhl
Y3V0aW5nIHRoZSBpbnN0cnVjdGlvbiBpdHNlbGYgbWlnaHQgYWxzbyBjYXVzZSBhbiBFUFQNCj4g
ZmF1bHQgaWYgcGVybWl0dGVkIHRvIHJ1biwgYW5kIHRoaXMgc2Vjb25kIGZhdWx0IHNob3VsZCBu
b3QgYmUgbG9zdC4NCj4gDQo+IFdlIHVzZSBodm1lbXVsX21hcF9saW5lYXJfYWRkcigpIHRvIGlu
dGVyY2VwdCByL3cgYWNjZXNzIGFuZA0KPiBfX2h2bV9jb3B5KCkgdG8gaW50ZXJjZXB0IGV4ZWMg
YWNjZXNzLg0KPiANCj4gRmlyc3Qgd2UgdHJ5IHRvIHNlbmQgYSB2bSBldmVudCBhbmQgaWYgdGhl
IGV2ZW50IGlzIHNlbnQgdGhlbiBlbXVsYXRpb24NCj4gcmV0dXJucyBYODZFTVVMX1JFVFJZIGlu
IG9yZGVyIHRvIHN0b3AgZW11bGF0aW9uIG9uIGluc3RydWN0aW9ucyB0aGF0DQo+IHVzZSBhY2Nl
c3MgcHJvdGVjdGVkIHBhZ2VzLiBJZiB0aGUgZXZlbnQgaXMgbm90IHNlbnQgdGhlbiB0aGUNCj4g
ZW11bGF0aW9uIGdvZXMgb24gYXMgZXhwZWN0ZWQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBbGV4
YW5kcnUgSXNhaWxhIDxhaXNhaWxhQGJpdGRlZmVuZGVyLmNvbT4NCg0KRW11bGF0aW9uIHBhcnRz
Li4uDQoNClJldmlld2VkLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29t
Pg0KDQouLi53aXRoIG9uZSBuaXQsIGlubGluZSBiZWxvdy4uLg0KDQo+IA0KPiAtLS0NCj4gQ2hh
bmdlcyBzaW5jZSBWNDoNCj4gCS0gTW92ZSB0aGUgZXhlYyBpbnRlcmNlcHRpb24gdG8gX19odm1f
Y29weSgpDQo+IAktIFJlbW92ZSB0aGUgcGFnZS13YWxrIGluIGh2bV9lbXVsYXRlX3NlbmRfdm1f
ZXZlbnQoKSBhbmQgZ2V0DQo+IHRoZSBuZWVkZWQgYWRkcmVzcyBmcm9tIHRoZSBleGlzdGluZyBw
YWdlIHdhbGsNCj4gCS0gQWRkIHNlbmRfZXZlbnQgcGFyYW0gdG8gX19odm1fY29weSgpIGFuZA0K
PiBodm1fY29weV9mcm9tX2d1ZXN0X2xpbmVhcigpDQo+IAktIERyb3AgWDg2RU1VTF9BQ0NFU1Nf
RVhDRVBUSU9OIGFuZCB1c2UgWDg2RU1VTF9SRVRSWSBpbnN0ZWFkLg0KPiAtLS0NCj4gIHhlbi9h
cmNoL3g4Ni9odm0vZW11bGF0ZS5jICAgICAgICB8IDcxICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysrLS0NCj4gIHhlbi9hcmNoL3g4Ni9odm0vaHZtLmMgICAgICAgICAgICB8IDI3ICsrKysr
KystLS0tLQ0KPiAgeGVuL2FyY2gveDg2L2h2bS9zdm0vc3ZtLmMgICAgICAgIHwgIDIgKy0NCj4g
IHhlbi9hcmNoL3g4Ni9odm0vdm1fZXZlbnQuYyAgICAgICB8ICAyICstDQo+ICB4ZW4vYXJjaC94
ODYvaHZtL3ZteC92dm14LmMgICAgICAgfCAgMiArLQ0KPiAgeGVuL2FyY2gveDg2L21tL21lbV9h
Y2Nlc3MuYyAgICAgIHwgIDMgKy0NCj4gIHhlbi9hcmNoL3g4Ni9tbS9zaGFkb3cvY29tbW9uLmMg
ICB8ICA0ICstDQo+ICB4ZW4vYXJjaC94ODYvbW0vc2hhZG93L2h2bS5jICAgICAgfCAgMiArLQ0K
PiAgeGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vZW11bGF0ZS5oIHwgIDkgKysrLQ0KPiAgeGVuL2lu
Y2x1ZGUvYXNtLXg4Ni9odm0vc3VwcG9ydC5oIHwgIDIgKy0NCj4gIDEwIGZpbGVzIGNoYW5nZWQs
IDEwMSBpbnNlcnRpb25zKCspLCAyMyBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS94
ZW4vYXJjaC94ODYvaHZtL2VtdWxhdGUuYyBiL3hlbi9hcmNoL3g4Ni9odm0vZW11bGF0ZS5jDQo+
IGluZGV4IDg2NTljODk4NjIuLjliMmQ4YzIwMTQgMTAwNjQ0DQo+IC0tLSBhL3hlbi9hcmNoL3g4
Ni9odm0vZW11bGF0ZS5jDQo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vZW11bGF0ZS5jDQo+IEBA
IC0xMiw5ICsxMiwxMSBAQA0KPiAgI2luY2x1ZGUgPHhlbi9pbml0Lmg+DQo+ICAjaW5jbHVkZSA8
eGVuL2xpYi5oPg0KPiAgI2luY2x1ZGUgPHhlbi9zY2hlZC5oPg0KPiArI2luY2x1ZGUgPHhlbi9t
b25pdG9yLmg+DQo+ICAjaW5jbHVkZSA8eGVuL3BhZ2luZy5oPg0KPiAgI2luY2x1ZGUgPHhlbi90
cmFjZS5oPg0KPiAgI2luY2x1ZGUgPHhlbi92bV9ldmVudC5oPg0KPiArI2luY2x1ZGUgPGFzbS9h
bHRwMm0uaD4NCj4gICNpbmNsdWRlIDxhc20vZXZlbnQuaD4NCj4gICNpbmNsdWRlIDxhc20vaTM4
Ny5oPg0KPiAgI2luY2x1ZGUgPGFzbS94c3RhdGUuaD4NCj4gQEAgLTUzMCw2ICs1MzIsNTcgQEAg
c3RhdGljIGludCBodm1lbXVsX2RvX21taW9fYWRkcihwYWRkcl90IG1taW9fZ3BhLA0KPiAgICAg
IHJldHVybiBodm1lbXVsX2RvX2lvX2FkZHIoMSwgbW1pb19ncGEsIHJlcHMsIHNpemUsIGRpciwg
ZGYsIHJhbV9ncGEpOw0KPiAgfQ0KPiANCj4gK2Jvb2wgaHZtX2VtdWxhdGVfc2VuZF92bV9ldmVu
dCh1bnNpZ25lZCBsb25nIGdsYSwgZ2ZuX3QgZ2ZuLA0KPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHVpbnQzMl90IHBmZWMsIGJvb2wgc2VuZF9ldmVudCkNCj4gK3sNCj4gKyAgICB4
ZW5tZW1fYWNjZXNzX3QgYWNjZXNzOw0KPiArICAgIHZtX2V2ZW50X3JlcXVlc3RfdCByZXEgPSB7
fTsNCj4gKyAgICBwYWRkcl90IGdwYSA9ICgoZ2ZuX3goZ2ZuKSA8PCBQQUdFX1NISUZUKSB8IChn
bGEgJiB+UEFHRV9NQVNLKSk7DQo+ICsNCj4gKyAgICBpZiAoICFzZW5kX2V2ZW50IHx8ICFwZmVj
ICkNCj4gKyAgICAgICAgcmV0dXJuIGZhbHNlOw0KPiArDQo+ICsgICAgaWYgKCBwMm1fZ2V0X21l
bV9hY2Nlc3MoY3VycmVudC0+ZG9tYWluLCBnZm4sICZhY2Nlc3MsDQo+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgYWx0cDJtX3ZjcHVfaWR4KGN1cnJlbnQpKSAhPSAwICkNCj4gKyAgICAg
ICAgcmV0dXJuIGZhbHNlOw0KPiArDQo+ICsgICAgc3dpdGNoICggYWNjZXNzICkgew0KPiArICAg
IGNhc2UgWEVOTUVNX2FjY2Vzc194Og0KPiArICAgIGNhc2UgWEVOTUVNX2FjY2Vzc19yeDoNCj4g
KyAgICAgICAgaWYgKCBwZmVjICYgUEZFQ193cml0ZV9hY2Nlc3MgKQ0KPiArICAgICAgICAgICAg
cmVxLnUubWVtX2FjY2Vzcy5mbGFncyA9IE1FTV9BQ0NFU1NfUiB8IE1FTV9BQ0NFU1NfVzsNCj4g
KyAgICAgICAgYnJlYWs7DQo+ICsNCj4gKyAgICBjYXNlIFhFTk1FTV9hY2Nlc3NfdzoNCj4gKyAg
ICBjYXNlIFhFTk1FTV9hY2Nlc3Nfcnc6DQo+ICsgICAgICAgIGlmICggcGZlYyAmIFBGRUNfaW5z
bl9mZXRjaCApDQo+ICsgICAgICAgICAgICByZXEudS5tZW1fYWNjZXNzLmZsYWdzID0gTUVNX0FD
Q0VTU19YOw0KPiArICAgICAgICBicmVhazsNCj4gKw0KPiArICAgIGNhc2UgWEVOTUVNX2FjY2Vz
c19yOg0KPiArICAgIGNhc2UgWEVOTUVNX2FjY2Vzc19uOg0KPiArICAgICAgICBpZiAoIHBmZWMg
JiBQRkVDX3dyaXRlX2FjY2VzcyApDQo+ICsgICAgICAgICAgICByZXEudS5tZW1fYWNjZXNzLmZs
YWdzIHw9IE1FTV9BQ0NFU1NfUiB8IE1FTV9BQ0NFU1NfVzsNCj4gKyAgICAgICAgaWYgKCBwZmVj
ICYgUEZFQ19pbnNuX2ZldGNoICkNCj4gKyAgICAgICAgICAgIHJlcS51Lm1lbV9hY2Nlc3MuZmxh
Z3MgfD0gTUVNX0FDQ0VTU19YOw0KPiArICAgICAgICBicmVhazsNCj4gKw0KPiArICAgIGRlZmF1
bHQ6DQo+ICsgICAgICAgIHJldHVybiBmYWxzZTsNCj4gKyAgICB9DQo+ICsNCj4gKyAgICBpZiAo
ICFyZXEudS5tZW1fYWNjZXNzLmZsYWdzICkNCj4gKyAgICAgICAgcmV0dXJuIGZhbHNlOyAvKiBu
byB2aW9sYXRpb24gKi8NCj4gKw0KPiArICAgIHJlcS5yZWFzb24gPSBWTV9FVkVOVF9SRUFTT05f
TUVNX0FDQ0VTUzsNCj4gKyAgICByZXEudS5tZW1fYWNjZXNzLmdmbiA9IGdmbl94KGdmbik7DQo+
ICsgICAgcmVxLnUubWVtX2FjY2Vzcy5mbGFncyB8PSBNRU1fQUNDRVNTX0ZBVUxUX1dJVEhfR0xB
IHwgTUVNX0FDQ0VTU19HTEFfVkFMSUQ7DQo+ICsgICAgcmVxLnUubWVtX2FjY2Vzcy5nbGEgPSBn
bGE7DQo+ICsgICAgcmVxLnUubWVtX2FjY2Vzcy5vZmZzZXQgPSBncGEgJiAoKDEgPDwgUEFHRV9T
SElGVCkgLSAxKTsNCg0KJiB+UEFHRV9NQVNLPw0KDQo+ICsNCj4gKyAgICByZXR1cm4gbW9uaXRv
cl90cmFwcyhjdXJyZW50LCB0cnVlLCAmcmVxKSA+PSAwOw0KPiArfQ0KPiArDQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

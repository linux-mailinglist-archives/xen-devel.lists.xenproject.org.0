Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B383F387A6
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jun 2019 12:06:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hZBhx-0007MZ-P5; Fri, 07 Jun 2019 10:02:49 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MI8S=UG=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hZBhx-0007MU-3r
 for xen-devel@lists.xenproject.org; Fri, 07 Jun 2019 10:02:49 +0000
X-Inumbo-ID: 666eeadc-890b-11e9-8980-bc764e045a96
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 666eeadc-890b-11e9-8980-bc764e045a96;
 Fri, 07 Jun 2019 10:02:47 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=SoftFail smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: SoftFail (esa4.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com is inclined to not designate
 162.221.158.21 as permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 5CuIKrBIjlqf2kko9nnbgKYJW1kY7u1rjgUQph5Gx9OgD/Mpxi8tXARlpkP+jljNuE/9f9h3um
 7fIMmwEJlzlJBhuqyAB8h1yYbVAeU1TfxDvXT+1IGcVAbCfEZZqNs35RK8JfMHrgcNDt3TCaii
 6rLiwxNSBtrp2V1urn41hrKI092+Wpx4UtczFiMwCi2kmM9Rl9RczxJIYuGFG/F2Apmcg/kJwN
 ZA3vctTqfuVP6AlRFQ6a4FqmS9TNL/ASJ4QL2XaHQUYNd5EVK2LvYxSgnYNbDtBVcFHEEDNHCD
 dco=
X-SBRS: -0.9
X-MesageID: 1442124
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,562,1557201600"; 
   d="scan'208";a="1442124"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH v3 02/13] pci: introduce a devfn field to
 pci_sbdf_t
Thread-Index: AQHVHRLXj4mgcr1zPECMlACdGv3t/qaP9gTg
Date: Fri, 7 Jun 2019 10:02:43 +0000
Message-ID: <ecaf3ad1884f43e08830a0598a5699a4@AMSPEX02CL03.citrite.net>
References: <20190607092232.83179-1-roger.pau@citrix.com>
 <20190607092232.83179-3-roger.pau@citrix.com>
In-Reply-To: <20190607092232.83179-3-roger.pau@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v3 02/13] pci: introduce a devfn field to
 pci_sbdf_t
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Julien
 Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Ian
 Jackson <Ian.Jackson@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2ZWwgW21haWx0bzp4
ZW4tZGV2ZWwtYm91bmNlc0BsaXN0cy54ZW5wcm9qZWN0Lm9yZ10gT24gQmVoYWxmIE9mIFJvZ2Vy
IFBhdSBNb25uZQ0KPiBTZW50OiAwNyBKdW5lIDIwMTkgMTA6MjINCj4gVG86IHhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBDYzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGlu
aUBrZXJuZWwub3JnPjsgV2VpIExpdSA8d2xAeGVuLm9yZz47IEtvbnJhZCBSemVzenV0ZWsgV2ls
aw0KPiA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT47IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5s
YXBAY2l0cml4LmNvbT47IEFuZHJldyBDb29wZXINCj4gPEFuZHJldy5Db29wZXIzQGNpdHJpeC5j
b20+OyBJYW4gSmFja3NvbiA8SWFuLkphY2tzb25AY2l0cml4LmNvbT47IFRpbSAoWGVuLm9yZykg
PHRpbUB4ZW4ub3JnPjsgSnVsaWVuDQo+IEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT47IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT47IFJvZ2VyIFBhdSBNb25uZSA8cm9nZXIucGF1
QGNpdHJpeC5jb20+DQo+IFN1YmplY3Q6IFtYZW4tZGV2ZWxdIFtQQVRDSCB2MyAwMi8xM10gcGNp
OiBpbnRyb2R1Y2UgYSBkZXZmbiBmaWVsZCB0byBwY2lfc2JkZl90DQo+IA0KPiBUaGlzIGlzIGVx
dWl2YWxlbnQgdG8gdGhlIGN1cnJlbnQgZXh0ZnVuYyBmaWVsZCBpbiB0ZXJtIG9mIGNvbnRlbnRz
Lg0KPiANCj4gU3dpdGNoIHRoZSB0d28gY3VycmVudCB1c2VycyBvZiBleHRmdW5jIHRvIHVzZSBk
ZXZmbiBpbnN0ZWFkIGZvcg0KPiBjb3JyZWN0bmVzcy4NCj4gDQo+IE5vIGZ1bmN0aW9uYWwgY2hh
bmdlLg0KPiANCj4gUmVxdWVzdGVkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
DQo+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29t
Pg0KDQpSZXZpZXdlZC1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4N
Cg0KPiAtLS0NCj4gQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+
DQo+IENjOiBHZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVubGFwQGV1LmNpdHJpeC5jb20+DQo+IENj
OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4NCj4gQ2M6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gQ2M6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxs
QGFybS5jb20+DQo+IENjOiBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNs
ZS5jb20+DQo+IENjOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+
DQo+IENjOiBUaW0gRGVlZ2FuIDx0aW1AeGVuLm9yZz4NCj4gQ2M6IFdlaSBMaXUgPHdsQHhlbi5v
cmc+DQo+IC0tLQ0KPiBDaGFuZ2VzIHNpbmNlIHYyOg0KPiAgLSBTd2l0Y2ggZGVjbGFyYXRpb24g
b3JkZXIgb2YgdGhlIGRldmZuIGFuZCBleHRmdW5jIGZpZWxkcy4NCj4gDQo+IENoYW5nZXMgc2lu
Y2UgdjE6DQo+ICAtIE5ldyBpbiB0aGlzIHZlcnNpb24uDQo+IC0tLQ0KPiAgeGVuL2RyaXZlcnMv
dnBjaS92cGNpLmMgfCA0ICsrLS0NCj4gIHhlbi9pbmNsdWRlL3hlbi9wY2kuaCAgIHwgMyArKy0N
Cj4gIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPiAN
Cj4gZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jIGIveGVuL2RyaXZlcnMvdnBj
aS92cGNpLmMNCj4gaW5kZXggYjAzMjMyZmUzMC4uY2E1OTg2NzVlYSAxMDA2NDQNCj4gLS0tIGEv
eGVuL2RyaXZlcnMvdnBjaS92cGNpLmMNCj4gKysrIGIveGVuL2RyaXZlcnMvdnBjaS92cGNpLmMN
Cj4gQEAgLTMyNyw3ICszMjcsNyBAQCB1aW50MzJfdCB2cGNpX3JlYWQocGNpX3NiZGZfdCBzYmRm
LCB1bnNpZ25lZCBpbnQgcmVnLCB1bnNpZ25lZCBpbnQgc2l6ZSkNCj4gICAgICB9DQo+IA0KPiAg
ICAgIC8qIEZpbmQgdGhlIFBDSSBkZXYgbWF0Y2hpbmcgdGhlIGFkZHJlc3MuICovDQo+IC0gICAg
cGRldiA9IHBjaV9nZXRfcGRldl9ieV9kb21haW4oZCwgc2JkZi5zZWcsIHNiZGYuYnVzLCBzYmRm
LmV4dGZ1bmMpOw0KPiArICAgIHBkZXYgPSBwY2lfZ2V0X3BkZXZfYnlfZG9tYWluKGQsIHNiZGYu
c2VnLCBzYmRmLmJ1cywgc2JkZi5kZXZmbik7DQo+ICAgICAgaWYgKCAhcGRldiApDQo+ICAgICAg
ICAgIHJldHVybiB2cGNpX3JlYWRfaHcoc2JkZiwgcmVnLCBzaXplKTsNCj4gDQo+IEBAIC00MzIs
NyArNDMyLDcgQEAgdm9pZCB2cGNpX3dyaXRlKHBjaV9zYmRmX3Qgc2JkZiwgdW5zaWduZWQgaW50
IHJlZywgdW5zaWduZWQgaW50IHNpemUsDQo+ICAgICAgICogRmluZCB0aGUgUENJIGRldiBtYXRj
aGluZyB0aGUgYWRkcmVzcy4NCj4gICAgICAgKiBQYXNzdGhyb3VnaCBldmVyeXRoaW5nIHRoYXQn
cyBub3QgdHJhcHBlZC4NCj4gICAgICAgKi8NCj4gLSAgICBwZGV2ID0gcGNpX2dldF9wZGV2X2J5
X2RvbWFpbihkLCBzYmRmLnNlZywgc2JkZi5idXMsIHNiZGYuZXh0ZnVuYyk7DQo+ICsgICAgcGRl
diA9IHBjaV9nZXRfcGRldl9ieV9kb21haW4oZCwgc2JkZi5zZWcsIHNiZGYuYnVzLCBzYmRmLmRl
dmZuKTsNCj4gICAgICBpZiAoICFwZGV2ICkNCj4gICAgICB7DQo+ICAgICAgICAgIHZwY2lfd3Jp
dGVfaHcoc2JkZiwgcmVnLCBzaXplLCBkYXRhKTsNCj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRl
L3hlbi9wY2kuaCBiL3hlbi9pbmNsdWRlL3hlbi9wY2kuaA0KPiBpbmRleCBkYWIxYTg2ZGQ0Li5j
NjFmZDdlMjYyIDEwMDY0NA0KPiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vcGNpLmgNCj4gKysrIGIv
eGVuL2luY2x1ZGUveGVuL3BjaS5oDQo+IEBAIC00OSw3ICs0OSw4IEBAIHR5cGVkZWYgdW5pb24g
ew0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDhfdCBmbiAgIDogMywNCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgZGV2ICA6IDU7DQo+ICAgICAgICAgICAgICAgICAg
ICAgIH07DQo+IC0gICAgICAgICAgICAgICAgICAgIHVpbnQ4X3QgICAgIGV4dGZ1bmM7DQo+ICsg
ICAgICAgICAgICAgICAgICAgIHVpbnQ4X3QgICAgIGRldmZuLA0KPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBleHRmdW5jOw0KPiAgICAgICAgICAgICAgICAgIH07DQo+ICAgICAg
ICAgICAgICAgICAgdWludDhfdCAgICAgICAgIGJ1czsNCj4gICAgICAgICAgICAgIH07DQo+IC0t
DQo+IDIuMjAuMSAoQXBwbGUgR2l0LTExNykNCj4gDQo+IA0KPiBfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiBYZW4tZGV2ZWwgbWFpbGluZyBsaXN0DQo+
IFhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVsDQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs

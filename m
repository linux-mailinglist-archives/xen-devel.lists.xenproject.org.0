Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E01BE370ED
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jun 2019 11:54:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYp4h-0004c0-8S; Thu, 06 Jun 2019 09:52:47 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ATwH=UF=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hYp4f-0004bu-Ib
 for xen-devel@lists.xenproject.org; Thu, 06 Jun 2019 09:52:45 +0000
X-Inumbo-ID: d5114a9e-8840-11e9-8980-bc764e045a96
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id d5114a9e-8840-11e9-8980-bc764e045a96;
 Thu, 06 Jun 2019 09:52:44 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=SoftFail smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: SoftFail (esa1.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com is inclined to not designate
 162.221.158.21 as permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 5M+fbI+JTYeSFAP4mjJQmkO4LKWOjH7rvliTw5T/Bvdm122G+Mn4Lr6TQVtstSC1TOM4x49GQc
 Pe41qNrg2x5v3ZtTRcNqSlR6cRGBOXNM0f2Iw7QoiuMdJ3G2yLCy5q67MJPf7RIsUnpS1QFAqg
 fTAq4d/y2qg9iL4Pbtp3/5RRBHPJK1mCxH0A9nLGUeh92/39SnL8DZWX5BMRVbl0Pzyq4SvLOD
 I+fx4/b4TlLUavaeyf+4ZRecoasnJV9KnVV7n7caazbGN6rtLvQUJOGG2Ep0npVuMBfiLN/y8v
 DoY=
X-SBRS: -0.9
X-MesageID: 1398731
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,559,1557201600"; 
   d="scan'208";a="1398731"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH v2 02/12] pci: introduce a pci_sbdf_t field
 to pci_dev
Thread-Index: AQHVHEbBqN1IJ03zK0CByoIuwImL2qaOYn7Q
Date: Thu, 6 Jun 2019 09:52:40 +0000
Message-ID: <c3485df0d7ee455fb7181618e0ad1d09@AMSPEX02CL03.citrite.net>
References: <20190606090146.77381-1-roger.pau@citrix.com>
 <20190606090146.77381-3-roger.pau@citrix.com>
In-Reply-To: <20190606090146.77381-3-roger.pau@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 02/12] pci: introduce a pci_sbdf_t field
 to pci_dev
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
IFBhdSBNb25uZQ0KPiBTZW50OiAwNiBKdW5lIDIwMTkgMTA6MDINCj4gVG86IHhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBDYzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGlu
aUBrZXJuZWwub3JnPjsgV2VpIExpdSA8d2xAeGVuLm9yZz47IEtvbnJhZCBSemVzenV0ZWsgV2ls
aw0KPiA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT47IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5s
YXBAY2l0cml4LmNvbT47IEFuZHJldyBDb29wZXINCj4gPEFuZHJldy5Db29wZXIzQGNpdHJpeC5j
b20+OyBJYW4gSmFja3NvbiA8SWFuLkphY2tzb25AY2l0cml4LmNvbT47IFRpbSAoWGVuLm9yZykg
PHRpbUB4ZW4ub3JnPjsgSnVsaWVuDQo+IEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT47IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT47IFJvZ2VyIFBhdSBNb25uZSA8cm9nZXIucGF1
QGNpdHJpeC5jb20+DQo+IFN1YmplY3Q6IFtYZW4tZGV2ZWxdIFtQQVRDSCB2MiAwMi8xMl0gcGNp
OiBpbnRyb2R1Y2UgYSBwY2lfc2JkZl90IGZpZWxkIHRvIHBjaV9kZXYNCj4gDQo+IEFuZCB1c2Ug
YW4gdW5pb24gd2l0aCB0aGUgY3VycmVudCBzZWcsIGJ1cyBhbmQgZGV2Zm4gZmllbGRzIHRvIG1h
a2UNCj4gZmllbGRzIHBvaW50IHRvIHRoZSBzYW1lIHVuZGVybHlpbmcgZGF0YS4NCj4gDQo+IE5v
IGZ1bmN0aW9uYWwgY2hhbmdlLg0KPiANCj4gU3VnZ2VzdGVkLWJ5OiBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2Vy
LnBhdUBjaXRyaXguY29tPg0KDQpSZXZpZXdlZC1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJh
bnRAY2l0cml4LmNvbT4NCg0KPiAtLS0NCj4gQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+DQo+IENjOiBHZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVubGFwQGV1LmNp
dHJpeC5jb20+DQo+IENjOiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4N
Cj4gQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gQ2M6IEp1bGllbiBHcmFs
bCA8anVsaWVuLmdyYWxsQGFybS5jb20+DQo+IENjOiBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtv
bnJhZC53aWxrQG9yYWNsZS5jb20+DQo+IENjOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxs
aW5pQGtlcm5lbC5vcmc+DQo+IENjOiBUaW0gRGVlZ2FuIDx0aW1AeGVuLm9yZz4NCj4gQ2M6IFdl
aSBMaXUgPHdsQHhlbi5vcmc+DQo+IC0tLQ0KPiAgeGVuL2RyaXZlcnMvdnBjaS9oZWFkZXIuYyB8
ICA3ICsrLS0tLS0NCj4gIHhlbi9pbmNsdWRlL3hlbi9wY2kuaCAgICAgfCAxMiArKysrKysrKyst
LS0NCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkN
Cj4gDQo+IGRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy92cGNpL2hlYWRlci5jIGIveGVuL2RyaXZl
cnMvdnBjaS9oZWFkZXIuYw0KPiBpbmRleCBlZmI2Y2E5MGUzLi4wNDZiMWM2MTBlIDEwMDY0NA0K
PiAtLS0gYS94ZW4vZHJpdmVycy92cGNpL2hlYWRlci5jDQo+ICsrKyBiL3hlbi9kcml2ZXJzL3Zw
Y2kvaGVhZGVyLmMNCj4gQEAgLTQ2MSw5ICs0NjEsNiBAQCBzdGF0aWMgaW50IGluaXRfYmFycyhz
dHJ1Y3QgcGNpX2RldiAqcGRldikNCj4gICAgICB1bnNpZ25lZCBpbnQgaSwgbnVtX2JhcnMsIHJv
bV9yZWc7DQo+ICAgICAgc3RydWN0IHZwY2lfaGVhZGVyICpoZWFkZXIgPSAmcGRldi0+dnBjaS0+
aGVhZGVyOw0KPiAgICAgIHN0cnVjdCB2cGNpX2JhciAqYmFycyA9IGhlYWRlci0+YmFyczsNCj4g
LSAgICBwY2lfc2JkZl90IHNiZGYgPSB7DQo+IC0gICAgICAgIC5zYmRmID0gUENJX1NCREYzKHBk
ZXYtPnNlZywgcGRldi0+YnVzLCBwZGV2LT5kZXZmbiksDQo+IC0gICAgfTsNCj4gICAgICBpbnQg
cmM7DQo+IA0KPiAgICAgIHN3aXRjaCAoIHBjaV9jb25mX3JlYWQ4KHBkZXYtPnNlZywgcGRldi0+
YnVzLCBzbG90LCBmdW5jLCBQQ0lfSEVBREVSX1RZUEUpDQo+IEBAIC01MzAsNyArNTI3LDcgQEAg
c3RhdGljIGludCBpbml0X2JhcnMoc3RydWN0IHBjaV9kZXYgKnBkZXYpDQo+ICAgICAgICAgIGVs
c2UNCj4gICAgICAgICAgICAgIGJhcnNbaV0udHlwZSA9IFZQQ0lfQkFSX01FTTMyOw0KPiANCj4g
LSAgICAgICAgcmMgPSBwY2lfc2l6ZV9tZW1fYmFyKHNiZGYsIHJlZywgJmFkZHIsICZzaXplLA0K
PiArICAgICAgICByYyA9IHBjaV9zaXplX21lbV9iYXIocGRldi0+c2JkZiwgcmVnLCAmYWRkciwg
JnNpemUsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAoaSA9PSBudW1fYmFycyAt
IDEpID8gUENJX0JBUl9MQVNUIDogMCk7DQo+ICAgICAgICAgIGlmICggcmMgPCAwICkNCj4gICAg
ICAgICAgew0KPiBAQCAtNTYwLDcgKzU1Nyw3IEBAIHN0YXRpYyBpbnQgaW5pdF9iYXJzKHN0cnVj
dCBwY2lfZGV2ICpwZGV2KQ0KPiAgICAgIH0NCj4gDQo+ICAgICAgLyogQ2hlY2sgZXhwYW5zaW9u
IFJPTS4gKi8NCj4gLSAgICByYyA9IHBjaV9zaXplX21lbV9iYXIoc2JkZiwgcm9tX3JlZywgJmFk
ZHIsICZzaXplLCBQQ0lfQkFSX1JPTSk7DQo+ICsgICAgcmMgPSBwY2lfc2l6ZV9tZW1fYmFyKHBk
ZXYtPnNiZGYsIHJvbV9yZWcsICZhZGRyLCAmc2l6ZSwgUENJX0JBUl9ST00pOw0KPiAgICAgIGlm
ICggcmMgPiAwICYmIHNpemUgKQ0KPiAgICAgIHsNCj4gICAgICAgICAgc3RydWN0IHZwY2lfYmFy
ICpyb20gPSAmaGVhZGVyLT5iYXJzW251bV9iYXJzXTsNCj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNs
dWRlL3hlbi9wY2kuaCBiL3hlbi9pbmNsdWRlL3hlbi9wY2kuaA0KPiBpbmRleCBlYzk4Mjc0Njc1
Li5mNDkwOGFiZDhiIDEwMDY0NA0KPiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vcGNpLmgNCj4gKysr
IGIveGVuL2luY2x1ZGUveGVuL3BjaS5oDQo+IEBAIC04Myw5ICs4MywxNSBAQCBzdHJ1Y3QgcGNp
X2RldiB7DQo+ICAgICAgc3RydWN0IGFyY2hfbXNpeCAqbXNpeDsNCj4gDQo+ICAgICAgc3RydWN0
IGRvbWFpbiAqZG9tYWluOw0KPiAtICAgIGNvbnN0IHUxNiBzZWc7DQo+IC0gICAgY29uc3QgdTgg
YnVzOw0KPiAtICAgIGNvbnN0IHU4IGRldmZuOw0KPiArDQo+ICsgICAgdW5pb24gew0KPiArICAg
ICAgICBzdHJ1Y3Qgew0KPiArICAgICAgICAgICAgY29uc3QgdWludDhfdCBkZXZmbjsNCj4gKyAg
ICAgICAgICAgIGNvbnN0IHVpbnQ4X3QgYnVzOw0KPiArICAgICAgICAgICAgY29uc3QgdWludDE2
X3Qgc2VnOw0KPiArICAgICAgICB9Ow0KPiArICAgICAgICBjb25zdCBwY2lfc2JkZl90IHNiZGY7
DQo+ICsgICAgfTsNCj4gDQo+ICAgICAgdTggcGhhbnRvbV9zdHJpZGU7DQo+IA0KPiAtLQ0KPiAy
LjIwLjEgKEFwcGxlIEdpdC0xMTcpDQo+IA0KPiANCj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18NCj4gWGVuLWRldmVsIG1haWxpbmcgbGlzdA0KPiBYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==

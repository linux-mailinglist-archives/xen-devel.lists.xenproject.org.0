Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B5F38710
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jun 2019 11:27:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hZB82-0003jY-GD; Fri, 07 Jun 2019 09:25:42 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MI8S=UG=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hZB80-0003hE-ET
 for xen-devel@lists.xenproject.org; Fri, 07 Jun 2019 09:25:40 +0000
X-Inumbo-ID: 36b5bf73-8906-11e9-8980-bc764e045a96
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 36b5bf73-8906-11e9-8980-bc764e045a96;
 Fri, 07 Jun 2019 09:25:39 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=SoftFail smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: SoftFail (esa5.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com is inclined to not designate
 162.221.158.21 as permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: SKXgErn+qOWIZ7ZbnlNybqMfBUoBmWCmUaF2AC3cWbGxgABHPx0bCEMmq+6PKzo3VnuFszIt5L
 ZcMVMaX0y0PpTK7Heu/oYyGdNXBnjGbpDJFdFFs4diw/F+PSFY5wah9hwTjSUbmsvxbJzKUCjP
 XQZXJ9V/pmLPTYwNN1iBiXdYaH6LZ6NlJ0KrwVBsVvh1dWxXzuz3bIuIh6+HYLtMdk/vyD1z8S
 hdcXtIMV5Js+1EbXRRolvOrd2FByHkzLrXnDzaFRLu5XPrsP48vS4TvJr2wBj+FbI767xi/5IK
 3Sc=
X-SBRS: -0.9
X-MesageID: 1419293
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,562,1557201600"; 
   d="scan'208";a="1419293"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v3 01/13] pci: rename func field to fn
Thread-Index: AQHVHRKYxY1hcfzy1kGnx4RpjgjgVKaP65PA
Date: Fri, 7 Jun 2019 09:25:34 +0000
Message-ID: <9511b97ef1fa48ed8ee10e1ccd1d41e1@AMSPEX02CL03.citrite.net>
References: <20190607092232.83179-1-roger.pau@citrix.com>
 <20190607092232.83179-2-roger.pau@citrix.com>
In-Reply-To: <20190607092232.83179-2-roger.pau@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v3 01/13] pci: rename func field to fn
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim
 \(Xen.org\)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>, Julien
 Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Ian Jackson <Ian.Jackson@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSb2dlciBQYXUgTW9ubmUgW21h
aWx0bzpyb2dlci5wYXVAY2l0cml4LmNvbV0NCj4gU2VudDogMDcgSnVuZSAyMDE5IDEwOjIyDQo+
IFRvOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gQ2M6IFJvZ2VyIFBhdSBNb25u
ZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyBQYXVsIER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRy
aXguY29tPjsgSmFuIEJldWxpY2gNCj4gPGpiZXVsaWNoQHN1c2UuY29tPjsgQW5kcmV3IENvb3Bl
ciA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IEdlb3JnZSBEdW5sYXANCj4gPEdlb3JnZS5E
dW5sYXBAY2l0cml4LmNvbT47IElhbiBKYWNrc29uIDxJYW4uSmFja3NvbkBjaXRyaXguY29tPjsg
SnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT47DQo+IEtvbnJhZCBSemVzenV0ZWsg
V2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJl
bGxpbmlAa2VybmVsLm9yZz47IFRpbQ0KPiAoWGVuLm9yZykgPHRpbUB4ZW4ub3JnPjsgV2VpIExp
dSA8d2xAeGVuLm9yZz4NCj4gU3ViamVjdDogW1BBVENIIHYzIDAxLzEzXSBwY2k6IHJlbmFtZSBm
dW5jIGZpZWxkIHRvIGZuDQo+IA0KPiBJbiBwcmVwYXJhdGlvbiBmb3IgYWRkaW5nIGEgZGV2Zm4g
ZmllbGQuIFRoaXMgbWFrZXMgdGhlIG5hbWluZyBtb3JlDQo+IGNvbnNpc3RlbnQsIGFzIHRoZSBk
ZXZmbiBmaWVsZCBlbmNsb3NlcyBib3RoIHRoZSBkZXYgYW5kIHRoZSBmbg0KPiBmaWVsZHMuDQo+
IA0KPiBObyBmdW5jdGlvbmFsIGNoYW5nZSBpbnRlbmRlZC4NCj4gDQo+IFJlcXVlc3RlZC1ieTog
UGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4NCj4gU2lnbmVkLW9mZi1ieTog
Um9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQoNClJldmlld2VkLWJ5OiBQ
YXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPg0KDQo+IC0tLQ0KPiBDYzogSmFu
IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3
LmNvb3BlcjNAY2l0cml4LmNvbT4NCj4gQ2M6IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBA
ZXUuY2l0cml4LmNvbT4NCj4gQ2M6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXgu
Y29tPg0KPiBDYzogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4NCj4gQ2M6IEtv
bnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4NCj4gQ2M6IFN0ZWZh
bm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4NCj4gQ2M6IFRpbSBEZWVnYW4g
PHRpbUB4ZW4ub3JnPg0KPiBDYzogV2VpIExpdSA8d2xAeGVuLm9yZz4NCj4gLS0tDQo+IENoYW5n
ZXMgc2luY2UgdjI6DQo+ICAtIE5ldyBpbiB0aGlzIHZlcnNpb24uDQo+IC0tLQ0KPiAgeGVuL2Ry
aXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMgfCAxOCArKysrKysrKystLS0tLS0tLS0NCj4gIHhlbi9k
cml2ZXJzL3ZwY2kvdnBjaS5jICAgICAgIHwgMjggKysrKysrKysrKysrKystLS0tLS0tLS0tLS0t
LQ0KPiAgeGVuL2luY2x1ZGUveGVuL3BjaS5oICAgICAgICAgfCAgMiArLQ0KPiAgMyBmaWxlcyBj
aGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspLCAyNCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1n
aXQgYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9wY2kuYyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJv
dWdoL3BjaS5jDQo+IGluZGV4IDIwYmZhOTcxYTkuLjUzNWM3ZTUxMWIgMTAwNjQ0DQo+IC0tLSBh
L3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jDQo+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0
aHJvdWdoL3BjaS5jDQo+IEBAIC02NDQsNyArNjQ0LDcgQEAgdW5zaWduZWQgaW50IHBjaV9zaXpl
X21lbV9iYXIocGNpX3NiZGZfdCBzYmRmLCB1bnNpZ25lZCBpbnQgcG9zLA0KPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IGZsYWdzKQ0KPiAgew0KPiAgICAgIHVp
bnQzMl90IGhpID0gMCwgYmFyID0gcGNpX2NvbmZfcmVhZDMyKHNiZGYuc2VnLCBzYmRmLmJ1cywg
c2JkZi5kZXYsDQo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
c2JkZi5mdW5jLCBwb3MpOw0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHNiZGYuZm4sIHBvcyk7DQo+ICAgICAgdWludDY0X3Qgc2l6ZTsNCj4gICAgICBib29s
IGlzNjRiaXRzID0gIShmbGFncyAmIFBDSV9CQVJfUk9NKSAmJg0KPiAgICAgICAgICAoYmFyICYg
UENJX0JBU0VfQUREUkVTU19NRU1fVFlQRV9NQVNLKSA9PSBQQ0lfQkFTRV9BRERSRVNTX01FTV9U
WVBFXzY0Ow0KPiBAQCAtNjU0LDcgKzY1NCw3IEBAIHVuc2lnbmVkIGludCBwY2lfc2l6ZV9tZW1f
YmFyKHBjaV9zYmRmX3Qgc2JkZiwgdW5zaWduZWQgaW50IHBvcywNCj4gICAgICBBU1NFUlQoISgo
ZmxhZ3MgJiBQQ0lfQkFSX1ZGKSAmJiAoZmxhZ3MgJiBQQ0lfQkFSX1JPTSkpKTsNCj4gICAgICBB
U1NFUlQoKGZsYWdzICYgUENJX0JBUl9ST00pIHx8DQo+ICAgICAgICAgICAgIChiYXIgJiBQQ0lf
QkFTRV9BRERSRVNTX1NQQUNFKSA9PSBQQ0lfQkFTRV9BRERSRVNTX1NQQUNFX01FTU9SWSk7DQo+
IC0gICAgcGNpX2NvbmZfd3JpdGUzMihzYmRmLnNlZywgc2JkZi5idXMsIHNiZGYuZGV2LCBzYmRm
LmZ1bmMsIHBvcywgfjApOw0KPiArICAgIHBjaV9jb25mX3dyaXRlMzIoc2JkZi5zZWcsIHNiZGYu
YnVzLCBzYmRmLmRldiwgc2JkZi5mbiwgcG9zLCB+MCk7DQo+ICAgICAgaWYgKCBpczY0Yml0cyAp
DQo+ICAgICAgew0KPiAgICAgICAgICBpZiAoIGZsYWdzICYgUENJX0JBUl9MQVNUICkNCj4gQEAg
LTY2MiwyNCArNjYyLDI0IEBAIHVuc2lnbmVkIGludCBwY2lfc2l6ZV9tZW1fYmFyKHBjaV9zYmRm
X3Qgc2JkZiwgdW5zaWduZWQgaW50IHBvcywNCj4gICAgICAgICAgICAgIHByaW50ayhYRU5MT0df
V0FSTklORw0KPiAgICAgICAgICAgICAgICAgICAgICIlc2RldmljZSAlMDR4OiUwMng6JTAyeC4l
dSB3aXRoIDY0LWJpdCAlc0JBUiBpbiBsYXN0IHNsb3RcbiIsDQo+ICAgICAgICAgICAgICAgICAg
ICAgKGZsYWdzICYgUENJX0JBUl9WRikgPyAiU1ItSU9WICIgOiAiIiwgc2JkZi5zZWcsIHNiZGYu
YnVzLA0KPiAtICAgICAgICAgICAgICAgICAgIHNiZGYuZGV2LCBzYmRmLmZ1bmMsIChmbGFncyAm
IFBDSV9CQVJfVkYpID8gInZmICIgOiAiIik7DQo+ICsgICAgICAgICAgICAgICAgICAgc2JkZi5k
ZXYsIHNiZGYuZm4sIChmbGFncyAmIFBDSV9CQVJfVkYpID8gInZmICIgOiAiIik7DQo+ICAgICAg
ICAgICAgICAqcHNpemUgPSAwOw0KPiAgICAgICAgICAgICAgcmV0dXJuIDE7DQo+ICAgICAgICAg
IH0NCj4gLSAgICAgICAgaGkgPSBwY2lfY29uZl9yZWFkMzIoc2JkZi5zZWcsIHNiZGYuYnVzLCBz
YmRmLmRldiwgc2JkZi5mdW5jLCBwb3MgKyA0KTsNCj4gLSAgICAgICAgcGNpX2NvbmZfd3JpdGUz
MihzYmRmLnNlZywgc2JkZi5idXMsIHNiZGYuZGV2LCBzYmRmLmZ1bmMsIHBvcyArIDQsIH4wKTsN
Cj4gKyAgICAgICAgaGkgPSBwY2lfY29uZl9yZWFkMzIoc2JkZi5zZWcsIHNiZGYuYnVzLCBzYmRm
LmRldiwgc2JkZi5mbiwgcG9zICsgNCk7DQo+ICsgICAgICAgIHBjaV9jb25mX3dyaXRlMzIoc2Jk
Zi5zZWcsIHNiZGYuYnVzLCBzYmRmLmRldiwgc2JkZi5mbiwgcG9zICsgNCwgfjApOw0KPiAgICAg
IH0NCj4gLSAgICBzaXplID0gcGNpX2NvbmZfcmVhZDMyKHNiZGYuc2VnLCBzYmRmLmJ1cywgc2Jk
Zi5kZXYsIHNiZGYuZnVuYywNCj4gKyAgICBzaXplID0gcGNpX2NvbmZfcmVhZDMyKHNiZGYuc2Vn
LCBzYmRmLmJ1cywgc2JkZi5kZXYsIHNiZGYuZm4sDQo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBwb3MpICYgbWFzazsNCj4gICAgICBpZiAoIGlzNjRiaXRzICkNCj4gICAgICB7DQo+ICAg
ICAgICAgIHNpemUgfD0gKHVpbnQ2NF90KXBjaV9jb25mX3JlYWQzMihzYmRmLnNlZywgc2JkZi5i
dXMsIHNiZGYuZGV2LA0KPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgc2JkZi5mdW5jLCBwb3MgKyA0KSA8PCAzMjsNCj4gLSAgICAgICAgcGNpX2NvbmZfd3JpdGUz
MihzYmRmLnNlZywgc2JkZi5idXMsIHNiZGYuZGV2LCBzYmRmLmZ1bmMsIHBvcyArIDQsIGhpKTsN
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNiZGYuZm4sIHBv
cyArIDQpIDw8IDMyOw0KPiArICAgICAgICBwY2lfY29uZl93cml0ZTMyKHNiZGYuc2VnLCBzYmRm
LmJ1cywgc2JkZi5kZXYsIHNiZGYuZm4sIHBvcyArIDQsIGhpKTsNCj4gICAgICB9DQo+ICAgICAg
ZWxzZSBpZiAoIHNpemUgKQ0KPiAgICAgICAgICBzaXplIHw9ICh1aW50NjRfdCl+MCA8PCAzMjsN
Cj4gLSAgICBwY2lfY29uZl93cml0ZTMyKHNiZGYuc2VnLCBzYmRmLmJ1cywgc2JkZi5kZXYsIHNi
ZGYuZnVuYywgcG9zLCBiYXIpOw0KPiArICAgIHBjaV9jb25mX3dyaXRlMzIoc2JkZi5zZWcsIHNi
ZGYuYnVzLCBzYmRmLmRldiwgc2JkZi5mbiwgcG9zLCBiYXIpOw0KPiAgICAgIHNpemUgPSAtc2l6
ZTsNCj4gDQo+ICAgICAgaWYgKCBwYWRkciApDQo+IGRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy92
cGNpL3ZwY2kuYyBiL3hlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jDQo+IGluZGV4IDgyNjA3YmRiOWEu
LmIwMzIzMmZlMzAgMTAwNjQ0DQo+IC0tLSBhL3hlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jDQo+ICsr
KyBiL3hlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jDQo+IEBAIC0yMTIsNyArMjEyLDcgQEAgc3RhdGlj
IHVpbnQzMl90IHZwY2lfcmVhZF9odyhwY2lfc2JkZl90IHNiZGYsIHVuc2lnbmVkIGludCByZWcs
DQo+ICAgICAgc3dpdGNoICggc2l6ZSApDQo+ICAgICAgew0KPiAgICAgIGNhc2UgNDoNCj4gLSAg
ICAgICAgZGF0YSA9IHBjaV9jb25mX3JlYWQzMihzYmRmLnNlZywgc2JkZi5idXMsIHNiZGYuZGV2
LCBzYmRmLmZ1bmMsIHJlZyk7DQo+ICsgICAgICAgIGRhdGEgPSBwY2lfY29uZl9yZWFkMzIoc2Jk
Zi5zZWcsIHNiZGYuYnVzLCBzYmRmLmRldiwgc2JkZi5mbiwgcmVnKTsNCj4gICAgICAgICAgYnJl
YWs7DQo+IA0KPiAgICAgIGNhc2UgMzoNCj4gQEAgLTIyMiwyNiArMjIyLDI2IEBAIHN0YXRpYyB1
aW50MzJfdCB2cGNpX3JlYWRfaHcocGNpX3NiZGZfdCBzYmRmLCB1bnNpZ25lZCBpbnQgcmVnLA0K
PiAgICAgICAgICAgKi8NCj4gICAgICAgICAgaWYgKCByZWcgJiAxICkNCj4gICAgICAgICAgew0K
PiAtICAgICAgICAgICAgZGF0YSA9IHBjaV9jb25mX3JlYWQ4KHNiZGYuc2VnLCBzYmRmLmJ1cywg
c2JkZi5kZXYsIHNiZGYuZnVuYywNCj4gKyAgICAgICAgICAgIGRhdGEgPSBwY2lfY29uZl9yZWFk
OChzYmRmLnNlZywgc2JkZi5idXMsIHNiZGYuZGV2LCBzYmRmLmZuLA0KPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHJlZyk7DQo+IC0gICAgICAgICAgICBkYXRhIHw9IHBjaV9j
b25mX3JlYWQxNihzYmRmLnNlZywgc2JkZi5idXMsIHNiZGYuZGV2LCBzYmRmLmZ1bmMsDQo+ICsg
ICAgICAgICAgICBkYXRhIHw9IHBjaV9jb25mX3JlYWQxNihzYmRmLnNlZywgc2JkZi5idXMsIHNi
ZGYuZGV2LCBzYmRmLmZuLA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
cmVnICsgMSkgPDwgODsNCj4gICAgICAgICAgfQ0KPiAgICAgICAgICBlbHNlDQo+ICAgICAgICAg
IHsNCj4gLSAgICAgICAgICAgIGRhdGEgPSBwY2lfY29uZl9yZWFkMTYoc2JkZi5zZWcsIHNiZGYu
YnVzLCBzYmRmLmRldiwgc2JkZi5mdW5jLA0KPiArICAgICAgICAgICAgZGF0YSA9IHBjaV9jb25m
X3JlYWQxNihzYmRmLnNlZywgc2JkZi5idXMsIHNiZGYuZGV2LCBzYmRmLmZuLA0KPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZWcpOw0KPiAtICAgICAgICAgICAgZGF0YSB8
PSBwY2lfY29uZl9yZWFkOChzYmRmLnNlZywgc2JkZi5idXMsIHNiZGYuZGV2LCBzYmRmLmZ1bmMs
DQo+ICsgICAgICAgICAgICBkYXRhIHw9IHBjaV9jb25mX3JlYWQ4KHNiZGYuc2VnLCBzYmRmLmJ1
cywgc2JkZi5kZXYsIHNiZGYuZm4sDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHJlZyArIDIpIDw8IDE2Ow0KPiAgICAgICAgICB9DQo+ICAgICAgICAgIGJyZWFrOw0KPiAN
Cj4gICAgICBjYXNlIDI6DQo+IC0gICAgICAgIGRhdGEgPSBwY2lfY29uZl9yZWFkMTYoc2JkZi5z
ZWcsIHNiZGYuYnVzLCBzYmRmLmRldiwgc2JkZi5mdW5jLCByZWcpOw0KPiArICAgICAgICBkYXRh
ID0gcGNpX2NvbmZfcmVhZDE2KHNiZGYuc2VnLCBzYmRmLmJ1cywgc2JkZi5kZXYsIHNiZGYuZm4s
IHJlZyk7DQo+ICAgICAgICAgIGJyZWFrOw0KPiANCj4gICAgICBjYXNlIDE6DQo+IC0gICAgICAg
IGRhdGEgPSBwY2lfY29uZl9yZWFkOChzYmRmLnNlZywgc2JkZi5idXMsIHNiZGYuZGV2LCBzYmRm
LmZ1bmMsIHJlZyk7DQo+ICsgICAgICAgIGRhdGEgPSBwY2lfY29uZl9yZWFkOChzYmRmLnNlZywg
c2JkZi5idXMsIHNiZGYuZGV2LCBzYmRmLmZuLCByZWcpOw0KPiAgICAgICAgICBicmVhazsNCj4g
DQo+ICAgICAgZGVmYXVsdDoNCj4gQEAgLTI1OSw3ICsyNTksNyBAQCBzdGF0aWMgdm9pZCB2cGNp
X3dyaXRlX2h3KHBjaV9zYmRmX3Qgc2JkZiwgdW5zaWduZWQgaW50IHJlZywgdW5zaWduZWQgaW50
IHNpemUsDQo+ICAgICAgc3dpdGNoICggc2l6ZSApDQo+ICAgICAgew0KPiAgICAgIGNhc2UgNDoN
Cj4gLSAgICAgICAgcGNpX2NvbmZfd3JpdGUzMihzYmRmLnNlZywgc2JkZi5idXMsIHNiZGYuZGV2
LCBzYmRmLmZ1bmMsIHJlZywgZGF0YSk7DQo+ICsgICAgICAgIHBjaV9jb25mX3dyaXRlMzIoc2Jk
Zi5zZWcsIHNiZGYuYnVzLCBzYmRmLmRldiwgc2JkZi5mbiwgcmVnLCBkYXRhKTsNCj4gICAgICAg
ICAgYnJlYWs7DQo+IA0KPiAgICAgIGNhc2UgMzoNCj4gQEAgLTI2OSwyNiArMjY5LDI2IEBAIHN0
YXRpYyB2b2lkIHZwY2lfd3JpdGVfaHcocGNpX3NiZGZfdCBzYmRmLCB1bnNpZ25lZCBpbnQgcmVn
LCB1bnNpZ25lZCBpbnQgc2l6ZSwNCj4gICAgICAgICAgICovDQo+ICAgICAgICAgIGlmICggcmVn
ICYgMSApDQo+ICAgICAgICAgIHsNCj4gLSAgICAgICAgICAgIHBjaV9jb25mX3dyaXRlOChzYmRm
LnNlZywgc2JkZi5idXMsIHNiZGYuZGV2LCBzYmRmLmZ1bmMsIHJlZywNCj4gKyAgICAgICAgICAg
IHBjaV9jb25mX3dyaXRlOChzYmRmLnNlZywgc2JkZi5idXMsIHNiZGYuZGV2LCBzYmRmLmZuLCBy
ZWcsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZGF0YSk7DQo+IC0gICAgICAgICAg
ICBwY2lfY29uZl93cml0ZTE2KHNiZGYuc2VnLCBzYmRmLmJ1cywgc2JkZi5kZXYsIHNiZGYuZnVu
YywgcmVnICsgMSwNCj4gKyAgICAgICAgICAgIHBjaV9jb25mX3dyaXRlMTYoc2JkZi5zZWcsIHNi
ZGYuYnVzLCBzYmRmLmRldiwgc2JkZi5mbiwgcmVnICsgMSwNCj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgZGF0YSA+PiA4KTsNCj4gICAgICAgICAgfQ0KPiAgICAgICAgICBlbHNlDQo+
ICAgICAgICAgIHsNCj4gLSAgICAgICAgICAgIHBjaV9jb25mX3dyaXRlMTYoc2JkZi5zZWcsIHNi
ZGYuYnVzLCBzYmRmLmRldiwgc2JkZi5mdW5jLCByZWcsDQo+ICsgICAgICAgICAgICBwY2lfY29u
Zl93cml0ZTE2KHNiZGYuc2VnLCBzYmRmLmJ1cywgc2JkZi5kZXYsIHNiZGYuZm4sIHJlZywNCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZGF0YSk7DQo+IC0gICAgICAgICAgICBwY2lf
Y29uZl93cml0ZTgoc2JkZi5zZWcsIHNiZGYuYnVzLCBzYmRmLmRldiwgc2JkZi5mdW5jLCByZWcg
KyAyLA0KPiArICAgICAgICAgICAgcGNpX2NvbmZfd3JpdGU4KHNiZGYuc2VnLCBzYmRmLmJ1cywg
c2JkZi5kZXYsIHNiZGYuZm4sIHJlZyArIDIsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgZGF0YSA+PiAxNik7DQo+ICAgICAgICAgIH0NCj4gICAgICAgICAgYnJlYWs7DQo+IA0KPiAg
ICAgIGNhc2UgMjoNCj4gLSAgICAgICAgcGNpX2NvbmZfd3JpdGUxNihzYmRmLnNlZywgc2JkZi5i
dXMsIHNiZGYuZGV2LCBzYmRmLmZ1bmMsIHJlZywgZGF0YSk7DQo+ICsgICAgICAgIHBjaV9jb25m
X3dyaXRlMTYoc2JkZi5zZWcsIHNiZGYuYnVzLCBzYmRmLmRldiwgc2JkZi5mbiwgcmVnLCBkYXRh
KTsNCj4gICAgICAgICAgYnJlYWs7DQo+IA0KPiAgICAgIGNhc2UgMToNCj4gLSAgICAgICAgcGNp
X2NvbmZfd3JpdGU4KHNiZGYuc2VnLCBzYmRmLmJ1cywgc2JkZi5kZXYsIHNiZGYuZnVuYywgcmVn
LCBkYXRhKTsNCj4gKyAgICAgICAgcGNpX2NvbmZfd3JpdGU4KHNiZGYuc2VnLCBzYmRmLmJ1cywg
c2JkZi5kZXYsIHNiZGYuZm4sIHJlZywgZGF0YSk7DQo+ICAgICAgICAgIGJyZWFrOw0KPiANCj4g
ICAgICBkZWZhdWx0Og0KPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL3BjaS5oIGIveGVu
L2luY2x1ZGUveGVuL3BjaS5oDQo+IGluZGV4IDUzZjUwZDg5ZTcuLmRhYjFhODZkZDQgMTAwNjQ0
DQo+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9wY2kuaA0KPiArKysgYi94ZW4vaW5jbHVkZS94ZW4v
cGNpLmgNCj4gQEAgLTQ2LDcgKzQ2LDcgQEAgdHlwZWRlZiB1bmlvbiB7DQo+ICAgICAgICAgICAg
ICBzdHJ1Y3Qgew0KPiAgICAgICAgICAgICAgICAgIHVuaW9uIHsNCj4gICAgICAgICAgICAgICAg
ICAgICAgc3RydWN0IHsNCj4gLSAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQ4X3QgZnVuYyA6
IDMsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICB1aW50OF90IGZuICAgOiAzLA0KPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkZXYgIDogNTsNCj4gICAgICAgICAgICAgICAg
ICAgICAgfTsNCj4gICAgICAgICAgICAgICAgICAgICAgdWludDhfdCAgICAgZXh0ZnVuYzsNCj4g
LS0NCj4gMi4yMC4xIChBcHBsZSBHaXQtMTE3KQ0KDQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs

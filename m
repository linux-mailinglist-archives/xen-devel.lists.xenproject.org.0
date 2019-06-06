Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5A3372BF
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jun 2019 13:25:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYqTc-0006L0-Q4; Thu, 06 Jun 2019 11:22:36 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ATwH=UF=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hYqTb-0006Kv-Hw
 for xen-devel@lists.xenproject.org; Thu, 06 Jun 2019 11:22:35 +0000
X-Inumbo-ID: 6195447a-884d-11e9-8980-bc764e045a96
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6195447a-884d-11e9-8980-bc764e045a96;
 Thu, 06 Jun 2019 11:22:34 +0000 (UTC)
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
IronPort-SDR: xbQF7ikCOi0SbNi0hUjmDvKbt9OwC9byOTOULweGIq+bJv7PFUIOHWcvI9B1rLV1JGWdtSjnh0
 ehJahyw7XOkLIqvqeO4I5WDACR3FG6A2tobRIiktvOEjgUQG9JrRqyTyKJWgAcq4qXTHZ2JmpB
 JGnUInbwhRGilvBRp5XDw8Tdqnfvq0aCBsRYedY1PNCLLvRZNU8NrfzIC26pqHFYKJekO+mS+m
 vVuVfGAFViCJTNw7NDjdrCK94wRq+aV4/O3fmvTv+XPbnyrI5sFOqt5yZjjgoPTvAIaQ9lhX0j
 +D8=
X-SBRS: -0.9
X-MesageID: 1401834
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,559,1557201600"; 
   d="scan'208";a="1401834"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH v2 04/12] pci: make PCI_SBDF2 return a
 pci_sbdf_t
Thread-Index: AQHVHEa0DjJS7EJ5PEeTWCtwaOUxuaaOe04Q
Date: Thu, 6 Jun 2019 11:22:30 +0000
Message-ID: <4ca7756ef46f4bd4aa08fbf2ac838200@AMSPEX02CL03.citrite.net>
References: <20190606090146.77381-1-roger.pau@citrix.com>
 <20190606090146.77381-5-roger.pau@citrix.com>
In-Reply-To: <20190606090146.77381-5-roger.pau@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 04/12] pci: make PCI_SBDF2 return a
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew
 Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2ZWwgW21haWx0bzp4
ZW4tZGV2ZWwtYm91bmNlc0BsaXN0cy54ZW5wcm9qZWN0Lm9yZ10gT24gQmVoYWxmIE9mIFJvZ2Vy
IFBhdSBNb25uZQ0KPiBTZW50OiAwNiBKdW5lIDIwMTkgMTA6MDINCj4gVG86IHhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBDYzogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5j
b20+OyBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBXZWkgTGl1
DQo+IDx3bEB4ZW4ub3JnPjsgS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFj
bGUuY29tPjsgR2VvcmdlIER1bmxhcA0KPiA8R2VvcmdlLkR1bmxhcEBjaXRyaXguY29tPjsgQW5k
cmV3IENvb3BlciA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IElhbiBKYWNrc29uDQo+IDxJ
YW4uSmFja3NvbkBjaXRyaXguY29tPjsgVGltIChYZW4ub3JnKSA8dGltQHhlbi5vcmc+OyBKdWxp
ZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPjsgSmFuDQo+IEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPjsgUm9nZXIgUGF1IE1vbm5lIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gU3Vi
amVjdDogW1hlbi1kZXZlbF0gW1BBVENIIHYyIDA0LzEyXSBwY2k6IG1ha2UgUENJX1NCREYyIHJl
dHVybiBhIHBjaV9zYmRmX3QNCj4gDQo+IEFuZCBmaXggaXQncyBvbmx5IGNhbGxlci4NCj4gDQo+
IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0K
PiAtLS0NCj4gQ2M6IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPg0KPiBDYzogQW5k
cmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCj4gQ2M6IEdlb3JnZSBEdW5s
YXAgPEdlb3JnZS5EdW5sYXBAZXUuY2l0cml4LmNvbT4NCj4gQ2M6IElhbiBKYWNrc29uIDxpYW4u
amFja3NvbkBldS5jaXRyaXguY29tPg0KPiBDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPg0KPiBDYzogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4NCj4gQ2M6IEtv
bnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4NCj4gQ2M6IFN0ZWZh
bm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4NCj4gQ2M6IFRpbSBEZWVnYW4g
PHRpbUB4ZW4ub3JnPg0KPiBDYzogV2VpIExpdSA8d2xAeGVuLm9yZz4NCj4gLS0tDQo+ICB4ZW4v
ZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvZG1hci5jIHwgMiArLQ0KPiAgeGVuL2luY2x1ZGUveGVu
L3BjaS5oICAgICAgICAgICAgICB8IDMgKystDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9w
YXNzdGhyb3VnaC92dGQvZG1hci5jIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2RtYXIu
Yw0KPiBpbmRleCA1OWE0NmNkMWM2Li5iODU4ZmU3YzgwIDEwMDY0NA0KPiAtLS0gYS94ZW4vZHJp
dmVycy9wYXNzdGhyb3VnaC92dGQvZG1hci5jDQo+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJv
dWdoL3Z0ZC9kbWFyLmMNCj4gQEAgLTEwNDcsNyArMTA0Nyw3IEBAIGludCBpbnRlbF9pb21tdV9n
ZXRfcmVzZXJ2ZWRfZGV2aWNlX21lbW9yeShpb21tdV9ncmRtX3QgKmZ1bmMsIHZvaWQgKmN0eHQp
DQo+IA0KPiAgICAgICAgICByYyA9IGZ1bmMoUEZOX0RPV04ocm1yci0+YmFzZV9hZGRyZXNzKSwN
Cj4gICAgICAgICAgICAgICAgICAgIFBGTl9VUChybXJyLT5lbmRfYWRkcmVzcykgLSBQRk5fRE9X
TihybXJyLT5iYXNlX2FkZHJlc3MpLA0KPiAtICAgICAgICAgICAgICAgICAgUENJX1NCREYyKHJt
cnItPnNlZ21lbnQsIGJkZiksIGN0eHQpOw0KPiArICAgICAgICAgICAgICAgICAgUENJX1NCREYy
KHJtcnItPnNlZ21lbnQsIGJkZikuc2JkZiwgY3R4dCk7DQo+IA0KPiAgICAgICAgICBpZiAoIHVu
bGlrZWx5KHJjIDwgMCkgKQ0KPiAgICAgICAgICAgICAgcmV0dXJuIHJjOw0KPiBkaWZmIC0tZ2l0
IGEveGVuL2luY2x1ZGUveGVuL3BjaS5oIGIveGVuL2luY2x1ZGUveGVuL3BjaS5oDQo+IGluZGV4
IDllYTQxNzg5ZDAuLjMwYWZhY2E4MzggMTAwNjQ0DQo+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9w
Y2kuaA0KPiArKysgYi94ZW4vaW5jbHVkZS94ZW4vcGNpLmgNCj4gQEAgLTM2LDcgKzM2LDggQEAN
Cj4gICNkZWZpbmUgUENJX0JERjIoYixkZikgICgoKChiKSAmIDB4ZmYpIDw8IDgpIHwgKChkZikg
JiAweGZmKSkNCj4gICNkZWZpbmUgUENJX1NCREYocyxiLGQsZikgXA0KPiAgICAgICgocGNpX3Ni
ZGZfdCkgeyAuc2JkZiA9ICgoKHMpICYgMHhmZmZmKSA8PCAxNikgfCBQQ0lfQkRGKGIsZCxmKSB9
KQ0KPiAtI2RlZmluZSBQQ0lfU0JERjIocyxiZGYpICgoKChzKSAmIDB4ZmZmZikgPDwgMTYpIHwg
KChiZGYpICYgMHhmZmZmKSkNCj4gKyNkZWZpbmUgUENJX1NCREYyKHMsYmRmKSBcDQo+ICsgICAg
KChwY2lfc2JkZl90KSB7IC5zYmRmID0gKCgocykgJiAweGZmZmYpIDw8IDE2KSB8ICgoYmRmKSAm
IDB4ZmZmZikgfSkNCg0KUGVyaGFwcy4uLg0KDQooKHBjaV9zYmRmX3QpIHsgLnNlZyA9IHMsIC5i
ZGYgPSBiZGYgfSkNCg0KPiAgI2RlZmluZSBQQ0lfU0JERjMocyxiLGRmKSAoKCgocykgJiAweGZm
ZmYpIDw8IDE2KSB8IFBDSV9CREYyKGIsIGRmKSkNCj4gDQo+ICB0eXBlZGVmIHVuaW9uIHsNCj4g
LS0NCj4gMi4yMC4xIChBcHBsZSBHaXQtMTE3KQ0KPiANCj4gDQo+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+IFhlbi1kZXZlbCBtYWlsaW5nIGxpc3QN
Cj4gWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IGh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWwNCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

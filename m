Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B382678663
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 09:34:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs08a-0000Ud-Ug; Mon, 29 Jul 2019 07:32:04 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=33BZ=V2=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1hs08Z-0000UY-84
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 07:32:03 +0000
X-Inumbo-ID: f4c118a7-b1d2-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f4c118a7-b1d2-11e9-8980-bc764e045a96;
 Mon, 29 Jul 2019 07:32:02 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=lars.kurth@citrix.com;
 spf=Pass smtp.mailfrom=lars.kurth@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 lars.kurth@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 lars.kurth@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 7Du9HUfNCya2xkugMHux/NvjITHe1qwjwiLooIxeUKkMP3cflUZpy0TZOZFUUvRikd7FSKoKd4
 XwJsnefSNjo5T1dRwFaQZU/0Jzj4sAN3IKfJHOxCc123NOdZT008amTH75ct0Sak1EK7wW4lm3
 kbPwCgAueu/gVqOZFJPv0/2N2y62dB8AZUiDcgGgLW34QjLYw0WHlQyXGEeEFPc14GEMc5NMdh
 9eR3UqDh+owBgaq+IfSxpFh2GdmAMrfyhI0/IaFER+7wDZPx580Gut4D31h/v6/4iEfnAdghJe
 3XE=
X-SBRS: 2.7
X-MesageID: 3539115
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,321,1559534400"; 
   d="scan'208";a="3539115"
From: Lars Kurth <lars.kurth@citrix.com>
To: Julien Grall <julien.grall@arm.com>, Viktor Mitin
 <viktor.mitin.19@gmail.com>
Thread-Topic: [Xen-devel] [RFC] xen: Add .astylerc for automated
 style-formatting
Thread-Index: AQHVPXn2jJssZBgvR0Grzx5Y//8PX6bQWn2AgAAH0ICAABvVAIAA/1oAgAuQybSABCVqgA==
Date: Mon, 29 Jul 2019 07:31:57 +0000
Message-ID: <D70D14A6-603E-4A9D-BFAE-C145D0ED2872@citrix.com>
References: <20190718144317.23307-1-tamas@tklengyel.com>
 <119d0edb-cb12-fbad-9e3e-8c0a469983df@arm.com>
 <CABfawh=DwOP5eQYmMVNF+n-khkbEDFia0eo=JbE0yhCKjV_+8Q@mail.gmail.com>
 <fcbf4968-7b82-6e5d-75ae-e4c2ff059b4d@arm.com>
 <CABfawhnk+_ssU1xEzN6O+_JkH4jT2NguP30VRpkNKzc7xoKeXw@mail.gmail.com>
 <d60c933e-7f30-191c-2d75-4558223ef3e4@arm.com>
 <CAOcoXZYA4oC+ZXkfS4CQVs6JhkR+pAONgyg1ZfWzo+Q=GcAWQA@mail.gmail.com>
 <9e9d6fbf-ecdb-4e3f-89ae-beb13243d9e1@arm.com>
In-Reply-To: <9e9d6fbf-ecdb-4e3f-89ae-beb13243d9e1@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.c.190715
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <05BF44238F371B4A9C75C0B04353E013@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [RFC] xen: Add .astylerc for automated
 style-formatting
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
Cc: Artem Mygaiev <Artem_Mygaiev@epam.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Wei
 Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim
 \(Xen.org\)" <tim@xen.org>, George
 Dunlap <George.Dunlap@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Jan
 Beulich <jbeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 Iurii Artemenko <Iurii_Artemenko@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCu+7v09uIDI2LzA3LzIwMTksIDE2OjEyLCAiSnVsaWVuIEdyYWxsIiA8anVsaWVuLmdyYWxs
QGFybS5jb20+IHdyb3RlOg0KDQogICAgSGkgVmlrdG9yLA0KICAgIA0KICAgIE9uIDI2LzA3LzIw
MTkgMTU6NTgsIFZpa3RvciBNaXRpbiB3cm90ZToNCiAgICA+IE9uIEZyaSwgSnVsIDE5LCAyMDE5
IGF0IDExOjM3IEFNIEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOg0K
ICAgID4+DQogICAgPj4gSGkgVGFtYXMsDQogICAgPj4NCiAgICA+PiBPbiAxOC8wNy8yMDE5IDE4
OjIyLCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6DQogICAgPj4+PiAgICAgIC0gTGluZSAxMzk6IFRo
ZSB7IGFyZSBjb21tb25seSBvbiB0aGUgc2FtZSBsaW5lIGFzIHN0cnVjdCBvciBkZWZpbml0aW9u
Lg0KICAgID4+Pg0KICAgID4+PiBBY2NvcmRpbmcgdG8gQ09ESU5HX1NUWUxFIHRoYXQncyBub3Qg
aG93IGl0IHNob3VsZCBiZS4NCiAgICA+Pg0KICAgID4+IEkgZ3Vlc3MgeW91IHJlZmVyIHRvIHRo
ZSBzZWN0aW9uICJCcmFjaW5nIi4gSWYgc28sIEkgdGhpbmsgd2UgZG9uJ3QgZm9sbG93IHRoZQ0K
ICAgID4+IENPRElOR19TVFlMRSBmb3Igc3RydWN0IG9yIGRlZmluaXRpb24uDQogICAgPj4NCiAg
ICA+PiBJIGhhdmUgdG8gYWRtaXQgdGhhdCBmb3IgdGhpcyBjYXNlLCBJIGFsd2F5cyBoYXZlIHRv
IGxvb2sgYXQgb3RoZXIgdXNhZ2UgaW4gdGhlDQogICAgPj4gY29kZSBiZWNhdXNlIEkgdGVuZCB0
byBwdXQgdGhlIHsgb24gYSBuZXdsaW5lLg0KICAgID4+DQogICAgPj4gSSB3YXMgZ29pbmcgdG8g
c2F5IHRoYXQgdGhlcmUgbWF5IGJlIHNvbWUgY2FzZXMgd2hlcmUgaXQgbWFrZXMgc2Vuc2UgdG8g
a2VlcCB7DQogICAgPj4gb24gdGhlIHNhbWUgbGluZS4gRm9yIGluc3RhbmNlOg0KICAgID4+DQog
ICAgPj4gICAgICB7IGEsIGIsIGMsIGQgfSwNCiAgICA+PiAgICAgIHsgZSwgZiwgZywgaCB9LA0K
ICAgID4+DQogICAgPiANCiAgICA+IEFsbCB0aGUgcnVsZXMgc2hvdWxkIGJlIHN0YXRlZCBpbiBD
T0RJTkdfU1RZTEUgZXhwbGljaXRseS4NCiAgICA+IEluIG90aGVyIGNhc2VzLCBpdCBjYW5ub3Qg
YmUgYXV0b21hdGVkIHdpdGggZnV0dXJlIHByb3ZlcyB3aHkgaXQgd29ya3MNCiAgICA+IHRoaXMg
b3IgdGhhdCB3YXkuDQogICAgDQogICAgVGhpcyBpcyBub3QgdmVyeSBjb25zdHJ1Y3RpdmUgdG8g
c2VuZCBvbiBtdWx0aXBsZSBkaWZmZXJlbnQgdGhyZWFkcyAidGhpcyBzaG91bGQgDQogICAgYmUg
ZXhwbGljaXRseSBiZSBpbiB0aGUgQ09ESU5HX1NUWUxFIi4gTW9zdCBvZiB0aGUgcGVvcGxlIGlu
IENDIGFyZSBhd2FyZSB0aGlzIA0KICAgIGlzIGFuIGlzc3VlLg0KICAgIA0KICAgIEJ1dCB0aGUg
cHJvYmxlbSBoZXJlIGlzIGNvZGlmeWluZyB0aG9zZSBzdHlsZXMuIFRoaXMgb2Z0ZW4gcmVzdWx0
cyBpbiBhIGxvdCBvZiANCiAgICBkaXNjdXNzaW9ucyBiZWNhdXNlIGEgbG90IGlzIGEgbWF0dGVy
IG9mIHRhc3RlLiBJbiBvdGhlciB0aGVyZSBhcmUgbm8gYW5zd2VycyB0byANCiAgICB0aGUgcGF0
Y2hlcy4NCiAgICANCiAgICBXaGF0IHdlIG5lZWQgaXMgc29tZW9uZSB0byBkcml2ZSB0aGlzIGVm
Zm9ydCBhbmQgbWFrZSBzdXJlIHdlIG1ha2Ugc29tZSBwcm9ncmVzcy4NCiAgICANCiAgICBBbHNv
LCB0cnlpbmcgdG8gY29kaWZ5IGFsbCB0aGUgdW53cml0dGVuIHN0eWxlcyBpcyBwcm9iYWJseSBn
b2luZyB0byBiZSANCiAgICBkaWZmaWN1bHQuIEluc3RlYWQsIEkgd291bGQgc3VnZ2VzdCB0byBz
dGFydCBmcm9tIGFuIGV4aXN0aW5nIGNvZGluZyBzdHlsZSB0aGF0IA0KICAgIGlzIHZlcnkgY2xv
c2UgdG8gWGVuIChtYXliZSBCU0Q/KS4NCiAgICANCk9LLiBNYXliZSB0aGlzIGlzIHNvbWV0aGlu
ZyBJIHNob3VsZCBkcml2ZSwgaWYgdGhlcmUgaXMgaW4gZmFjdCBzb21lIHNvcnQgb2YgYWdyZWVt
ZW50IHRoYXQgdGhpcyBtYWtlcyBzZW5zZS4NCg0KSSBhZ3JlZSB0aGF0IGNvZGlmeWluZyB0aGUg
c3R5bGVzIGlzIHByb2JsZW1hdGljLCBhcyBpdCBlbmNvdXJhZ2VzIGJpa2Ugc2hlZGRpbmcuIE1h
eWJlIHRoaXMgaXMgc29tZXRoaW5nIA0Kd2hlcmUgd2UgY291bGQgdHJ5IHNvbWV0aGluZyB2b3Rl
IGJhc2VkLCBha2EgbWFrZSBhIGxpc3Qgb2YgY29kaWZpZWQgcnVsZXMuIEhhdmUgZXZlcnlvbmUg
dm90ZSBpbiB0aGUgdXN1YWwNCndheSBvZiAtMiAuLi4gKzIgb24gaXQuDQoNCkFsc28sIHdlIGNh
bid0IGltcGxlbWVudCBjaGVja2luZyB0b29scywgaWYgdGhlIHN0eWxlcyBhcmUgbm90IGRvY3Vt
ZW50ZWQuIENoZWNraW5nIHRvb2xzIHNob3VsZCBmcmVlIHVwDQpyZXZpZXdlciB0aW1lLg0KDQpM
YXJzDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

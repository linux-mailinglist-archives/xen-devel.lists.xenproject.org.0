Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DDE72F57
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2019 14:58:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqGmV-00013H-7u; Wed, 24 Jul 2019 12:54:07 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=E+1q=VV=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1hqGmT-00013C-D1
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2019 12:54:05 +0000
X-Inumbo-ID: 1d892e0d-ae12-11e9-8980-bc764e045a96
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1d892e0d-ae12-11e9-8980-bc764e045a96;
 Wed, 24 Jul 2019 12:54:04 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=lars.kurth@citrix.com;
 spf=Pass smtp.mailfrom=lars.kurth@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 lars.kurth@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 lars.kurth@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: OmjZnL8EsmEZczSlHw1TLXzOa2TFXarvUs3in6jFSKqKUSR9ooXMihF39qDlR2Vw7f+bZgZ2/B
 YWmeiwcBhSPqQhirIimJ4P2uWwiKCs3SFsVoGMvjeCRIneKwz4NHRaipFwVdw8KYLMY0Yytbof
 17UXCepCzyGNql7j7n+6QshqX/MJbFbZMluEynVgNiRI26kCO4k0pY4xkClzkMoIo01/KDGhpX
 joNGadLpfkj+whANjJP/fHsHopPg9S3fxWs+277KA5upDS/XNZjWVco/ikYp3uRZ42pCrwSXXX
 UiU=
X-SBRS: 2.7
X-MesageID: 3469997
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,302,1559534400"; 
   d="scan'208";a="3469997"
From: Lars Kurth <lars.kurth@citrix.com>
To: Rich Persaud <persaur@gmail.com>, Julien Grall <julien.grall@arm.com>,
 Iurii Artemenko <Iurii_Artemenko@epam.com>, Artem Mygaiev
 <Artem_Mygaiev@epam.com>, Lars Kurth <lars.kurth.xen@gmail.com>
Thread-Topic: [Xen-devel] [RFC] xen: Add .astylerc for automated
 style-formatting
Thread-Index: AQHVPXn2jJssZBgvR0Grzx5Y//8PX6bQWn2AgAAH0ICAACMhgIAA+jaAgABHqoCAAAM6AIAAALmAgAACzwCAAAH2gIAABTyAgAfcv4A=
Date: Wed, 24 Jul 2019 12:53:59 +0000
Message-ID: <BB40B125-3F09-44E9-8E1E-46418E6DD75B@citrix.com>
References: <20190718144317.23307-1-tamas@tklengyel.com>
 <119d0edb-cb12-fbad-9e3e-8c0a469983df@arm.com>
 <CABfawh=DwOP5eQYmMVNF+n-khkbEDFia0eo=JbE0yhCKjV_+8Q@mail.gmail.com>
 <fcbf4968-7b82-6e5d-75ae-e4c2ff059b4d@arm.com>
 <CABfawh=R-K3nje0gdsi-26Zj7-y6=KkiW=-s0TLK1o3QgVXLmw@mail.gmail.com>
 <27973ea5-a0d4-0ca4-fd3f-9680f179b283@arm.com>
 <CABfawhk4TzQemnG+3XwtQ4SGmquufOd4nFGajEWJJ++YFuqfZw@mail.gmail.com>
 <a0c71023-2546-d7c4-771c-02a944c93d90@arm.com>
 <CABfawhm+e4YfnPGT9K-aWqipAFJp1tqfFr9dNDm6g0Twb2gGoA@mail.gmail.com>
 <d9f6faf8-c784-7998-e184-19702a625ca9@arm.com>
 <6cabe11e-af20-2096-5516-02c0deaf6fca@arm.com>
 <0BAD4AC1-5181-48AA-98FE-DD64133194CB@gmail.com>
In-Reply-To: <0BAD4AC1-5181-48AA-98FE-DD64133194CB@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.c.190715
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <DD7DED1A717C404CBC14D444DE9FCA58@citrix.com>
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
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Daniel Smith <dpsmith@apertussolutions.com>, Andrew
 Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>,
 "Jeff.Kubascik@dornerworks.com" <Jeff.Kubascik@dornerworks.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>, Doug Goldstein <cardoe@cardoe.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCu+7v09uIDE5LzA3LzIwMTksIDE0OjUwLCAiUmljaCBQZXJzYXVkIiA8cGVyc2F1ckBnbWFp
bC5jb20+IHdyb3RlOg0KDQogICAgT24gSnVsIDE5LCAyMDE5LCBhdCAwOTozMSwgSnVsaWVuIEdy
YWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6DQogICAgPj4gT24gMTkvMDcvMjAxOSAx
NDoyNCwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KICAgID4+IEhpIFRhbWFzLA0KICAgID4+PiBPbiAx
OS8wNy8yMDE5IDE0OjE0LCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6DQogICAgPj4+PiBPbiBGcmks
IEp1bCAxOSwgMjAxOSBhdCA3OjExIEFNIEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5j
b20+IHdyb3RlOg0KICAgID4+Pj4gDQogICAgPj4+PiBIaSBUYW1hcywNCiAgICA+Pj4+IA0KICAg
ID4+Pj4+IE9uIDE5LzA3LzIwMTkgMTQ6MDAsIFRhbWFzIEsgTGVuZ3llbCB3cm90ZToNCiAgICA+
Pj4+Pj4gT24gRnJpLCBKdWwgMTksIDIwMTkgYXQgMjo0MyBBTSBKdWxpZW4gR3JhbGwgPGp1bGll
bi5ncmFsbEBhcm0uY29tPiB3cm90ZToNCiAgICA+Pj4+Pj4gDQogICAgPj4+Pj4+IEhpIFRhbWFz
LA0KICAgID4+Pj4+PiANCiAgICA+Pj4+Pj4gT24gMTgvMDcvMjAxOSAxODo0OCwgVGFtYXMgSyBM
ZW5neWVsIHdyb3RlOg0KICAgID4+Pj4+Pj4+ICAgICAgIC0gTGluZSAxMDI1OiBUaGUgdG9vbHMg
bmVlZHMgdG8gYmUgYWJsZSB0byBkZWFsIGZvcl9lYWNoX3ZjcHUoLi4uKSAmIGNvLg0KICAgID4+
Pj4+Pj4gDQogICAgPj4+Pj4+PiBUaGVzZSBjYW4gYmUgbWFkZSBPSyBieSBhZGRpbmcgYnJhY2Vz
LiBPdGhlciB0aGFuIHRoYXQgdGhlIG9ubHkgd2F5IEkNCiAgICA+Pj4+Pj4+IGZvdW5kIHRvIG1h
a2UgaXQgbm90IGNoYW5nZSB0aGUgaW5kZW50YXRpb24gaXMgdG8gYWRkIHRoZSBjb21tZW50ICIv
Kg0KICAgID4+Pj4+Pj4gKklOREVOVC1PRkYqICovIiBiZWZvcmUgdGhlIGJsb2NrIGFuZCAiLyog
KklOREVOVC1PTiogKi8iIGFmdGVyd2FyZHMuDQogICAgPj4+Pj4+IA0KICAgID4+Pj4+PiBOb25l
IG9mIHRoZW0gbG9va3MgcmVhbGx5IGFwcGVhbGluZyBiZWNhdXNlIGl0IG1lYW5zIGFzdHlsZSB3
aWxsIG5vdCBjb3JyZWN0bHkNCiAgICA+Pj4+Pj4gaW5kZW50IGlmIHRoZSB1c2VyIGRvZXMgbm90
IGFkZCBicmFjZXMgb3IgY29tbWVudHMuDQogICAgPj4+Pj4+IA0KICAgID4+Pj4+PiBDb3VsZCBh
c3R5bGUgYmUgZWFzaWx5IG1vZGlmaWVkIHRvIHJlY29nbml6ZSBmb3JlYWNoIG1hY3Jvcz8NCiAg
ICA+Pj4+PiANCiAgICA+Pj4+PiBOb3QgdGhhdCBJJ20gYXdhcmUgb2YuIElmIHlvdSBkb24ndCB3
YW50IHRvIG1hbnVhbGx5IGFubm90YXRlIGZpbGVzDQogICAgPj4+Pj4gd2l0aCB1bnN1cHBvcnRl
ZCBtYWNyb3MgdGhlbiBqdXN0IGV4Y2x1ZGUgdGhvc2UgZmlsZXMgZnJvbSBhc3R5bGUuIEkNCiAg
ICA+Pj4+PiB3b3VsZG4ndCByZWNvbW1lbmQgYWRkaW5nIHRoaXMgdG8gdGhlIENJIGZvciBhbGwg
ZmlsZXMsIG9ubHkgZm9yIHRob3NlDQogICAgPj4+Pj4gdGhhdCB0aGVpciByZXNwZWN0aXZlIG1h
aW50YWluZXJzIGhhdmUgY29uZmlybWVkIHRvIGNvbmZvcm0gdG8gdGhlDQogICAgPj4+Pj4gc3R5
bGUgYW5kIHdhbnQgdG8gZW5mb3JjZSBpdCBnb2luZyBmb3J3YXJkLg0KICAgID4+Pj4gDQogICAg
Pj4+PiBTbyBhIGNvdXBsZSB1c2Ugb2YgYW4gdW5zdXBwb3J0ZWQgbWFjcm9zIHdvdWxkIG1ha2Ug
aW1wb3NzaWJsZSB0byBlbmZvcmNlIHRoZQ0KICAgID4+Pj4gY29kaW5nIHN0eWxlLiBUaGlzIGlz
IG5vdCBhIHZlcnkgaWRlYWwgcG9zaXRpb24gdG8gYmUgaW4uDQogICAgPj4+PiANCiAgICA+Pj4+
IF9pZl8gd2UgYXJlIGdvaW5nIHRvIGFkb3B0IGFzdHlsZSB0aGVuIHdlIG5lZWQgdG8gYmUgYWJs
ZSB0byBlbmZvcmNlIGl0IG9uIGV2ZXJ5DQogICAgPj4+PiBYZW4gZmlsZXMgbG9uZy10ZXJtLiBJ
ZiBpdCBpcyBub3QgcG9zc2libGUgdG8gZG8gaXQgd2l0aCBhc3R5bGUsIHRoZW4gbWF5YmUgdGhp
cw0KICAgID4+Pj4gaXMgbm90IHRoZSByaWdodCB0b29sIHRvIHVzZS4NCiAgICA+Pj4+IA0KICAg
ID4+Pj4gRm9yIGluc3RhbmNlLCBJIGtub3cgdGhhdCB0b29scyBzdWNoIGFzIGNsYW5nLWZvcm1h
dCBpcyBhYmxlIHRvIGRlYWwgd2l0aA0KICAgID4+Pj4gZm9yZWFjaCBtYWNyb3MuDQogICAgPj4+
IA0KICAgID4+PiBJZiB0aGVyZSBhcmUgYmV0dGVyIHRvb2xzIHRoZW4gc3VyZSwgSSBkb24ndCBy
ZWFsbHkgbWluZCB1c2luZw0KICAgID4+PiBzb21ldGhpbmcgZWxzZS4gSSBqdXN0IGRvbid0IGhh
dmUgdGltZSB0byBkbyB0aGUgbWFudWFsIHN0eWxlIGNoZWNrDQogICAgPj4+IGJhY2stYW5kLWZv
cnRoIGFueW1vcmUsIHNvIHRoZSBzb29uZXIgd2UgaGF2ZSBzb21ldGhpbmcgaW4gcGxhY2UgdGhl
DQogICAgPj4+IGJldHRlci4NCiAgICA+PiBJIHRvdGFsbHkgYWdyZWUgd2UgbmVlZCBhIHRvb2wg
c28gdGhlIHJldmlld2VyIGNhbiBmcmVlLXVwIHNvbWUgdGltZSB0byBmb2N1cyBvbiBtb3JlIGlt
cG9ydGFudCB0aGluZ3MuIEhvd2V2ZXIsIEkgdGhpbmsgd2Ugc2hvdWxkIGJlIGNhcmVmdWwgb24g
d2hhdCB3ZSBhZG9wdCBoZXJlLg0KICAgID4+IFNpbWlsYXIgdG8gQW5kcmV3LCBJIGFtIG9wZW4g
d2l0aCBtb2RpZnlpbmcgdGhlIGNvZGluZyBzdHlsZSB0byBoZWxwIHRoZSBhdXRvbWF0aWMgc3R5
bGUgY2hlY2suIEJ1dCBJIGFtIG5vdCBoYXBweSB0byBkaXNhYmxlIGF1dG9tYXRpYyBzdHlsZSBv
biBwYXJ0IChvciBlbnRpcmUpIG9mIGZpbGVzIGZvcmV2ZXIuDQogICAgPj4gQXQgdGhlIG1vbWVu
dCwgY2xhbmctZm9ybWF0IGZlZWxzIG1vcmUgcG93ZXJmdWwgYW5kIHRoZXJlIGFyZSBwZW9wbGUg
d29ya2luZyBvbiBpdC4NCiAgICA+IA0KICAgID4gRllJLCBiZWxvdyBhIGxpbmsgdG8gdGhlIGNs
YW5nLWZvcm1hdCBjaGFuZ2VzOg0KICAgID4gDQogICAgPiBodHRwczovL2dpdGh1Yi5jb20veGVu
LXRyb29wcy9YZW4tQ2xhbmctZm9ybWF0L2Jsb2IvZGV2ZWwvY2xhbmctZm9ybWF0LnBhdGNoDQog
ICAgDQogICAgV2VyZSB0aGVzZSBjbGFuZy1mb3JtYXQgY2hhbmdlcyBkb25lIGZvciBGdVNhIHdv
cms/ICBBcmUgdGhleSBpbnRlbmRlZCB0byBiZSBydW4gd2l0aGluIE9TU3Rlc3QgYW5kL29yIFhl
bidzIEdpdGxhYiBDSSwgd2hpY2ggZG8gbm90IGN1cnJlbnRseSBzdXBwb3J0IE9wZW5FbWJlZGRl
ZC9Zb2N0byBhbmQgeGVuLXRyb29wcz8NCg0KTm8sIHRoZXkgd2VyZSBkb25lIGZvbGxvd2luZyBh
IGRpc2N1c3Npb24gYXQgYSBwcmV2aW91cyBzdW1taXQgYW5kIHRoZW4gbm90aGluZyBtb3ZlZCBm
b3IgdHdvIHllYXJzDQpUaGUgaWRlYSB3YXMgdG8gYXZvaWQgcmV2aWV3ZXJzIGhhdmluZyB0byBk
byBtZWNoYW5pY2FsIHRhc2tzIHN1Y2ggYXMgcmV2aWV3IHN0eWxpbmcNCiAgICANCiAgICBJdCB3
b3VsZCBiZSBoZWxwZnVsIHRvIGhhdmUgYSB4ZW4tZGV2ZWwgdGhyZWFkIG9uIHRoZSBtb3RpdmF0
aW9uIGZvciB0aGUgY2xhbmctZm9ybWF0IHdvcmssIHRoZSBzcGVjaWZpYyBzdHlsZSBiZWluZyBl
bmZvcmNlZCAoaW5jbHVkaW5nIHRoZSBudWFuY2VzIGRpc2N1c3NlZCBpbiB0aGlzIHRocmVhZCkg
YW5kIGFkZGl0aW9uYWwgd29yayBuZWVkZWQgYmVmb3JlIGNsYW5nLWZvcm1hdCBjYW4gcGVyZm9y
bSBhdXRvbWF0ZWQgc3R5bGUgY2hlY2tpbmcgdG8gYWRkcmVzcyAoYSkgZXhpc3RpbmcgWGVuL0xp
bnV4IHN0eWxlIHJlcXVpcmVtZW50cywgKGIpIEZ1U2EgcmVxdWlyZW1lbnRzLg0KDQpVbHRpbWF0
ZWx5LCB3ZSB3YW50IHRvIGludGVncmF0ZSB0aGlzIGludG8gdGhlIENJdjIgd2UgZGlzY3Vzc2Vk
IGFuZCBhZ3JlZWQgYXQgdGhlIHN1bW1pdC4gQWthIGFuIGF1dG9tYXRpYyBzdHlsZSBjaGVjayB0
cmlnZ2VyZWQgYnkgYSBtYWlsaW5nIGxpc3QgcG9zdCBhbG9uZ3NpZGUgYnVpbGQgY2hlY2tzIGFu
ZCBiYXNpYyBzbW9rZSB0ZXN0cyBvbiB0b3Agb2YgUUVNVS4gSSBzdGlsbCBuZWVkIHRvIGdldCBv
biB0b3Agb2YgdGhlIG5vdGVzDQoNCkxhcnMNClAuUy46IFNvcnJ5LCBjYXRjaGluZyB1cCBvbiBt
YWlsaW5nIGxpc3QgYW5kIHN0dWZmIGFmdGVyIGEgMiB3ZWVrIHRyaXANCg0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

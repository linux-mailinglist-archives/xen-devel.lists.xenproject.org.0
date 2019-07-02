Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F0A5CDE9
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2019 12:52:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hiGLU-0004lw-0s; Tue, 02 Jul 2019 10:49:08 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=A/Ug=U7=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hiGLS-0004lp-RK
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2019 10:49:06 +0000
X-Inumbo-ID: 03148550-9cb7-11e9-8980-bc764e045a96
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 03148550-9cb7-11e9-8980-bc764e045a96;
 Tue, 02 Jul 2019 10:49:05 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: czYqwbZIJ5CkvaLr5ZiJ4rFXBNGt8hjxpaYwCJkihhjIgsH4RQgv4qQmTt57NKGtAN5mD0bl2V
 sHMfD33AShh34eHwD4rdDi7SNlQsdq3CeqwJhZwSc9w3hm9qvQmmGz2dDmSL6zNBybvkGKZhiH
 Q6XfiZku9uzstVHylpVxk7YTlWLAhEgikIw/XfUQFJvj7kNw8kV0t8bEmjnFmMmsozyM4hUR7Z
 p/YHM2lOYeVnVrmKDSBMVGKyjQMG4ZmrkszgGXy5ocW3jaAk07Ow71PZhtqe0vhd0zoY4b9jgd
 DAg=
X-SBRS: 2.7
X-MesageID: 2536507
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,443,1557201600"; 
   d="scan'208";a="2536507"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Jan Beulich' <JBeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH 4/6] x86: move INVPCID_TYPE_* to x86-defns.h
Thread-Index: AQHVMASHk433so6yJUGaLfT0O8g9jqa3J1WQ
Date: Tue, 2 Jul 2019 10:49:03 +0000
Message-ID: <36253cfd31f5479b85f0a986e42fc039@AMSPEX02CL03.citrite.net>
References: <2d69ac51-9c4a-96f9-fd37-578658076571@suse.com>
 <630dddd7-3467-9204-c9da-3b776dade6a8@suse.com>
In-Reply-To: <630dddd7-3467-9204-c9da-3b776dade6a8@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 4/6] x86: move INVPCID_TYPE_* to x86-defns.h
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
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8SkJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDAxIEp1bHkgMjAxOSAxMjo1Nw0KPiBUbzogeGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IENjOiBBbmRyZXcgQ29vcGVyIDxBbmRyZXcuQ29vcGVy
M0BjaXRyaXguY29tPjsgUGF1bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT47IFJv
Z2VyIFBhdSBNb25uZQ0KPiA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyBXZWkgTGl1IDx3bEB4ZW4u
b3JnPg0KPiBTdWJqZWN0OiBbUEFUQ0ggNC82XSB4ODY6IG1vdmUgSU5WUENJRF9UWVBFXyogdG8g
eDg2LWRlZm5zLmgNCj4gDQo+IFRoaXMgd2F5IHRoZSBpbnNuIGVtdWxhdG9yIGNhbiB0aGVuIHRv
byB1c2UgdGhlICNkZWZpbmUtcy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJy
YW50QGNpdHJpeC5jb20+DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs

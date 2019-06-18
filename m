Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C28B49FC0
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2019 13:54:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdCeZ-0004ad-Mg; Tue, 18 Jun 2019 11:51:55 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6zAf=UR=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hdCeX-0004aY-UM
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2019 11:51:53 +0000
X-Inumbo-ID: 7598387e-91bf-11e9-8980-bc764e045a96
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7598387e-91bf-11e9-8980-bc764e045a96;
 Tue, 18 Jun 2019 11:51:52 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: cBgWoWbFktZMXEGX7iMTEOXfOkNzuc4eqhOtFAFPrIqbhQCH0dVe+w2axLEq9nx3dhQmB25/zg
 SlwXCuZdKvdyEg2ZqmddI7/Titysa2wJYdrr1MMZkDcUgXTeAQrSC+GbckBG4jzS9VGrclx0IZ
 O1wulcGQPzzZ8ZGHPB02U2t2d97rPeYkv3c8N3uNKtWT4jaF+PDIUdU1moG8Iq7alvZxpImIVo
 oocrOk597S2uZeuSte60rP5IolOuAF7A0QXjBrhOtWYoMTDrLCdD6iC7mw7hITHSFAt0eEqEOT
 Mb8=
X-SBRS: 2.7
X-MesageID: 1866243
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,389,1557201600"; 
   d="scan'208";a="1866243"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Anthony Perard <anthony.perard@citrix.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Thread-Topic: [PATCH v2 3/4] xen: Drop includes of xen/hvm/params.h
Thread-Index: AQHVJchNDl2we0AoKEKy0mWoK7a/+aahTL6Q
Date: Tue, 18 Jun 2019 11:51:48 +0000
Message-ID: <2d5c7b6b814048d38dd60dfb8607f6a1@AMSPEX02CL03.citrite.net>
References: <20190618112341.513-1-anthony.perard@citrix.com>
 <20190618112341.513-4-anthony.perard@citrix.com>
In-Reply-To: <20190618112341.513-4-anthony.perard@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 3/4] xen: Drop includes of
 xen/hvm/params.h
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEFudGhvbnkgUEVSQVJEIFttYWls
dG86YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbV0KPiBTZW50OiAxOCBKdW5lIDIwMTkgMTI6MjQK
PiBUbzogcWVtdS1kZXZlbEBub25nbnUub3JnCj4gQ2M6IEFudGhvbnkgUGVyYXJkIDxhbnRob255
LnBlcmFyZEBjaXRyaXguY29tPjsgUGF1bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNv
bT47IFN0ZWZhbm8KPiBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgeGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCj4gU3ViamVjdDogW1BBVENIIHYyIDMvNF0geGVuOiBE
cm9wIGluY2x1ZGVzIG9mIHhlbi9odm0vcGFyYW1zLmgKPiAKPiB4ZW4tbWFwY2FjaGUuYyBkb2Vz
bid0IG5lZWRzIHBhcmFtcy5oLgo+IAo+IHhlbi1odm0uYyB1c2VzIGRlZmluZXMgYXZhaWxhYmxl
IGluIHBhcmFtcy5oIGJ1dCBzbyBpcyB4ZW5fY29tbW9uLmgKPiB3aGljaCBpcyBpbmNsdWRlZCBi
ZWZvcmUuIEhWTV9QQVJBTV8qIGZsYWdzIGFyZSBvbmx5IG5lZWRlZCB0byBtYWtlCj4geGNfaHZt
X3BhcmFtX3tnZXQsc2V0fSBjYWxscyBzbyBpbmNsdWRpbmcgb25seSB4ZW5jdHJsLmgsIHdoaWNo
IGlzCj4gd2hlcmUgdGhlIGRlZmluaXRpb24gdGhlIGZ1bmN0aW9uIGlzLCBzaG91bGQgYmUgZW5v
dWdoLgo+ICh4ZW5jdHJsLmggZG9lcyBpbmNsdWRlIHBhcmFtcy5oKQo+IAo+IFNpZ25lZC1vZmYt
Ynk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgoKUmV2aWV3ZWQt
Ynk6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

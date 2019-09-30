Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF38C2573
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 18:51:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEyrA-00087x-AO; Mon, 30 Sep 2019 16:49:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uEAI=XZ=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1iEyr8-00087a-To
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 16:49:02 +0000
X-Inumbo-ID: 348668ac-e3a2-11e9-97fb-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by localhost (Halon) with ESMTPS
 id 348668ac-e3a2-11e9-97fb-bc764e2007e4;
 Mon, 30 Sep 2019 16:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569862141;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=H+kAUQ2LX/b5hXLLkvf6DKLaSjgrOZuztGxKLZBnBKY=;
 b=K0CMCXcj30bpUz3+Gj0IHDIRMvbm+4pUdn9c4AhcmGmzLtx0LfChX1Oa
 tgIfRbSghybMqU2rzMa17kjYvKjv6NYPuGkZ1ty/Bij/m1DQGRygNF9O/
 wJAWNVy2NY+0AteIXb/ICygvpOPzu5a7ueQH63Mt4AGhc9jP1H/AeN8xd w=;
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
IronPort-SDR: 77hJVxLWysz5j4QSLu8rlcYFNHc/Zsxkm9arzNUYe+ltfiqYyf6gkVg41i6q5i40qpejfzGefD
 PqPzlfO3/1HODGU/P3fGLUnSCDj19w8SZt5mXPbyBDWL7aaKmjSRlmBgt5PDyiGQTbloEpOWcB
 aYLUIH3EdDQbR2H1ZM0ME7KVf2ci7q+q2e850EMf3fsW76+ItTVqNvOXJrkOz74Cvxe840g2Vi
 0W3dHcxjro74jRENOYv3/lWwcj/my7NQQqr95kcvPUq9s8m/k0UTQoTqWWQG3FTBmHS53nVJ0o
 qsk=
X-SBRS: 2.7
X-MesageID: 6615647
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,567,1559534400"; 
   d="scan'208";a="6615647"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Julien Grall' <julien.grall@arm.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH] Update my e-mail in MAINTAINERS
Thread-Index: AQHVd667jq6TpKgqg0K0T96h0120cadEbl9g
Date: Mon, 30 Sep 2019 16:48:58 +0000
Message-ID: <83f709aee54f4fe58640e7ca7e6dddbe@AMSPEX02CL03.citrite.net>
References: <20190930164502.408-1-julien.grall@arm.com>
In-Reply-To: <20190930164502.408-1-julien.grall@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] Update my e-mail in MAINTAINERS
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
Cc: "jgross@suse.com" <jgross@suse.com>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
 "julien@xen.org" <julien@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZl
bC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YgSnVsaWVuIEdyYWxs
DQo+IFNlbnQ6IDMwIFNlcHRlbWJlciAyMDE5IDE3OjQ1DQo+IFRvOiB4ZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcNCj4gQ2M6IGpncm9zc0BzdXNlLmNvbTsganVsaWVuQHhlbi5vcmc7IEp1
bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+OyBWb2xvZHlteXJfQmFiY2h1a0BlcGFt
LmNvbQ0KPiBTdWJqZWN0OiBbWGVuLWRldmVsXSBbUEFUQ0hdIFVwZGF0ZSBteSBlLW1haWwgaW4g
TUFJTlRBSU5FUlMNCj4gDQo+IEkgd2lsbCBzb29uIGxvc2UgYWNjZXNzIHRvIG15IEFybSBlLW1h
aWwgYWRkcmVzcy4gVXBkYXRlIGl0IHRvDQo+IGp1bGllbkB4ZW4ub3JnDQoNCmp1bGllbkB4ZW4u
b3JnLCBvciBqdWxpZW4uZ3JhbGxAeGVuLm9yZz8NCg0KICBQYXVsDQoNCj4gDQo+IFNpZ25lZC1v
ZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+DQo+IENjOiBqdWxpZW5A
eGVuLm9yZw0KPiAtLS0NCj4gIE1BSU5UQUlORVJTIHwgNiArKystLS0NCj4gIDEgZmlsZSBjaGFu
Z2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEv
TUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUw0KPiBpbmRleCA3MThmMGE0Y2ExLi4xZDI0NzIzMWQ2
IDEwMDY0NA0KPiAtLS0gYS9NQUlOVEFJTkVSUw0KPiArKysgYi9NQUlOVEFJTkVSUw0KPiBAQCAt
MTc1LDcgKzE3NSw3IEBAIEY6CXRvb2xzL2xpYnhjL3hjX2FyaW5jNjUzLmMNCj4gDQo+ICBBUk0g
KFcvIFZJUlRVQUxJU0FUSU9OIEVYVEVOU0lPTlMpIEFSQ0hJVEVDVFVSRQ0KPiAgTToJU3RlZmFu
byBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPg0KPiAtTToJSnVsaWVuIEdyYWxs
IDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4NCj4gK006CUp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxs
QHhlbi5vcmc+DQo+ICBSOglWb2xvZHlteXIgQmFiY2h1ayA8Vm9sb2R5bXlyX0JhYmNodWtAZXBh
bS5jb20+DQo+ICBTOglTdXBwb3J0ZWQNCj4gIEw6CXhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZw0KPiBAQCAtMjEyLDcgKzIxMiw3IEBAIEY6CXhlbi9jb21tb24vY3B1cG9vbC5jDQo+IA0K
PiAgREVWSUNFIFRSRUUNCj4gIE06CVN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2Vy
bmVsLm9yZz4NCj4gLU06CUp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+DQo+ICtN
OglKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEB4ZW4ub3JnPg0KPiAgUzoJU3VwcG9ydGVkDQo+
ICBGOgl4ZW4vY29tbW9uL2xpYmZkdC8NCj4gIEY6CXhlbi9jb21tb24vZGV2aWNlX3RyZWUuYw0K
PiBAQCAtNTMzLDcgKzUzMyw3IEBAIE06CUFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNp
dHJpeC5jb20+DQo+ICBNOglHZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVubGFwQGV1LmNpdHJpeC5j
b20+DQo+ICBNOglJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4NCj4gIE06
CUphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gLU06CUp1bGllbiBHcmFsbCA8anVs
aWVuLmdyYWxsQGFybS5jb20+DQo+ICtNOglKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEB4ZW4u
b3JnPg0KPiAgTToJS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29t
Pg0KPiAgTToJU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPg0KPiAg
TToJVGltIERlZWdhbiA8dGltQHhlbi5vcmc+DQo+IC0tDQo+IDIuMTEuMA0KPiANCj4gDQo+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+IFhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QNCj4gWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IGh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWwNCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

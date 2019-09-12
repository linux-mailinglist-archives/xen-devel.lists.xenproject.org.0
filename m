Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33BD9B129A
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 18:11:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8Rct-0005WJ-G6; Thu, 12 Sep 2019 16:07:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GjwE=XH=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1i8Rcs-0005WE-AX
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 16:07:18 +0000
X-Inumbo-ID: 6439b088-d577-11e9-a337-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6439b088-d577-11e9-a337-bc764e2007e4;
 Thu, 12 Sep 2019 16:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568304437;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=p5Zd7PWmZKOQVtnMLVrCnM1v9zPy7RNQewPk5Yr3kdQ=;
 b=IgU17knT+JKxCzqeEdtcL2XxnEdSqY3icXZEjfexWoT7hXnhj9bjflsM
 mSpQ/lNTeOyhltuTQZLgZQ4qxAS3tLaWurvhjUnCJCYvOkC/G/4ac+Dc5
 BRFGttLqHO1hA3O8LVkc8RV6F7tYSBTnGSkJymnG550iLs4gM6MkZd20m Y=;
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
IronPort-SDR: ZdkckP2wnSC5+2c7T2cSsoOHUHNvh106DOeF5cRHkoezSHrIMxO5Xx4o/ljgh++86dMwvkXXhk
 S15puK+VDbH5jtRaqgVo/c6nWDavkj5WXIIB+hJ8/3RRw9jm6Ch78HhrMGwt+CVvHiFQSEHbX9
 etHW8tk73R8VTBMzpY2BgrWD5lsMz9idhmxuTFE6gU4a/ATYICL/9VwCHmRepQLQy17kZMa+67
 r8rAgPibu0o4PZVSTRhKQs6QBGYVOabtzyl7PTlJHOYwdAQSZwna1JdvYaUm/f/eZCvC3CsNzP
 Agc=
X-SBRS: 2.7
X-MesageID: 5787619
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,497,1559534400"; 
   d="scan'208";a="5787619"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Jan Beulich' <jbeulich@suse.com>
Thread-Topic: [PATCH] public/xen.h: update the comment explaining 'Wallclock
 time'
Thread-Index: AQHVaXMVkfoCMWg/YkCaTAWjsIjXTacoEpQAgAAirwA=
Date: Thu, 12 Sep 2019 16:07:10 +0000
Message-ID: <902c5aa15eba42acb39e7cbf5d7b9c55@AMSPEX02CL03.citrite.net>
References: <20190912140504.40853-1-paul.durrant@citrix.com>
 <ebb1e983-aa65-a364-3574-ce092d08e249@suse.com>
In-Reply-To: <ebb1e983-aa65-a364-3574-ce092d08e249@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] public/xen.h: update the comment explaining
 'Wallclock time'
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
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Julien
 Grall <julien.grall@arm.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDEyIFNlcHRlbWJlciAyMDE5IDE3OjAzDQo+IFRvOiBQYXVs
IER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPg0KPiBDYzogeGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnOyBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPjsgQW5k
cmV3IENvb3Blcg0KPiA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IEdlb3JnZSBEdW5sYXAg
PEdlb3JnZS5EdW5sYXBAY2l0cml4LmNvbT47IElhbiBKYWNrc29uDQo+IDxJYW4uSmFja3NvbkBj
aXRyaXguY29tPjsgU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsg
S29ucmFkIFJ6ZXN6dXRlayBXaWxrDQo+IDxrb25yYWQud2lsa0BvcmFjbGUuY29tPjsgVGltIChY
ZW4ub3JnKSA8dGltQHhlbi5vcmc+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPg0KPiBTdWJqZWN0OiBS
ZTogW1BBVENIXSBwdWJsaWMveGVuLmg6IHVwZGF0ZSB0aGUgY29tbWVudCBleHBsYWluaW5nICdX
YWxsY2xvY2sgdGltZScNCj4gDQo+IE9uIDEyLjA5LjIwMTkgMTY6MDUsIFBhdWwgRHVycmFudCB3
cm90ZToNCj4gPiBTaW5jZSBjb21taXQgMDYyOWFkZmQ4MGUgIkFjdHVhbGx5IHNldCBhIEhWTSBk
b21haW4ncyB0aW1lIG9mZnNldCB3aGVuIGl0DQo+ID4gc2V0cyB0aGUgUlRDIiwgdGhlIGNvbW1l
bnQgaW4gdGhlIHB1YmxpYyBoZWFkZXIgaGFzIGJlZW4gbWlzbGVhZGluZywgc2luY2UNCj4gPiBp
dCBjbGFpbXMgdGhhdCB3YWxsY2xvY2sgdGltZSBpcyBvbmx5IHVwZGF0ZWQgYnkgY29udHJvbCBz
b2Z0d2FyZS4NCj4gPiBNb3Jlb3ZlciwgdGhlIGNvbW1lbnRzIHN0YXRpbmcgdGhhdCB3Y19zZWMg
YW5kIHdjX25zZWMgYXJlIHNlY29uZHMgYW5kDQo+ID4gbmFub3NlY29uZHMgKHJlc3BlY3RpdmVs
eSkgaW4gVVRDIHNpbmNlIHRoZSBVbml4IGVwb2NoIGFyZSBib2d1cy4gVGhlaXINCj4gPiB2YWx1
ZXMgYXJlIGFkanVzdGVkIGJ5IHRoZSBkb21haW4ncyB0aW1lX29mZnNldF9zZWNvbmRzIHZhbHVl
LCB3aGljaCBpcw0KPiA+IHVwZGF0ZWQgYnkgYSBndWVzdCB3cml0ZSB0byB0aGUgZW11bGF0ZWQg
UlRDIGFuZCBoZW5jZSB0aGUgd2FsbGNsb2NrDQo+ID4gdGltZXpvbmUgaXMgdW5kZXIgZ3Vlc3Qg
Y29udHJvbC4NCj4gPg0KPiA+IFRoaXMgcGF0Y2ggYXR0ZW1wdHMgdG8gYnJpbmcgdGhlIGNvbW1l
bnQgaW4gbGluZSB3aXRoIHJlYWxpdHkgd2hpbHN0DQo+ID4ga2VlcGluZyBpdCByZWFzb25hYmx5
IHNob3J0Lg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJh
bnRAY2l0cml4LmNvbT4NCj4gDQo+IEFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+DQo+IChwcmVmZXJhYmx5IHdpdGggdGhlIHR5cG8gZml4ZWQgdGhhdCBKw7xyZ2VuIHBv
aW50ZWQgb3V0OyBlYXNpbHkNCj4gZG9uZSB3aGlsZSBjb21taXR0aW5nKQ0KDQpPSy4gVGhhbmtz
LA0KDQogIFBhdWwNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==

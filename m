Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A890D5E576
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2019 15:27:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hifGZ-0006o0-9r; Wed, 03 Jul 2019 13:25:43 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eYTC=VA=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hifGX-0006nu-WC
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2019 13:25:42 +0000
X-Inumbo-ID: 0d1f0419-9d96-11e9-8980-bc764e045a96
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 0d1f0419-9d96-11e9-8980-bc764e045a96;
 Wed, 03 Jul 2019 13:25:40 +0000 (UTC)
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
IronPort-SDR: JfUziK1XMb/nSXINSf0qFV3RicWr2JVmPfEGRfrRycUl59Js9hxaaB3aJI1yKB6sHE7DksOpvf
 xhFhYeUw7XFOgvMF/o0Y/QVIvWAw+1XucNxR+mWm9k8hkdavLGwhhF1ClwmLoF4Xuwt+I4Tvpp
 nT+XyInEnMB/sAnTkqqAs7muqi3p69QXhcvegoalAG2m5OJcQA29enwVNFfVbh0nxxm1UdPHOL
 daBPLd9qJCcZDSoRCeYFM0k6pldjYhthHguWXwbM07TXSKr7u/rDeXe+Hz20lKo4Tmy8TzZQpd
 +2g=
X-SBRS: 2.7
X-MesageID: 2598441
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,446,1557201600"; 
   d="scan'208";a="2598441"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Jan Beulich' <JBeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH] passthrough/pci: properly qualify the
 mem_sharing_enabled check...
Thread-Index: AQHVMA9kcqsXFu/a/EyHT+XK2JkJZqa4wnSAgAAih5A=
Date: Wed, 3 Jul 2019 13:25:37 +0000
Message-ID: <e07d1e6fa911456490ec9a8475fa4000@AMSPEX02CL03.citrite.net>
References: <20190701131750.37855-1-paul.durrant@citrix.com>
 <a57d3e6a-b28a-611b-9db7-c49004157da3@suse.com>
In-Reply-To: <a57d3e6a-b28a-611b-9db7-c49004157da3@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] passthrough/pci: properly qualify the
 mem_sharing_enabled check...
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
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Tamas K
 Lengyel <tamas@tklengyel.com>, George Dunlap <George.Dunlap@citrix.com>,
 WeiLiu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8SkJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDAzIEp1bHkgMjAxOSAxNDoyMA0KPiBUbzogUGF1bCBEdXJy
YW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZw0KPiBDYzogQW5kcmV3IENvb3BlciA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IFJv
Z2VyIFBhdSBNb25uZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyBHZW9yZ2UgRHVubGFwDQo+IDxH
ZW9yZ2UuRHVubGFwQGNpdHJpeC5jb20+OyBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRrbGVuZ3ll
bC5jb20+OyBXZWlMaXUgPHdsQHhlbi5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIHBhc3N0
aHJvdWdoL3BjaTogcHJvcGVybHkgcXVhbGlmeSB0aGUgbWVtX3NoYXJpbmdfZW5hYmxlZCBjaGVj
ay4uLg0KPiANCj4gT24gMDEuMDcuMjAxOSAxNToxNywgUGF1bCBEdXJyYW50IHdyb3RlOg0KPiA+
IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jDQo+ID4gKysrIGIveGVuL2RyaXZl
cnMvcGFzc3Rocm91Z2gvcGNpLmMNCj4gPiBAQCAtMTQ1MCw3ICsxNDUwLDcgQEAgc3RhdGljIGlu
dCBhc3NpZ25fZGV2aWNlKHN0cnVjdCBkb21haW4gKmQsIHUxNiBzZWcsIHU4IGJ1cywgdTggZGV2
Zm4sIHUzMg0KPiBmbGFnKQ0KPiA+DQo+ID4gICAgICAgLyogUHJldmVudCBkZXZpY2UgYXNzaWdu
IGlmIG1lbSBwYWdpbmcgb3IgbWVtIHNoYXJpbmcgaGF2ZSBiZWVuDQo+ID4gICAgICAgICogZW5h
YmxlZCBmb3IgdGhpcyBkb21haW4gKi8NCj4gPiAtICAgIGlmICggdW5saWtlbHkoZC0+YXJjaC5o
dm0ubWVtX3NoYXJpbmdfZW5hYmxlZCB8fA0KPiA+ICsgICAgaWYgKCB1bmxpa2VseShtZW1fc2hh
cmluZ19lbmFibGVkKGQpIHx8DQo+ID4gICAgICAgICAgICAgICAgICAgICB2bV9ldmVudF9jaGVj
a19yaW5nKGQtPnZtX2V2ZW50X3BhZ2luZykgfHwNCj4gPiAgICAgICAgICAgICAgICAgICAgIHAy
bV9nZXRfaG9zdHAybShkKS0+Z2xvYmFsX2xvZ2RpcnR5KSApDQo+ID4gICAgICAgICAgIHJldHVy
biAtRVhERVY7DQo+IA0KPiBUaGlzIGNoYW5nZSBpcyByZWR1bmRhbnQgd2l0aCB0aGUgbW9yZSBl
eHRlbnNpdmUgb25lIGJ5DQo+ICJ4ODYvSFZNOiBwMm1fcmFtX3JvIGlzIGluY29tcGF0aWJsZSB3
aXRoIGRldmljZSBwYXNzLXRocm91Z2giLA0KPiBvZiB3aGljaCBJJ3ZlIHNlbnQgdjIgZWFybGll
ciB0b2RheSwgYW5kIHYxIG9mIHdoaWNoIGhhcyBiZWVuDQo+IHBlbmRpbmcgZm9yIHF1aXRlIHNv
bWUgdGltZSB3aXRob3V0IGhhdmluZyBoZWFyZCBiYWNrIGZyb20NCj4gb3RoZXIgdGhhbiB5b3Uu
DQoNCkFncmVlZCwgYnV0IEkgc3RpbGwgdGhpbmsgaXQncyBhIGdvb2QgaWRlYSB0byBtb3ZlIHRo
ZSBtZW1fc2hhcmluZ19lbmFibGVkKCkgbWFjcm8gaW50byBkb21haW4uaCwgc28gbWF5YmUgaW5j
b3Jwb3JhdGUgdGhhdCBpbnRvIHlvdXIgcGF0Y2g/IEknbGwgdGFrZSBhIGxvb2sgYXQgdjIgYXMg
c29vbiBhcyBJIGNhbi4NCg0KICBQYXVsDQoNCj4gDQo+IEphbg0KDQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

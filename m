Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B603C6D63D
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 23:08:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoDbN-0004vb-V3; Thu, 18 Jul 2019 21:06:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=y+p/=VP=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hoDbM-0004vW-Fk
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 21:06:08 +0000
X-Inumbo-ID: da992834-a99f-11e9-83fe-2786597a8fb4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id da992834-a99f-11e9-83fe-2786597a8fb4;
 Thu, 18 Jul 2019 21:06:04 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=George.Dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 George.Dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: YyYA6T38zjVgqsOQeTlfGHOwB5RPlDTc8sVA+3mtNVnCWEawBajqgtJNLir8BkKzeccwxRLM3D
 OoJURzuW9+/V1yRkTUiVN6w+qD72rj0KK4B1+I/j2/10s8GcdK4D85LDkJfqp6YbmpQYHrk09L
 eVfDjDluS7f0wmJXwD1DKV7InGBWXID9JgkxHLQyNgqF/fM78+Lzik9Rzzjye6x6SPunwblFfe
 LmMvnxmRQ0sW/hPbN7t7NBLPJsWuITMFCbHwZIxY1z7ZPiLP0erqs7KmMMTqxVZ/+FJ5cb8nSs
 OnE=
X-SBRS: 2.7
X-MesageID: 3239660
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,279,1559534400"; 
   d="scan'208";a="3239660"
From: George Dunlap <George.Dunlap@citrix.com>
To: Rich Persaud <persaur@gmail.com>
Thread-Topic: [Xen-devel] [PATCH] golang/xenlight: Fixing compilation for go
 1.11
Thread-Index: AQHU9YlYaQHRy7JwqkeZC0HzYwfyb6ZBw++AgArm0wCAABEZAICEZEKAgAAoYICAAAQbgA==
Date: Thu, 18 Jul 2019 21:06:00 +0000
Message-ID: <D57E29FB-DF9A-4BBF-A06E-48B893E8926A@citrix.com>
References: <20190418015203.1636-1-dpsmith@apertussolutions.com>
 <1cf0e5e9-2109-9517-49d9-88c5251cf156@citrix.com>
 <5CC19CAC0200007800229037@prv1-mh.provo.novell.com>
 <b6599113-99ec-8c92-5316-09c0992ab122@citrix.com>
 <29A6C124-6EF4-45C2-860E-D34A9B6D2087@gmail.com>
 <1FBA5690-D488-4D2E-9AC2-0A9BE89390A2@citrix.com>
In-Reply-To: <1FBA5690-D488-4D2E-9AC2-0A9BE89390A2@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3445.104.11)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <5AC10464175EC24582F15884AC2C9F94@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] golang/xenlight: Fixing compilation for go
 1.11
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
Cc: "Daniel P.Smith" <dpsmith.dev@gmail.com>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 "nicolas.belouin@gandi.net" <nicolas.belouin@gandi.net>,
 Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gSnVsIDE4LCAyMDE5LCBhdCA5OjUxIFBNLCBHZW9yZ2UgRHVubGFwIDxHZW9yZ2Uu
RHVubGFwQGNpdHJpeC5jb20+IHdyb3RlOg0KPiANCj4gDQo+IA0KPj4gT24gSnVsIDE4LCAyMDE5
LCBhdCA3OjI2IFBNLCBSaWNoIFBlcnNhdWQgPHBlcnNhdXJAZ21haWwuY29tPiB3cm90ZToNCj4+
IA0KPj4+IE9uIEFwciAyNSwgMjAxOSwgYXQgMDc6NDEsIEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5k
dW5sYXBAY2l0cml4LmNvbT4gd3JvdGU6DQo+Pj4gDQo+Pj4gT24gNC8yNS8xOSAxMjo0MCBQTSwg
SmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+Pj4+IE9uIDE4LjA0LjE5IGF0IDE1OjExLCA8Z2Vvcmdl
LmR1bmxhcEBjaXRyaXguY29tPiB3cm90ZToNCj4+Pj4+PiBPbiA0LzE4LzE5IDI6NTIgQU0sIERh
bmllbCBQLiBTbWl0aCB3cm90ZToNCj4+Pj4+PiBUaGlzIGRlYWxzIHdpdGggdHdvIGNhc3Rpbmcg
aXNzdWVzIGZvciBjb21waWxpbmcgdW5kZXIgZ28gMS4xMToNCj4+Pj4+PiAtIGV4cGxpY2l0bHkg
Y2FzdCB0byAqQy54ZW50b29sbG9nX2xvZ2dlciBmb3IgQ3R4LmxvZ2dlciBwb2ludGVyDQo+Pj4+
Pj4gLSBhZGQgY2FzdCB0byB1bnNhZmUuUG9pbnRlciBmb3IgdGhlIEMgc3RyaW5nIGNwYXRoDQo+
Pj4+Pj4gDQo+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFAuIFNtaXRoIDxkcHNtaXRoQGFw
ZXJ0dXNzb2x1dGlvbnMuY29tPg0KPj4+Pj4gDQo+Pj4+PiBSZXZpZXdlZC1ieTogR2VvcmdlIER1
bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPg0KPj4+Pj4gDQo+Pj4+PiBCVFcsIGRvIHlv
dSBrbm93IGlmIHRoaXMgd2lsbCBjb21waWxlIGZvciBvbGRlciB2ZXJzaW9ucyBvZiBnbz8NCj4+
Pj4+IA0KPj4+Pj4gVGhpcyBzaG91bGQgYmUgY29uc2lkZXJlZCBmb3IgYmFja3BvcnQgYXMgd2Vs
bCAoY2MnaW5nIEphbikuDQo+Pj4+IA0KPj4+PiBEaWQgeW91IG1lYW4gSWFuLCB0aGlzIGJlaW5n
IGEgdG9vbHMgcGF0Y2g/DQo+Pj4gDQo+Pj4gSSBndWVzcyBzby4gIFNvcnJ5LCBJIGRpZG4ndCBy
ZWFsaXplIElhbiB3YXMgZG9pbmcgdGhlIHRvb2xzIGJhY2twb3J0cy4NCj4+PiANCj4+PiAtR2Vv
cmdlDQo+PiANCj4+IFdpdGggdGhlIGdvbGFuZyB0b29scyBtYWludGFpbmVyIGNoYW5nZSBjb21w
bGV0ZWQsIGlzIGFueXRoaW5nIGZ1cnRoZXIgbmVlZGVkIGZvciB0aGlzIHBhdGNoIHRvIGJlIG1l
cmdlZD8NCj4gDQo+IE15IGNoYW5nZSB0byB0aGUgTUFJTlRBSU5FUlMgZmlsZSBoYXNu4oCZdCB5
ZXQgYmVlbiBtZXJnZWQ7IEkgdGhpbmsgaXQgd291bGQgYmUgZ29vZCB0byB3YWl0IHVudGlsIHRo
ZSB0b29scyBtYWludGFpbmVyICh3aG8gdGVjaG5pY2FsbHkgaXMgY3VycmVudGx5IHRoZSBtYWlu
dGFpbmVyKSBjYW4gQWNrIHRoZSBwYXRjaC4NCj4gDQo+IEnigJlsbCBwaW5nIElhbiBwcml2YXRl
bHkgdG8gbWFrZSBzdXJlIGhlIGRvZXNu4oCZdCBtaXNzIGl0Lg0KDQpPSywgaGXigJlzIGFja2Vk
IGl0IHByaXZhdGVseSwgc28gSeKAmWxsIGNoZWNrIHRoYXQgaW4gYW5kIHRoZW4gY2F0Y2ggdGhl
c2UuDQoNCiAtR2VvcmdlDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=

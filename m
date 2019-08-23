Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00DFD9B1B0
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2019 16:14:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i1AHa-0003mw-MX; Fri, 23 Aug 2019 14:11:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0Qj9=WT=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1i1AHY-0003mp-WF
 for xen-devel@lists.xenproject.org; Fri, 23 Aug 2019 14:11:13 +0000
X-Inumbo-ID: dc23f0fe-c5af-11e9-ade8-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dc23f0fe-c5af-11e9-ade8-12813bfff9fa;
 Fri, 23 Aug 2019 14:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566569471;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=QECGd4NHZsI3YJf2kuEZJJOxekCeLgLr5tGgfYBcS1U=;
 b=YEtpiboLOtq8oWjqibrT7dDLFbJnvQllLrUXt9u26eGOkRUHIar8WUCj
 pZl0pZmddhb15LlBalKaFiu0LW5f8Qsq6J7/sSrLZ4Qu9oftyUZ4d1Ldo
 YK0DLdV3Dewz9z9+gE9OkVq7Zx5VaouHbaNOtbQWxrgRmj6zol3DpZSaw Y=;
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
IronPort-SDR: tPKDwcrlvaR8AYPMYKY5kw+PeifSrpWC8Lq3C1+WsyyqPhzKZfP46/+uLT3dj//IQ6NOvrj+2Z
 WzD2GIRjnsrXeKrOpDJxGTLApnNNzvMX9AqMtRbFkzoD0/i0Q4qLxomLaB7NwdS0/y3ePenbIS
 Zy1hMuHKeNcvljvZ+pesDlaNq6HEtSgTlDI6SmkbFoYELpl8sfQJfzW74i6TupZsfLFEIeZdZ9
 dqCe3uQC73oSXR/VjWcKxIU8Qq2Qeb9DCZT3Pl0T/igd3iw8SQLIF9PHZoxYXuOyb40VcexNcE
 myY=
X-SBRS: 2.7
X-MesageID: 4856983
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,421,1559534400"; 
   d="scan'208";a="4856983"
From: George Dunlap <George.Dunlap@citrix.com>
To: Jeff Kubascik <jeff.kubascik@dornerworks.com>
Thread-Topic: [PATCH] MAINTAINERS: Add DornerWorks maintainers email
Thread-Index: AQHVWbxSQiinUUn2LUWS1Nz6jsTBhacIpDaA
Date: Fri, 23 Aug 2019 14:11:07 +0000
Message-ID: <9A48EF4D-E9DE-45F5-9D22-4257D2E37C3D@citrix.com>
References: <20190823140855.4222-1-jeff.kubascik@dornerworks.com>
In-Reply-To: <20190823140855.4222-1-jeff.kubascik@dornerworks.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3445.104.11)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <1B35A15AFF861D4898AA6D94262D9069@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] MAINTAINERS: Add DornerWorks maintainers
 email
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
Cc: DornerWorks Xen-Devel <xen-devel@dornerworks.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim
 \(Xen.org\)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>,
 Robert VanVossen <robert.vanvossen@dornerworks.com>, Julien
 Grall <julien.grall@arm.com>, Josh Whitehead <josh.whitehead@dornerworks.com>,
 Jan Beulich <jbeulich@suse.com>, Ian
 Jackson <Ian.Jackson@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Jarvis Roach <Jarvis.Roach@dornerworks.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gQXVnIDIzLCAyMDE5LCBhdCAzOjA4IFBNLCBKZWZmIEt1YmFzY2lrIDxqZWZmLmt1
YmFzY2lrQGRvcm5lcndvcmtzLmNvbT4gd3JvdGU6DQo+IA0KPiBXZSB3b3VsZCBsaWtlIHRvIGhh
dmUgYSBjb21tb24gbWFpbnRhaW5lcnMgZW1haWwgYWRkcmVzcyBmb3IgRG9ybmVyV29ya3MNCj4g
bWFpbnRhaW5lZCBjb2RlLCB3aGljaCBjdXJyZW50bHkgaXMgdGhlIEFSSU5DNjUzIHNjaGVkdWxl
ci4gVGhpcyB3aWxsDQo+IGVuYWJsZSB1cyB0byBiZXR0ZXIgbW9uaXRvciBhbmQgcmVzcG9uZCB0
byB0aGUgWGVuIGNvbW11bml0eS4gVGhpcyBwYXRjaA0KPiBhZGRzIGEgbWFpbnRhaW5lciBsaW5l
IHdpdGggdGhlIERvcm5lcldvcmtzIG1haW50YWluZXJzIGVtYWlsIGFkZHJlc3MuDQo+IC0tLQ0K
PiBNQUlOVEFJTkVSUyB8IDEgKw0KPiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCj4g
DQo+IGRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTDQo+IGluZGV4IDc3NDEz
ZTBkOWUuLjNjY2UyNTM5MzEgMTAwNjQ0DQo+IC0tLSBhL01BSU5UQUlORVJTDQo+ICsrKyBiL01B
SU5UQUlORVJTDQo+IEBAIC0xNjgsNiArMTY4LDcgQEAgRjoJeGVuL2NvbW1vbi9hcmdvLmMNCj4g
QVJJTkM2NTMgU0NIRURVTEVSDQo+IE06CUpvc2ggV2hpdGVoZWFkIDxqb3NoLndoaXRlaGVhZEBk
b3JuZXJ3b3Jrcy5jb20+DQo+IE06CVJvYmVydCBWYW5Wb3NzZW4gPHJvYmVydC52YW52b3NzZW5A
ZG9ybmVyd29ya3MuY29tPg0KPiArTToJRG9ybmVyV29ya3MgWGVuLURldmVsIDx4ZW4tZGV2ZWxA
ZG9ybmVyd29ya3MuY29tPg0KDQpNYWludGFpbmVyc2hpcCBpbXBsaWVzIGEgY2VydGFpbiBsZXZl
bCBvZiBhdXRob3JpdHkuICBJIHRoaW5rIHlvdSB3YW50IFI6IGhlcmUgaW5zdGVhZCwgd2hpY2gg
aXMg4oCcRGVzaWduYXRlZCByZXZpZXdlcuKAnTogeW91IGdldCBtYWlsLCBidXQgZG9u4oCZdCBo
YXZlIGFueSBhdXRob3JpdHkuDQoNCiAtR2VvcmdlDQoNCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=

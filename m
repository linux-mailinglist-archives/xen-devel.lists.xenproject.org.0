Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71566AB37B
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2019 09:51:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i68yz-0004Ru-Ve; Fri, 06 Sep 2019 07:48:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XnaT=XB=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1i68yy-0004Rp-QZ
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2019 07:48:36 +0000
X-Inumbo-ID: bb00ece4-d07a-11e9-abeb-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bb00ece4-d07a-11e9-abeb-12813bfff9fa;
 Fri, 06 Sep 2019 07:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567756115;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=F+DvKi2PsTXVyC1ZtgTUbmLO3BseAcKkBu4oeL+IAwE=;
 b=QC2QWfsOZ3tsSy9AO3Q7DdEevOWWj7nNlTg6Ubhr4a9ivqWChUamYVJJ
 FmtqF3Ot2G0MKXVtYskXT+QEIvT3r/YudlwtMVBVSROwfEBcMQ9bd5yRZ
 aqj6+foY97I57j1vHeq9OtU/TGj3JvlSNWELRU/nY03wdnjs4M2nI9QCl A=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=lars.kurth@citrix.com;
 spf=Pass smtp.mailfrom=lars.kurth@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 lars.kurth@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 lars.kurth@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: CLB11L3TUAO+CfaSMfayxWxLmHnAHPmZXFTw2EUWEbYossV2/f2ZvV3wXDN86H0Jb/U6Cm3uUO
 nGngygb3ik1EIM1Lks4NGZbXj0nM7ANct5M6TIH+jEnRpkJgb72PdDAjaXYY7nB8MqILL3/G5G
 7r0qxHM5BIlMAhanJyJr/PG1kEQ+jLPuOIsKnyZ9Ak3i7DlMjgObKbhFwHvFy4hokHyHQlI1QI
 YbfHIaoEm7cjVwo7H3fctwnjeKAvJi96T1qpaqgFFXYM0hvgocuBs9Df8+4pN062GkbWKV3m4a
 +/U=
X-SBRS: 2.7
X-MesageID: 5407298
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,472,1559534400"; 
   d="scan'208";a="5407298"
From: Lars Kurth <lars.kurth@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>, Xen-devel
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH] docs/sphinx: todo/wishlist
Thread-Index: AQHVQMKYw8HwL0LrIEyDTmWq2utksqcefKuA
Date: Fri, 6 Sep 2019 07:48:31 +0000
Message-ID: <59A4FB08-71DB-4628-8DF0-B26B60CFBF45@citrix.com>
References: <20190722192056.15816-1-andrew.cooper3@citrix.com>
In-Reply-To: <20190722192056.15816-1-andrew.cooper3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.d.190811
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <630CF4EDA597E846ADC76068AACFB096@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] docs/sphinx: todo/wishlist
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
 "Tim \(Xen.org\)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>,
 Julien Grall <julien.grall@arm.com>, Paul Durrant <Paul.Durrant@citrix.com>,
 Jan Beulich <JBeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCu+7v09uIDIyLzA3LzIwMTksIDIwOjIxLCAiQW5kcmV3IENvb3BlciIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+IHdyb3RlOg0KDQogICAgYS5rLmEuIChhdCBsZWFzdCBpbiB0aGlzIGZv
cm0pIEFuZHJldydzICJ3b3JrIHdoaWNoIG1pZ2h0IGJlIG9mZmxvYWRhYmxlIHRvDQogICAgc29t
ZW9uZSBlbHNlIiBsaXN0Lg0KICAgIA0KICAgIFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIg
PGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQogICAgLS0tDQogICAgQ0M6IEdlb3JnZSBEdW5s
YXAgPEdlb3JnZS5EdW5sYXBAZXUuY2l0cml4LmNvbT4NCiAgICBDQzogSWFuIEphY2tzb24gPGlh
bi5qYWNrc29uQGNpdHJpeC5jb20+DQogICAgQ0M6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNl
LmNvbT4NCiAgICBDQzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3Jn
Pg0KICAgIENDOiBUaW0gRGVlZ2FuIDx0aW1AeGVuLm9yZz4NCiAgICBDQzogV2VpIExpdSA8d2xA
eGVuLm9yZz4NCiAgICBDQzogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4NCiAg
ICBDQzogTGFycyBLdXJ0aCA8bGFycy5rdXJ0aEBjaXRyaXguY29tPg0KICAgIENDOiBQYXVsIER1
cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPg0KICAgIENDOiBSb2dlciBQYXUgTW9ubsOp
IDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCiAgICANCiAgICBSRkMgZm9yIG9idmlvdXMgcmVhc29u
cy4NCiAgICANCiAgICBBIHJlbmRlcmVkIHZlcnNpb24gb2YgdGhpcyBjYW4gYmUgZm91bmQgYXQ6
DQogICAgaHR0cHM6Ly9hbmRyZXdjb29wLXhlbi5yZWFkdGhlZG9jcy5pby9lbi9kb2NzLXdpc2hs
aXN0L21pc2Mvd2lzaGxpc3QuaHRtbA0KICAgIA0KICAgIER1cmluZyBYZW5TdW1taXQgaW4gQ2hp
Y2FnbywgaXQgd2FzIGV4cHJlc3NlZCBzZXZlcmFsIHRpbWVzIHRoYXQgaGF2aW5nIHNvbWUNCiAg
ICB0b2RvIGxpc3RzIHdvdWxkIGJlIGEgYmVuZWZpdCwgdG8gaGVscCBjb29yZGluYXRlIHdvcmsg
aW4gcmVsYXRlZCBhcmVhcy4NCiAgICANCiAgICBIZXJlIGlzIGFuIGF0dGVtcHQgdG8gc3RhcnQg
b25lLiAgRm9yIG5vdywgaXQgY292ZXJzIG9uZSBzaW5nbGUNCiAgICBpdGVtICh4ZW5zdG9yZWQn
cyB1c2Ugb2Ygbm9uLXN0YWJsZSBBUElzKSB0byBnZXQgc29tZSBmZWVkYmFjayBhYm91dCB0aGUN
CiAgICBnZW5lcmFsIGFwcHJvYWNoLiAgSSBoYXZlIHBsZW50eSB0byBnZXQgc3R1Y2sgaW50byBp
biBYZW4gaXRzZWxmIGlmIHRoaXMgd2F5DQogICAgb2YgZXhwcmVzc2luZyB0aGVtIGlzbid0IGRl
ZW1lZCB1bmFjY2VwdGFibGUuDQogICAgDQogICAgQXMgZm9yIHRoZSB3aXNobGlzdCBpdHNlbGYs
IEkgdGhpbmsgaXQgaXMgaW1wb3J0YW50IHRoYXQgaXQgYmUgcmVzdHJpY3RlZCB0bw0KICAgIGNv
bmNyZXRlIGFjdGlvbnMgKGkuZS4gYWxyZWFkeSBwYXJ0aWFsbHkgZ3Jvb21lZCwgaWYgeW91IHNw
ZWFrIGFnaWxlKSwgd2hpY2gNCiAgICBhcmUgaWRlbnRpZmllZCBwcm9ibGVtcywgYW5kIHN1Z2dl
c3RlZCBmaXhlcy4NCiAgICANCiAgICBJbiBwYXJ0aWN1bGFyLCBJIGRvbid0IHRoaW5rIGl0IGlz
IGFwcHJvcHJpYXRlIHRvIGRldm9sdmUgaW50byBhIGJ1bGxldCBwb2ludA0KICAgIGxpc3Qgb2Yg
bmV3IGZlYXR1cmVzLCBvciB0YXNrcyBsaWtlICJkb2N1bWVudCAkd2hvdHNpdCIuICBJdCBzaG91
bGQgYmUNCiAgICByZXN0cmljdGVkIHRvIHRoaW5ncyB3aGljaCBhcmUgcmVhbCBwcm9ibGVtcywg
b24gZXhpc3Rpbmcgc3lzdGVtcywgd2hpY2ggaGF2ZQ0KICAgIHNvbWUgZm9yd2FyZCBwbGFuIG9m
IGFjdGlvbi4gIFRoYXQgd2F5LCBhbnkgZGV2ZWxvcGVyIHNob3VsZCBiZSBhYmxlIHRvDQogICAg
Y3Jvc3MtcmVmZXJlbmNlIGF0IGxlYXN0IGF0IGEgaGlnaCBsZXZlbCwgYW5kIHNlZSBpZiB0aGVy
ZSBhcmUgYXJlYXMgb2YNCiAgICBvdmVybGFwcGluZyB3b3JrLCBvciB3aGV0aGVyIGEgc2xpZ2h0
bHkgdHdlYWtlZCBhcHByb2FjaCBtaWdodCBiZSBzdWl0YWJsZSBmb3INCiAgICBtdWx0aXBsZSBh
cmVhcy4NCiAgICANCiAgICBBbnl3YXkgLSB0aG91Z2h0cyBmcm9tIHRoZSBwZWFudXQgZ2FsbGVy
eT8NCg0KSGkgQW5keSwgc29ycnkgSSBoYWQgbWlzc2VkIHRoaXMuIEkgdGhpbmsgdGhpcyBpcyBh
IGdvb2QgaWRlYSBhbmQgd29ydGggZXhwZXJpbWVudGluZyB3aXRoLg0KDQpSZWdhcmRpbmcgUmlj
aCdzIGNvbW1lbnQsIEkgdGhvdWdodCB3ZSBhbHJlYWR5IGFncmVlZCB0aGF0IHdlIGNhbiB1c2Ug
YSBDQywgYnV0IHdlIGhhdmUgbm90IGRlY2lkZWQgaG93IHRvIGRvIHRoaXMgaW4gcHJhY3RpY2Fs
IHRlcm1zIGFzIHdlIG1heSBiZSBob292ZXJpbmcgdXAgY29udGVudCB0aGF0IGluIHRoZSBwYXN0
IG1heSBoYXZlIGJlZW4gcHVibGlzaGVkIGFzIEdQTA0KDQpMYXJzDQogDQoNCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

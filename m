Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD55124901
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 15:05:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihZtU-0000JC-C2; Wed, 18 Dec 2019 14:01:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0dd+=2I=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1ihZtS-0000J7-ON
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 14:01:38 +0000
X-Inumbo-ID: e3a535cc-219e-11ea-b6f1-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e3a535cc-219e-11ea-b6f1-bc764e2007e4;
 Wed, 18 Dec 2019 14:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576677690;
 h=from:to:cc:subject:date:message-id:content-id:
 content-transfer-encoding:mime-version;
 bh=EGinG8qxZlwA+cIOKlgOrqXSeo2n8ToLK/1Y7TjUUUQ=;
 b=Gwzle8V/slmJsddy4WJMjg2fIq+UQ1MVkRHtHRuJC4hPKRQseXcbeYLi
 f100daKeL8O7IZGwaI5+HMPB4EC4xKFoPsqkOEAvuQhWVbcHBggcmMyT+
 eURSKHoM5rfXuAVl+3AUfIoPkDZ2BB8gtLgLlGqim+AAnr0o8X7eJv9PO k=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: fz0Wo7p0+E7IC2PZJM57CiVsC2BFFnnWDtzQhb9rFVfSPEgmJwhTizZaTTntAtuACc6Pe/vXft
 G7DsDap3au8pWh9nei430kneDIa8WhoTAW3oXk/p6rEeh1iQec2lPvfvMjb8mgEN9/Xn120xxd
 87DeokbHZAHp9BCHkqt8pG7Q01pvxH2r4dkOILxHYbBnNPJJH60wZExxzwGc04GtnJh22PK/FM
 0KQJ95Wn5d5uafaVMNZdVi71DUIFJ+64NosbBngyiy6fvPd+HAHrfetz+HBkCek+tOsvizXJAd
 azQ=
X-SBRS: 2.7
X-MesageID: 10293994
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,329,1571716800"; d="scan'208";a="10293994"
From: Lars Kurth <lars.kurth@citrix.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Thread-Topic: [RFC] Integrate CoC, Governance, Security Policy and other key
 documents into sphinx docs
Thread-Index: AQHVtaujTAEtf/n3rkCwi9Phdf0Yiw==
Date: Wed, 18 Dec 2019 14:01:26 +0000
Message-ID: <0BDF4017-822C-45E2-9374-6ED3B7424787@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.11.191208
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <2A0DC424D3AB814DB3CC01AF337735EF@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [RFC] Integrate CoC, Governance,
 Security Policy and other key documents into sphinx docs
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
Cc: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Durrant,
 Paul" <pdurrant@amazon.com>,
 "committers@xenproject.org" <committers@xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgYWxsLA0KDQpub3cgdGhhdCA0LjEzIGlzIG91dCBvZiB0aGUgd2F5IEkgd2FudGVkIHRvIGdl
dCB0aGUgQ29DIGRpc2N1c3Npb24gY2xvc2VkIC0gc2VlIGh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxOS0xMi90aHJlYWRzLmh0bWwjMDA5MjYs
IHdoaWNoIG1lYW5zIEkgbmVlZCBBQ0tzIG9yIGZpbmFsIHN1Z2dlc3Rpb25zLiBUaGUgbmV4dCBz
dGVwIHdvdWxkIGJlIHRvIHB1Ymxpc2ggaXQgb24gdGhlIHdlYnNpdGUuDQoNCkhvd2V2ZXIsIEkg
aGF2ZSBhbHNvIGJlZW4gdGhpbmtpbmcgYWJvdXQga2VlcGluZyBzb21lIGRvY3VtZW50cyBpbiBt
dWx0aXBsZSBwbGFjZXMgYW5kIGRlZmluaW5nIGEgKm1hc3RlciogY29weSBzb21ld2hlcmUgaW4g
YSB0cmVlLiBSaWdodCBub3csIHRoZXNlIGFyZSBhIGZldyBwZXJzb25hbCByZXBvcyB0aGF0IEkg
b3duLCB3aGljaCBzZWVtcyB1bm5lY2Vzc2FyeSwgZ2l2ZW4gdGhhdCB3ZSBoYXZlIHRoZSBzcGhp
bnggZG9jcy4gSW4gdGhlIGludGVyZXN0IG9mIGltcHJvdmluZyB0aGUgZG9jcywgd2UgYWxzbyBu
ZWVkIG1vcmUgdXNlZnVsIGNvbnRlbnQgaW4gdGhlIGRvY3MgdG8gZ3VpZGUgcGVvcGxlIHRvIHRo
ZW0uDQoNCk15IHByb3Bvc2FsIHdvdWxkIGJlIHRvIG1vdmUgdGhlIG1hc3RlciBzb3VyY2VzIGZv
ciBhIG51bWJlciBvZiBrZXkgcHJvY2VzcyBkb2NzIHRvIHhlbi5naXQ6L2RvY3MgbWF5YmUgdW5k
ZXIgYSAiV29ya2luZyB3aXRoIHRoZSBYZW4gUHJvamVjdCBjb21tdW5pdHkiIGluIGEgcHJvY2Vz
cy1ndWlkZSBkaXJlY3RvcnkuIA0KVGhpcyB3b3VsZCB0aGVuIGluY2x1ZGUgY29udGVudCBmcm9t
DQrigKIgaHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9cGVvcGxlL2xhcnNrL2dvdmVy
bmFuY2UuZ2l0O2E9c3VtbWFyeQ0K4oCiIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9w
PXBlb3BsZS9sYXJzay9zZWN1cml0eS1wcm9jZXNzLmdpdDthPXN1bW1hcnkNCuKAoiBodHRwOi8v
eGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD1wZW9wbGUvbGFyc2svY29kZS1vZi1jb25kdWN0Lmdp
dDthPXN1bW1hcnkNCg0KYW5kIHdlIGNvdWxkIGFsc28gY29uc2lkZXIgaW5jbHVkaW5nIHNvbWUg
b2YgdGhlIHdpa2kgcGFnZXMgcmVsYXRlZCB0byBjb250cmlidXRpb24gd29ya2Zsb3cgYW5kIHJl
LWRpcmVjdCB0aGUgcGFnZXMuDQoNCldlIHdvdWxkIG5lZWQgdG8gYW5zd2VyIHNvbWUgcXVlc3Rp
b25zLCBzdWNoIGFzDQphKSBBcmUgd2UgT0sgd2l0aCB0aGVzZSBzdGF5aW5nIGluIG1hcmtkb3du
IC0gSSBkb27igJl0IG1pbmQgY29udmVydGluZw0KYikgQXJlIHdlIE9LIHdpdGggc29tZSBvZiB0
aGUgZG9jdW1lbnRzIG5lZWRpbmcgcHJvamVjdCB3aWRlIGFncmVlbWVudCBiZWZvcmUgdGhleSBj
YW4gYmUgY2hhbmdlZCwgc3BlY2lmaWNhbGx5IHRoaXMgd291bGQgY292ZXINCi0gZ292ZXJuYW5j
ZS5naXQNCi0gY29kZS1vZi1jb25kdWN0LmdpdDpjb2RlLW9mLWNvbmR1Y3QubWQNCi0gY29kZS1v
Zi1jb25kdWN0LmdpdDpjb21tdW5pY2F0aW9uLWd1aWRlLm1kDQoNCkJlc3QgUmVnYXJkcw0KTGFy
cw0KDQoNCg0KDQoNCiANCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E153FA8598
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2019 16:25:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5WCJ-0000ht-Cj; Wed, 04 Sep 2019 14:23:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WgxQ=W7=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1i5WCI-0000hn-If
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2019 14:23:46 +0000
X-Inumbo-ID: 9a063276-cf1f-11e9-b76c-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9a063276-cf1f-11e9-b76c-bc764e2007e4;
 Wed, 04 Sep 2019 14:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567607025;
 h=from:to:subject:date:message-id:content-id:
 content-transfer-encoding:mime-version;
 bh=k1IzR1xNGsKgQAZH+9qreqIxv93/BMcoILeDj961+rU=;
 b=XJflpXzszKpAEDdThjzQCZuPO8sq1pr+Cf6qTC5aewbmaQX7tOjiRuZx
 gJJ5P/n7JAKCuQfq9baxb0zPBnyXBaRF9J5Y6ISbNiloYbvyZvYoUI0xy
 sP4zwBv8FwAxZQufTF/h27S6MnnDlpW5BhV/oy+VDWQ6RxbXPI5bP78Py 0=;
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
IronPort-SDR: 3Oza53F8tLT6IdBzhhNKIUXlux2DNKVoUCwHnQUdZp0K7SF15imgWR5donhyhyjRZ/SEepkgrf
 vpiZDI1dBWwdu+uGfSiX6Cp8xi5T/D9FapPNnaOdbTP0GeyZb+UkZ2DKC6EY3DxnsL1lW31UKK
 k3R17mXKeLWeuDqYcVufu98qCVwcBIcGm4sGrQSnDUZtDYJxYwOdACR4h/JjP2UmPfJ8m/gZho
 lhrBIlaID2i/NFD1HlvmfmtDEekO5HIHa9+v2BIu6Sj58qKSGHTC5lO4HJhxv31WompJ56uZ7C
 N1c=
X-SBRS: 2.7
X-MesageID: 5342952
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,467,1559534400"; 
   d="scan'208";a="5342952"
From: Lars Kurth <lars.kurth@citrix.com>
To: xen-devel <xen-devel@lists.xenproject.org>,
 "minios-devel@lists.xenproject.org" <minios-devel@lists.xenproject.org>,
 "mirageos-devel@lists.xenproject.org" <mirageos-devel@lists.xenproject.org>
Thread-Topic: [Poll] Please vote on date options for next year's Developer
 Summit (closes Wednesday, September 11)
Thread-Index: AQHVYyxR8dMvjKx5ZUmpULPWAlXMyg==
Date: Wed, 4 Sep 2019 14:23:27 +0000
Message-ID: <56100B8A-BD4B-4C65-9FBE-594EBE6D1AAF@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.d.190811
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <C46511291F6743439935D5910BF226FC@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [Poll] Please vote on date options for next year's
 Developer Summit (closes Wednesday, September 11)
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgYWxsLA0KDQp3ZSBzdGFydGVkIHBsYW5uaW5nIG5leHQgeWVhcuKAmXMgRGV2ZWxvcGVyIFN1
bW1pdCwgd2hpY2ggaXMgZHVlIHRvIGJlIGluIEV1cm9wZS4gV2UgaGF2ZSBhIHZlbnVlIGluIEJ1
Y2hhcmVzdCwgUm9tYW5pYSBzZWN1cmVkIGJ1dCBhcmUgc3RpbGwgd29ya2luZyB0aHJvdWdoIHRo
ZSBkZXRhaWxzLiBBcyB3ZSBhcmUgZWFybHksIHdlIGRvIGhhdmUgc2V2ZXJhbCBkYXRlIG9wdGlv
bnM6IHNvIEkgd2FudGVkIHRvIGdpdmUgeW91IGEgY2hvaWNlIHRvIHZvdGUsIHN1Y2ggdGhhdCB3
ZSBlbmQgdXAgd2l0aCBhIGRhdGUgdGhhdCB3b3JrcyBiZXN0IGZvciB5b3UNCg0KTm90ZSB0aGF0
IHRoZSBMaW51eCBGb3VuZGF0aW9uIGV2ZW50IHNjaGVkdWxlIGZvciBuZXh0IHllYXIgaXMgVkVS
WSBkaWZmZXJlbnQgZnJvbSB0aGF0IG9mIHBhc3QgeWVhcnMuIE9wZW4gU291cmNlIFN1bW1pdCBO
QSB3aWxsIGJlIGluIHRoZSB3ZWVrIG9mIEp1bmUgMjJuZCBhbmQgdGh1cyB3ZSBhcmUgbm90IGNv
bnNpZGVyaW5nIGFuIGV2ZW50IDEgd2VlayBiZWZvcmUgYW5kIDEgd2VlayBhZnRlci4NCg0KSSBk
aWQgYWRkIHRoZSB3ZWVrIHBvc3QgNHRoIG9mIEp1bHk6IHRoaXMgY291bGQgYmUgYSBwcm9ibGVt
IGZvciBzb21lIHBlb3BsZSBpbiB0aGUgVVMsIGJ1dCBJIGxlZnQgdGhlIHNsb3QgaW4gcmVnYXJk
bGVzcy4gDQoNClRoZSBwb2xsIGlzIGF0IGh0dHBzOi8vZG9jcy5nb29nbGUuY29tL2Zvcm1zL2Qv
ZS8xRkFJcFFMU2Rfa0IydzVYZ1c2YU5xa25WXzdCaDk2aEdIRGFzM0pXZFl1WFFXcFRFV0ZuNThh
Zy92aWV3Zm9ybSBhbmQgY2xvc2VzIFdlZG5lc2RheSwgU2VwdGVtYmVyIDExDQoNCkJlc3QgUmVn
YXJkcw0KTGFycw0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C86B6CC52
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 11:51:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ho32O-00081O-IR; Thu, 18 Jul 2019 09:49:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=04i1=VP=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1ho32M-00081J-VJ
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 09:49:18 +0000
X-Inumbo-ID: 4d99a598-a941-11e9-92ed-2fac7b6e6a78
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4d99a598-a941-11e9-92ed-2fac7b6e6a78;
 Thu, 18 Jul 2019 09:49:15 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: lyQztnwyoQlzCXYuaxOuaUrUYkmfoZRNyw9aQSKgGfoGIFo3ya4bIiirinejKg99kXlp+lSQ+B
 nmoUmDLOPHoYp850vhLUH14Bj7Kvk2kdd8Q6CmQDifowXQgbhdLzXl0ezjtu5DZ16hm+W/z77N
 j8O4kv2yWNZDvZzrG1eoZJbEUAN2XIb5LdsnbsjXvzDx1IiGq44bPixgYxbp5mHYV38hzUzMp2
 mecrn2zO7t+CzO2TCdIOuPIbNiMtOGSRKVud8qdvBOuap/Ad8KInj/dCNPfLdbfWYS/gnD+3AW
 qRc=
X-SBRS: 2.7
X-MesageID: 3114347
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,276,1559534400"; 
   d="scan'208";a="3114347"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: "xen-devel (xen-devel@lists.xenproject.org)"
 <xen-devel@lists.xenproject.org>
Thread-Topic: IOMMU page-tables
Thread-Index: AdU9TCP6x7BzOdjWTRO+l3/aOrPvEA==
Date: Thu, 18 Jul 2019 09:49:12 +0000
Message-ID: <f07114de1c9f440182359a1d7d064fdd@AMSPEX02CL03.citrite.net>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: [Xen-devel] IOMMU page-tables
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

SGksCgogIEJlZm9yZSBJIGdldCB0b28gZmFyIGludG8gdGhpcyBJIHdhbnQgdG8gZ2V0IHNvbWUg
b3BpbmlvbnMgZnJvbSB0aGUgd2lkZXIgY29tbXVuaXR5Li4uCgogIEF0IHRoZSBtb21lbnQgd2hl
biB0aGUgZmlyc3QgUENJIGRldmljZSBpcyBhc3NpZ25lZCB0byBhIGRvbWFpbiAoaS5lLiBwYXNz
ZWQgdGhyb3VnaCkgdGhpcyB3aWxsIHRyaWdnZXIgY29uc3RydWN0aW9uIG9mIElPTU1VIHBhZ2Ug
dGFibGVzIGZvciB0aGF0IGRvbWFpbi4gU2ltaWxhcmx5IHdoZW4gdGhlIGxhc3QgUENJIGRldmlj
ZSBpcyBkZS1hc3NpZ25lZCB0aGUgdGFibGVzIGFyZSB0b3JuIGRvd24gYWdhaW4uIEJvdGggb2Yg
dGhlc2Ugb3BlcmF0aW9ucyBjYW4gYmUgcXVpdGUgZXhwZW5zaXZlIGlmIHRoZSBkb21haW4gaXMg
YSBsYXJnZSBhbW91bnQgZm9yIFJBTSwgYW5kIGlmIHRoZSBJT01NVSBkb2VzIG5vdCBzdXBwb3J0
IHNoYXJpbmcgdGhlIHNlY29uZCBsZXZlbCBDUFUgcGFnZSB0YWJsZXMgKG9yIHRoZSBkb21haW4g
aXMgUFYpLiBNb3Jlb3ZlciwgdGhlIGd1ZXN0IGNvdWxkIHNpbXVsdGFuZW91c2x5IGJlIGJhbGxv
b25pbmcgb3IgZG9pbmcgb3RoZXIgb3BlcmF0aW9ucyB0aGF0IGFmZmVjdCBpdHMgcGFnZSB0eXBl
cyBhbmQgc28gdGhlIHByb2Nlc3Mgb2YgYnVpbGRpbmcgdGhlIHRhYmxlcyBoYXMgdG8gdGFrZSBp
bnRvIGFjY291bnQgc3VjaCByYWNlcy4KICBJZiB3ZSB3ZXJlIGluc3RlYWQgdG8gc2F5IHRoYXQg
Z2l2aW5nIGEgZG9tYWluIElPTU1VIHBhZ2UgdGFibGVzIGlzIGFuIG9wdGlvbiB0aGF0IG5lZWRz
IHRvIGJlIHNlbGVjdGVkIGF0IGRvbWFpbiBjcmVhdGUgdGltZSB0aGVuIGl0IG1ha2VzIHRoZSBj
b2RlIHNpZ25pZmljYW50bHkgc2ltcGxlciBhbmQgdGhlcmUgaXMgbm8gbmVlZCB0byBkZWFsIHdp
dGggcGFnZSB0eXBlIGNoYW5nZS9iYWxsb29uaW5nIHJhY2VzIGFueSBtb3JlLiBJIGhhY2tlZCB0
b2dldGhlciBhIHRlc3QgcGF0Y2ggYW5kIGl0IGdldHMgcmlkIG9mIHJvdWdobHkgMjAwIGxpbmVz
IG9mIGNvZGUgKGFuZCB0aGVyZSBtYXkgYmUgbW9yZSB0aGF0IEkgbWlzc2VkKS4KICBEb2VzIGFu
eW9uZSB0aGluayB0aGF0IGRlY2lkaW5nIHdoZXRoZXIgYSBkb21haW4gc2hvdWxkIGdldCBJT01N
VSBwYWdlIHRhYmxlcyBpcyBub3QgYSByZWFzb25hYmxlIHRoaW5nIHRvIGhhdmUgdG8gZG8gYXQg
Y3JlYXRlIHRpbWU/CgogIENoZWVycywKCiAgICBQYXVsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs

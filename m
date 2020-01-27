Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F186B14A304
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2020 12:27:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iw2UR-0000BM-W2; Mon, 27 Jan 2020 11:23:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Csoy=3Q=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1iw2UR-0000BC-6A
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2020 11:23:35 +0000
X-Inumbo-ID: 6ef982be-40f7-11ea-8e9a-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6ef982be-40f7-11ea-8e9a-bc764e2007e4;
 Mon, 27 Jan 2020 11:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580124204;
 h=from:to:cc:subject:date:message-id:content-id:
 content-transfer-encoding:mime-version;
 bh=Bo1xoG0zFB4TwwXYG1+s5zHAZYVBywd13STys3vWbbU=;
 b=Ie/3ovEtyHgjvqxSIBmfd//ctr9YZnpks5fRGxA31U8hx2LuIGrvD/iD
 OTg3/qyaKEpFXtKlA9y1rDv492VEvQMDaXRzUd3CFg2JSCls+nSIJsKgl
 HPTvj3cezESzpZzqFXwTR5gUCOy2aYLUugTpIRkIivebW9sn7HZ90DNNc c=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=lars.kurth@citrix.com;
 spf=Pass smtp.mailfrom=lars.kurth@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 lars.kurth@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 lars.kurth@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: SU1kuoMWGfjhNihn8plP/uQbDDquj8Qpj72qNs4HS+J+C5sGaRuyijFepFV68iJ5Luwulonvy/
 H6QnQaB+GH0F0GDTNQIi64CdJgqh0YxzXRLju2THJ+jhAhdeNyFxfeX90QCNgkdX19gD/Ye+vD
 yB3yNCEOk1jqnYcX+Ij5SuqqzRZEZva/CToGIgAESpfeAB32He2n2znPrM3xzhtb0sZi1a2And
 bdOzzNf29kQY6i7XwrFmWvOgIMOtjburRRqC4p8Nux9cQGSdGQ9mWU73ZBlEcwblrk54Q+9wTX
 13o=
X-SBRS: 2.7
X-MesageID: 12083208
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,369,1574139600"; d="scan'208";a="12083208"
From: Lars Kurth <lars.kurth@citrix.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Thread-Topic: [Announcement] CfP for Xen Project Developer Summit closes March
 6th
Thread-Index: AQHV1QQppFbZnzRW/kmcyTvO620eYw==
Date: Mon, 27 Jan 2020 11:23:12 +0000
Message-ID: <7FF4B79F-19A3-472B-80E9-CB9AA12AA2DE@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.21.0.200113
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <F8F6F3837A398A4B8C67876E9451033E@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [Announcement] CfP for Xen Project Developer Summit
 closes March 6th
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
Cc: "committers@xenproject.org" <committers@xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RGVhciBjb21tdW5pdHkgbWVtYmVycywNCg0KVGhlIENmUCBhbmQgUmVnaXN0cmF0aW9uIGZvciB0
aGUgWGVuIFByb2plY3QgRGV2ZWxvcGVyICYgRGVzaWduIFN1bW1pdCBoYXMgYmVlbiBvcGVuIGZv
ciBhIHdlZWsuIFRoaXMgaXMgYSBxdWljayByZW1pbmRlciB0aGF0IHRoZSBDZlAgZm9yIHRhbGtz
IGNsb3NlcyBvbiBNYXJjaCA2dGguIA0KSW5mb3JtYXRpb24gYWJvdXQgdGhlIENmUCBjYW4gYmUg
Zm91bmQgaGVyZTogaHR0cHM6Ly9ldmVudHMubGludXhmb3VuZGF0aW9uLm9yZy94ZW4tc3VtbWl0
L3Byb2dyYW0vY2ZwLw0KDQpUaGUgZXZlbnQgdGFrZXMgcGxhY2UgZnJvbSBKdW5lIDJuZCB0aHJv
dWdoIHRoZSA0dGggYXQgdGhlIFBSRUNJUyBDZW50ZXIgaW4gQnVjaGFyZXN0LCBSb21hbmlhLiBU
aGlzIG1lYW5zIHRoYXQgd2UgaGF2ZSB0byBwdWJsaXNoIGEgc2NoZWR1bGUgYnkgZW5kIG9mIE1h
cmNoLCB0byBhdHRyYWN0IGF0dGVuZGVlcyB3aGljaCBkbyBub3QgYWx3YXlzIGNvbWUgdG8gdGhl
IGV2ZW50LiBJbmZvcm1hdGlvbiBhYm91dCB0aGUgZXZlbnQgY2FuIGJlIGZvdW5kIGhlcmU6IGh0
dHBzOi8vZXZlbnRzLmxpbnV4Zm91bmRhdGlvbi5vcmcveGVuLXN1bW1pdC8NCg0KVGhlIERlc2ln
biBTZXNzaW9ucyBzeXN0ZW0gaXMgbm90IHlldCBvcGVuLiBXZSBhbnRpY2lwYXRlIHRoYXQgaXQg
d2lsbCBvcGVuIGJlZm9yZSB0aGUgc2NoZWR1bGUgZ29lcyBsaXZlIGF0IHRoZSBlbmQgb2YgTWFy
Y2guDQoNClBsZWFzZSBsZXQgbWUga25vdyBpZiB5b3UgaGF2ZSBxdWVzdGlvbnMNCg0KQmVzdCBS
ZWdhcmRzDQpMYXJzDQoNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==

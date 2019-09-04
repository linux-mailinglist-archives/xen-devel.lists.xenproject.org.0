Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 790B1A8741
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2019 20:23:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5Ztr-0006eR-UN; Wed, 04 Sep 2019 18:20:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WgxQ=W7=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1i5Ztq-0006e4-UP
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2019 18:20:58 +0000
X-Inumbo-ID: b37565b2-cf40-11e9-abbd-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b37565b2-cf40-11e9-abbd-12813bfff9fa;
 Wed, 04 Sep 2019 18:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567621242;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=lGtLMc94JJQzOeMRmR1dldQs4pfkziYrTZsy4UbDZP4=;
 b=FQzR6xamjaVCKfoceq1Lyea4I5g+vP9qILrzGYuxkJN0o77229+khq02
 r9ynqhQykCA7X93dGUP7GsRzEOS6/ShIrMaXBWhL25HlgumenNAUkLdaj
 4RLzZoWf5ke1ZUJF9h0FwTGBvjKr9kP3skeSsu4mu30YBSC8NKCxarwNv Y=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=lars.kurth@citrix.com;
 spf=Pass smtp.mailfrom=lars.kurth@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 lars.kurth@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 lars.kurth@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: o8a5/Yv3u7UQuNJwC/0OYrQTXHZjpqsfiIPrjqnnf9qOuzDYewk5vMJxjOS67vl7mM9GYVp/eM
 TU7HEZDESzwhmadcGB8TT+Jb8GAdA9hpHxNMirY3pmlLbTv1kmrUTQVKucUtcephvGo6/JWVzl
 S0Yuv/Ks3l5crfv+iMB5UJ2VOjurjeynbS9r7K3Chf9M9NfdwEjPLw6EL9WkydkVb/J/jZ4OGH
 aeZbTwgWx51iDBqknoSBr5z2FKk9v2qNmGu5N2vZrCzF/VpJQ33EDMb2vApeTjmIc1bjroZSXG
 uek=
X-SBRS: 2.7
X-MesageID: 5144046
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,467,1559534400"; 
   d="scan'208";a="5144046"
From: Lars Kurth <lars.kurth@citrix.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH 0/2] Code of Conduct (based on Contributor Covenant v1.4)
Thread-Index: AQHVY0xSCXYAyOA5+kuSSJHc2RChdKcbw4mA
Date: Wed, 4 Sep 2019 18:20:37 +0000
Message-ID: <5BA52AD9-FAC0-43BB-8C5C-DD52699A40A8@citrix.com>
References: <cover.1567620587.git.lars.kurth@citrix.com>
In-Reply-To: <cover.1567620587.git.lars.kurth@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.d.190811
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <9253AA50A698894DA257A08FFE91E8CD@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 0/2] Code of Conduct (based on Contributor
 Covenant v1.4)
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
Cc: "minios-devel@lists.xenproject.org" <minios-devel@lists.xenproject.org>,
 "xen-api@lists.xenproject.org" <xen-api@lists.xenproject.org>,
 "win-pv-devel@lists.xenproject.org" <win-pv-devel@lists.xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>,
 "mirageos-devel@lists.xenproject.org" <mirageos-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQrvu79PbiAwNC8wOS8yMDE5LCAxOToxMiwgIkxhcnMgS3VydGgiIDxsYXJzLmt1cnRoQGNpdHJp
eC5jb20+IHdyb3RlOg0KDQogICAgVGhpcyBzZXJpZXMgcHJvcG9zZXMgYSBjb25jcmV0ZSB2ZXJz
aW9uIG9mIHRoZSBYZW4gUHJvamVjdA0KICAgIENvQyBiYXNlZCBvbiB2MS40IG9mIHRoZSBDb250
cmlidXRvciBDb3ZlbmFudC4gU2VlIFsxXQ0KICAgIA0KQXBvbG9naWVzIGZvciB0aGUgYmFkbHkg
Zm9ybWF0dGVkIHBhdGNoLiBJdCBzZWVtcyB0aGUgbm9ybWFsIGluc3RydWN0aW9ucyBkbyBub3Qg
d29yayB3aGVuIHVzaW5nIGl0IG9uIHZpcmdpbiBnaXQgcmVwb3NpdG9yeSBhbmQgSSBkaWRuJ3Qg
cmVhbGl6ZSB0aGF0IC1OMiBzdHJpcHMgdGhlIDEvMiwgMi8yDQoNClRoZSBkaXN0cmlidXRpb24g
bGlzdCBpcyBzbyB3aWRlLCBhcyB0aGlzIGFmZmVjdHMgYWxsIHN1Yi1wcm9qZWN0cw0KDQpMYXJz
IA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

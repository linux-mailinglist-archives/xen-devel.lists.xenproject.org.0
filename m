Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA7ECF98F
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2019 14:13:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHoJc-0004o2-4t; Tue, 08 Oct 2019 12:10:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rCmb=YB=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1iHoJa-0004kZ-O0
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2019 12:10:06 +0000
X-Inumbo-ID: 837ee8a8-e9c4-11e9-8c93-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 837ee8a8-e9c4-11e9-8c93-bc764e2007e4;
 Tue, 08 Oct 2019 12:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570536585;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Qm/LjbcSvEciTTIHu6jx+llHWv5xSfgqSTZUcSLCeUc=;
 b=fWRKnlxZKh+c6pSYU6dohXPmZC2qFPyj5ENymoHpyr7Jv/VCXLKaYuur
 r0C9tAB1ndSItP3aEuuclihKH0HpaSoQK7x+JLeRomD3MSZ7MQHqyizwz
 vyC/hA6fvf7aGtBgbuhQeHj9J8UWnvyNa74u0veyc6YH0KclCl3M7cHgt Q=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Qek1Nf6LW1c5buEoxcYUZ+E7OkO5XmUU9D6uM/U0e1KJvfqdiDRARx9gLT3AM1QYSXdvfQrPVI
 Sy/jssEyNGpBdkM+h5PMLZ+bggJrjj1sUab2zB8+ZJbuPi2cX65OtrQ2CgLLat2wcD0AbTZaqy
 o3OlPH9Ll/iKpaVvNZLfqPjq0EftN7RcIIsqYbjlSjXYp8mfQNjFUNwpqbfMcbqMeCfRdJvq1i
 7Dq+OHNG+R3THaJDe1URWUksMlEsqF4aK5FZLKlm1UYPh5Zg1Ho//juBEq4+NoO2ds7vzJQiS/
 qWY=
X-SBRS: 2.7
X-MesageID: 6858968
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,270,1566878400"; 
   d="scan'208";a="6858968"
From: Lars Kurth <lars.kurth@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>, Xen-devel
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH 2/4] docs/sphinx: Indent cleanup
Thread-Index: AQHVei0G3TPSFWfB/0O0pcSnBHePB6dQnWgA
Date: Tue, 8 Oct 2019 12:09:40 +0000
Message-ID: <263D656E-93E4-4582-9A78-B77F72D1A981@citrix.com>
References: <20191003205623.20839-1-andrew.cooper3@citrix.com>
 <20191003205623.20839-3-andrew.cooper3@citrix.com>
In-Reply-To: <20191003205623.20839-3-andrew.cooper3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.e.190909
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <690A47D566279149B314B06EC409157C@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 2/4] docs/sphinx: Indent cleanup
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek
 Wilk <konrad.wilk@oracle.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCu+7v09uIDAzLzEwLzIwMTksIDIxOjU2LCAiQW5kcmV3IENvb3BlciIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+IHdyb3RlOg0KDQogICAgU3BoaW54LCBpdHMgbGludGVycywgYW5kIFJT
VCBtb2RlcyBpbiBjb21tb24gZWRpdG9ycywgZXhwZWN0IDMgc3BhY2VzIG9mDQogICAgaW5kZW50
YXRpb24uICBTb21lIGJpdHMgYWxyZWFkeSBjb25mb3JtIHRvIHRoaXMgZXhwZWN0YXRpb24uICBV
cGRhdGUgdGhlDQogICAgcmVzdCB0byBtYXRjaC4NCiAgICANCiAgICBTaWduZWQtb2ZmLWJ5OiBB
bmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KDQpSZXZpZXdlZC1ieTog
TGFycyBLdXJ0aCA8bGFycy5rdXJ0aEBjaXRyaXguY29tPg0KICAgIA0KDQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

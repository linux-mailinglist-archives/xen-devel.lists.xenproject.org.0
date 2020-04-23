Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA051B5933
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2020 12:31:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRZ8q-0002ia-5s; Thu, 23 Apr 2020 10:31:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wmme=6H=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jRZ8o-0002iR-Px
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2020 10:31:34 +0000
X-Inumbo-ID: 9a60f6c2-854d-11ea-9340-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9a60f6c2-854d-11ea-9340-12813bfff9fa;
 Thu, 23 Apr 2020 10:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587637893;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=88ObPnjc7oqBNVVKieuFiZ6HGMnRfimNK5HLKQnG9Hg=;
 b=S5b4RiJrvj8znTcMJ0YtEilVqmGpOhsz+sXP471Q1/VrfYrMusHENCNs
 /HIzhESVXFq53H9bPO4EictJlNlaLV+zkxfcaILJw26eaFxR6qSTZjn8L
 Odd2zbnnLPdF4PBue4YwYeTAvt6gezw7pnVsUOM6wLpSITjX3HjHSyJMh E=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=George.Dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 George.Dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
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
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: pHwaMcbjdkdyF6YuN7+uS7QcWVxbGhDdbGD1I9ofIt5YRFpyvbrkE+4jl22wNJS/v9oCa+S5uX
 k8WHUI/EujUcmyvOg0FMHWKMJAGE1TCF6geFzUh/4AXfFdPPzXri0BOZVOjeNCDLwZzBVxghXf
 F4Mm8Yc2WnzsPqK+4g5GL2VyT5qlhgb1aSKRRWLfx0rsD6i9E1SgyxGpGD83dAKVDWNcjLSpAm
 dbN26HgL5u/NP3t1exU+T+adhH9PXieGVV5gP5PnBK+XVg/UXUDB4AwZXkZ4XMKjl+ba6UiQNO
 A58=
X-SBRS: 2.7
X-MesageID: 16800743
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,307,1583211600"; d="scan'208";a="16800743"
From: George Dunlap <George.Dunlap@citrix.com>
To: Nick Rosbrook <rosbrookn@gmail.com>
Subject: Re: [PATCH 0/4] More wrappers for xenlight Go package
Thread-Topic: [PATCH 0/4] More wrappers for xenlight Go package
Thread-Index: AQHWERYayi56nLJ4jUq+qxG7wsmEEaiGcQAA
Date: Thu, 23 Apr 2020 10:31:30 +0000
Message-ID: <5AAA6D77-872F-4C46-9ECD-16D433FD4CE7@citrix.com>
References: <cover.1586727061.git.rosbrookn@ainfosec.com>
In-Reply-To: <cover.1586727061.git.rosbrookn@ainfosec.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.60.0.2.5)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <FFEDB89BFD52564B99D9E159D7D53537@citrix.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Ian Jackson <Ian.Jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gQXByIDEyLCAyMDIwLCBhdCAxMTowMiBQTSwgTmljayBSb3Nicm9vayA8cm9zYnJv
b2tuQGdtYWlsLmNvbT4gd3JvdGU6DQo+IA0KPiBUaGlzIHNlcmllcyBhZGRzIHdyYXBwZXJzIHRv
IHRoZSB4ZW5saWdodCBwYWNrYWdlIGZvciB2YXJpb3VzIGxpYnhsDQo+IGZ1bmN0aW9ucywgd2hp
Y2ggYXJlIG5vdyB0cml2aWFsIHRvIGFkZCB3aXRoIHRoZSBnZW5lcmF0ZWQgdHlwZXMgYW5kDQo+
IG1hcnNoYWxpbmcgaGVscGVycy4gSW4gcGFydGljdWxhciwgdGhlc2UgYXJlIGZ1bmN0aW9ucyB0
aGF0IHdvdWxkIGFsbG93IA0KPiByZWRjdGwgdG8gYmVnaW4gbWFraW5nIHRoZSB0cmFuc2l0aW9u
IHRvIHVzaW5nIHRoZSB4ZW5saWdodCBwYWNrYWdlLiBGb3INCj4gcmVmZXJlbmNlLCBJIGhhdmUg
c3RhcnRlZCBhbiBleHBlcmltZW50YWwgYnJhbmNoIHdoZXJlIEkgYW0gdXNpbmcgdGhlc2UNCj4g
ZnVuY3Rpb25zIGluIHJlZGN0bCBbMV0uDQo+IA0KPiBbMV0gaHR0cHM6Ly9naXRsYWIuY29tL2Vu
cjBuL3JlZGN0bC8tL2Jsb2IvMWJkZjdiNTE1NjU0Y2MwMzBlMDk1ZjNhNjMwYTI0NTMwZjkzMGMw
MC9pbnRlcm5hbC9zZXJ2ZXIveGVubGlnaHRfeGVuX2RyaXZlci5nbw0KPiANCj4gTmljayBSb3Ni
cm9vayAoNCk6DQo+ICBnb2xhbmcveGVubGlnaHQ6IGFkZCBOYW1lVG9Eb21pZCBhbmQgRG9taWRU
b05hbWUgdXRpbCBmdW5jdGlvbnMNCj4gIGdvbGFuZy94ZW5saWdodDogYWRkIERldmljZU5pY0Fk
ZC9SZW1vdmUgd3JhcHBlcnMNCj4gIGdvbGFuZy94ZW5saWdodDogYWRkIERldmljZVBjaUFkZC9S
ZW1vdmUgd3JhcHBlcnMNCj4gIGdvbGFuZy94ZW5saWdodDogYWRkIERldmljZVVzYmRldkFkZC9S
ZW1vdmUgd3JhcHBlcnMNCg0KRllJIEnigJl2ZSBwdXNoZWQgdGhlIGxhc3QgdGhyZWUgdG8gc3Rh
Z2luZy4NCg0KIC1HZW9yZ2U=


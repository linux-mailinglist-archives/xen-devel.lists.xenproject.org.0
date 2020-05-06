Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F214E1C6CD5
	for <lists+xen-devel@lfdr.de>; Wed,  6 May 2020 11:26:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWGJG-0006XK-5d; Wed, 06 May 2020 09:25:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+RWK=6U=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jWGJF-0006XF-2n
 for xen-devel@lists.xenproject.org; Wed, 06 May 2020 09:25:45 +0000
X-Inumbo-ID: 8f7ec288-8f7b-11ea-b07b-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8f7ec288-8f7b-11ea-b07b-bc764e2007e4;
 Wed, 06 May 2020 09:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588757144;
 h=from:to:subject:date:message-id:content-id:
 content-transfer-encoding:mime-version;
 bh=zOR7oP0vIGWuptoMR316WLNacqZpyL9csw+Bz1qBQCg=;
 b=c0SNTGyKuMirVzDiWhUGeyixFRPXtIZuyA40F32vqAzaRZmRUS+SuyzR
 FBsqrT+l48CKt2oc8YfbiY50dNIcofbBjglsDfxnacCvX9cJzB78D/eJx
 gXLEwuTMnra9F6fayEI6wtdf/ATtJNiIK9gyU6+fegN72Yi8TEWXhWqVa M=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Cxt1s9HfSv2neARbaPlUv403uldiZzVK7krGhjhLtw9wLJYX4ZKqtVOpFjS/PNn/wNYxHfPmRh
 HG84E7RCIHyuoUBTwx+4zPYIXh52PJum5FXgqH1wISXiyyPdJJ6PS/wo9Dck/iVR2L/qawmLiN
 PtVNGfY0b+eKYSSvQIUgnotdQ+hYompTDZCVYRe09EAjhnF/JBGpqmvKbf+IBM6oUoNtsO7b5b
 jrZuryBxwOoAf6bUAmIp4kGE5xHGlxWxcF3JgJJX+6UDpDpK2FT3vkIiByLL9NfRQzc/zh2sy3
 cKw=
X-SBRS: 2.7
X-MesageID: 17235415
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,358,1583211600"; d="scan'208";a="17235415"
From: George Dunlap <George.Dunlap@citrix.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: [ANNOUNCE] Call for agenda items for 7 May Community Call @ 15:00 UTC
Thread-Topic: [ANNOUNCE] Call for agenda items for 7 May Community Call @
 15:00 UTC
Thread-Index: AQHWI4hPEIh5dR/9x0+t1y63Yoi16g==
Date: Wed, 6 May 2020 09:25:40 +0000
Message-ID: <076A5C6D-A3FA-46D9-8640-90BC77B066CE@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.60.0.2.5)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <C8330C5A39FD2F4092F3B3AA02149F02@citrix.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgYWxsLA0KDQpUaGUgcHJvcG9zZWQgYWdlbmRhIGlzIGluICBhbmQgaHR0cHM6Ly9jcnlwdHBh
ZC5mci9wYWQvIy8yL3BhZC9lZGl0L3FQUVVFUUV2M25KSjk3Y2xTOGIyS2R0UC8geW91IGNhbiBl
ZGl0IHRvIGFkZCBpdGVtcy4gIEFsdGVybmF0aXZlbHksIHlvdSBjYW4gcmVwbHkgdG8gdGhpcyBt
YWlsIGRpcmVjdGx5Lg0KDQpBZ2VuZGEgaXRlbXMgYXBwcmVjaWF0ZWQgYSBmZXcgZGF5cyBiZWZv
cmUgdGhlIGNhbGw6IHBsZWFzZSBwdXQgeW91ciBuYW1lIGJlc2lkZXMgaXRlbXMgaWYgeW91IGVk
aXQgdGhlIGRvY3VtZW50Lg0KDQpOb3RlIHRoZSBmb2xsb3dpbmcgYWRtaW5pc3RyYXRpdmUgY29u
dmVudGlvbnMgZm9yIHRoZSBjYWxsOg0KKiBVbmxlc3MsIGFncmVlZCBpbiB0aGUgcGVydmlvdXMg
bWVldGluZyBvdGhlcndpc2UsIHRoZSBjYWxsIGlzIG9uIHRoZSAxc3QgVGh1cnNkYXkgb2YgZWFj
aCBtb250aCBhdCAxNjAwIEJyaXRpc2ggVGltZSAoZWl0aGVyIEdNVCBvciBCU1QpDQoqIEkgdXN1
YWxseSBzZW5kIG91dCBhIG1lZXRpbmcgcmVtaW5kZXIgYSBmZXcgZGF5cyBiZWZvcmUgd2l0aCBh
IHByb3Zpc2lvbmFsIGFnZW5kYQ0KDQoqIElmIHlvdSB3YW50IHRvIGJlIENDJ2VkIHBsZWFzZSBh
ZGQgb3IgcmVtb3ZlIHlvdXJzZWxmIGZyb20gdGhlIHNpZ24tdXAtc2hlZXQgYXQgaHR0cHM6Ly9j
cnlwdHBhZC5mci9wYWQvIy8yL3BhZC9lZGl0L0Q5dkd6aWhQeHhBT2U2UkZQejBzUkNmKy8NCg0K
QmVzdCBSZWdhcmRzDQpHZW9yZ2UNCg0KDQoNCj09IERpYWwtaW4gSW5mb3JtYXRpb24gPT0NCiMj
IE1lZXRpbmcgdGltZQ0KMTU6MDAgLSAxNjowMCBVVEMgKGR1cmluZyBCU1QpDQpGdXJ0aGVyIElu
dGVybmF0aW9uYWwgbWVldGluZyB0aW1lczogaHR0cHM6Ly93d3cudGltZWFuZGRhdGUuY29tL3dv
cmxkY2xvY2svbWVldGluZ2RldGFpbHMuaHRtbD95ZWFyPTIwMjAmbW9udGg9NSZkYXk9NyZob3Vy
PTE1Jm1pbj0wJnNlYz0wJnAxPTEyMzQmcDI9MzcmcDM9MjI0JnA0PTE3OQ0KDQoNCiMjIERpYWwg
aW4gZGV0YWlscw0KV2ViOiBodHRwczovL3d3dy5nb3RvbWVldC5tZS9HZW9yZ2VEdW5sYXANCg0K
WW91IGNhbiBhbHNvIGRpYWwgaW4gdXNpbmcgeW91ciBwaG9uZS4NCkFjY2VzcyBDb2RlOiAxNjgt
NjgyLTEwOQ0KDQpDaGluYSAoVG9sbCBGcmVlKTogNDAwOCA4MTEwODQNCkdlcm1hbnk6ICs0OSA2
OTIgNTczNiA3MzE3DQpQb2xhbmQgKFRvbGwgRnJlZSk6IDAwIDgwMCAxMTI0NzU5DQpVa3JhaW5l
IChUb2xsIEZyZWUpOiAwIDgwMCA1MCAxNzMzDQpVbml0ZWQgS2luZ2RvbTogKzQ0IDMzMCAyMjEg
MDA4OA0KVW5pdGVkIFN0YXRlczogKzEgKDU3MSkgMzE3LTMxMjkNClNwYWluOiArMzQgOTMyIDc1
IDIwMDQNCg0KDQpNb3JlIHBob25lIG51bWJlcnMNCkF1c3RyYWxpYTogKzYxIDIgOTA4NyAzNjA0
DQpBdXN0cmlhOiArNDMgNyAyMDgxIDU0MjcNCkFyZ2VudGluYSAoVG9sbCBGcmVlKTogMCA4MDAg
NDQ0IDMzNzUNCkJhaHJhaW4gKFRvbGwgRnJlZSk6IDgwMCA4MSAxMTENCkJlbGFydXMgKFRvbGwg
RnJlZSk6IDggODIwIDAwMTEgMDQwMA0KQmVsZ2l1bTogKzMyIDI4IDkzIDcwMTgNCkJyYXppbCAo
VG9sbCBGcmVlKTogMCA4MDAgMDQ3IDQ5MDYNCkJ1bGdhcmlhIChUb2xsIEZyZWUpOiAwMDgwMCAx
MjAgNDQxNw0KQ2FuYWRhOiArMSAoNjQ3KSA0OTctOTM5MQ0KQ2hpbGUgKFRvbGwgRnJlZSk6IDgw
MCAzOTUgMTUwDQpDb2xvbWJpYSAoVG9sbCBGcmVlKTogMDEgODAwIDUxOCA0NDgzDQpDemVjaCBS
ZXB1YmxpYyAoVG9sbCBGcmVlKTogODAwIDUwMDQ0OA0KRGVubWFyazogKzQ1IDMyIDcyIDAzIDgy
DQpGaW5sYW5kOiArMzU4IDkyMyAxNyAwNTY4DQpGcmFuY2U6ICszMyAxNzAgOTUwIDU5NA0KR3Jl
ZWNlIChUb2xsIEZyZWUpOiAwMCA4MDAgNDQxNCAzODM4DQpIb25nIEtvbmcgKFRvbGwgRnJlZSk6
IDMwNzEzMTY5OTA2LTg4Ni05NjUNCkh1bmdhcnkgKFRvbGwgRnJlZSk6ICgwNikgODAgOTg2IDI1
NQ0KSWNlbGFuZCAoVG9sbCBGcmVlKTogODAwIDcyMDQNCkluZGlhIChUb2xsIEZyZWUpOiAxODAw
MjY2OTI3Mg0KSW5kb25lc2lhIChUb2xsIEZyZWUpOiAwMDcgODAzIDAyMCA1Mzc1DQpJcmVsYW5k
OiArMzUzIDE1IDM2MCA3MjgNCklzcmFlbCAoVG9sbCBGcmVlKTogMSA4MDkgNDU0IDgzMA0KSXRh
bHk6ICszOSAwIDI0NyA5MiAxMyAwMQ0KSmFwYW4gKFRvbGwgRnJlZSk6IDAgMTIwIDY2MyA4MDAN
CktvcmVhLCBSZXB1YmxpYyBvZiAoVG9sbCBGcmVlKTogMDA3OTggMTQgMjA3IDQ5MTQNCkx1eGVt
Ym91cmcgKFRvbGwgRnJlZSk6IDgwMCA4NTE1OA0KTWFsYXlzaWEgKFRvbGwgRnJlZSk6IDEgODAw
IDgxIDY4NTQNCk1leGljbyAoVG9sbCBGcmVlKTogMDEgODAwIDUyMiAxMTMzDQpOZXRoZXJsYW5k
czogKzMxIDIwNyA5NDEgMzc3DQpOZXcgWmVhbGFuZDogKzY0IDkgMjgwIDYzMDINCk5vcndheTog
KzQ3IDIxIDkzIDM3IDUxDQpQYW5hbWEgKFRvbGwgRnJlZSk6IDAwIDgwMCAyMjYgNzkyOA0KUGVy
dSAoVG9sbCBGcmVlKTogMCA4MDAgNzcwMjMNClBoaWxpcHBpbmVzIChUb2xsIEZyZWUpOiAxIDgw
MCAxMTEwIDE2NjENClBvcnR1Z2FsIChUb2xsIEZyZWUpOiA4MDAgODE5IDU3NQ0KUm9tYW5pYSAo
VG9sbCBGcmVlKTogMCA4MDAgNDEwIDAyOQ0KUnVzc2lhbiBGZWRlcmF0aW9uIChUb2xsIEZyZWUp
OiA4IDgwMCAxMDAgNjIwMw0KU2F1ZGkgQXJhYmlhIChUb2xsIEZyZWUpOiA4MDAgODQ0IDM2MzMN
ClNpbmdhcG9yZSAoVG9sbCBGcmVlKTogMTgwMDcyMzEzMjMNClNvdXRoIEFmcmljYSAoVG9sbCBG
cmVlKTogMCA4MDAgNTU1IDQ0Nw0KU3dlZGVuOiArNDYgODUzIDUyNyA4MjcNClN3aXR6ZXJsYW5k
OiArNDEgMjI1IDQ1OTkgNzgNClRhaXdhbiAoVG9sbCBGcmVlKTogMCA4MDAgNjY2IDg1NA0KVGhh
aWxhbmQgKFRvbGwgRnJlZSk6IDAwMSA4MDAgMDExIDAyMw0KVHVya2V5IChUb2xsIEZyZWUpOiAw
MCA4MDAgNDQ4OCAyMzY4Mw0KVW5pdGVkIEFyYWIgRW1pcmF0ZXMgKFRvbGwgRnJlZSk6IDgwMCAw
NDQgNDA0MzkNClVydWd1YXkgKFRvbGwgRnJlZSk6IDAwMDQgMDE5IDEwMTgNClZpZXQgTmFtIChU
b2xsIEZyZWUpOiAxMjIgODAgNDgxDQrigIvigIvigIvigIvigIvigIvigIsNCg0KRmlyc3QgR29U
b01lZXRpbmc/IExldCdzIGRvIGEgcXVpY2sgc3lzdGVtIGNoZWNrOg0KDQpodHRwczovL2xpbmsu
Z290b21lZXRpbmcuY29tL3N5c3RlbS1jaGVjaw==


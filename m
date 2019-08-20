Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ACBA95CEB
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2019 13:08:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i01w4-0006za-4S; Tue, 20 Aug 2019 11:04:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Xv/m=WQ=amazon.de=prvs=128763efb=wipawel@srs-us1.protection.inumbo.net>)
 id 1i01w2-0006zR-TO
 for xen-devel@lists.xenproject.org; Tue, 20 Aug 2019 11:04:18 +0000
X-Inumbo-ID: 416cce72-c33a-11e9-8bf6-12813bfff9fa
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 416cce72-c33a-11e9-8bf6-12813bfff9fa;
 Tue, 20 Aug 2019 11:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1566299058; x=1597835058;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:mime-version: content-transfer-encoding;
 bh=l0aXztEsgJYWD1JW3EdEyKGs1kTgi/Ou7kmBZ2eDGmM=;
 b=Jven6abZAFvIPfMenBrzQ2+hJLICDvRcaz+vUqhY0osZ33nmp7/vihQi
 kPDRU7XseQV2eEM/sYjYZtEXgqXBCyXFrcwDwbe+3koOSpvNiSIXNO8UG
 U+FGmtdDXPj5Scr/mzvc1wi05DgWz9wlk8yJf1UnNmvzLEjfO8wb6lzk5 I=;
X-IronPort-AV: E=Sophos;i="5.64,408,1559520000"; d="scan'208";a="747559279"
Received: from iad6-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-2a-90c42d1d.us-west-2.amazon.com) ([10.124.125.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 20 Aug 2019 11:04:16 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2a-90c42d1d.us-west-2.amazon.com (Postfix) with ESMTPS
 id 909E1A24E0; Tue, 20 Aug 2019 11:04:15 +0000 (UTC)
Received: from EX13D05EUB002.ant.amazon.com (10.43.166.45) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 20 Aug 2019 11:04:14 +0000
Received: from EX13D05EUB004.ant.amazon.com (10.43.166.115) by
 EX13D05EUB002.ant.amazon.com (10.43.166.45) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 20 Aug 2019 11:04:13 +0000
Received: from EX13D05EUB004.ant.amazon.com ([10.43.166.115]) by
 EX13D05EUB004.ant.amazon.com ([10.43.166.115]) with mapi id 15.00.1367.000;
 Tue, 20 Aug 2019 11:04:13 +0000
From: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>
To: =?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
 <marmarek@invisiblethingslab.com>
Thread-Topic: [livepatch: independ. modules 3/3] python: Add XC binding for
 Xen build ID
Thread-Index: AQHU9FQkQLRkvrIaZk67aUP+VzvJmqb8s0UAgAcA3oCAAPE0gA==
Date: Tue, 20 Aug 2019 11:04:13 +0000
Message-ID: <BF511E1D-FB7E-4616-AD0C-F74159F09809@amazon.com>
References: <20190416125832.32881-3-wipawel@amazon.de>
 <20190815094400.126289-1-wipawel@amazon.de> <20190819204055.GC1457@mail-itl>
In-Reply-To: <20190819204055.GC1457@mail-itl>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.63]
Content-ID: <9BAB5105C9261748A971632709676DDE@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [livepatch: independ. modules 3/3] python: Add XC
 binding for Xen build ID
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Wei Liu <wl@xen.org>, Ian
 Jackson <ian.jackson@eu.citrix.com>, xen-devel <xen-devel@lists.xen.org>,
 "Pohlack, Martin" <mpohlack@amazon.de>, "Wieczorkiewicz,
 Pawel" <wipawel@amazon.de>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQo+IE9uIDE5LiBBdWcgMjAxOSwgYXQgMjI6NDAsIE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNr
aSA8bWFybWFyZWtAaW52aXNpYmxldGhpbmdzbGFiLmNvbT4gd3JvdGU6DQo+IA0KPiBPbiBUaHUs
IEF1ZyAxNSwgMjAxOSBhdCAwOTo0NDowMEFNICswMDAwLCBQYXdlbCBXaWVjem9ya2lld2ljeiB3
cm90ZToNCj4+IEV4dGVuZCB0aGUgbGlzdCBvZiB4YygpIG9iamVjdCBtZXRob2RzIHdpdGggYWRk
aXRpb25hbCBvbmUgdG8gZGlzcGxheQ0KPj4gWGVuJ3MgYnVpbGRpZC4gVGhlIGltcGxlbWVudGF0
aW9uIGZvbGxvd3MgdGhlIGxpYnhsIGltcGxlbWVudGF0aW9uDQo+PiAoZS5nLiBtYXggYnVpbGRp
ZCBzaXplIGFzc3VtcHRpb24gYmVpbmcgWENfUEFHRV9TSVpFKS4NCj4+IA0KPj4gU2lnbmVkLW9m
Zi1ieTogUGF3ZWwgV2llY3pvcmtpZXdpY3ogPHdpcGF3ZWxAYW1hem9uLmRlPg0KPj4gUmV2aWV3
ZWQtYnk6IE1hcnRpbiBNYXplaW4gPGFtYXplaW5AYW1hem9uLmRlPg0KPj4gUmV2aWV3ZWQtYnk6
IEFuZHJhLUlyaW5hIFBhcmFzY2hpdiA8YW5kcmFwcnNAYW1hem9uLmNvbT4NCj4+IFJldmlld2Vk
LWJ5OiBOb3JiZXJ0IE1hbnRoZXkgPG5tYW50aGV5QGFtYXpvbi5kZT4NCj4+IC0tLQ0KPj4gdjI6
DQo+PiANCuKApnNuaXAuLi4NCj4+IA0KPj4gK3N0YXRpYyBQeU9iamVjdCAqcHl4Y194ZW5idWls
ZGlkKFhjT2JqZWN0ICpzZWxmKQ0KPj4gK3sNCj4+ICsgICAgeGVuX2J1aWxkX2lkX3QgKmJ1aWxk
aWQ7DQo+PiArICAgIGludCBpLCByOw0KPj4gKyAgICBjaGFyICpzdHI7DQo+PiArDQo+PiArICAg
IGJ1aWxkaWQgPSBhbGxvY2Eoc2l6ZW9mKGJ1aWxkaWQtPmxlbikgKyBYQ19QQUdFX1NJWkUpOw0K
Pj4gKyAgICBidWlsZGlkLT5sZW4gPSBYQ19QQUdFX1NJWkUgLSBzaXplb2YoKmJ1aWxkaWQpOw0K
PiANCj4gVGhvc2UgZG9lc24ndCBtYXRjaC4gWW91IGFsbG9jYXRlZCBYQ19QQUdFX1NJWkUgaW4g
YWRkaXRpb24gdG8NCj4gc2l6ZW9mKGJ1aWxkaWQtPmxlbikuIEknZCBjaGFuZ2UgdG8gYWxsb2Nh
KFhDX1BBR0VfU0laRSkgLSBpdCBpcw0KPiB1bmxpa2VseSB0aGF0IGl6ZW9mKGJ1aWxkaWQtPmxl
bikgd291bGQgYmUgbGFyZ2VyIHRoYW4gWENfUEFHRV9TSVpFIGFuZA0KPiB3ZSBkbyBhc3N1bWUg
aXQgaW4gb3RoZXIgcGxhY2VzIGFueXdheS4NCg0KQUNLLiBXaWxsIGZpeC4NCg0KPiANCj4+ICsN
Cj4+ICsgICAgciA9IHhjX3ZlcnNpb24oc2VsZi0+eGNfaGFuZGxlLCBYRU5WRVJfYnVpbGRfaWQs
IGJ1aWxkaWQpOw0KPj4gKyAgICBpZiAoIHIgPD0gMCApDQo+PiArICAgICAgICByZXR1cm4gcHl4
Y19lcnJvcl90b19leGNlcHRpb24oc2VsZi0+eGNfaGFuZGxlKTsNCj4+ICsNCj4+IA0KDQrigKZz
bmlwLi4uDQoNCj4gDQo+IC0tIA0KPiBCZXN0IFJlZ2FyZHMsDQo+IE1hcmVrIE1hcmN6eWtvd3Nr
aS1Hw7NyZWNraQ0KPiBJbnZpc2libGUgVGhpbmdzIExhYg0KPiBBOiBCZWNhdXNlIGl0IG1lc3Nl
cyB1cCB0aGUgb3JkZXIgaW4gd2hpY2ggcGVvcGxlIG5vcm1hbGx5IHJlYWQgdGV4dC4NCj4gUTog
V2h5IGlzIHRvcC1wb3N0aW5nIHN1Y2ggYSBiYWQgdGhpbmc/DQoNCg0KQmVzdCBSZWdhcmRzLA0K
UGF3ZWwgV2llY3pvcmtpZXdpY3oNCg0KDQoNCgoKCkFtYXpvbiBEZXZlbG9wbWVudCBDZW50ZXIg
R2VybWFueSBHbWJICktyYXVzZW5zdHIuIDM4CjEwMTE3IEJlcmxpbgpHZXNjaGFlZnRzZnVlaHJ1
bmc6IENocmlzdGlhbiBTY2hsYWVnZXIsIFJhbGYgSGVyYnJpY2gKRWluZ2V0cmFnZW4gYW0gQW10
c2dlcmljaHQgQ2hhcmxvdHRlbmJ1cmcgdW50ZXIgSFJCIDE0OTE3MyBCClNpdHo6IEJlcmxpbgpV
c3QtSUQ6IERFIDI4OSAyMzcgODc5CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==

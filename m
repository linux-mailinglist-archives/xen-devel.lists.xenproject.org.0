Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 169F71E2021
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2020 12:51:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdXAc-0004TJ-DO; Tue, 26 May 2020 10:50:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=52a6=7I=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jdXAa-0004TE-U0
 for xen-devel@lists.xenproject.org; Tue, 26 May 2020 10:50:52 +0000
X-Inumbo-ID: c4055c24-9f3e-11ea-a606-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c4055c24-9f3e-11ea-a606-12813bfff9fa;
 Tue, 26 May 2020 10:50:51 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: cL5R855sXckrq7UQRAtJS3jZQhND/cvrshWa7YFrg0rmxAAQBIJc5p6kfR/U0JNkGtDtTvBaEX
 HG70zg9CV/odpI6d9x1h0y0dRQaJuqIOz6TTTkUhkSamtuVrGgrFuACpjRPhZ0wAWkvPysRbvb
 HYBvo0WsbZm5h6jtN+zu4SKosyppseOE8Nd90Ra7zIo+mOgWGfiJgqfrVpsRacVYfXrpR3bu+s
 56aTY8jvF16yVaeHAWlmZECMfKF+rRGLaMlHF5QvRR0Q5ZTIxajmkd3AFIXBhOIyTqRLNxSicY
 3Yk=
X-SBRS: None
X-MesageID: 19118755
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
From: George Dunlap <George.Dunlap@citrix.com>
To: Jason Andryuk <jandryuk@gmail.com>
Subject: Re: [PATCH] SUPPORT: Add linux device model stubdom to Toolstack
Thread-Topic: [PATCH] SUPPORT: Add linux device model stubdom to Toolstack
Thread-Index: AQHWMj/s7fGWchLRtk6NEQ/KHg6aZKi6EQAA
Date: Tue, 26 May 2020 10:50:47 +0000
Message-ID: <3986B3CE-1730-443C-BD10-D2161C2A75F4@citrix.com>
References: <20200525025506.225959-1-jandryuk@gmail.com>
In-Reply-To: <20200525025506.225959-1-jandryuk@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.80.23.2.2)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <B3F439CA8791704C92BE5E37C1E33655@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gTWF5IDI1LCAyMDIwLCBhdCAzOjU1IEFNLCBKYXNvbiBBbmRyeXVrIDxqYW5kcnl1
a0BnbWFpbC5jb20+IHdyb3RlOg0KPiANCj4gQWRkIHFlbXUteGVuIGxpbnV4IGRldmljZSBtb2Rl
bCBzdHViZG9tYWluIHRvIHRoZSBUb29sc3RhY2sgc2VjdGlvbiBhcyBhDQo+IFRlY2ggUHJldmll
dy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEphc29uIEFuZHJ5dWsgPGphbmRyeXVrQGdtYWlsLmNv
bT4NCj4gLS0tDQo+IFNVUFBPUlQubWQgfCA2ICsrKysrKw0KPiAxIGZpbGUgY2hhbmdlZCwgNiBp
bnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvU1VQUE9SVC5tZCBiL1NVUFBPUlQubWQN
Cj4gaW5kZXggZTNhMzY2ZmQ1Ni4uMjViZWNjOTE5MiAxMDA2NDQNCj4gLS0tIGEvU1VQUE9SVC5t
ZA0KPiArKysgYi9TVVBQT1JULm1kDQo+IEBAIC0xNTMsNiArMTUzLDEyIEBAIEdvIChnb2xhbmcp
IGJpbmRpbmdzIGZvciBsaWJ4bA0KPiANCj4gICAgIFN0YXR1czogRXhwZXJpbWVudGFsDQo+IA0K
PiArIyMjIExpbnV4IGRldmljZSBtb2RlbCBzdHViZG9tYWlucw0KPiArDQo+ICtTdXBwb3J0IGZv
ciBydW5uaW5nIHFlbXUteGVuIGRldmljZSBtb2RlbCBpbiBhIGxpbnV4IHN0dWJkb21haW4uDQo+
ICsNCj4gKyAgICBTdGF0dXM6IFRlY2ggUHJldmlldw0KDQpBY2tlZC1ieTogR2VvcmdlIER1bmxh
cCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPg0KDQpPdXQgb2YgY3VyaW9zaXR5LCB3aGF0IGRv
IHlvdSB0aGluayBpcyBtaXNzaW5nIHRvIGJlIGFibGUgdG8gZGVjbGFyZSB0aGlzIOKAmFN1cHBv
cnRlZOKAmT8gIEFyZSB0aGVyZSBhbnkgZmVhdHVyZXMgbWlzc2luZywgb3IgZG8gd2UganVzdCAg
bmVlZCB0byBhZGQgYSB0ZXN0IHRvIG9zc3Rlc3Q/DQoNCiAtR2Vvcmdl


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB0C118CBF
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2019 16:39:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iehZh-0001pc-LK; Tue, 10 Dec 2019 15:37:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ERUJ=2A=amazon.com=prvs=2402c4381=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iehZg-0001pW-93
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2019 15:37:20 +0000
X-Inumbo-ID: f3b8afa8-1b62-11ea-a1e1-bc764e2007e4
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f3b8afa8-1b62-11ea-a1e1-bc764e2007e4;
 Tue, 10 Dec 2019 15:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1575992240; x=1607528240;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=eU9mFvVK6zlmrQ7iG0yjwbsvAKDX1Sgqbcd+vMVq4Gs=;
 b=tbg3Fc89rcPJJG5z63EnzCVaogecKSIuAuSJ4E7UwbhmpgY/8z7OGU9I
 7AjxsUf+oaKhqDA11seK0xDcITZuQHEV00EX+Cdu+v0BiUidzFX5xJboN
 u2aO/sTu4desq7Wa7JYpEyc4uBTToCwbiWxcmI6b2PaEdRho6qbl/Dsiw 4=;
IronPort-SDR: 2UCiTvDB0OtMgOQcEqyMJErRjexzXW2fxaH+qoiCWcIK6/LqJUCC2dTe+qj3AuYVHfMbnCYDDf
 MjRJHE1a8qzg==
X-IronPort-AV: E=Sophos;i="5.69,300,1571702400"; 
   d="scan'208";a="8452318"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2a-69849ee2.us-west-2.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 10 Dec 2019 15:37:18 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-69849ee2.us-west-2.amazon.com (Postfix) with ESMTPS
 id 63C5BA1FF0; Tue, 10 Dec 2019 15:37:17 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 10 Dec 2019 15:37:16 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 10 Dec 2019 15:37:16 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Tue, 10 Dec 2019 15:37:16 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
Thread-Topic: [Xen-devel] [PATCH for-next 1/7] x86: import hyperv-tlfs.h from
 Linux
Thread-Index: AQHVr29SX289CcKCn0e0gFftYKHJTKezgFLA
Date: Tue, 10 Dec 2019 15:37:15 +0000
Message-ID: <cbb42ea2e12a4731873ae74ed0668a3c@EX13D32EUC003.ant.amazon.com>
References: <20191025091618.10153-1-liuwe@microsoft.com>
 <20191025091618.10153-2-liuwe@microsoft.com>
 <97016273-46d8-423d-8eef-f448f2d04845@suse.com>
In-Reply-To: <97016273-46d8-423d-8eef-f448f2d04845@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.120]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH for-next 1/7] x86: import hyperv-tlfs.h from
 Linux
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Wei Liu <liuwe@microsoft.com>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>, Xen
 Development List <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZl
bC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YgSmFuDQo+IEJldWxp
Y2gNCj4gU2VudDogMTAgRGVjZW1iZXIgMjAxOSAxNTozNA0KPiBUbzogV2VpIExpdSA8d2xAeGVu
Lm9yZz4NCj4gQ2M6IFdlaSBMaXUgPGxpdXdlQG1pY3Jvc29mdC5jb20+OyBQYXVsIER1cnJhbnQg
PHBhdWxAeGVuLm9yZz47IEFuZHJldw0KPiBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5j
b20+OyBNaWNoYWVsIEtlbGxleQ0KPiA8bWlrZWxsZXlAbWljcm9zb2Z0LmNvbT47IFhlbiBEZXZl
bG9wbWVudCBMaXN0IDx4ZW4tDQo+IGRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnPjsgUm9nZXIg
UGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbWGVuLWRl
dmVsXSBbUEFUQ0ggZm9yLW5leHQgMS83XSB4ODY6IGltcG9ydCBoeXBlcnYtdGxmcy5oDQo+IGZy
b20gTGludXgNCj4gDQo+IE9uIDI1LjEwLjIwMTkgMTE6MTYsIFdlaSBMaXUgd3JvdGU6DQo+ID4g
VGFrZW4gZnJvbSBMaW51eCBjb21taXQgYjJkOGIxNjdlMTViYjVlYzI2OTFkMTExOWMwMjU2MzBh
MjQ3ZjY0OS4NCj4gPg0KPiA+IFRoaXMgaXMgYSBwcmlzdGluZSBjb3B5IGZyb20gTGludXguIEl0
IGlzIG5vdCB1c2VkIHlldCBhbmQgcHJvYmFibHkNCj4gPiBkb2Vzbid0IGNvbXBpbGUuIENoYW5n
ZXMgdG8gbWFrZSBpdCB3b3JrIHdpbGwgY29tZSBsYXRlci4NCj4gPg0KPiA+IFNpZ25lZC1vZmYt
Ynk6IFdlaSBMaXUgPGxpdXdlQG1pY3Jvc29mdC5jb20+DQo+IA0KPiBUaGlzIGNvbWluZyBmcm9t
IExpbnV4IGFuZCBhc3N1bWluZyBhdCBsZWFzdCBhIGZhaXIgcGFydCBvZiBpdCBpcw0KPiBnb2lu
ZyB0byBiZSB1c2VkLCBpbiBwcmluY2lwbGUNCj4gQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4NCj4gDQo+IEhvd2V2ZXIsIHRoZXJlIGFyZSBtYW55IHNlZW1pbmdseSB1
bm5lY2Vzc2FyeSB1c2VzIG9mIF9fcGFja2VkDQo+IGhlcmUsIHdoaWNoIEknZCByYXRoZXIgbm90
IHNlZSBnbyBpbiBhdCBhbGwgKGkuZS4gbm90IGJlIGRyb3BwZWQNCj4gbGF0ZXIgb24sIGFuZCB0
aGVuIHBvdGVudGlhbGx5IG1pc3Npbmcgc29tZSkuIEkgZmluZCAuLi4NCj4gDQo+ID4gK3R5cGVk
ZWYgc3RydWN0IF9IVl9SRUZFUkVOQ0VfVFNDX1BBR0Ugew0KPiA+ICsJX191MzIgdHNjX3NlcXVl
bmNlOw0KPiA+ICsJX191MzIgcmVzMTsNCj4gPiArCV9fdTY0IHRzY19zY2FsZTsNCj4gPiArCV9f
czY0IHRzY19vZmZzZXQ7DQo+ID4gK30gIF9fcGFja2VkIEhWX1JFRkVSRU5DRV9UU0NfUEFHRSwg
KlBIVl9SRUZFUkVOQ0VfVFNDX1BBR0U7DQo+DQoNCllvdSByZWFsaXNlIHRoZXJlJ3MgYSBkZWZp
bml0aW9uIG9mIHRoaXMgaW4gdGhlIHZpcmlkaWFuIGNvZGUgYWxyZWFkeSwgcmlnaHQ/DQoNCiAg
UGF1bA0KIA0KPiAuLiB0aGlzIG9uZSBwYXJ0aWN1bGFybHkgc3VzcGljaW91czogSSBkb24ndCB0
aGluayBpdCBpcyB3ZWxsDQo+IGRlZmluZWQgZm9yIF9fcGFja2VkIHRvIGFsc28gYXBwbHkgdG8g
dGhlIHR5cGUNCj4gUEhWX1JFRkVSRU5DRV9UU0NfUEFHRSBwb2ludHMgdG8gKGFuZCBJIHN1c3Bl
Y3QgaXQgZG9lc24ndCkuDQo+IA0KPiBKYW4NCj4gDQo+IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fDQo+IFhlbi1kZXZlbCBtYWlsaW5nIGxpc3QNCj4gWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWwNCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=

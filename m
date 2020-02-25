Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C57F16C111
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2020 13:40:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6ZSj-0003C0-9s; Tue, 25 Feb 2020 12:37:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UoxS=4N=amazon.co.uk=prvs=317b3ba57=pdurrant@srs-us1.protection.inumbo.net>)
 id 1j6ZSh-0003Bv-Sx
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2020 12:37:19 +0000
X-Inumbo-ID: 8fbe686c-57cb-11ea-aba8-bc764e2007e4
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8fbe686c-57cb-11ea-aba8-bc764e2007e4;
 Tue, 25 Feb 2020 12:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1582634240; x=1614170240;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mryefqkdaZOSPzEAMeFo1HaNxGquhBcW1Z1LWZE/zw4=;
 b=K2XC6cO5Oa1p9jkmhQqUTeYTX6pEujK48B9t1xGyVdZOqVSKsdYPACSq
 7Epx2HRHdfuoJL3Qyw6HzxEQd94s4/qSGS+Au7e8vwBUPVgCtsuV0EzLp
 Z4h9Eni5H5FPm5l4MQu/ucLL4zMci/pUgosRnDvqJ2Ar5sqLp3V8ksph5 I=;
IronPort-SDR: A3CMK0Yt3Kl6Hn15wVoFbvpsfY1LAY8wPLLI1FVVx+q/79+bL8ISmQ7t6ByL9dVKooBCNK7pOA
 K8Y19dooJZeQ==
X-IronPort-AV: E=Sophos;i="5.70,484,1574121600"; d="scan'208";a="27333522"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2a-e7be2041.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 25 Feb 2020 12:37:19 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-e7be2041.us-west-2.amazon.com (Postfix) with ESMTPS
 id 6BAE2A279C; Tue, 25 Feb 2020 12:37:18 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Tue, 25 Feb 2020 12:37:17 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 25 Feb 2020 12:37:16 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Tue, 25 Feb 2020 12:37:16 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Wei Liu <wl@xen.org>, Xen Development List <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH] automation: document vsyscall=emulate for
 old glibc
Thread-Index: AQHV69UATaMZyo0+Wk+AaNSTjm4UKqgr2LMA
Date: Tue, 25 Feb 2020 12:37:16 +0000
Message-ID: <a1e112b19e1e4dc08561febfc0c819e4@EX13D32EUC003.ant.amazon.com>
References: <20200225121048.5889-1-wl@xen.org>
In-Reply-To: <20200225121048.5889-1-wl@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.108]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH] automation: document vsyscall=emulate for
 old glibc
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Doug Goldstein <cardoe@cardoe.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZl
bC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YgV2VpDQo+IExpdQ0K
PiBTZW50OiAyNSBGZWJydWFyeSAyMDIwIDEyOjExDQo+IFRvOiBYZW4gRGV2ZWxvcG1lbnQgTGlz
dCA8eGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnPg0KPiBDYzogRG91ZyBHb2xkc3RlaW4g
PGNhcmRvZUBjYXJkb2UuY29tPjsgV2VpIExpdSA8d2xAeGVuLm9yZz4NCj4gU3ViamVjdDogW1hl
bi1kZXZlbF0gW1BBVENIXSBhdXRvbWF0aW9uOiBkb2N1bWVudCB2c3lzY2FsbD1lbXVsYXRlIGZv
ciBvbGQNCj4gZ2xpYmMNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdsQHhlbi5vcmc+
DQo+IC0tLQ0KPiAgYXV0b21hdGlvbi9idWlsZC9SRUFETUUubWQgfCAxMCArKysrKysrKysrDQo+
ICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2F1
dG9tYXRpb24vYnVpbGQvUkVBRE1FLm1kIGIvYXV0b21hdGlvbi9idWlsZC9SRUFETUUubWQNCj4g
aW5kZXggNDc2ZjgyY2Y0NS4uOGNkYTJiNjVhNSAxMDA2NDQNCj4gLS0tIGEvYXV0b21hdGlvbi9i
dWlsZC9SRUFETUUubWQNCj4gKysrIGIvYXV0b21hdGlvbi9idWlsZC9SRUFETUUubWQNCj4gQEAg
LTU4LDYgKzU4LDE2IEBAIHVuZGVyc3RhbmRzLg0KPiAgLSBYRU5fQ09ORklHX0VYUEVSVDogSWYg
dGhpcyBpcyBkZWZpbmVkIGluIHlvdXIgc2hlbGwgaXQgd2lsbCBiZQ0KPiAgICBhdXRvbWF0aWNh
bGx5IHBhc3NlZCB0aHJvdWdoIHRvIHRoZSBjb250YWluZXIuDQo+IA0KPiArSWYgeW91ciBkb2Nr
ZXIgaG9zdCBoYXMgTGludXgga2VybmVsID4gNC4xMSwgYW5kIHlvdSB3YW50IHRvIHVzZQ0KPiBj
b250YWluZXJzDQo+ICt0aGF0IHJ1biBvbGQgZ2xpYmMgKGZvciBleGFtcGxlLCBDZW50T1MgNiBv
ciBTTEVTMTFTUDQpLCB5b3UgbWF5IG5lZWQgdG8NCj4gYWRkDQo+ICsNCj4gK2BgYA0KPiArdnN5
c2NhbGw9ZW11bGF0ZQ0KPiArYGBgDQo+ICsNCj4gK3RvIHRoZSBob3N0IGtlcm5lbCBjb21tYW5k
IGxpbmUuIFRoYXQgZW5hYmxlcyBhIGxlZ2FjeSBpbnRlcmZhY2UgdGhhdCBpcw0KPiB1c2VkDQo+
ICtieSBvbGQgZ2xpYmMuDQo+ICsNCg0KSSBjYW4gdm91Y2ggdGhhdCBpdCBpcyBpbmRlZWQgbmVj
ZXNzYXJ5Lg0KDQpSZXZpZXdlZC1ieTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24uY29t
Pg0KDQo+IA0KPiAgQnVpbGRpbmcgYSBjb250YWluZXINCj4gIC0tLS0tLS0tLS0tLS0tLS0tLS0t
DQo+IC0tDQo+IDIuMjAuMQ0KPiANCj4gDQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fDQo+IFhlbi1kZXZlbCBtYWlsaW5nIGxpc3QNCj4gWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWwNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=

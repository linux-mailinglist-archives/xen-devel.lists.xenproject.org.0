Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 353E614CB0A
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 14:03:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwmy1-0004hb-PQ; Wed, 29 Jan 2020 13:01:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xIWx=3S=amazon.co.uk=prvs=2906e62af=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iwmy0-0004hM-1i
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 13:01:12 +0000
X-Inumbo-ID: 6c05d534-4297-11ea-a933-bc764e2007e4
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6c05d534-4297-11ea-a933-bc764e2007e4;
 Wed, 29 Jan 2020 13:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1580302872; x=1611838872;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=L3PM/1VfBGebQ4J963xWaegSWeYjdR989va2AKAWbLg=;
 b=kYVeUBAj2DivF2uYWzk6ajSW1zzxErIO9RkqCdgIhU7jYMRrbzBLhow9
 augnq1P9WTe9PhW7cS+MW0RXOzLCezlzoyeGm1K/wF2FDMMR+WhRaqdg5
 fOhaJH1wZ/fhMKpsrdk9eZr9M5C6Wl/EYNY6PIDQYcSse9TgEQ6iWUV9Q I=;
IronPort-SDR: mmzEYfUlP+EgYVbXH+lQu/XIGzfFrpQ5C0LnOzTsvqSYzTBBPT9u1CEE9AirsDIW98JJOZo8qk
 PgcvQedpkSWw==
X-IronPort-AV: E=Sophos;i="5.70,377,1574121600"; d="scan'208";a="23153599"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2b-baacba05.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 29 Jan 2020 13:00:59 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-baacba05.us-west-2.amazon.com (Postfix) with ESMTPS
 id A71A4A26C6; Wed, 29 Jan 2020 13:00:57 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Wed, 29 Jan 2020 13:00:57 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 29 Jan 2020 13:00:56 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Wed, 29 Jan 2020 13:00:56 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [ANNOUNCE] Xen 4.14 Development Update
Thread-Index: AQHV1qC3v/Fua/b59UacJxMyrVG64agBl0+AgAACyrA=
Date: Wed, 29 Jan 2020 13:00:56 +0000
Message-ID: <e71376f7748e488ea7a4c02f2cae359d@EX13D32EUC003.ant.amazon.com>
References: <20200129123618.1202-1-pdurrant@amazon.com>
 <2de0978b-ad66-47a7-7d9b-07444f955f7a@suse.com>
In-Reply-To: <2de0978b-ad66-47a7-7d9b-07444f955f7a@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.63]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [ANNOUNCE] Xen 4.14 Development Update
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDI5IEphbnVhcnkgMjAyMCAxMjo0OA0KPiBUbzogRHVycmFu
dCwgUGF1bCA8cGR1cnJhbnRAYW1hem9uLmNvLnVrPg0KPiBDYzogeGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBbQU5OT1VOQ0VdIFhlbiA0LjE0IERldmVsb3Bt
ZW50IFVwZGF0ZQ0KPiANCj4gT24gMjkuMDEuMjAyMCAxMzozNiwgUGF1bCBEdXJyYW50IHdyb3Rl
Og0KPiA+ID09PSB4ODYgPT09DQo+ID4NCj4gPiAqICBJbnRlbCBQcm9jZXNzb3IgVHJhY2Ugdmly
dHVhbGl6YXRpb24gZW5hYmxpbmcgKHYxKQ0KPiA+ICAgLSAgTHV3ZWkgS2FuZw0KPiA+DQo+ID4g
KiAgTGludXggc3R1YiBkb21haW5zIChSRkMgdjIpDQo+ID4gICAtICBNYXJlayBNYXJjenlrb3dz
a2ktR8OzcmVja2kNCj4gPg0KPiA+ICogIEZpeGVzIHRvICNEQiBpbmplY3Rpb24NCj4gPiAgIC0g
IEFuZHJldyBDb29wZXINCj4gPg0KPiA+ICogIENQVUlEL01TUiBYZW4vdG9vbHN0YWNrIGltcHJv
dmVtZW50cw0KPiA+ICAgLSAgQW5kcmV3IENvb3Blcg0KPiA+DQo+ID4gKiAgSW1wcm92ZW1lbnRz
IHRvIGRvbWFpbl9jcmFzaCgpDQo+ID4gICAtICBBbmRyZXcgQ29vcGVyDQo+ID4NCj4gPiAqICBF
SUJSUw0KPiA+ICAgLSAgQW5kcmV3IENvb3Blcg0KPiA+DQo+ID4gKiAgWGVuIGlvcmVxIHNlcnZl
ciAodjMpDQo+ID4gICAtICBSb2dlciBQYXUgTW9ubmUNCj4gDQo+IERvIHlvdSB3YW50IHRvIGFk
ZCAieDg2L0hWTTogaW1wbGVtZW50IG1lbW9yeSByZWFkIGNhY2hpbmciDQo+IChodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTgtDQo+IDA5L21z
ZzAwOTc2Lmh0bWwpDQo+IGhlcmU/IEkgdGhpbmsgSSBub3cgaGF2ZSBzb21ldGhpbmcgY29taW5n
IGEgbGl0dGxlIGNsb3NlciB0bw0KPiB3aGF0IEFuZHJldyB3YW50cy4gSXQgaGFzIGl0cyBvd24g
ZG93bnNpZGVzLCBzbyB0aGVyZSBiZWluZyBhDQo+IHY0IChhZnRlciB3ZWxsIG92ZXIgYSB5ZWFy
KSBkb2Vzbid0IG1lYW4gdGhpcyB3aWxsIGdldCBpdCBhbnkNCj4gY2xvc2VyIHRvIGdvaW5nIGlu
Lg0KDQpJdCBzb3VuZHMgbGlrZSBzb21ldGhpbmcgdGhhdCBpcyByZWFzb25hYmxlIHRvIHRyYWNr
LiBJIGNhbiBhZGQgaXQgaW4gKHN0YXJ0aW5nIGF0IHYzLCBpZiB2NCBoYXMgbm90IGJlZW4gcG9z
dGVkIGJ5IHRoYXQgcG9pbnQpDQoNCj4gDQo+IERvIHlvdSBhbHNvIHdhbnQgdG8gYWRkIHRoZSBv
bmdvaW5nIHg4NiBpbnNuIGVtdWxhdG9yIHdvcmsNCj4gaGVyZT8gU29tZSBwYXJ0cyB3ZXJlIHBv
c3RlZCwgc29tZSBwYXJ0cyBhcmUgc3RpbGwgaW4gbmVlZGVkDQo+IG9mIGZpbmRpbmcgdGltZSB0
byBjYXJyeSBvdXQsIGFuZCBzb21lIHBhcnRzIGFyZSBzdGlsbCBwcmV0dHkNCj4gdmFndWUuDQoN
Ck9rLiBJdCdzIG9uLWdvaW5nIHdvcmsgc28gaXQgbWF5IGFzIHdlbGwgYmUgdHJhY2tlZC4NCg0K
ICBQYXVsDQoNCj4gDQo+IEphbg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==

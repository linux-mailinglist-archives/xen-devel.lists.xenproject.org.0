Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 474B114A884
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2020 18:01:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iw7jE-0000yp-LQ; Mon, 27 Jan 2020 16:59:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5TJ9=3Q=amazon.co.uk=prvs=288783767=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iw7jC-0000yi-Pn
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2020 16:59:10 +0000
X-Inumbo-ID: 561b24ee-4126-11ea-b833-bc764e2007e4
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 561b24ee-4126-11ea-b833-bc764e2007e4;
 Mon, 27 Jan 2020 16:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1580144351; x=1611680351;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DzKI/U+5tojuyhiViVpOy7XjxYlaEzfSXTGRO4IrB04=;
 b=PMnC/RW2qvIXGCAzp7Jx81q1nzLlA+aqsreI+3D5mpe4mnJqAQSysvqT
 37Q5IzYmVyyN49M6sJ1wZcfc2/OAXKDzSC3oyeGJUG4n3xgUbq7tdUk/T
 mFMY6ofVTo/KrflXqwTnjiDbi9urUz4OQAdO0a/jQTF+Oow/Qsm9FRDQ8 U=;
IronPort-SDR: SXP7RVKR8WYWYHUrCimfcG54/u4EPlw3K1B34pgDLxN83kWuoXBFFDo1XQLxyfa7A1xCL6bkIu
 u21SOkTDVZCw==
X-IronPort-AV: E=Sophos;i="5.70,370,1574121600"; d="scan'208";a="22707251"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1d-74cf8b49.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 27 Jan 2020 16:58:59 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1d-74cf8b49.us-east-1.amazon.com (Postfix) with ESMTPS
 id 355CBC076F; Mon, 27 Jan 2020 16:58:54 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Mon, 27 Jan 2020 16:58:54 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 27 Jan 2020 16:58:53 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Mon, 27 Jan 2020 16:58:53 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Juergen Gross <jgross@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH resend] docs: add DIRECTORY_PART
 specification do xenstore protocol doc
Thread-Index: AQHV1TIlEPAa/WJKA0e/SDeKaV2mqKf+u5Wg
Date: Mon, 27 Jan 2020 16:58:53 +0000
Message-ID: <05f5189a4c314c10aea5e6f9ebaa5ec6@EX13D32EUC003.ant.amazon.com>
References: <20200127165050.29413-1-jgross@suse.com>
In-Reply-To: <20200127165050.29413-1-jgross@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.48]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH resend] docs: add DIRECTORY_PART
 specification do xenstore protocol doc
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZl
bC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YNCj4gSnVlcmdlbiBH
cm9zcw0KPiBTZW50OiAyNyBKYW51YXJ5IDIwMjAgMTY6NTENCj4gVG86IHhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZw0KPiBDYzogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPjsg
U3RlZmFubyBTdGFiZWxsaW5pDQo+IDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgSnVsaWVuIEdy
YWxsIDxqdWxpZW5AeGVuLm9yZz47IFdlaSBMaXUNCj4gPHdsQHhlbi5vcmc+OyBLb25yYWQgUnpl
c3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+OyBHZW9yZ2UNCj4gRHVubGFwIDxH
ZW9yZ2UuRHVubGFwQGV1LmNpdHJpeC5jb20+OyBBbmRyZXcgQ29vcGVyDQo+IDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPjsgSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+
DQo+IFN1YmplY3Q6IFtYZW4tZGV2ZWxdIFtQQVRDSCByZXNlbmRdIGRvY3M6IGFkZCBESVJFQ1RP
UllfUEFSVCBzcGVjaWZpY2F0aW9uDQo+IGRvIHhlbnN0b3JlIHByb3RvY29sIGRvYw0KPiANCj4g
RElSRUNUT1JZX1BBUlQgd2FzIG1pc3NpbmcgaW4gZG9jcy9taXNjL3hlbnN0b3JlLnR4dC4gQWRk
IGl0Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29t
Pg0KDQpSZXZpZXdlZC1ieTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24uY29tPg0KDQo+
IC0tLQ0KPiAgZG9jcy9taXNjL3hlbnN0b3JlLnR4dCB8IDkgKysrKysrKysrDQo+ICAxIGZpbGUg
Y2hhbmdlZCwgOSBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZG9jcy9taXNjL3hl
bnN0b3JlLnR4dCBiL2RvY3MvbWlzYy94ZW5zdG9yZS50eHQNCj4gaW5kZXggYWUxYjZhOGM2ZS4u
NjU1NzAxODNiNiAxMDA2NDQNCj4gLS0tIGEvZG9jcy9taXNjL3hlbnN0b3JlLnR4dA0KPiArKysg
Yi9kb2NzL21pc2MveGVuc3RvcmUudHh0DQo+IEBAIC0xNTIsNiArMTUyLDE1IEBAIERJUkVDVE9S
WQkJPHBhdGg+fAkJCTxjaGlsZC0NCj4gbGVhZi1uYW1lPnwqDQo+ICAJbGVhZm5hbWVzLiAgVGhl
IHJlc3VsdGluZyBjaGlsZHJlbiBhcmUgZWFjaCBuYW1lZA0KPiAgCTxwYXRoPi88Y2hpbGQtbGVh
Zi1uYW1lPi4NCj4gDQo+ICtESVJFQ1RPUllfUEFSVAkJPHBhdGg+fDxvZmZzZXQ+CQk8Z2VuY250
Pnw8Y2hpbGQtbGVhZi0NCj4gbmFtZT58Kg0KPiArCVNhbWUgYXMgRElSRUNUT1JZLCBidXQgdG8g
YmUgdXNlZCBmb3IgY2hpbGRyZW4gbGlzdHMgbG9uZ2VyIHRoYW4NCj4gKwlYRU5TVE9SRV9QQVlM
T0FEX01BWC4gSW5wdXQgYXJlIDxwYXRoPiBhbmQgdGhlIGJ5dGUgb2Zmc2V0IGludG8NCj4gKwl0
aGUgbGlzdCBvZiBjaGlsZHJlbiB0byByZXR1cm4uIFJldHVybiB2YWx1ZXMgYXJlIHRoZSBnZW5l
cmF0aW9uDQo+ICsJY291bnQgPGdlbmNudD4gb2YgdGhlIG5vZGUgKHRvIGJlIHVzZWQgdG8gZW5z
dXJlIHRoZSBub2RlIGhhc24ndA0KPiArCWNoYW5nZWQgYmV0d2VlbiB0d28gcmVhZHM6IDxnZW5j
bnQ+IGJlaW5nIHRoZSBzYW1lIGZvciBtdWx0aXBsZQ0KPiArCXJlYWRzIGd1YXJhbnRlZXMgdGhl
IG5vZGUgaGFzbid0IGNoYW5nZWQpIGFuZCB0aGUgbGlzdCBvZiBjaGlsZHJlbg0KPiArCXN0YXJ0
aW5nIGF0IHRoZSBzcGVjaWZpZWQgPG9mZnNldD4gb2YgdGhlIGNvbXBsZXRlIGxpc3QuDQo+ICsN
Cj4gIEdFVF9QRVJNUwkgCTxwYXRoPnwJCQk8cGVybS1hcy1zdHJpbmc+fCsNCj4gIFNFVF9QRVJN
UwkJPHBhdGg+fDxwZXJtLWFzLXN0cmluZz58Kz8NCj4gIAk8cGVybS1hcy1zdHJpbmc+IGlzIG9u
ZSBvZiB0aGUgZm9sbG93aW5nDQo+IC0tDQo+IDIuMTYuNA0KPiANCj4gDQo+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+IFhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QNCj4gWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IGh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWwNCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

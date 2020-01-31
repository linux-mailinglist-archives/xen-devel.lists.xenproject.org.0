Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2030014EAAE
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jan 2020 11:36:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixTb5-0004z3-0R; Fri, 31 Jan 2020 10:32:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Qch3=3U=amazon.co.uk=prvs=292a3fd2f=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ixTb3-0004yy-Om
 for xen-devel@lists.xenproject.org; Fri, 31 Jan 2020 10:32:21 +0000
X-Inumbo-ID: f612c826-4414-11ea-8396-bc764e2007e4
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f612c826-4414-11ea-8396-bc764e2007e4;
 Fri, 31 Jan 2020 10:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1580466742; x=1612002742;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+yYYednB6padtb54CfxdVntBG5NKbsRg9Ffm65JKVTM=;
 b=WX+ZcuyCLuiuOypSL1T5U7aJO13Jj4Vib2+RoV0STuiMnG8k/mqWGA7P
 bsksnwmNAO568urmMf8pNJswlbacToH9rmAexPYnVjMlVpz2MI9L4bgOL
 Vv5jGY5EyWraqLokiK4gPkAEUthy8I2xljSvK4LKI07cwYvkyN1ILGEnA w=;
IronPort-SDR: BJbZ1lU3nBsnEBM+1hD8g3I7lVcv5Tneqs7ek0CbjUvhuqhf1lp6iGAv5Hkfh33p0qSmXISlJ9
 CN1kmodclQCw==
X-IronPort-AV: E=Sophos;i="5.70,385,1574121600"; d="scan'208";a="22212420"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2b-c300ac87.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 31 Jan 2020 10:32:01 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-c300ac87.us-west-2.amazon.com (Postfix) with ESMTPS
 id CA763A2260; Fri, 31 Jan 2020 10:31:59 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Fri, 31 Jan 2020 10:31:51 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 31 Jan 2020 10:31:50 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Fri, 31 Jan 2020 10:31:50 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Thread-Topic: [Xen-devel] [PATCH v4 1/7] libxl: add definition of
 INVALID_DOMID to the API
Thread-Index: AQHV0TKAfSuQBKGYT06LZ4VCzz55Pqf2xNQAgA3bA5A=
Date: Fri, 31 Jan 2020 10:31:49 +0000
Message-ID: <61e9f341fc1b48beaa6266bb90ff2701@EX13D32EUC003.ant.amazon.com>
References: <20200122144446.919-1-pdurrant@amazon.com>
 <20200122144446.919-2-pdurrant@amazon.com>
 <20200122145248.GB57924@desktop-tdan49n.eng.citrite.net>
In-Reply-To: <20200122145248.GB57924@desktop-tdan49n.eng.citrite.net>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.63]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v4 1/7] libxl: add definition of
 INVALID_DOMID to the API
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Ian
 Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZl
bC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YNCj4gUm9nZXIgUGF1
IE1vbm7DqQ0KPiBTZW50OiAyMiBKYW51YXJ5IDIwMjAgMTQ6NTMNCj4gVG86IER1cnJhbnQsIFBh
dWwgPHBkdXJyYW50QGFtYXpvbi5jby51az4NCj4gQ2M6IEFudGhvbnkgUEVSQVJEIDxhbnRob255
LnBlcmFyZEBjaXRyaXguY29tPjsgeGVuLQ0KPiBkZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsg
SWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+OyBXZWkNCj4gTGl1IDx3bEB4
ZW4ub3JnPg0KPiBTdWJqZWN0OiBSZTogW1hlbi1kZXZlbF0gW1BBVENIIHY0IDEvN10gbGlieGw6
IGFkZCBkZWZpbml0aW9uIG9mDQo+IElOVkFMSURfRE9NSUQgdG8gdGhlIEFQSQ0KPiANCj4gT24g
V2VkLCBKYW4gMjIsIDIwMjAgYXQgMDI6NDQ6NDBQTSArMDAwMCwgUGF1bCBEdXJyYW50IHdyb3Rl
Og0KPiA+IEN1cnJlbnRseSBib3RoIHhsIGFuZCBsaWJ4bCBoYXZlIGludGVybmFsIGRlZmluaXRp
b25zIG9mIElOVkFMSURfRE9NSUQNCj4gPiB3aGljaCBoYXBwZW4gdG8gYmUgaWRlbnRpY2FsLiBI
b3dldmVyLCBmb3IgdGhlIHB1cnBvc2VzIG9mIGRlc2NyaWJpbmcNCj4gdGhlDQo+ID4gYmVoYXZp
b3VyIG9mIGxpYnhsX2RvbWFpbl9jcmVhdGVfbmV3L3Jlc3RvcmUoKSBpdCBpcyB1c2VmdWwgdG8g
aGF2ZSBhDQo+ID4gc3BlY2lmaWVkIGludmFsaWQgdmFsdWUgZm9yIGEgZG9tYWluIGlkLg0KPiA+
DQo+ID4gVGhpcyBwYXRjaCB0aGVyZWZvcmUgbW92ZXMgdGhlIGxpYnhsIGRlZmluaXRpb24gZnJv
bSBsaWJ4bF9pbnRlcm5hbC5oIHRvDQo+ID4gbGlieGwuaCBhbmQgcmVtb3ZlcyB0aGUgaW50ZXJu
YWwgZGVmaW5pdGlvbiBmcm9tIHhsX3V0aWxzLmguIFRoZQ0KPiBoYXJkY29kZWQNCj4gPiAnLTEn
IHBhc3NlZCBiYWNrIHZpYSBkb21jcmVhdGVfY29tcGxldGUoKSBpcyB0aGVuIHVwZGF0ZWQgdG8N
Cj4gSU5WQUxJRF9ET01JRA0KPiA+IGFuZCBjb21tZW50IGFib3ZlIGxpYnhsX2RvbWFpbl9jcmVh
dGVfbmV3L3Jlc3RvcmUoKSBpcyBhY2NvcmRpbmdseQ0KPiA+IG1vZGlmaWVkLg0KPiANCj4gVXJn
LCBpdCdzIGtpbmQgb2YgdWdseSB0byBhZGQgYW5vdGhlciBkZWZpbml0aW9uIG9mIGludmFsaWQg
ZG9taWQgd2hlbg0KPiB0aGVyZSdzIGFscmVhZHkgRE9NSURfSU5WQUxJRCBpbiB0aGUgcHVibGlj
IGhlYWRlcnMuIEkgZ3Vlc3MgdGhlcmUncyBhDQo+IHJlYXNvbiBJJ20gbWlzc2luZyBmb3Igbm90
IHVzaW5nIERPTUlEX0lOVkFMSUQgaW5zdGVhZCBvZiBpbnRyb2R1Y2luZw0KPiBhIG5ldyB2YWx1
ZT8NCj4gDQoNClRCSCBJIGRvbid0IGtub3cuIEFzIGZhciBhcyB4bC9saWJ4bCBnb2VzLCBkb21p
ZHMgYXJlIHVpbnQzMl90cyBzbyBtYXliZSBET01JRF9JTlZBTElEIHdhcyBmb3Igc29tZSByZWFz
b24gbm90IGNvbnNpZGVyZWQgYXBwcm9wcmlhdGU/IEJlYXIgaW4gbWluZCwgdGhpcyBwYXRjaCBp
cyBub3QgdHJ1bHkgaW50cm9kdWNpbmcgYSBuZXcgdmFsdWU7IGl0J3MganVzdCBtYWtpbmcgc29t
ZXRoaW5nIHRoYXQgd2FzIGludGVybmFsIGJ1dCBpZGVudGljYWwgaW4gYm90aCB4bCBhbmQgbGli
eGwgcGFydCBvZiB0aGUgaW50ZXJmYWNlLg0KDQo+IElmIHNvIGNvdWxkIHRoaXMgYmUgbWVudGlv
bmVkIGluIHRoZSBjb21taXQgbWVzc2FnZT8NCj4gDQoNCkknbGwgYWRkIGEgbm90ZSB0byB0aGUg
Y29tbWl0IGNvbW1lbnQgdG8gcG9pbnQgb3V0IHRoYXQgdGhpcyBpcyBub3QgY2hhbmdpbmcgYW55
IHZhbHVlIHVzZWQgYnkgdGhlIHRvb2xzdGFjay4NCg0KICBQYXVsDQoNCj4gVGhhbmtzLCBSb2dl
ci4NCj4gDQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
DQo+IFhlbi1kZXZlbCBtYWlsaW5nIGxpc3QNCj4gWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnDQo+IGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWwNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

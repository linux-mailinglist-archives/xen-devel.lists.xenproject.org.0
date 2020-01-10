Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C567136A93
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2020 11:08:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iprAR-0001Lr-Om; Fri, 10 Jan 2020 10:05:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2ryA=27=amazon.co.uk=prvs=27124b7d2=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iprAQ-0001Lm-IH
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2020 10:05:22 +0000
X-Inumbo-ID: b63bfb80-3390-11ea-a2eb-bc764e2007e4
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b63bfb80-3390-11ea-a2eb-bc764e2007e4;
 Fri, 10 Jan 2020 10:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1578650722; x=1610186722;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=j89HtEqKLBhzj+S5OK+LTd/+ZM/6dWSUpBfeXEB0azo=;
 b=qmVCirMaQ9X1AyontV+KbaMPMv1nFdUhbmNCOworXUq7sbdKhzCbxg2m
 IqxIw74hdgSy60uwet59HmhFwpmBZJQsd1WYWMn7qF2eNQBRsDy/cmo4V
 +Zsw2x5554g2B+vnWbvxXjGkwUM6gnvqE2kKKyCnsU/FvtyokXtoi+vOa Q=;
IronPort-SDR: ow2jQv9B1/03ZuZrl5dV6XWXrTwHQW8uzjJgTanAOl92geMX3cgX/F5nMDjYF6GtJFUsLpdc9f
 GVupXVB4d88w==
X-IronPort-AV: E=Sophos;i="5.69,415,1571702400"; d="scan'208";a="17928651"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2a-6e2fc477.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 10 Jan 2020 10:05:08 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-6e2fc477.us-west-2.amazon.com (Postfix) with ESMTPS
 id 1F353A20FE; Fri, 10 Jan 2020 10:05:07 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 10 Jan 2020 10:05:06 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 10 Jan 2020 10:05:05 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Fri, 10 Jan 2020 10:05:05 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [PATCH] Introduce CHANGELOG.md
Thread-Index: AQHVx5YgnhlhQcqPBUeZ5xSzZzMbjqfjqCQAgAACNeA=
Date: Fri, 10 Jan 2020 10:05:05 +0000
Message-ID: <10d677971c374b21a2daa11e67a50b62@EX13D32EUC003.ant.amazon.com>
References: <20200110091238.845-1-pdurrant@amazon.com>
 <4ecd249e-1e34-20ff-ae26-cb4d3bbd8cf4@suse.com>
In-Reply-To: <4ecd249e-1e34-20ff-ae26-cb4d3bbd8cf4@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.252]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH] Introduce CHANGELOG.md
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Lars Kurth <lars.kurth@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDEwIEphbnVhcnkgMjAyMCAwOTo1Mg0KPiBUbzogRHVycmFu
dCwgUGF1bCA8cGR1cnJhbnRAYW1hem9uLmNvLnVrPg0KPiBDYzogeGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnOyBBbmRyZXcgQ29vcGVyDQo+IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29t
PjsgR2VvcmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBldS5jaXRyaXguY29tPjsNCj4gSWFuIEph
Y2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+OyBKdWxpZW4gR3JhbGwgPGp1bGllbkB4
ZW4ub3JnPjsNCj4gS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29t
PjsgU3RlZmFubyBTdGFiZWxsaW5pDQo+IDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgV2VpIExp
dSA8d2xAeGVuLm9yZz47IExhcnMgS3VydGgNCj4gPGxhcnMua3VydGhAY2l0cml4LmNvbT4NCj4g
U3ViamVjdDogUmU6IFtQQVRDSF0gSW50cm9kdWNlIENIQU5HRUxPRy5tZA0KPiANCj4gT24gMTAu
MDEuMjAyMCAxMDoxMiwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPiA+IC0tLSAvZGV2L251bGwNCj4g
PiArKysgYi9DSEFOR0VMT0cubWQNCj4gPiBAQCAtMCwwICsxLDE0IEBADQo+ID4gKyMgQ2hhbmdl
bG9nDQo+ID4gKw0KPiA+ICtBbGwgbm90YWJsZSBjaGFuZ2VzIHRvIFhlbiB3aWxsIGJlIGRvY3Vt
ZW50ZWQgaW4gdGhpcyBmaWxlLg0KPiANCj4gSG93IGRvIHdlIHF1YWxpZnkgd2hhdCdzICJub3Rh
YmxlIiBhbmQgd2hhdCdzIG5vdD8gSU9XIEkgd29uZGVyDQo+IHdoZXRoZXIgIkFsbCIgc2hvdWxk
IGJlIGRyb3BwZWQsIG9yIGJlIHJlcGxhY2VkIGJ5ICJTb21lIi4NCj4gDQoNCkFncmVlZCB0aGF0
IGl0J3MgZGViYXRhYmxlLiBQZXJoYXBzIGp1c3QgZHJvcCB0aGUgJ0FsbCcgYW5kIHNheToNCg0K
J05vdGFibGUgY2hhbmdlcyB0byBYZW4gd2lsbCBiZSBkb2N1bWVudGVkIGluIHRoaXMgZmlsZS4n
DQoNCj8NCg0KUGF0Y2ggYXV0aG9ycyBvdWdodCB0byB1cGRhdGUgdGhlIGZpbGUgaWYgdGhleSBj
b25zaWRlciB0aGVpciBjb250cmlidXRpb24ocykgbm90YWJsZSBidXQgSSdkIGFsc28gaG9wZSB0
aGF0IG1haW50YWluZXJzIHdpbGwgZXhwcmVzcyBhbiBvcGluaW9uIGFzIHRvIHdoZXRoZXIgc29t
ZXRoaW5nIHNob3VsZCBiZSBpbmNsdWRlZC9ub3QgaW5jbHVkZWQuIEl0J3Mgbm90IGdvaW5nIHRv
IGJlIGZvb2wtcHJvb2YgYnV0IEkgdGhpbmsgaXQgd2lsbCBiZSBiZXR0ZXIgdGhhbiBub3RoaW5n
Lg0KDQogIFBhdWwNCg0KPiBKYW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=

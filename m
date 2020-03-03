Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CC11777DD
	for <lists+xen-devel@lfdr.de>; Tue,  3 Mar 2020 14:54:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j97xO-0003nv-OY; Tue, 03 Mar 2020 13:51:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=x433=4U=amazon.co.uk=prvs=32428865a=pdurrant@srs-us1.protection.inumbo.net>)
 id 1j97xN-0003np-BG
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2020 13:51:33 +0000
X-Inumbo-ID: 16fc058e-5d56-11ea-94a0-bc764e2007e4
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 16fc058e-5d56-11ea-94a0-bc764e2007e4;
 Tue, 03 Mar 2020 13:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1583243493; x=1614779493;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Sch3vrMQMaOUmoSMCkNNgYuNh3+edPYwViz+xXWTAw0=;
 b=epvb3VZ2Vq6i+gKGPrBr9juXnPHMTy/nw1PQvEaJLialcPpm1ho7Ag9+
 5cfyXliUoE37xJYdxsWrZPkljs42AmFzzPjLeaOV3ZtmEs6AjFvEq1b1Q
 /AUdPT0yPgpunBYlo/Vdmc/RqGslV5Mc9nKESGXixsJaHhUg0ukODFbsV w=;
IronPort-SDR: RaKetImQBWnccwX+THt6/2xNDn3j8HG+QCsG5X8UyirfRUT0lJRXCyg3bN1YyjvOV0wDjBrxxE
 t36gblEo8lxA==
X-IronPort-AV: E=Sophos;i="5.70,511,1574121600"; d="scan'208";a="30253451"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1d-5dd976cd.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 03 Mar 2020 13:51:30 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-5dd976cd.us-east-1.amazon.com (Postfix) with ESMTPS
 id C8E5CA290E; Tue,  3 Mar 2020 13:51:26 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Tue, 3 Mar 2020 13:51:26 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 3 Mar 2020 13:51:25 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Tue, 3 Mar 2020 13:51:24 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: "Durrant, Paul" <pdurrant@amazon.co.uk>, Jan Beulich <jbeulich@suse.com>, 
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH] MAINTAINERS: Paul to co-maintain
 vendor-independent IOMMU code
Thread-Index: AQHV8VVnpsNjB5H2sEyKT+hFTnK/9qg24oGA
Date: Tue, 3 Mar 2020 13:51:24 +0000
Message-ID: <e1686178c4ea4bb8ab6a8b8720372631@EX13D32EUC003.ant.amazon.com>
References: <9731ee51-33ac-d916-3ae4-3126756a76c9@suse.com>
 <c181faf860cd412dae3de589c9c1bfd1@EX13D32EUC003.ant.amazon.com>
In-Reply-To: <c181faf860cd412dae3de589c9c1bfd1@EX13D32EUC003.ant.amazon.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.151]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH] MAINTAINERS: Paul to co-maintain
 vendor-independent IOMMU code
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
 Wei Liu <wl@xen.org>, Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZl
bC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YNCj4gRHVycmFudCwg
UGF1bA0KPiBTZW50OiAwMyBNYXJjaCAyMDIwIDEyOjEzDQo+IFRvOiBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gQ2M6IFN0
ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IEp1bGllbiBHcmFsbA0K
PiA8anVsaWVuQHhlbi5vcmc+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgS29ucmFkIFdpbGsNCj4g
PGtvbnJhZC53aWxrQG9yYWNsZS5jb20+OyBHZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVubGFwQGV1
LmNpdHJpeC5jb20+Ow0KPiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29t
PjsgUGF1bCBEdXJyYW50IDxwYXVsQHhlbi5vcmc+Ow0KPiBJYW4gSmFja3NvbiA8aWFuLmphY2tz
b25AY2l0cml4LmNvbT4NCj4gU3ViamVjdDogUmU6IFtYZW4tZGV2ZWxdIFtQQVRDSF0gTUFJTlRB
SU5FUlM6IFBhdWwgdG8gY28tbWFpbnRhaW4gdmVuZG9yLQ0KPiBpbmRlcGVuZGVudCBJT01NVSBj
b2RlDQo+IA0KPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IFtzbmlwXQ0KPiA+DQo+
ID4gSGF2aW5nIGp1c3QgYSBzaW5nbGUgbWFpbnRhaW5lciBpcyBub3QgaGVscGZ1bCBhbnl3aGVy
ZSwgYW5kIGNhbiBiZQ0KPiA+IGF2b2lkZWQgaGVyZSBxdWl0ZSBlYXNpbHksIHNlZWluZyB0aGF0
IFBhdWwgaGFzIGJlZW4gZG9pbmcgcXVpdGUgYSBiaXQNCj4gPiBvZiBJT01NVSB3b3JrIGxhdGVs
eS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT4NCj4gDQo+IFJldmlld2VkLWJ5OiBQYXVsIER1cnJhbnQgPHBkdXJyYW50QGFtYXpvbi5jb20+
DQo+IA0KPiA+DQo+ID4gLS0tIGEvTUFJTlRBSU5FUlMNCj4gPiArKysgYi9NQUlOVEFJTkVSUw0K
PiA+IEBAIC0zMjMsNiArMzIzLDcgQEAgRjogIHhlbi9hcmNoL3g4Ni9jcHUvdnBtdV9pbnRlbC5j
DQo+ID4NCj4gPiAgSU9NTVUgVkVORE9SIElOREVQRU5ERU5UIENPREUNCj4gPiAgTTogICAgIEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gPiArTTogICAgIFBhdWwgRHVycmFudCA8
cGR1cnJhbnRAYW1hem9uLmNvbT4NCg0KQWN0dWFsbHksIGNvdWxkIG15IGFkZHJlc3MgaGVyZSBi
ZSBzZXQgdG8gcGR1cnJhbnRAYW16bi5jb20gaGVyZSBwbGVhc2U/IEknbGwgc2VuZCBhIHBhdGNo
IGZvciBteSBvdGhlciBlbnRyaWVzIG5vdy4NCg0KICBUaGFua3MsDQoNCiAgICBQYXVsDQoNCj4g
PiAgUzogICAgIFN1cHBvcnRlZA0KPiA+ICBGOiAgICAgeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gv
DQo+ID4gIFg6ICAgICB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvDQo+ID4NCj4gPiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiA+IFhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QNCj4gPiBYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gPiBo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVsDQo+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+IFhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QNCj4gWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IGh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWwNCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

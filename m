Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A27E10FA68
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2019 10:06:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ic45d-0005OP-C3; Tue, 03 Dec 2019 09:03:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=R1E3=ZZ=amazon.com=prvs=233bd8a4a=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ic45c-0005OK-Dy
 for xen-devel@lists.xen.org; Tue, 03 Dec 2019 09:03:24 +0000
X-Inumbo-ID: c259d52a-15ab-11ea-83b8-bc764e2007e4
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c259d52a-15ab-11ea-83b8-bc764e2007e4;
 Tue, 03 Dec 2019 09:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1575363804; x=1606899804;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=8sE93puQK0YvbiIukywFlIKkk46lG9swYlj+7GgKm8E=;
 b=PfNKm7PJnEJWfMc6QAPFM24imPU9Nfa7Y3rjQxEwv4apTTUIHFpQKY9m
 tdO/DXMRFsZwbQomZ2y9widaZHtemj2QWpTtJuxrFVyFpfsqSV1Addg91
 x4uRZvR+c4rwcosJSAHBhP1aM05gnMgbr4UWhnB85r4Fxe4CPEMlnMkcJ o=;
IronPort-SDR: E7oFPQ44mX0rL7/cigIVPIYnzthuzyOAM7IIsaIbUatRpRE7N4stJuMHm7/gWtq7I7LmL9G6io
 efFS+ghe8HSQ==
X-IronPort-AV: E=Sophos;i="5.69,272,1571702400"; 
   d="scan'208";a="2814620"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2a-69849ee2.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 03 Dec 2019 09:03:13 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-69849ee2.us-west-2.amazon.com (Postfix) with ESMTPS
 id 921A6A25C1; Tue,  3 Dec 2019 09:03:12 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 3 Dec 2019 09:03:12 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 3 Dec 2019 09:03:11 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Tue, 3 Dec 2019 09:03:10 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel List
 <xen-devel@lists.xen.org>
Thread-Topic: [Xen-devel] Xen 4.14 and future work
Thread-Index: AQHVqUqk5MCo/aOaTki8kF6hi2B7FKeoF5GA
Date: Tue, 3 Dec 2019 09:03:10 +0000
Message-ID: <a1a9b3928b784590b5595591f61cbc44@EX13D32EUC003.ant.amazon.com>
References: <941cf23c-13ed-14a1-fd25-45b001d9564a@citrix.com>
In-Reply-To: <941cf23c-13ed-14a1-fd25-45b001d9564a@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.177]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] Xen 4.14 and future work
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZl
bC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YNCj4gQW5kcmV3IENv
b3Blcg0KPiBTZW50OiAwMiBEZWNlbWJlciAyMDE5IDE5OjUyDQo+IFRvOiBYZW4tZGV2ZWwgTGlz
dCA8eGVuLWRldmVsQGxpc3RzLnhlbi5vcmc+DQo+IFN1YmplY3Q6IFtYZW4tZGV2ZWxdIFhlbiA0
LjE0IGFuZCBmdXR1cmUgd29yaw0KPiANCj4gSGVsbG8sDQo+IA0KPiBOb3cgdGhhdCA0LjEzIGlz
IG9uIGl0cyB3YXkgb3V0IG9mIHRoZSBkb29yLCBpdCBpcyB0aW1lIHRvIGxvb2sgdG8NCj4gb25n
b2luZyB3b3JrLg0KPiANCj4gV2UgaGF2ZSBhIGxhcmdlIGJhY2tsb2cgb2Ygc3BlY3VsYXRpb24t
cmVsYXRlZCB3b3JrLsKgIEZvciBvbmUsIHdlIHN0aWxsDQo+IGRvbid0IHZpcnR1YWxpc2UgTVNS
X0FSQ0hfQ0FQUyBmb3IgZ3Vlc3RzLCBvciB1c2UgZUlCUlMgb3Vyc2VsdmVzIGluDQo+IFhlbi7C
oCBUaGVyZWZvcmUsIHdoaWxlIFhlbiBkb2VzIGZ1bmN0aW9uIG9uIENhc2NhZGUgTGFrZSwgc3Vw
cG9ydCBpcw0KPiBkaXN0aW5jdGx5IHN1Ym9wdGltYWwuDQo+IA0KPiBTaW1pbGFybHksIEFNRCBz
eXN0ZW1zIGZyZXF1ZW50bHkgZmlsbCAvdmFyL2xvZyB3aXRoOg0KPiANCj4gKFhFTikgZW11bC1w
cml2LW9wLmM6MTExMzpkMHYxMyBEb21haW4gYXR0ZW1wdGVkIFdSTVNSIGMwMDExMDIwIGZyb20N
Cj4gMHgwMDA2NDA0MDAwMDAwMDAwIHRvIDB4MDAwNjQwNDAwMDAwMDQwMA0KPiANCj4gd2hpY2gg
aXMgYW4gaW50ZXJhY3Rpb24gTGludXgncyBwcmN0bCgpIHRvIGRpc2FibGUgbWVtb3J5IGRpc2Ft
YmlndWF0aW9uDQo+IG9uIGEgcGVyLXByb2Nlc3MgYmFzaXMsIFhlbidzIHdyaXRlL2Rpc2NhcmQg
YmVoYXZpb3VyIGZvciBNU1JzLCBhbmQgdGhlDQo+IGxvbmctb3ZlcmR1ZSBzZXJpZXMgdG8gcHJv
cGVybHkgdmlydHVhbGlzZSBTU0JEIHN1cHBvcnQgb24gQU1EDQo+IGhhcmR3YXJlLsKgIEFNRCBS
b21lIGhhcmR3YXJlLCBsaWtlIENhc2NhZGUgTGFrZSwgaGFzIGNlcnRhaW4gaGFyZHdhcmUNCj4g
c3BlY3VsYXRpdmUgbWl0aWdhdGlvbiBmZWF0dXJlcyB3aGljaCBuZWVkIHZpcnR1YWxpc2luZyBm
b3IgZ3Vlc3RzIHRvDQo+IG1ha2UgdXNlIG9mLg0KPiANCg0KSSBhc3N1bWUgdGhpcyB3b3VsZCBh
ZGRyZXNzZWQgYnkgdGhlIHByb3Bvc2VkIGNwdWlkL21zciBwb2xpY3kgd29yaz8gSSB0aGluayBp
dCBpcyBxdWl0ZSB2aXRhbCBmb3IgWGVuIHRoYXQgd2UgYXJlIGFibGUgdG8gbWlncmF0ZSBndWVz
dHMgYWNyb3NzIHBvb2xzIG9mIGhldGVyb2dlbmVvdXMgaC93IGFuZCB0aGVyZWZvcmUgSSdkIGxp
a2UgdG8gc2VlIHRoaXMgZG9uZSBpbiA0LjE0IGlmIHBvc3NpYmxlLg0KDQo+IA0KPiBTaW1pbGFy
bHksIHRoZXJlIGlzIHBsZW50eSBtb3JlIHdvcmsgdG8gZG8gd2l0aCBjb3JlLWF3YXJlIHNjaGVk
dWxpbmcsDQo+IGFuZCBmcm9tIG15IHNpZGUgb2YgdGhpbmdzLCBzYW5lIGd1ZXN0IHRvcG9sb2d5
LsKgIFRoaXMgd2lsbCBldmVudHVhbGx5DQo+IHVuYmxvY2sgb25lIG9mIHRoZSBmYWN0b3JzIG9u
IHRoZSBoYXJkIDEyOCB2Y3B1IGxpbWl0IGZvciBIVk0gZ3Vlc3RzLg0KPiANCj4gDQo+IEFub3Ro
ZXIgYmlnIGFyZWEgaXMgdGhlIHN0YWJpbGl0eSBvZiB0b29sc3RhY2sgaHlwZXJjYWxscy7CoCBU
aGlzIGlzIGENCj4gY3JpcHBsaW5nIHBhaW4gcG9pbnQgZm9yIGRpc3Ryb3MgYW5kIHVwZ3JhZGVh
YmlsaXR5IG9mIHN5c3RlbXMsIGFuZA0KPiB0aGVyZSBpcyBmcmFua2x5IG5vIGp1c3RpZmlhYmxl
IHJlYXNvbiBmb3IgdGhlIHdheSB3ZSBjdXJyZW50bHkgZG8NCj4gdGhpbmdzwqAgVGhlIHJlYWwg
cmVhc29uIGlzIGluZXJ0aWEgZnJvbSBiYWNrIGluIHRoZSBkYXlzIHdoZW4gWGVuLmdpdA0KPiAo
Yml0a2VlcGVyIGFzIGl0IHdhcyBiYWNrIHRoZW4pIGNvbnRhaW5lZCBhIGZvcmsgb2YgZXZlcnkg
cmVsZXZhbnQNCj4gcGllY2VzIG9mIHNvZnR3YXJlLCBidXQgdGhpcyBhIGxvbmctc2luY2Ugb2Jz
b2xldGUgbW9kZWwsIGJ1dCBzdGlsbA0KPiBjYXVzaW5nIHVzIHBhaW4uwqAgSSB3aWxsIGZvbGxv
dyB1cCB3aXRoIGEgcHJvcG9zYWwgaW4gZHVlIGNvdXJzZSwgYnV0IGFzDQo+IGEgb25lbGluZXIs
IGl0IHdpbGwgYnVpbGQgb24gdGhlIGRtX29wKCkgQVBJIG1vZGVsLg0KDQpUaGlzIGlzIGFsc28g
ZmFpcmx5IHZpdGFsIGZvciB0aGUgd29yayBvbiBsaXZlIHVwZGF0ZSBvZiBYZW4gKGFzIGRpc2N1
c3NlZCBhdCB0aGUgbGFzdCBkZXYgc3VtbWl0KS4gQW55IGluc3RhYmlsaXR5IGluIHRoZSB0b29s
cyBBQkkgd2lsbCBjb21wcm9taXNlIGh5cGVydmlzb3IgdXBkYXRlIGFuZCBmaXhpbmcgc3VjaCBp
c3N1ZXMgb24gYW4gYWQtaG9jIGJhc2lzIGFzIHRoZXkgYXJpc2UgaXMgbm90IHJlYWxseSBhIGRl
c2lyYWJsZSBwcm9zcGVjdC4NCg0KPiANCj4gTGlrZWx5IGluY2x1ZGVkIHdpdGhpbiB0aGlzIGlz
IG1ha2luZyB0aGUgZG9tYWluL3ZjcHUgZGVzdHJveSBwYXRocw0KPiBpZGVtcG90ZW50IHNvIHdl
IGNhbiBmaXggYSBsb2FkIG9mIE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZXMgaW4gWGVuDQo+IGNh
dXNlZCBieSBYRU5fRE9NQ1RMX21heF92Y3B1cyBub3QgYmVpbmcgcGFydCBvZiBYRU5fRE9NQ1RM
X2NyZWF0ZWRvbWFpbi4NCj4gDQo+IE90aGVyIHdvcmsgaW4gdGhpcyBhcmVhIGludm9sdmVzIGFk
ZGluZyBYODZfRU1VTF97VklSSURJQU4sTkVTVEVEX1ZJUlR9DQo+IHRvIHJlcGxhY2UgdGhlaXIg
ZXhpc3RpbmcgcHJvYmxlbWF0aWMgZW5hYmxlbWVudCBpbnRlcmZhY2VzLg0KPiANCg0KSSB0aGlu
ayB0aGlzIHNob3VsZCBpbmNsdWRlIGRlcHJlY2F0aW9uIG9mIEhWTU9QX2dldC9zZXRfcGFyYW0g
YXMgZmFyIGFzIGlzIHBvc3NpYmxlIChpLmUuIHRvb2xzIHVzZSkuLi4NCg0KPiANCj4gQSBzdGFy
dCBuZWVkcyB0byBiZSBtYWRlIG9uIGEgdG90YWwgcmV0aGluayBvZiB0aGUgSFZNIEFCSS7CoCBU
aGlzIGhhcw0KPiBjb21lIHVwIHJlcGVhdGVkbHkgYXQgcHJldmlvdXMgZGV2IHN1bW1pdHMsIGFu
ZCBpcyBpbiBkZXNwZXJhdGUgbmVlZCBvZg0KPiBoYXZpbmcgc29tZSB3b3JrIHN0YXJ0ZWQgb24g
aXQuDQo+IA0KDQouLi5hbmQgY29tcGxldGVseSBpbiBhbnkgbmV3IEFCSS4NCg0KSSB3b25kZXIg
dG8gd2hhdCBleHRlbnQgd2UgY2FuIHByb3ZpZGUgYSBndWVzdC1zaWRlIGNvbXBhdCBsYXllciBo
ZXJlLCBvdGhlcndpc2UgaXQgd291bGQgYmUgaGFyZCB0byBnZXQgdHJhY3Rpb24gSSB0aGluay4N
ClRoZXJlIHdhcyBhbiBpbnRlcmVzdGluZyB0YWxrIGF0IEtWTSBGb3J1bSAoaHR0cHM6Ly9zY2hl
ZC5jby9UbXV5KSBvbiBkZWFsaW5nIHdpdGggZW11bGF0aW9uIGluc2lkZSBndWVzdCBjb250ZXh0
IGJ5IGVzc2VudGlhbGx5IHJlLWluamVjdGluZyB0aGUgVk1FWElUcyBiYWNrIGludG8gdGhlIGd1
ZXN0IGZvciBwc2V1ZG8tU01NIGNvZGUgKGxvYWRlZCBhcyBwYXJ0IG9mIHRoZSBmaXJtd2FyZSBi
bG9iKSB0byBkZWFsIHdpdGguIEkgY291bGQgaW1hZ2luZSBwb3RlbnRpYWxseSB1c2luZyBzdWNo
IGEgbWVjaGFuaXNtIHRvIGhhdmUgYSAnbGVnYWN5JyBoeXBlcmNhbGwgdHJhbnNsYXRlZCB0byB0
aGUgbmV3IEFCSSwgd2hpY2ggd291bGQgYWxsb3cgb2xkZXIgZ3Vlc3RzIHRvIGJlIHN1cHBvcnRl
ZCB1bm1vZGlmaWVkIChhbGJlaXQgd2l0aCBhIHBlcmZvcm1hbmNlIHBlbmFsdHkpLiBTdWNoIGEg
bWVjaGFuaXNtIG1heSBhbHNvIGJlIHVzZWZ1bCBhcyBhbiBhbHRlcm5hdGl2ZSB3YXkgb2YgZGVh
bGluZyB3aXRoIHNvbWUgb2YgdGhlIGVtdWxhdGlvbiBkZWFsdCB3aXRoIGRpcmVjdGx5IGluIFhl
biBhdCB0aGUgbW9tZW50LCB0byByZWR1Y2UgdGhlIGh5cGVydmlzb3IgYXR0YWNrIHN1cmZhY2Ug
ZS5nLiBzdGR2Z2EgY2FjaGluZywgaHBldCwgcnRjLi4uIHBlcmhhcHMuDQoNCkNoZWVycywNCg0K
ICBQYXVsDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

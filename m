Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E16116AA4
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 11:14:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieG07-00079f-Sv; Mon, 09 Dec 2019 10:10:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BuSh=Z7=amazon.com=prvs=2393b02c0=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ieG06-00079Y-AK
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 10:10:46 +0000
X-Inumbo-ID: 2a29f148-1a6c-11ea-87b8-12813bfff9fa
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2a29f148-1a6c-11ea-87b8-12813bfff9fa;
 Mon, 09 Dec 2019 10:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1575886246; x=1607422246;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QHz/uLqTQUyscpRPQBvnKdE0ex9UES2gJ3vnZUi95I4=;
 b=O3ixwiNGITL8MYXhv7UUIl+rD7d/+JhZRAsG2wPWsUnpoxYzycz4eGy6
 kGToCbcdUlOSWGmrHQGsN9wo1sum6jWY5gDxBFtg57WU3w02XJoOs2LdO
 oJ8a+oYpDMkuuqZdQDCp+X6/gEgyHYs6NNJEpV99IQiOOIQ9DpUK7JhqV g=;
IronPort-SDR: RS72le+/bJQMkc5rbNn8Nd6OZYAeB7tmMFC2Fu7Ce+S9HKb6/KPzgQKCPs2xeT8gReoLRMweKH
 zhhz3RDhMB1Q==
X-IronPort-AV: E=Sophos;i="5.69,294,1571702400"; 
   d="scan'208";a="8228751"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2c-87a10be6.us-west-2.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 09 Dec 2019 10:10:39 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2c-87a10be6.us-west-2.amazon.com (Postfix) with ESMTPS
 id 4417BA18A5; Mon,  9 Dec 2019 10:10:37 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 9 Dec 2019 10:10:36 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 9 Dec 2019 10:10:36 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Mon, 9 Dec 2019 10:10:35 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Thread-Topic: [Xen-devel] [PATCH-for-5.0 v3 6/6] hw/pci-host: Add Kconfig
 entry to select the IGD Passthrough Host Bridge
Thread-Index: AQHVrnZbIYbicIAsU0iXZ4evoRtKD6exlDCg
Date: Mon, 9 Dec 2019 10:10:35 +0000
Message-ID: <3f1702b0765841b19328366af11fd3ed@EX13D32EUC003.ant.amazon.com>
References: <20191209095002.32194-1-philmd@redhat.com>
 <20191209095002.32194-7-philmd@redhat.com>
In-Reply-To: <20191209095002.32194-7-philmd@redhat.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.211]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH-for-5.0 v3 6/6] hw/pci-host: Add Kconfig
 entry to select the IGD Passthrough Host Bridge
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Thomas Huth <thuth@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Paul Durrant <paul@xen.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZl
bC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YNCj4gUGhpbGlwcGUg
TWF0aGlldS1EYXVkw6kNCj4gU2VudDogMDkgRGVjZW1iZXIgMjAxOSAwOTo1MA0KPiBUbzogcWVt
dS1kZXZlbEBub25nbnUub3JnDQo+IENjOiBUaG9tYXMgSHV0aCA8dGh1dGhAcmVkaGF0LmNvbT47
IFN0ZWZhbm8gU3RhYmVsbGluaQ0KPiA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IE1pY2hhZWwg
Uy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+OyBQYXVsDQo+IER1cnJhbnQgPHBhdWxAeGVuLm9y
Zz47IE1hcmt1cyBBcm1icnVzdGVyIDxhcm1icnVAcmVkaGF0LmNvbT47IEFsZXgNCj4gV2lsbGlh
bXNvbiA8YWxleC53aWxsaWFtc29uQHJlZGhhdC5jb20+OyBNYXJjZWwgQXBmZWxiYXVtDQo+IDxt
YXJjZWwuYXBmZWxiYXVtQGdtYWlsLmNvbT47IFBhb2xvIEJvbnppbmkgPHBib256aW5pQHJlZGhh
dC5jb20+OyBBbnRob255DQo+IFBlcmFyZCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT47IHhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsNCj4gUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kg
PHBoaWxtZEByZWRoYXQuY29tPg0KPiBTdWJqZWN0OiBbWGVuLWRldmVsXSBbUEFUQ0gtZm9yLTUu
MCB2MyA2LzZdIGh3L3BjaS1ob3N0OiBBZGQgS2NvbmZpZyBlbnRyeQ0KPiB0byBzZWxlY3QgdGhl
IElHRCBQYXNzdGhyb3VnaCBIb3N0IEJyaWRnZQ0KPiANCj4gQWRkIHRoZSBYRU5fSUdEX1BBU1NU
SFJPVUdIIEtjb25maWcgb3B0aW9uLg0KPiANCj4gWGVuIGJ1aWxkIGhhcyB0aGF0IG9wdGlvbiBz
ZWxlY3RlZCBieSBkZWZhdWx0LiBOb24tWGVuIGJ1aWxkcyBub3cNCj4gaGF2ZSB0byBzZWxlY3Qg
dGhpcyBmZWF0dXJlIG1hbnVhbGx5Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogUGhpbGlwcGUgTWF0
aGlldS1EYXVkw6kgPHBoaWxtZEByZWRoYXQuY29tPg0KPiAtLS0NCj4gdjM6IE9ubHkgZGVmYXVs
dCB3aXRoIFhlbiAoQWxleCBXaWxsaWFtc29uKQ0KPiANCj4gSSBkaWQgbm90IHVzZWQgJ2RlcGVu
ZHMgb24gWEVOJyBhcyBzdWdnZXN0ZWQgYnkgQWxleCBidXQNCj4gJ2RlZmF1bHQgeSBpZiBYRU4n
LCBzbyBvbmUgY2FuIGJ1aWxkIFhFTiB3aXRob3V0IHRoaXMgZmVhdHVyZQ0KPiAoZm9yIGV4YW1w
bGUsIG9uIG90aGVyIEFSQ0ggdGhhbiBYODYpLg0KDQpBbGxvd2luZyBpdCB0byBiZSBjb21waWxl
ZCBvdXQgZm9yIFhlbiBidWlsZHMgaXMgcXVpdGUgcmVhc29uYWJsZSBJTU8uIEkgZG9uJ3QgYmVs
aWV2ZSBpdCBpcyB3aWRlbHkgdXNlZC4NCg0KQWNrZWQtYnk6IFBhdWwgRHVycmFudCA8cGF1bEB4
ZW4ub3JnPg0KDQo+IC0tLQ0KPiAgaHcvcGNpLWhvc3QvS2NvbmZpZyAgICAgICB8IDUgKysrKysN
Cj4gIGh3L3BjaS1ob3N0L01ha2VmaWxlLm9ianMgfCAyICstDQo+ICAyIGZpbGVzIGNoYW5nZWQs
IDYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2h3L3Bj
aS1ob3N0L0tjb25maWcgYi9ody9wY2ktaG9zdC9LY29uZmlnDQo+IGluZGV4IGIwYWE4MzUxYzQu
LjI0YmE4ZWEwNDYgMTAwNjQ0DQo+IC0tLSBhL2h3L3BjaS1ob3N0L0tjb25maWcNCj4gKysrIGIv
aHcvcGNpLWhvc3QvS2NvbmZpZw0KPiBAQCAtMSw2ICsxLDExIEBADQo+ICBjb25maWcgUEFNDQo+
ICAgICAgYm9vbA0KPiANCj4gK2NvbmZpZyBYRU5fSUdEX1BBU1NUSFJPVUdIDQo+ICsgICAgYm9v
bA0KPiArICAgIGRlZmF1bHQgeSBpZiBYRU4NCj4gKyAgICBzZWxlY3QgUENJX0k0NDBGWA0KPiAr
DQo+ICBjb25maWcgUFJFUF9QQ0kNCj4gICAgICBib29sDQo+ICAgICAgc2VsZWN0IFBDSQ0KPiBk
aWZmIC0tZ2l0IGEvaHcvcGNpLWhvc3QvTWFrZWZpbGUub2JqcyBiL2h3L3BjaS1ob3N0L01ha2Vm
aWxlLm9ianMNCj4gaW5kZXggZmE2ZDE1NTZjMC4uOWM0NjZmYWIwMSAxMDA2NDQNCj4gLS0tIGEv
aHcvcGNpLWhvc3QvTWFrZWZpbGUub2Jqcw0KPiArKysgYi9ody9wY2ktaG9zdC9NYWtlZmlsZS5v
YmpzDQo+IEBAIC0xNCw3ICsxNCw3IEBAIGNvbW1vbi1vYmotJChDT05GSUdfVkVSU0FUSUxFX1BD
SSkgKz0gdmVyc2F0aWxlLm8NCj4gIGNvbW1vbi1vYmotJChDT05GSUdfUENJX1NBQlJFKSArPSBz
YWJyZS5vDQo+ICBjb21tb24tb2JqLSQoQ09ORklHX0ZVTE9ORykgKz0gYm9uaXRvLm8NCj4gIGNv
bW1vbi1vYmotJChDT05GSUdfUENJX0k0NDBGWCkgKz0gaTQ0MGZ4Lm8NCj4gLWNvbW1vbi1vYmot
JChDT05GSUdfUENJX0k0NDBGWCkgKz0geGVuX2lnZF9wdC5vDQo+ICtjb21tb24tb2JqLSQoQ09O
RklHX1hFTl9JR0RfUEFTU1RIUk9VR0gpICs9IHhlbl9pZ2RfcHQubw0KPiAgY29tbW9uLW9iai0k
KENPTkZJR19QQ0lfRVhQUkVTU19RMzUpICs9IHEzNS5vDQo+ICBjb21tb24tb2JqLSQoQ09ORklH
X1BDSV9FWFBSRVNTX0dFTkVSSUNfQlJJREdFKSArPSBncGV4Lm8NCj4gIGNvbW1vbi1vYmotJChD
T05GSUdfUENJX0VYUFJFU1NfWElMSU5YKSArPSB4aWxpbngtcGNpZS5vDQo+IC0tDQo+IDIuMjEu
MA0KPiANCj4gDQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fDQo+IFhlbi1kZXZlbCBtYWlsaW5nIGxpc3QNCj4gWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnDQo+IGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWwNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE6D106D8B
	for <lists+xen-devel@lfdr.de>; Fri, 22 Nov 2019 12:01:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iY6df-0000qL-UT; Fri, 22 Nov 2019 10:58:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6SD+=ZO=amazon.com=prvs=222105d68=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iY6de-0000qF-I5
 for xen-devel@lists.xenproject.org; Fri, 22 Nov 2019 10:58:10 +0000
X-Inumbo-ID: f8389d68-0d16-11ea-a34c-12813bfff9fa
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f8389d68-0d16-11ea-a34c-12813bfff9fa;
 Fri, 22 Nov 2019 10:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1574420290; x=1605956290;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tGni+YsvbH/jh3UnUoFy+75PbXcqlq7ErI0MA5xH8/s=;
 b=RZawMt2F2P1uwyO2efteLis2pLalqFPb8i3ML7gcisVJ4xW+LgIOIHQG
 jekl2b7SXy3vHeQ18dK5dOrwBSa6LwsC85XU0+ZpUHCNukO96bGqy91cU
 h0c6hmfga6pcrxwn05Z5D/lHaehuGQcteoUDN43093yuPfg47RMiPHX1F k=;
IronPort-SDR: VB8CwdF/loNWEuRoPXMq1CSeH0ntq9SZmdDgEZNFFkRtxu9td+vT3Gd5P6IiQkJwcUJinK+IaR
 JAtqNYq2HMLQ==
X-IronPort-AV: E=Sophos;i="5.69,229,1571702400"; 
   d="scan'208";a="9256074"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1a-67b371d8.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 22 Nov 2019 10:57:58 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1a-67b371d8.us-east-1.amazon.com (Postfix) with ESMTPS
 id 39F0EA2481; Fri, 22 Nov 2019 10:57:56 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 22 Nov 2019 10:57:55 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 22 Nov 2019 10:57:55 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Fri, 22 Nov 2019 10:57:55 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: Wei Liu <wl@xen.org>, Xen Development List <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH v4 5/8] x86: rename hypervisor_{alloc,
 free}_unused_page
Thread-Index: AQHVoJzau7e4jUxMGU+jlmJhVsKcO6eXBgfA
Date: Fri, 22 Nov 2019 10:57:54 +0000
Message-ID: <44f9167878814f6daf837627772e3d09@EX13D32EUC003.ant.amazon.com>
References: <20191121185049.16666-1-liuwe@microsoft.com>
 <20191121185049.16666-6-liuwe@microsoft.com>
In-Reply-To: <20191121185049.16666-6-liuwe@microsoft.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.33]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v4 5/8] x86: rename hypervisor_{alloc,
 free}_unused_page
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
 Wei Liu <liuwe@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 Michael Kelley <mikelley@microsoft.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZl
bC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YgV2VpDQo+IExpdQ0K
PiBTZW50OiAyMSBOb3ZlbWJlciAyMDE5IDE5OjUxDQo+IFRvOiBYZW4gRGV2ZWxvcG1lbnQgTGlz
dCA8eGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnPg0KPiBDYzogV2VpIExpdSA8bGl1d2VA
bWljcm9zb2Z0LmNvbT47IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyBBbmRyZXcgQ29vcGVyDQo+IDxh
bmRyZXcuY29vcGVyM0BjaXRyaXguY29tPjsgTWljaGFlbCBLZWxsZXkgPG1pa2VsbGV5QG1pY3Jv
c29mdC5jb20+OyBKYW4NCj4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+OyBSb2dlciBQYXUg
TW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gU3ViamVjdDogW1hlbi1kZXZlbF0gW1BB
VENIIHY0IDUvOF0geDg2OiByZW5hbWUgaHlwZXJ2aXNvcl97YWxsb2MsDQo+IGZyZWV9X3VudXNl
ZF9wYWdlDQo+IA0KPiBUaGV5IGFyZSB1c2VkIGluIFhlbiBjb2RlIG9ubHkuDQo+IA0KPiBObyBm
dW5jdGlvbmFsIGNoYW5nZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPGxpdXdlQG1p
Y3Jvc29mdC5jb20+DQoNClJldmlld2VkLWJ5OiBQYXVsIER1cnJhbnQgPHBkdXJyYW50QGFtYXpv
bi5jb20+DQoNCj4gLS0tDQo+IENoYW5nZXMgaW4gdjQ6DQo+IDEuIFVzZSB4Z18gcHJlZml4IGlu
c3RlYWQuDQo+IDIuIERyb3AgUm9nZXIncyByZXZpZXcgdGFnLg0KPiAtLS0NCj4gIHhlbi9hcmNo
L3g4Ni9ndWVzdC94ZW4veGVuLmMgICAgfCA2ICsrKy0tLQ0KPiAgeGVuL2FyY2gveDg2L3B2L3No
aW0uYyAgICAgICAgICB8IDQgKystLQ0KPiAgeGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC94ZW4u
aCB8IDQgKystLQ0KPiAgMyBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDcgZGVsZXRp
b25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2d1ZXN0L3hlbi94ZW4uYyBi
L3hlbi9hcmNoL3g4Ni9ndWVzdC94ZW4veGVuLmMNCj4gaW5kZXggMWUzNzA4NjUxOC4uMGY1YjUy
NjdjNSAxMDA2NDQNCj4gLS0tIGEveGVuL2FyY2gveDg2L2d1ZXN0L3hlbi94ZW4uYw0KPiArKysg
Yi94ZW4vYXJjaC94ODYvZ3Vlc3QveGVuL3hlbi5jDQo+IEBAIC05Myw3ICs5Myw3IEBAIHN0YXRp
YyB2b2lkIG1hcF9zaGFyZWRfaW5mbyh2b2lkKQ0KPiAgICAgIHVuc2lnbmVkIGludCBpOw0KPiAg
ICAgIHVuc2lnbmVkIGxvbmcgcmM7DQo+IA0KPiAtICAgIGlmICggaHlwZXJ2aXNvcl9hbGxvY191
bnVzZWRfcGFnZSgmbWZuKSApDQo+ICsgICAgaWYgKCB4Z19hbGxvY191bnVzZWRfcGFnZSgmbWZu
KSApDQo+ICAgICAgICAgIHBhbmljKCJ1bmFibGUgdG8gcmVzZXJ2ZSBzaGFyZWQgaW5mbyBtZW1v
cnkgcGFnZVxuIik7DQo+IA0KPiAgICAgIHhhdHAuZ3BmbiA9IG1mbl94KG1mbik7DQo+IEBAIC0y
ODAsNyArMjgwLDcgQEAgdm9pZCBoeXBlcnZpc29yX2FwX3NldHVwKHZvaWQpDQo+ICAgICAgaW5p
dF9ldnRjaG4oKTsNCj4gIH0NCj4gDQo+IC1pbnQgaHlwZXJ2aXNvcl9hbGxvY191bnVzZWRfcGFn
ZShtZm5fdCAqbWZuKQ0KPiAraW50IHhnX2FsbG9jX3VudXNlZF9wYWdlKG1mbl90ICptZm4pDQo+
ICB7DQo+ICAgICAgdW5zaWduZWQgbG9uZyBtOw0KPiAgICAgIGludCByYzsNCj4gQEAgLTI5Miw3
ICsyOTIsNyBAQCBpbnQgaHlwZXJ2aXNvcl9hbGxvY191bnVzZWRfcGFnZShtZm5fdCAqbWZuKQ0K
PiAgICAgIHJldHVybiByYzsNCj4gIH0NCj4gDQo+IC1pbnQgaHlwZXJ2aXNvcl9mcmVlX3VudXNl
ZF9wYWdlKG1mbl90IG1mbikNCj4gK2ludCB4Z19mcmVlX3VudXNlZF9wYWdlKG1mbl90IG1mbikN
Cj4gIHsNCj4gICAgICByZXR1cm4gcmFuZ2VzZXRfcmVtb3ZlX3JhbmdlKG1lbSwgbWZuX3gobWZu
KSwgbWZuX3gobWZuKSk7DQo+ICB9DQo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvcHYvc2hp
bS5jIGIveGVuL2FyY2gveDg2L3B2L3NoaW0uYw0KPiBpbmRleCAzNTFkYTk3MGVmLi43YTg5OGZk
YmU1IDEwMDY0NA0KPiAtLS0gYS94ZW4vYXJjaC94ODYvcHYvc2hpbS5jDQo+ICsrKyBiL3hlbi9h
cmNoL3g4Ni9wdi9zaGltLmMNCj4gQEAgLTc0Miw3ICs3NDIsNyBAQCBzdGF0aWMgbG9uZyBwdl9z
aGltX2dyYW50X3RhYmxlX29wKHVuc2lnbmVkIGludCBjbWQsDQo+ICAgICAgICAgICAgICAgICAg
fTsNCj4gICAgICAgICAgICAgICAgICBtZm5fdCBtZm47DQo+IA0KPiAtICAgICAgICAgICAgICAg
IHJjID0gaHlwZXJ2aXNvcl9hbGxvY191bnVzZWRfcGFnZSgmbWZuKTsNCj4gKyAgICAgICAgICAg
ICAgICByYyA9IHhnX2FsbG9jX3VudXNlZF9wYWdlKCZtZm4pOw0KPiAgICAgICAgICAgICAgICAg
IGlmICggcmMgKQ0KPiAgICAgICAgICAgICAgICAgIHsNCj4gICAgICAgICAgICAgICAgICAgICAg
Z3ByaW50ayhYRU5MT0dfRVJSLA0KPiBAQCAtNzU0LDcgKzc1NCw3IEBAIHN0YXRpYyBsb25nIHB2
X3NoaW1fZ3JhbnRfdGFibGVfb3AodW5zaWduZWQgaW50IGNtZCwNCj4gICAgICAgICAgICAgICAg
ICByYyA9IHhlbl9oeXBlcmNhbGxfbWVtb3J5X29wKFhFTk1FTV9hZGRfdG9fcGh5c21hcCwNCj4g
JnhhdHApOw0KPiAgICAgICAgICAgICAgICAgIGlmICggcmMgKQ0KPiAgICAgICAgICAgICAgICAg
IHsNCj4gLSAgICAgICAgICAgICAgICAgICAgaHlwZXJ2aXNvcl9mcmVlX3VudXNlZF9wYWdlKG1m
bik7DQo+ICsgICAgICAgICAgICAgICAgICAgIHhnX2ZyZWVfdW51c2VkX3BhZ2UobWZuKTsNCj4g
ICAgICAgICAgICAgICAgICAgICAgYnJlYWs7DQo+ICAgICAgICAgICAgICAgICAgfQ0KPiANCj4g
ZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QveGVuLmggYi94ZW4vaW5jbHVk
ZS9hc20tDQo+IHg4Ni9ndWVzdC94ZW4uaA0KPiBpbmRleCAzMTQ1Zjc1MzYxLi4wMWRjM2VlNmY2
IDEwMDY0NA0KPiAtLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L3hlbi5oDQo+ICsrKyBi
L3hlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QveGVuLmgNCj4gQEAgLTMzLDggKzMzLDggQEAgZXh0
ZXJuIGJvb2wgcHZfY29uc29sZTsNCj4gIGV4dGVybiB1aW50MzJfdCB4ZW5fY3B1aWRfYmFzZTsN
Cj4gDQo+ICB2b2lkIHByb2JlX2h5cGVydmlzb3Iodm9pZCk7DQo+IC1pbnQgaHlwZXJ2aXNvcl9h
bGxvY191bnVzZWRfcGFnZShtZm5fdCAqbWZuKTsNCj4gLWludCBoeXBlcnZpc29yX2ZyZWVfdW51
c2VkX3BhZ2UobWZuX3QgbWZuKTsNCj4gK2ludCB4Z19hbGxvY191bnVzZWRfcGFnZShtZm5fdCAq
bWZuKTsNCj4gK2ludCB4Z19mcmVlX3VudXNlZF9wYWdlKG1mbl90IG1mbik7DQo+IA0KPiAgREVD
TEFSRV9QRVJfQ1BVKHVuc2lnbmVkIGludCwgdmNwdV9pZCk7DQo+ICBERUNMQVJFX1BFUl9DUFUo
c3RydWN0IHZjcHVfaW5mbyAqLCB2Y3B1X2luZm8pOw0KPiAtLQ0KPiAyLjIwLjENCj4gDQo+IA0K
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiBYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0DQo+IFhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVsDQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 380671505AE
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 12:54:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyaGg-0005bH-Pj; Mon, 03 Feb 2020 11:51:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Z8sP=3X=amazon.co.uk=prvs=29554d7b7=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iyaGf-0005bC-OX
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 11:51:53 +0000
X-Inumbo-ID: 9201c1a3-467b-11ea-8e51-12813bfff9fa
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9201c1a3-467b-11ea-8e51-12813bfff9fa;
 Mon, 03 Feb 2020 11:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1580730713; x=1612266713;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gVZcA2B8vujByGvcYXl/0mZSB0otMUPLijDp0OWhJs8=;
 b=V4lHmIfWn2Tx5mD0/8GUbf7JeM0zVuOcbf131XRVh2papu4NJU1SndBt
 8Tj0h5xu1XLK0oKIMwRfxAEuL4Tm5FXoAY8/qBbxZUH4gx0Wc5FrkXCOS
 8D5eAEdJ91LYGK1edEWPcgQHgcBP6UqPntrFTTwq6Yr/yFRHPTO40EfzQ I=;
IronPort-SDR: jeH9WppKpGGw8dMxfyqUtPU62zzGlOS+u1iRIWc4WsgvJ3RoINCUQIEO5OC2Ygo3XyTz/rVWVp
 UrCaDXddK8MA==
X-IronPort-AV: E=Sophos;i="5.70,397,1574121600"; d="scan'208";a="15404049"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-1e-27fb8269.us-east-1.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 03 Feb 2020 11:51:53 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-27fb8269.us-east-1.amazon.com (Postfix) with ESMTPS
 id 75D63A1B70; Mon,  3 Feb 2020 11:51:49 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Mon, 3 Feb 2020 11:51:49 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 3 Feb 2020 11:51:48 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Mon, 3 Feb 2020 11:51:47 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH v4 1/7] SVM: drop asm/hvm/emulate.h inclusion
 from vmcb.h
Thread-Index: AQHV2FWlngX7wp3JKUiy/tVDhHYiCKgJX80Q
Date: Mon, 3 Feb 2020 11:51:47 +0000
Message-ID: <d3b593a9ea8340fb9f67f9a063e951f2@EX13D32EUC003.ant.amazon.com>
References: <d9ac8ea4-9f2a-93d5-7656-48d93930ed2e@suse.com>
 <bfc4d4ad-85a5-2d79-748a-c7b72ba40bce@suse.com>
In-Reply-To: <bfc4d4ad-85a5-2d79-748a-c7b72ba40bce@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.18]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v4 1/7] SVM: drop asm/hvm/emulate.h
 inclusion from vmcb.h
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Kevin Tian <kevin.tian@intel.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Alexandru
 Isaila <aisaila@bitdefender.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZl
bC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YgSmFuDQo+IEJldWxp
Y2gNCj4gU2VudDogMzEgSmFudWFyeSAyMDIwIDE2OjQyDQo+IFRvOiB4ZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcNCj4gQ2M6IFBldHJlIFBpcmNhbGFidSA8cHBpcmNhbGFidUBiaXRkZWZl
bmRlci5jb20+OyBLZXZpbiBUaWFuDQo+IDxrZXZpbi50aWFuQGludGVsLmNvbT47IFRhbWFzIEsg
TGVuZ3llbCA8dGFtYXNAdGtsZW5neWVsLmNvbT47IFdlaSBMaXUNCj4gPHdsQHhlbi5vcmc+OyBQ
YXVsIER1cnJhbnQgPHBhdWxAeGVuLm9yZz47IEdlb3JnZSBEdW5sYXANCj4gPEdlb3JnZS5EdW5s
YXBAZXUuY2l0cml4LmNvbT47IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5j
b20+Ow0KPiBUaW0gRGVlZ2FuIDx0aW1AeGVuLm9yZz47IEp1biBOYWthamltYSA8anVuLm5ha2Fq
aW1hQGludGVsLmNvbT47IEFsZXhhbmRydQ0KPiBJc2FpbGEgPGFpc2FpbGFAYml0ZGVmZW5kZXIu
Y29tPjsgUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQo+IFN1YmplY3Q6
IFtYZW4tZGV2ZWxdIFtQQVRDSCB2NCAxLzddIFNWTTogZHJvcCBhc20vaHZtL2VtdWxhdGUuaCBp
bmNsdXNpb24NCj4gZnJvbSB2bWNiLmgNCj4gDQo+IEl0J3Mgbm90IG5lZWRlZCB0aGVyZSBhbmQg
aW50cm9kdWNlcyBhIG5lZWRsZXNzLCBhbG1vc3QgZ2xvYmFsDQo+IGRlcGVuZGVuY3kuIEluY2x1
ZGUgdGhlIGZpbGUgKG9yIGluIHNvbWUgY2FzZXMganVzdCB4ZW4vZXJyLmgpIHdoZXJlDQo+IGFj
dHVhbGx5IG5lZWRlZCwgb3IgLSBpbiBvbmUgY2FzZSAtIHNpbXBseSBmb3J3YXJkLWRlY2xhcmUg
YSBzdHJ1Y3QuIEluDQo+IG1pY3JvY29kZSouYyB0YWtlIHRoZSBvcHBvcnR1bml0eSBhbmQgYWxz
byByZS1vcmRlciBhIGZldyBvdGhlcg0KPiAjaW5jbHVkZS1zLg0KPiANCj4gU2lnbmVkLW9mZi1i
eTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KDQpSZXZpZXdlZC1ieTogUGF1bCBE
dXJyYW50IDxwZHVycmFudEBhbWF6b24uY29tPg0KDQo+IC0tLQ0KPiB2NDogTmV3Lg0KPiANCj4g
LS0tIGEveGVuL2FyY2gveDg2L2h2bS9odm0uYw0KPiArKysgYi94ZW4vYXJjaC94ODYvaHZtL2h2
bS5jDQo+IEBAIC01NSw2ICs1NSw3IEBADQo+ICAjaW5jbHVkZSA8YXNtL21jMTQ2ODE4cnRjLmg+
DQo+ICAjaW5jbHVkZSA8YXNtL21jZS5oPg0KPiAgI2luY2x1ZGUgPGFzbS9tb25pdG9yLmg+DQo+
ICsjaW5jbHVkZSA8YXNtL2h2bS9lbXVsYXRlLmg+DQo+ICAjaW5jbHVkZSA8YXNtL2h2bS9odm0u
aD4NCj4gICNpbmNsdWRlIDxhc20vaHZtL3ZwdC5oPg0KPiAgI2luY2x1ZGUgPGFzbS9odm0vc3Vw
cG9ydC5oPg0KPiAtLS0gYS94ZW4vYXJjaC94ODYvaHZtL2lvcmVxLmMNCj4gKysrIGIveGVuL2Fy
Y2gveDg2L2h2bS9pb3JlcS5jDQo+IEBAIC0yOCw2ICsyOCw3IEBADQo+ICAjaW5jbHVkZSA8eGVu
L3BhZ2luZy5oPg0KPiAgI2luY2x1ZGUgPHhlbi92cGNpLmg+DQo+IA0KPiArI2luY2x1ZGUgPGFz
bS9odm0vZW11bGF0ZS5oPg0KPiAgI2luY2x1ZGUgPGFzbS9odm0vaHZtLmg+DQo+ICAjaW5jbHVk
ZSA8YXNtL2h2bS9pb3JlcS5oPg0KPiAgI2luY2x1ZGUgPGFzbS9odm0vdm14L3ZteC5oPg0KPiAt
LS0gYS94ZW4vYXJjaC94ODYvaHZtL3N2bS9lbXVsYXRlLmMNCj4gKysrIGIveGVuL2FyY2gveDg2
L2h2bS9zdm0vZW11bGF0ZS5jDQo+IEBAIC0yMCw2ICsyMCw3IEBADQo+ICAjaW5jbHVkZSA8eGVu
L2xpYi5oPg0KPiAgI2luY2x1ZGUgPHhlbi90cmFjZS5oPg0KPiAgI2luY2x1ZGUgPGFzbS9tc3Iu
aD4NCj4gKyNpbmNsdWRlIDxhc20vaHZtL2VtdWxhdGUuaD4NCj4gICNpbmNsdWRlIDxhc20vaHZt
L2h2bS5oPg0KPiAgI2luY2x1ZGUgPGFzbS9odm0vc3VwcG9ydC5oPg0KPiAgI2luY2x1ZGUgPGFz
bS9odm0vc3ZtL3N2bS5oPg0KPiAtLS0gYS94ZW4vYXJjaC94ODYvaHZtL3ZtX2V2ZW50LmMNCj4g
KysrIGIveGVuL2FyY2gveDg2L2h2bS92bV9ldmVudC5jDQo+IEBAIC0yMiw2ICsyMiw3IEBADQo+
IA0KPiAgI2luY2x1ZGUgPHhlbi9zY2hlZC5oPg0KPiAgI2luY2x1ZGUgPHhlbi92bV9ldmVudC5o
Pg0KPiArI2luY2x1ZGUgPGFzbS9odm0vZW11bGF0ZS5oPg0KPiAgI2luY2x1ZGUgPGFzbS9odm0v
c3VwcG9ydC5oPg0KPiAgI2luY2x1ZGUgPGFzbS92bV9ldmVudC5oPg0KPiANCj4gLS0tIGEveGVu
L2FyY2gveDg2L21pY3JvY29kZS5jDQo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9taWNyb2NvZGUuYw0K
PiBAQCAtMjIsOSArMjIsMTAgQEANCj4gICAqLw0KPiANCj4gICNpbmNsdWRlIDx4ZW4vY3B1Lmg+
DQo+IC0jaW5jbHVkZSA8eGVuL2xpYi5oPg0KPiAtI2luY2x1ZGUgPHhlbi9rZXJuZWwuaD4NCj4g
KyNpbmNsdWRlIDx4ZW4vZXJyLmg+DQo+ICAjaW5jbHVkZSA8eGVuL2luaXQuaD4NCj4gKyNpbmNs
dWRlIDx4ZW4va2VybmVsLmg+DQo+ICsjaW5jbHVkZSA8eGVuL2xpYi5oPg0KPiAgI2luY2x1ZGUg
PHhlbi9ub3RpZmllci5oPg0KPiAgI2luY2x1ZGUgPHhlbi9zY2hlZC5oPg0KPiAgI2luY2x1ZGUg
PHhlbi9zbXAuaD4NCj4gLS0tIGEveGVuL2FyY2gveDg2L21pY3JvY29kZV9hbWQuYw0KPiArKysg
Yi94ZW4vYXJjaC94ODYvbWljcm9jb2RlX2FtZC5jDQo+IEBAIC0xNCw5ICsxNCwxMCBAQA0KPiAg
ICogIExpY2Vuc2UgdmVyc2lvbiAyLiBTZWUgZmlsZSBDT1BZSU5HIGZvciBkZXRhaWxzLg0KPiAg
ICovDQo+IA0KPiAtI2luY2x1ZGUgPHhlbi9saWIuaD4NCj4gLSNpbmNsdWRlIDx4ZW4va2VybmVs
Lmg+DQo+ICsjaW5jbHVkZSA8eGVuL2Vyci5oPg0KPiAgI2luY2x1ZGUgPHhlbi9pbml0Lmg+DQo+
ICsjaW5jbHVkZSA8eGVuL2tlcm5lbC5oPg0KPiArI2luY2x1ZGUgPHhlbi9saWIuaD4NCj4gICNp
bmNsdWRlIDx4ZW4vc2NoZWQuaD4NCj4gICNpbmNsdWRlIDx4ZW4vc21wLmg+DQo+ICAjaW5jbHVk
ZSA8eGVuL3NwaW5sb2NrLmg+DQo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9taWNyb2NvZGVfaW50ZWwu
Yw0KPiArKysgYi94ZW4vYXJjaC94ODYvbWljcm9jb2RlX2ludGVsLmMNCj4gQEAgLTIxLDkgKzIx
LDEwIEBADQo+ICAgKiAyIG9mIHRoZSBMaWNlbnNlLCBvciAoYXQgeW91ciBvcHRpb24pIGFueSBs
YXRlciB2ZXJzaW9uLg0KPiAgICovDQo+IA0KPiAtI2luY2x1ZGUgPHhlbi9saWIuaD4NCj4gLSNp
bmNsdWRlIDx4ZW4va2VybmVsLmg+DQo+ICsjaW5jbHVkZSA8eGVuL2Vyci5oPg0KPiAgI2luY2x1
ZGUgPHhlbi9pbml0Lmg+DQo+ICsjaW5jbHVkZSA8eGVuL2tlcm5lbC5oPg0KPiArI2luY2x1ZGUg
PHhlbi9saWIuaD4NCj4gICNpbmNsdWRlIDx4ZW4vc2NoZWQuaD4NCj4gICNpbmNsdWRlIDx4ZW4v
c21wLmg+DQo+ICAjaW5jbHVkZSA8eGVuL3NwaW5sb2NrLmg+DQo+IC0tLSBhL3hlbi9hcmNoL3g4
Ni9tbS9zaGFkb3cvaHZtLmMNCj4gKysrIGIveGVuL2FyY2gveDg2L21tL3NoYWRvdy9odm0uYw0K
PiBAQCAtMjgsNiArMjgsNyBAQA0KPiAgI2luY2x1ZGUgPHhlbi90cmFjZS5oPg0KPiANCj4gICNp
bmNsdWRlIDxhc20vY3VycmVudC5oPg0KPiArI2luY2x1ZGUgPGFzbS9odm0vZW11bGF0ZS5oPg0K
PiAgI2luY2x1ZGUgPGFzbS9zaGFkb3cuaD4NCj4gDQo+ICAjaW5jbHVkZSAicHJpdmF0ZS5oIg0K
PiAtLS0gYS94ZW4vYXJjaC94ODYvcHYvZW11bC1nYXRlLW9wLmMNCj4gKysrIGIveGVuL2FyY2gv
eDg2L3B2L2VtdWwtZ2F0ZS1vcC5jDQo+IEBAIC0xOSw2ICsxOSw3IEBADQo+ICAgKiBhbG9uZyB3
aXRoIHRoaXMgcHJvZ3JhbTsgSWYgbm90LCBzZWUgPGh0dHA6Ly93d3cuZ251Lm9yZy9saWNlbnNl
cy8+Lg0KPiAgICovDQo+IA0KPiArI2luY2x1ZGUgPHhlbi9lcnIuaD4NCj4gICNpbmNsdWRlIDx4
ZW4vZXJybm8uaD4NCj4gICNpbmNsdWRlIDx4ZW4vZXZlbnQuaD4NCj4gICNpbmNsdWRlIDx4ZW4v
Z3Vlc3RfYWNjZXNzLmg+DQo+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL3N2bS92bWNi
LmgNCj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vc3ZtL3ZtY2IuaA0KPiBAQCAtMjAs
OCArMjAsNiBAQA0KPiAgI2RlZmluZSBfX0FTTV9YODZfSFZNX1NWTV9WTUNCX0hfXw0KPiANCj4g
ICNpbmNsdWRlIDx4ZW4vdHlwZXMuaD4NCj4gLSNpbmNsdWRlIDxhc20vaHZtL2VtdWxhdGUuaD4N
Cj4gLQ0KPiANCj4gIC8qIGdlbmVyYWwgMSBpbnRlcmNlcHRzICovDQo+ICBlbnVtIEdlbmVyaWNJ
bnRlcmNlcHQxYml0cw0KPiAtLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L2h2bS92bXgvdm14LmgN
Cj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vdm14L3ZteC5oDQo+IEBAIC05Nyw2ICs5
Nyw3IEBAIHZvaWQgdm14X2FzbV9kb192bWVudHJ5KHZvaWQpOw0KPiAgdm9pZCB2bXhfaW50cl9h
c3Npc3Qodm9pZCk7DQo+ICB2b2lkIG5vcmV0dXJuIHZteF9kb19yZXN1bWUoc3RydWN0IHZjcHUg
Kik7DQo+ICB2b2lkIHZteF92bGFwaWNfbXNyX2NoYW5nZWQoc3RydWN0IHZjcHUgKnYpOw0KPiAr
c3RydWN0IGh2bV9lbXVsYXRlX2N0eHQ7DQo+ICB2b2lkIHZteF9yZWFsbW9kZV9lbXVsYXRlX29u
ZShzdHJ1Y3QgaHZtX2VtdWxhdGVfY3R4dCAqaHZtZW11bF9jdHh0KTsNCj4gIHZvaWQgdm14X3Jl
YWxtb2RlKHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzKTsNCj4gIHZvaWQgdm14X3VwZGF0ZV9k
ZWJ1Z19zdGF0ZShzdHJ1Y3QgdmNwdSAqdik7DQo+IA0KPiANCj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gWGVuLWRldmVsIG1haWxpbmcgbGlzdA0K
PiBYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

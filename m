Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE751905B2
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2020 07:26:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGcxf-0006SK-V3; Tue, 24 Mar 2020 06:22:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=b8ME=5J=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1jGcxe-0006SF-Ay
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2020 06:22:50 +0000
X-Inumbo-ID: e1c5d4d8-6d97-11ea-8383-12813bfff9fa
Received: from mga01.intel.com (unknown [192.55.52.88])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e1c5d4d8-6d97-11ea-8383-12813bfff9fa;
 Tue, 24 Mar 2020 06:22:49 +0000 (UTC)
IronPort-SDR: zjkk5xX5E8FVUqsUUjMSyi7trDvRVfD3DfZE+ThzWRiUqZI+GTK77ZfZOewh8mUxrQuylnQMyd
 r2qHdeKpSMRg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2020 23:22:48 -0700
IronPort-SDR: 5Z9GlhrgNG6RJGn1kmaBEKdTKkbxKThGfXObPUQ4v6Z9BEfh/uZYeY24A38QbnopxB8uxKMRl5
 GD1ssAJoW56w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,299,1580803200"; d="scan'208";a="270230842"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by fmsmga004.fm.intel.com with ESMTP; 23 Mar 2020 23:22:47 -0700
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 23 Mar 2020 23:22:47 -0700
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 23 Mar 2020 23:22:46 -0700
Received: from shsmsx105.ccr.corp.intel.com (10.239.4.158) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 23 Mar 2020 23:22:46 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.206]) by
 SHSMSX105.ccr.corp.intel.com ([169.254.11.144]) with mapi id 14.03.0439.000;
 Tue, 24 Mar 2020 14:22:43 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH 3/3] x86/nvmx: update exit bitmap on vmexit
Thread-Index: AQHV/urpfF5j4vGzhUi/L3UBZDzwCKhXRtFA
Date: Tue, 24 Mar 2020 06:22:43 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D7E5B94@SHSMSX104.ccr.corp.intel.com>
References: <20200320190737.42110-1-roger.pau@citrix.com>
 <20200320190737.42110-4-roger.pau@citrix.com>
In-Reply-To: <20200320190737.42110-4-roger.pau@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 3/3] x86/nvmx: update exit bitmap on vmexit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, "Nakajima, Jun" <jun.nakajima@intel.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGcm9tOiBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPiBTZW50OiBT
YXR1cmRheSwgTWFyY2ggMjEsIDIwMjAgMzowOCBBTQ0KPiANCj4gQ3VycmVudCBjb2RlIGluIG52
bXhfdXBkYXRlX2FwaWN2IHNldCB0aGUgZ3Vlc3QgaW50ZXJydXB0IHN0YXR1cyBmaWVsZA0KPiBi
dXQgZG9lc24ndCB1cGRhdGUgdGhlIGV4aXQgYml0bWFwLCB3aGljaCBjYW4gY2F1c2UgaXNzdWVz
IG9mIGxvc3QNCj4gaW50ZXJydXB0cyBvbiB0aGUgTDEgaHlwZXJ2aXNvciBpZiB2bXhfaW50cl9h
c3Npc3QgZ2V0cw0KPiBzaG9ydC1jaXJjdWl0ZWQgYnkgbnZteF9pbnRyX2ludGVyY2VwdCByZXR1
cm5pbmcgdHJ1ZS4NCg0KQWJvdmUgaXMgbm90IGFjY3VyYXRlLiBDdXJyZW50bHkgWGVuIGRpZG4n
dCBjaG9vc2UgdG8gdXBkYXRlIHRoZSBFT0kNCmV4aXQgYml0bWFwIGV2ZXJ5IHRpbWUgd2hlbiB0
aGVyZSBpcyBhIGNoYW5nZS4gSW5zdGVhZCwgaXQgY2hvc2UgdG8gDQpiYXRjaCB0aGUgdXBkYXRl
IGJlZm9yZSByZXN1bWluZyB0byB0aGUgZ3Vlc3QuIHNvcnQgb2Ygb3B0aW1pemF0aW9uLg0KU28g
aXQgaXMgbm90IHJlbGF0ZWQgdG8gd2hldGhlciBTVkkgaXMgY2hhbmdlZC4gV2Ugc2hvdWxkIGFs
d2F5cyBkbyB0aGUgDQpiaXRtYXAgdXBkYXRlIGluIG52bXhfdXBkYXRlX2FwaWN2LCByZWdhcmRs
ZXNzIG9mIHRoZSBzZXR0aW5nIG9mDQpBY2stb24tZXhpdCAuLi4NCg0KVGhhbmtzDQpLZXZpbg0K
DQo+IA0KPiBFeHRyYWN0IHRoZSBjb2RlIHRvIHVwZGF0ZSB0aGUgZXhpdCBiaXRtYXAgZnJvbSB2
bXhfaW50cl9hc3Npc3QgaW50byBhDQo+IGhlbHBlciBhbmQgdXNlIGl0IGluIG52bXhfdXBkYXRl
X2FwaWN2IHdoZW4gdXBkYXRpbmcgdGhlIGd1ZXN0DQo+IGludGVycnVwdCBzdGF0dXMgZmllbGQu
DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4
LmNvbT4NCj4gLS0tDQo+ICB4ZW4vYXJjaC94ODYvaHZtL3ZteC9pbnRyLmMgICAgICAgfCAyMSAr
KysrKysrKysrKysrLS0tLS0tLS0NCj4gIHhlbi9hcmNoL3g4Ni9odm0vdm14L3Z2bXguYyAgICAg
ICB8ICAxICsNCj4gIHhlbi9pbmNsdWRlL2FzbS14ODYvaHZtL3ZteC92bXguaCB8ICAyICsrDQo+
ICAzIGZpbGVzIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pDQo+IA0K
PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS92bXgvaW50ci5jIGIveGVuL2FyY2gveDg2
L2h2bS92bXgvaW50ci5jDQo+IGluZGV4IDQ5YTEyOTVmMDkuLjAwMGUxNGFmNDkgMTAwNjQ0DQo+
IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vdm14L2ludHIuYw0KPiArKysgYi94ZW4vYXJjaC94ODYv
aHZtL3ZteC9pbnRyLmMNCj4gQEAgLTIyNCw2ICsyMjQsMTggQEAgc3RhdGljIGludCBudm14X2lu
dHJfaW50ZXJjZXB0KHN0cnVjdCB2Y3B1ICp2LCBzdHJ1Y3QNCj4gaHZtX2ludGFjayBpbnRhY2sp
DQo+ICAgICAgcmV0dXJuIDA7DQo+ICB9DQo+IA0KPiArdm9pZCB2bXhfc3luY19leGl0X2JpdG1h
cChzdHJ1Y3QgdmNwdSAqdikNCj4gK3sNCj4gKyAgICBjb25zdCB1bnNpZ25lZCBpbnQgbiA9IEFS
UkFZX1NJWkUodi0+YXJjaC5odm0udm14LmVvaV9leGl0X2JpdG1hcCk7DQo+ICsgICAgdW5zaWdu
ZWQgaW50IGk7DQo+ICsNCj4gKyAgICB3aGlsZSAoIChpID0gZmluZF9maXJzdF9iaXQoJnYtPmFy
Y2guaHZtLnZteC5lb2lfZXhpdG1hcF9jaGFuZ2VkLCBuKSkgPA0KPiBuICkNCj4gKyAgICB7DQo+
ICsgICAgICAgIGNsZWFyX2JpdChpLCAmdi0+YXJjaC5odm0udm14LmVvaV9leGl0bWFwX2NoYW5n
ZWQpOw0KPiArICAgICAgICBfX3Ztd3JpdGUoRU9JX0VYSVRfQklUTUFQKGkpLCB2LT5hcmNoLmh2
bS52bXguZW9pX2V4aXRfYml0bWFwW2ldKTsNCj4gKyAgICB9DQo+ICt9DQo+ICsNCj4gIHZvaWQg
dm14X2ludHJfYXNzaXN0KHZvaWQpDQo+ICB7DQo+ICAgICAgc3RydWN0IGh2bV9pbnRhY2sgaW50
YWNrOw0KPiBAQCAtMzE4LDcgKzMzMCw2IEBAIHZvaWQgdm14X2ludHJfYXNzaXN0KHZvaWQpDQo+
ICAgICAgICAgICAgICAgIGludGFjay5zb3VyY2UgIT0gaHZtX2ludHNyY192ZWN0b3IgKQ0KPiAg
ICAgIHsNCj4gICAgICAgICAgdW5zaWduZWQgbG9uZyBzdGF0dXM7DQo+IC0gICAgICAgIHVuc2ln
bmVkIGludCBpLCBuOw0KPiANCj4gICAgICAgICAvKg0KPiAgICAgICAgICAqIGludGFjay52ZWN0
b3IgaXMgdGhlIGhpZ2hlc3QgcHJpb3JpdHkgdmVjdG9yLiBTbyB3ZSBzZXQgZW9pX2V4aXRfYml0
bWFwDQo+IEBAIC0zNzksMTMgKzM5MCw3IEBAIHZvaWQgdm14X2ludHJfYXNzaXN0KHZvaWQpDQo+
ICAgICAgICAgICAgICAgICAgICAgIGludGFjay52ZWN0b3I7DQo+ICAgICAgICAgIF9fdm13cml0
ZShHVUVTVF9JTlRSX1NUQVRVUywgc3RhdHVzKTsNCj4gDQo+IC0gICAgICAgIG4gPSBBUlJBWV9T
SVpFKHYtPmFyY2guaHZtLnZteC5lb2lfZXhpdF9iaXRtYXApOw0KPiAtICAgICAgICB3aGlsZSAo
IChpID0gZmluZF9maXJzdF9iaXQoJnYtPmFyY2guaHZtLnZteC5lb2lfZXhpdG1hcF9jaGFuZ2Vk
LA0KPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbikpIDwgbiApDQo+IC0g
ICAgICAgIHsNCj4gLSAgICAgICAgICAgIGNsZWFyX2JpdChpLCAmdi0+YXJjaC5odm0udm14LmVv
aV9leGl0bWFwX2NoYW5nZWQpOw0KPiAtICAgICAgICAgICAgX192bXdyaXRlKEVPSV9FWElUX0JJ
VE1BUChpKSwgdi0+YXJjaC5odm0udm14LmVvaV9leGl0X2JpdG1hcFtpXSk7DQo+IC0gICAgICAg
IH0NCj4gKyAgICAgICAgdm14X3N5bmNfZXhpdF9iaXRtYXAodik7DQo+IA0KPiAgICAgICAgICBw
dF9pbnRyX3Bvc3QodiwgaW50YWNrKTsNCj4gICAgICB9DQo+IGRpZmYgLS1naXQgYS94ZW4vYXJj
aC94ODYvaHZtL3ZteC92dm14LmMgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC92dm14LmMNCj4gaW5k
ZXggMTgwZDAxZTM4NS4uZTA0MWVjYzExNSAxMDA2NDQNCj4gLS0tIGEveGVuL2FyY2gveDg2L2h2
bS92bXgvdnZteC5jDQo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vdm14L3Z2bXguYw0KPiBAQCAt
MTQxNCw2ICsxNDE0LDcgQEAgc3RhdGljIHZvaWQgbnZteF91cGRhdGVfYXBpY3Yoc3RydWN0IHZj
cHUgKnYpDQo+ICAgICAgICAgICAgICBzdGF0dXMgfD0gcnZpICYgVk1YX0dVRVNUX0lOVFJfU1RB
VFVTX1NVQkZJRUxEX0JJVE1BU0s7DQo+IA0KPiAgICAgICAgICBfX3Ztd3JpdGUoR1VFU1RfSU5U
Ul9TVEFUVVMsIHN0YXR1cyk7DQo+ICsgICAgICAgIHZteF9zeW5jX2V4aXRfYml0bWFwKHYpOw0K
PiAgICAgIH0NCj4gIH0NCj4gDQo+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L2h2
bS92bXgvdm14LmggYi94ZW4vaW5jbHVkZS9hc20tDQo+IHg4Ni9odm0vdm14L3ZteC5oDQo+IGlu
ZGV4IGIzMzRlMWVjOTQuLjExMWNjZDdlNjEgMTAwNjQ0DQo+IC0tLSBhL3hlbi9pbmNsdWRlL2Fz
bS14ODYvaHZtL3ZteC92bXguaA0KPiArKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2h2bS92bXgv
dm14LmgNCj4gQEAgLTYxMCw2ICs2MTAsOCBAQCB2b2lkIHVwZGF0ZV9ndWVzdF9laXAodm9pZCk7
DQo+ICB2b2lkIHZteF9waV9wZXJfY3B1X2luaXQodW5zaWduZWQgaW50IGNwdSk7DQo+ICB2b2lk
IHZteF9waV9kZXNjX2ZpeHVwKHVuc2lnbmVkIGludCBjcHUpOw0KPiANCj4gK3ZvaWQgdm14X3N5
bmNfZXhpdF9iaXRtYXAoc3RydWN0IHZjcHUgKnYpOw0KPiArDQo+ICAjaWZkZWYgQ09ORklHX0hW
TQ0KPiAgdm9pZCB2bXhfcGlfaG9va3NfYXNzaWduKHN0cnVjdCBkb21haW4gKmQpOw0KPiAgdm9p
ZCB2bXhfcGlfaG9va3NfZGVhc3NpZ24oc3RydWN0IGRvbWFpbiAqZCk7DQo+IC0tDQo+IDIuMjUu
MA0KDQo=


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94802193BD6
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2020 10:29:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHOn4-0007ZN-W4; Thu, 26 Mar 2020 09:27:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ASzm=5L=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1jHOn3-0007ZD-K8
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2020 09:27:05 +0000
X-Inumbo-ID: f35503ec-6f43-11ea-8783-12813bfff9fa
Received: from mga07.intel.com (unknown [134.134.136.100])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f35503ec-6f43-11ea-8783-12813bfff9fa;
 Thu, 26 Mar 2020 09:27:03 +0000 (UTC)
IronPort-SDR: H5td9Drz98iHfwz35uWN/gAJQaiMPjDZeo1gJC2N8dEFefWju/XsG7k12GlMgzBh1VLCh5AsAk
 /pV2SAcYOtcA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2020 02:27:02 -0700
IronPort-SDR: w5pt197HgQ5Tby0RyVS6zRh7mkJkFB+DB3p8Bx1hOPB5bbq0be3D9XHjDLOTFy933mlAgUOSkO
 gjul+JH5uwbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,307,1580803200"; d="scan'208";a="293584913"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by FMSMGA003.fm.intel.com with ESMTP; 26 Mar 2020 02:27:01 -0700
Received: from fmsmsx155.amr.corp.intel.com (10.18.116.71) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 26 Mar 2020 02:27:01 -0700
Received: from shsmsx151.ccr.corp.intel.com (10.239.6.50) by
 FMSMSX155.amr.corp.intel.com (10.18.116.71) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 26 Mar 2020 02:27:01 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.206]) by
 SHSMSX151.ccr.corp.intel.com ([169.254.3.201]) with mapi id 14.03.0439.000;
 Thu, 26 Mar 2020 17:26:57 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Thread-Topic: [PATCH v2 4/4] x86/nvmx: update exit bitmap when using virtual
 interrupt delivery
Thread-Index: AQHWAo7oQ2VIPQB0qEy5IngbZ76c4ahaNBZg///gwYCAAIccoA==
Date: Thu, 26 Mar 2020 09:26:57 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D7EADD7@SHSMSX104.ccr.corp.intel.com>
References: <20200325101910.29168-1-roger.pau@citrix.com>
 <20200325101910.29168-5-roger.pau@citrix.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D7EA7AD@SHSMSX104.ccr.corp.intel.com>
 <20200326092213.GK28601@Air-de-Roger>
In-Reply-To: <20200326092213.GK28601@Air-de-Roger>
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
Subject: Re: [Xen-devel] [PATCH v2 4/4] x86/nvmx: update exit bitmap when
 using virtual interrupt delivery
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>, "Nakajima,
 Jun" <jun.nakajima@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGcm9tOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gU2VudDog
VGh1cnNkYXksIE1hcmNoIDI2LCAyMDIwIDU6MjIgUE0NCj4gDQo+IE9uIFRodSwgTWFyIDI2LCAy
MDIwIGF0IDAzOjE3OjU5QU0gKzAwMDAsIFRpYW4sIEtldmluIHdyb3RlOg0KPiA+ID4gRnJvbTog
Um9nZXIgUGF1IE1vbm5lIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gPiA+IFNlbnQ6IFdlZG5l
c2RheSwgTWFyY2ggMjUsIDIwMjAgNjoxOSBQTQ0KPiA+ID4NCj4gPiA+IEZvcmNlIGFuIHVwZGF0
ZSBvZiB0aGUgRU9JIGV4aXQgYml0bWFwIGluIG52bXhfdXBkYXRlX2FwaWN2LCBiZWNhdXNlDQo+
ID4gPiB0aGUgb25lIHBlcmZvcm1lZCBpbiB2bXhfaW50cl9hc3Npc3QgbWlnaHQgbm90IGJlIHJl
YWNoZWQgaWYgdGhlDQo+ID4gPiBpbnRlcnJ1cHQgaXMgaW50ZXJjZXB0ZWQgYnkgbnZteF9pbnRy
X2ludGVyY2VwdCByZXR1cm5pbmcgdHJ1ZS4NCj4gPiA+DQo+ID4gPiBFeHRyYWN0IHRoZSBjb2Rl
IHRvIHVwZGF0ZSB0aGUgZXhpdCBiaXRtYXAgZnJvbSB2bXhfaW50cl9hc3Npc3QgaW50byBhDQo+
ID4gPiBoZWxwZXIgYW5kIHVzZSBpdCBpbiBudm14X3VwZGF0ZV9hcGljdi4NCj4gPiA+DQo+ID4g
PiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4N
Cj4gPiA+IC0tLQ0KPiA+ID4gQ2hhbmdlcyBzaW5jZSB2MToNCj4gPiA+ICAtIFJld29yZCBjb21t
aXQgbWVzc2FnZS4NCj4gPiA+IC0tLQ0KPiA+ID4gIHhlbi9hcmNoL3g4Ni9odm0vdm14L2ludHIu
YyAgICAgICB8IDIxICsrKysrKysrKysrKystLS0tLS0tLQ0KPiA+ID4gIHhlbi9hcmNoL3g4Ni9o
dm0vdm14L3Z2bXguYyAgICAgICB8ICAyICsrDQo+ID4gPiAgeGVuL2luY2x1ZGUvYXNtLXg4Ni9o
dm0vdm14L3ZteC5oIHwgIDIgKysNCj4gPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDE3IGluc2VydGlv
bnMoKyksIDggZGVsZXRpb25zKC0pDQo+ID4gPg0KPiA+ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNo
L3g4Ni9odm0vdm14L2ludHIuYyBiL3hlbi9hcmNoL3g4Ni9odm0vdm14L2ludHIuYw0KPiA+ID4g
aW5kZXggNDlhMTI5NWYwOS4uMDAwZTE0YWY0OSAxMDA2NDQNCj4gPiA+IC0tLSBhL3hlbi9hcmNo
L3g4Ni9odm0vdm14L2ludHIuYw0KPiA+ID4gKysrIGIveGVuL2FyY2gveDg2L2h2bS92bXgvaW50
ci5jDQo+ID4gPiBAQCAtMjI0LDYgKzIyNCwxOCBAQCBzdGF0aWMgaW50IG52bXhfaW50cl9pbnRl
cmNlcHQoc3RydWN0IHZjcHUgKnYsDQo+IHN0cnVjdA0KPiA+ID4gaHZtX2ludGFjayBpbnRhY2sp
DQo+ID4gPiAgICAgIHJldHVybiAwOw0KPiA+ID4gIH0NCj4gPiA+DQo+ID4gPiArdm9pZCB2bXhf
c3luY19leGl0X2JpdG1hcChzdHJ1Y3QgdmNwdSAqdikNCj4gPiA+ICt7DQo+ID4gPiArICAgIGNv
bnN0IHVuc2lnbmVkIGludCBuID0gQVJSQVlfU0laRSh2LT5hcmNoLmh2bS52bXguZW9pX2V4aXRf
Yml0bWFwKTsNCj4gPiA+ICsgICAgdW5zaWduZWQgaW50IGk7DQo+ID4gPiArDQo+ID4gPiArICAg
IHdoaWxlICggKGkgPSBmaW5kX2ZpcnN0X2JpdCgmdi0+YXJjaC5odm0udm14LmVvaV9leGl0bWFw
X2NoYW5nZWQsIG4pKQ0KPiA8DQo+ID4gPiBuICkNCj4gPiA+ICsgICAgew0KPiA+ID4gKyAgICAg
ICAgY2xlYXJfYml0KGksICZ2LT5hcmNoLmh2bS52bXguZW9pX2V4aXRtYXBfY2hhbmdlZCk7DQo+
ID4gPiArICAgICAgICBfX3Ztd3JpdGUoRU9JX0VYSVRfQklUTUFQKGkpLCB2LQ0KPiA+YXJjaC5o
dm0udm14LmVvaV9leGl0X2JpdG1hcFtpXSk7DQo+ID4gPiArICAgIH0NCj4gPiA+ICt9DQo+ID4g
PiArDQo+ID4gPiAgdm9pZCB2bXhfaW50cl9hc3Npc3Qodm9pZCkNCj4gPiA+ICB7DQo+ID4gPiAg
ICAgIHN0cnVjdCBodm1faW50YWNrIGludGFjazsNCj4gPiA+IEBAIC0zMTgsNyArMzMwLDYgQEAg
dm9pZCB2bXhfaW50cl9hc3Npc3Qodm9pZCkNCj4gPiA+ICAgICAgICAgICAgICAgIGludGFjay5z
b3VyY2UgIT0gaHZtX2ludHNyY192ZWN0b3IgKQ0KPiA+ID4gICAgICB7DQo+ID4gPiAgICAgICAg
ICB1bnNpZ25lZCBsb25nIHN0YXR1czsNCj4gPiA+IC0gICAgICAgIHVuc2lnbmVkIGludCBpLCBu
Ow0KPiA+ID4NCj4gPiA+ICAgICAgICAgLyoNCj4gPiA+ICAgICAgICAgICogaW50YWNrLnZlY3Rv
ciBpcyB0aGUgaGlnaGVzdCBwcmlvcml0eSB2ZWN0b3IuIFNvIHdlIHNldA0KPiBlb2lfZXhpdF9i
aXRtYXANCj4gPiA+IEBAIC0zNzksMTMgKzM5MCw3IEBAIHZvaWQgdm14X2ludHJfYXNzaXN0KHZv
aWQpDQo+ID4gPiAgICAgICAgICAgICAgICAgICAgICBpbnRhY2sudmVjdG9yOw0KPiA+ID4gICAg
ICAgICAgX192bXdyaXRlKEdVRVNUX0lOVFJfU1RBVFVTLCBzdGF0dXMpOw0KPiA+ID4NCj4gPiA+
IC0gICAgICAgIG4gPSBBUlJBWV9TSVpFKHYtPmFyY2guaHZtLnZteC5lb2lfZXhpdF9iaXRtYXAp
Ow0KPiA+ID4gLSAgICAgICAgd2hpbGUgKCAoaSA9IGZpbmRfZmlyc3RfYml0KCZ2LT5hcmNoLmh2
bS52bXguZW9pX2V4aXRtYXBfY2hhbmdlZCwNCj4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBuKSkgPCBuICkNCj4gPiA+IC0gICAgICAgIHsNCj4gPiA+IC0gICAgICAg
ICAgICBjbGVhcl9iaXQoaSwgJnYtPmFyY2guaHZtLnZteC5lb2lfZXhpdG1hcF9jaGFuZ2VkKTsN
Cj4gPiA+IC0gICAgICAgICAgICBfX3Ztd3JpdGUoRU9JX0VYSVRfQklUTUFQKGkpLCB2LQ0KPiA+
YXJjaC5odm0udm14LmVvaV9leGl0X2JpdG1hcFtpXSk7DQo+ID4gPiAtICAgICAgICB9DQo+ID4g
PiArICAgICAgICB2bXhfc3luY19leGl0X2JpdG1hcCh2KTsNCj4gPiA+DQo+ID4gPiAgICAgICAg
ICBwdF9pbnRyX3Bvc3QodiwgaW50YWNrKTsNCj4gPiA+ICAgICAgfQ0KPiA+ID4gZGlmZiAtLWdp
dCBhL3hlbi9hcmNoL3g4Ni9odm0vdm14L3Z2bXguYw0KPiBiL3hlbi9hcmNoL3g4Ni9odm0vdm14
L3Z2bXguYw0KPiA+ID4gaW5kZXggODQzMWM5MTJhMS4uODQ1ZGQ4N2Y3NSAxMDA2NDQNCj4gPiA+
IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vdm14L3Z2bXguYw0KPiA+ID4gKysrIGIveGVuL2FyY2gv
eDg2L2h2bS92bXgvdnZteC5jDQo+ID4gPiBAQCAtMTQxOCw2ICsxNDE4LDggQEAgc3RhdGljIHZv
aWQgbnZteF91cGRhdGVfYXBpY3Yoc3RydWN0IHZjcHUgKnYpDQo+ID4gPiAgICAgICAgICBzdGF0
dXMgfD0gcnZpICYgVk1YX0dVRVNUX0lOVFJfU1RBVFVTX1NVQkZJRUxEX0JJVE1BU0s7DQo+ID4g
PiAgICAgICAgICBfX3Ztd3JpdGUoR1VFU1RfSU5UUl9TVEFUVVMsIHN0YXR1cyk7DQo+ID4gPiAg
ICAgIH0NCj4gPiA+ICsNCj4gPiA+ICsgICAgdm14X3N5bmNfZXhpdF9iaXRtYXAodik7DQo+ID4N
Cj4gPiBTaW1pbGFybHksIEknZCBsaWtlIHRvIGRvIHRoZSBzeW5jIHdpdGhpbiB0aGUgY29uZGl0
aW9uYWwgYmxvY2ssIHdoZW4gaW50cg0KPiA+IHN0YXR1cyBpcyBhY3R1YWxseSBjaGFuZ2VkLiBP
dGhlcndpc2UsIGl0IGJlY29tZXMgY2hlY2tpbmcgYml0bWFwIGNoYW5nZQ0KPiA+IGluIGV2ZXJ5
IHZtZW50cnkgd2hlbiBhcGljdiBpcyBlbmFibGVkLg0KPiANCj4gTm8gLSBpdCB3aWxsIG9ubHkg
Y2hlY2sgdGhlIGJpdG1hcCB3aGVuIHRoZXJlJ3MgYSB2aXJ0dWFsIHZtZXhpdA0KPiAod2hpY2gg
aXMgd2hlcmUgbnZteF91cGRhdGVfYXBpY3YgZ2V0cyBjYWxsZWQpLCBub3Qgb24gZXZlcnkgdm1l
bnRyeS4NCg0KeW91IGFyZSByaWdodC4gSSBvdmVybG9va2VkIGl0LiBidXQgc3RpbGwgaXQncyB1
bm5lY2Vzc2FyeSB0byBkbyBpdCBmb3INCmV2ZXJ5IHZpcnR1YWwgdm1leGl0LiDwn5iKDQoNCj4g
SSBjYW4gdHJ5IHRvIGRvIHRoaXMgY29uZGl0aW9uYWxseSBvbiB3aGV0aGVyIEdVRVNUX0lOVFJf
U1RBVFVTIGlzDQo+IGFjdHVhbGx5IGNoYW5nZWQuDQo+IA0KDQp5ZXMuDQoNClRoYW5rcw0KS2V2
aW4NCg==


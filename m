Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCEFE17D96B
	for <lists+xen-devel@lfdr.de>; Mon,  9 Mar 2020 07:49:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBCBM-0002mq-NX; Mon, 09 Mar 2020 06:46:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZGpV=42=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1jBCBL-0002ml-F8
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2020 06:46:31 +0000
X-Inumbo-ID: b3688383-61d1-11ea-abdb-12813bfff9fa
Received: from mga14.intel.com (unknown [192.55.52.115])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b3688383-61d1-11ea-abdb-12813bfff9fa;
 Mon, 09 Mar 2020 06:46:28 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Mar 2020 23:46:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,532,1574150400"; d="scan'208";a="235579501"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by orsmga008.jf.intel.com with ESMTP; 08 Mar 2020 23:46:27 -0700
Received: from shsmsx153.ccr.corp.intel.com (10.239.6.53) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Sun, 8 Mar 2020 23:46:26 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.206]) by
 SHSMSX153.ccr.corp.intel.com ([169.254.12.96]) with mapi id 14.03.0439.000;
 Mon, 9 Mar 2020 14:46:24 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
Thread-Topic: [XEN PATCH v3 07/23] xen/build: Use obj-y += subdir/ instead
 of subdir-y
Thread-Index: AQHV7Jil71dcirdzPkmvKqaCg16up6g5QG8AgAajGbA=
Date: Mon, 9 Mar 2020 06:46:23 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D7C3DA3@SHSMSX104.ccr.corp.intel.com>
References: <20200226113355.2532224-1-anthony.perard@citrix.com>
 <20200226113355.2532224-8-anthony.perard@citrix.com>
 <155c8c7d-df12-5177-45ab-1dd2a6bc9b45@suse.com>
In-Reply-To: <155c8c7d-df12-5177-45ab-1dd2a6bc9b45@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMGNiN2E3MTctYjZjZi00NGU0LWI5NTYtMmUxOWJiNjQ0OTRiIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiSDdoTzRZTmduXC9GRGlyTEQ0aDFrQU9iMVZnS0xiOURrWHBsamY2dWVXNjNHSWc1dXM4bDdPTDl1SnFcL2tTb2J1In0=
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [XEN PATCH v3 07/23] xen/build: Use obj-y +=
 subdir/ instead of subdir-y
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
Cc: Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFRodXJzZGF5
LCBNYXJjaCA1LCAyMDIwIDU6MjQgUE0NCj4gDQo+IE9uIDI2LjAyLjIwMjAgMTI6MzMsIEFudGhv
bnkgUEVSQVJEIHdyb3RlOg0KPiA+IFRoaXMgaXMgcGFydCBvZiB1cGdyYWRpbmcgb3VyIGJ1aWxk
IHN5c3RlbSBhbmQgaW1wb3J0IG1vcmUgb2YgTGludXgncw0KPiA+IG9uZS4NCj4gPg0KPiA+IElu
IExpbnV4LCBzdWJkaXIteSBpbiBNYWtlZmlsZXMgaXMgb25seSB1c2VkIHRvIGRlc2NlbmQgaW50
bw0KPiA+IHN1YmRpcmVjdG9yeSB3aGVuIHRoZXJlIGFyZSBubyBvYmplY3QgdG8gYnVpbGQsIFhl
biBkb2Vzbid0IGhhdmUgdGhhdA0KPiA+IGFuZCBhbGwgc3ViZGlyIGhhdmUgb2JqZWN0IHRvIGJl
IGluY2x1ZGVkIGluIHRoZSBmaW5hbCBiaW5hcnkuDQo+ID4NCj4gPiBUbyBhbGxvdyB0aGUgbmV3
IHN5bnRheCwgdGhlICJvYmoteSIgYW5kICJzdWJkaXItKiIgY2FsY3VsYXRpb24gaW4NCj4gPiBS
dWxlcy5tayBpcyBjaGFuZ2VkIGFuZCBwYXJ0aWFsbHkgaW1wb3J0ZWQgZnJvbSBMaW51eCdzIEti
dWlsZC4NCj4gPg0KPiA+IFRoZSBjb21tYW5kIHVzZWQgdG8gbW9kaWZ5IHRoZSBNYWtlZmlsZSB3
YXM6DQo+ID4gICAgIHNlZCAtaSAtciAncyNec3ViZGlyLSguKikjb2JqLVwxLyM7JyAqKi9NYWtl
ZmlsZQ0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVy
YXJkQGNpdHJpeC5jb20+DQo+ID4gLS0tDQo+ID4NCj4gPiBOb3RlczoNCj4gPiAgICAgdjM6DQo+
ID4gICAgIC0gbm8gbW9yZSB0YWJzDQo+ID4gICAgIC0gcmVzaHVmZmxlIHZhcmlhYmxlLCBhbmQg
cmVtb3ZlIF9fc3ViZGlyLXkNCj4gPg0KPiA+ICB4ZW4vUnVsZXMubWsgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAxOSArKysrKysrKy0tLS0tLS0tLS0tDQo+ID4gIHhlbi9hcmNoL2FybS9NYWtl
ZmlsZSAgICAgICAgICAgICAgICB8IDE0ICsrKysrKystLS0tLS0tDQo+ID4gIHhlbi9hcmNoL2Fy
bS9hcm0zMi9NYWtlZmlsZSAgICAgICAgICB8ICAyICstDQo+ID4gIHhlbi9hcmNoL2FybS9hcm02
NC9NYWtlZmlsZSAgICAgICAgICB8ICAyICstDQo+IA0KPiBKdWxpZW4sIFN0ZWZhbm8gLSBhbnkg
Y2hhbmNlIG9mIGdldHRpbmcgYW4gYWNrIGhlcmU/DQo+IA0KPiA+ICB4ZW4vYXJjaC94ODYvTWFr
ZWZpbGUgICAgICAgICAgICAgICAgfCAxOCArKysrKysrKystLS0tLS0tLS0NCj4gPiAgeGVuL2Fy
Y2gveDg2L2FjcGkvTWFrZWZpbGUgICAgICAgICAgIHwgIDIgKy0NCj4gPiAgeGVuL2FyY2gveDg2
L2NwdS9NYWtlZmlsZSAgICAgICAgICAgIHwgIDQgKystLQ0KPiA+ICB4ZW4vYXJjaC94ODYvZ3Vl
c3QvTWFrZWZpbGUgICAgICAgICAgfCAgNCArKy0tDQo+ID4gIHhlbi9hcmNoL3g4Ni9odm0vTWFr
ZWZpbGUgICAgICAgICAgICB8ICA2ICsrKy0tLQ0KPiA+ICB4ZW4vYXJjaC94ODYvbW0vTWFrZWZp
bGUgICAgICAgICAgICAgfCAgNCArKy0tDQo+ID4gIHhlbi9hcmNoL3g4Ni94ODZfNjQvTWFrZWZp
bGUgICAgICAgICB8ICAyICstDQo+ID4gIHhlbi9jb21tb24vTWFrZWZpbGUgICAgICAgICAgICAg
ICAgICB8IDEwICsrKysrLS0tLS0NCj4gPiAgeGVuL2RyaXZlcnMvTWFrZWZpbGUgICAgICAgICAg
ICAgICAgIHwgMTQgKysrKysrKy0tLS0tLS0NCj4gPiAgeGVuL2RyaXZlcnMvYWNwaS9NYWtlZmls
ZSAgICAgICAgICAgIHwgIDYgKysrLS0tDQo+ID4gIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL01h
a2VmaWxlICAgICB8ICA4ICsrKystLS0tDQo+ID4gIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0
ZC9NYWtlZmlsZSB8ICAyICstDQo+IA0KPiBLZXZpbiwgaG93IGFib3V0IHRoaXMgb25lPw0KDQpS
ZXZpZXdlZC1ieTogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+DQoNCj4gDQo+ID4g
IHhlbi9saWIvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICB8ICAyICstDQo+ID4gIHhlbi94
c20vTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICB8ICAyICstDQo+ID4gIHhlbi94c20vZmxh
c2svTWFrZWZpbGUgICAgICAgICAgICAgICB8ICAyICstDQo+IA0KPiBEYW5pZWwsIGhvdyBhYm91
dCB0aGVzZT8NCj4gDQo+IEkgZ3Vlc3MgdGhlIGxhdHRlciB0d28gYXJlIHNtYWxsIGVub3VnaCB0
byBza2lwIGZ1cnRoZXIgd2FpdGluZyBmb3INCj4gYWNrcyBvbmNlIHRoZSBBcm0gb25lIHdvdWxk
IGJlIGluIHBsYWNlLiBHZXR0aW5nIHRoaXMgcGF0Y2ggaW4NCj4gd291bGQgdW5ibG9jayBhIGZh
aXIgcGFydCBvZiB0aGUgcmVtYWluZGVyIG9mIHRoaXMgc2VyaWVzLg0KPiANCj4gSmFuDQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

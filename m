Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B450187974
	for <lists+xen-devel@lfdr.de>; Tue, 17 Mar 2020 07:13:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jE5Qb-0004Mw-DA; Tue, 17 Mar 2020 06:10:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=T/Et=5C=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1jE5Qa-0004Mr-Nq
 for xen-devel@lists.xenproject.org; Tue, 17 Mar 2020 06:10:12 +0000
X-Inumbo-ID: f48edefc-6815-11ea-b8cf-12813bfff9fa
Received: from mga14.intel.com (unknown [192.55.52.115])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f48edefc-6815-11ea-b8cf-12813bfff9fa;
 Tue, 17 Mar 2020 06:10:10 +0000 (UTC)
IronPort-SDR: kKS09cV0bYJVgXpmYLO3EyGyBb9P8cETSxKbWS2wc8QqM9m1U34sirpduTmbBnVf0yJh5C3/Y1
 Gp+6IYPhRS6Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2020 23:10:08 -0700
IronPort-SDR: ijNQkcf7mskM6IT1+HGe84IwlvddSLfKM+wSO1VMPcPMZsQQFnGpu9NZgt2NlDEDUDe2h1gbK+
 1nmbdQdh1q4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,563,1574150400"; d="scan'208";a="267852927"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by fmsmga004.fm.intel.com with ESMTP; 16 Mar 2020 23:10:08 -0700
Received: from shsmsx108.ccr.corp.intel.com (10.239.4.97) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 16 Mar 2020 23:10:08 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.206]) by
 SHSMSX108.ccr.corp.intel.com ([169.254.8.235]) with mapi id 14.03.0439.000;
 Tue, 17 Mar 2020 14:10:06 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "paul@xen.org" <paul@xen.org>, 'Jan Beulich' <jbeulich@suse.com>
Thread-Topic: [Xen-devel] [PATCH v3] IOMMU: make DMA containment of
 quarantined devices optional
Thread-Index: AQHV9gMvA8DkILGx5UOf5iWNvNKXRqhBK2Cg///vUwCAACJ5gIAAKxiAgAAChICAAAiJAIAABewAgARkzGD//+KrgIAGmDwQ
Date: Tue, 17 Mar 2020 06:10:05 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D7D5E05@SHSMSX104.ccr.corp.intel.com>
References: <83253657-b3b4-a045-b829-f8f4c4aeae28@suse.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D7C5CDC@SHSMSX104.ccr.corp.intel.com>
 <2999c86a-328f-927e-6b53-895d2fd788f6@suse.com>
 <000f01d5f6d7$a89fe3b0$f9dfab10$@xen.org>
 <7f34d08e-7876-5eae-d561-c20db2fd5d99@suse.com>
 <002e01d5f6ee$75e09700$61a1c500$@xen.org>
 <0c311606-5c96-9171-f106-23e1e0c13bbb@suse.com>
 <003401d5f6f5$b119b4d0$134d1e70$@xen.org>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D7CDADF@SHSMSX104.ccr.corp.intel.com>
 <009d01d5f919$6c76c7c0$45645740$@xen.org>
In-Reply-To: <009d01d5f919$6c76c7c0$45645740$@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v3] IOMMU: make DMA containment of
 quarantined devices optional
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
 'Andrew Cooper' <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGcm9tOiBQYXVsIER1cnJhbnQgPHhhZGltZ25pa0BnbWFpbC5jb20+DQo+IFNlbnQ6IEZyaWRh
eSwgTWFyY2ggMTMsIDIwMjAgNToyNiBQTQ0KPiANCj4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KPiA+IEZyb206IFRpYW4sIEtldmluIDxrZXZpbi50aWFuQGludGVsLmNvbT4NCj4gPiBT
ZW50OiAxMyBNYXJjaCAyMDIwIDAzOjIzDQo+ID4gVG86IHBhdWxAeGVuLm9yZzsgJ0phbiBCZXVs
aWNoJyA8amJldWxpY2hAc3VzZS5jb20+DQo+ID4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZzsgJ0FuZHJldyBDb29wZXInDQo+IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0K
PiA+IFN1YmplY3Q6IFJFOiBbWGVuLWRldmVsXSBbUEFUQ0ggdjNdIElPTU1VOiBtYWtlIERNQSBj
b250YWlubWVudCBvZg0KPiBxdWFyYW50aW5lZCBkZXZpY2VzIG9wdGlvbmFsDQo+ID4NCj4gPiA+
IEZyb206IFBhdWwgRHVycmFudCA8eGFkaW1nbmlrQGdtYWlsLmNvbT4NCj4gPiA+IFNlbnQ6IFdl
ZG5lc2RheSwgTWFyY2ggMTEsIDIwMjAgMTI6MDUgQU0NCj4gPiA+DQo+ID4gWy4uLl0NCj4gPiA+
DQo+ID4gPiA+DQo+ID4gPiA+ID4gSG93ZXZlciwgaXMgYSByZWFsbHkgc2F5aW5nIHRoYXQgdGhp
bmdzIHdpbGwgYnJlYWsgaWYgYW55IG9mIHRoZQ0KPiA+ID4gPiA+IFBURXMgaGFzIHRoZWlyIHBy
ZXNlbnQgYml0IGNsZWFyPw0KPiA+ID4gPg0KPiA+ID4gPiBXZWxsLCB5b3Ugc2FpZCB0aGF0IHJl
YWQgZmF1bHRzIGFyZSBmYXRhbCAodG8gdGhlIGhvc3QpLiBSZWFkcyB3aWxsLA0KPiA+ID4gPiBm
b3IgYW55IGFkZHJlc3Mgd2l0aCBhbiB1bnBvcHVsYXRlZCBQVEUsIHJlc3VsdCBpbiBhIGZhdWx0
IGFuZCBoZW5jZQ0KPiA+ID4gPiBieSBpbXBsaWNhdGlvbiBiZSBmYXRhbC4NCj4gPiA+DQo+ID4g
PiBPaCBJIHNlZS4gSSB0aG91Z2h0IHRoZXJlIHdhcyBhbiBpbXBsaWNhdGlvbiB0aGF0IHRoZSBJ
T01NVSBjb3VsZCBub3QNCj4gY29wZQ0KPiA+ID4gd2l0aCBub24tcHJlc2VudCBQVEVzIGluIHNv
bWUgd2F5LiBBZ3JlZWQgdGhhdCwgd2hlbiB0aGUgZGV2aWNlIGlzDQo+IGFzc2lnbmVkDQo+ID4g
PiB0byB0aGUgZ3Vlc3QsIHRoZW4gaXQgY2FuIGFycmFuZ2UgKHZpYSBiYWxsb29uaW5nKSBmb3Ig
YSBub24tcHJlc2VudCBlbnRyeQ0KPiB0bw0KPiA+ID4gYmUgaGl0IGJ5IGEgcmVhZCB0cmFuc2Fj
dGlvbiwgcmVzdWx0aW5nIGluIGEgbG9jay11cC4gQnV0IGRlYWxpbmcgd2l0aCBhDQo+ID4gPiBt
YWxpY2lvdXMgZ3Vlc3Qgd2FzIG5vdCB0aGUgaXNzdWUgYXQgaGFuZC4uLiBkZWFsaW5nIHdpdGgg
YSBidWdneSBkZXZpY2UNCj4gdGhhdA0KPiA+ID4gc3RpbGwgdHJpZWQgdG8gRE1BIGFmdGVyIHJl
c2V0IGFuZCB3aGlsc3QgaW4gcXVhcmFudGluZSB3YXMgdGhlIHByb2JsZW0uDQo+ID4gPg0KPiA+
DQo+ID4gTW9yZSB0aGlua2luZyBvbiB0aGlzLCBJIHdvbmRlciB3aGV0aGVyIHRoZSBzY3JhdGNo
IHBhZ2UgaXMgc3VmZmljaWVudCwgb3INCj4gPiB3aGV0aGVyIHdlIHNob3VsZCBzdXBwb3J0IHN1
Y2ggZGV2aWNlIGluIHRoZSBmaXJzdCBwbGFjZS4gTG9va2luZyBhdA0KPiA+IDBjMzVkNDQ2Og0K
PiA+IC0tDQo+ID4gICAgIFRoZSByZWFzb24gZm9yIGRvaW5nIHRoaXMgaXMgdGhhdCBzb21lIGhh
cmR3YXJlIG1heSBjb250aW51ZSB0byByZS10cnkNCj4gPiAgICAgRE1BIChkZXNwaXRlIEZMUikg
aW4gdGhlIGV2ZW50IG9mIGFuIGVycm9yLCBvciBldmVuIEJNRSBiZWluZyBjbGVhcmVkLA0KPiBh
bmQNCj4gPiAgICAgd2lsbCBmYWlsIHRvIGRlYWwgd2l0aCBETUEgcmVhZCBmYXVsdHMgZ3JhY2Vm
dWxseS4gSGF2aW5nIGEgc2NyYXRjaCBwYWdlDQo+ID4gICAgIG1hcHBlZCB3aWxsIGFsbG93IHBl
bmRpbmcgRE1BIHJlYWRzIHRvIGNvbXBsZXRlIGFuZCB0aHVzIHN1Y2ggYnVnZ3kNCj4gPiAgICAg
aGFyZHdhcmUgd2lsbCBldmVudHVhbGx5IGJlIHF1aWVzY2VkLg0KPiA+IC0tDQo+ID4NCj4gPiAn
ZXZlbnR1YWxseScuLi4gd2hhdCBkb2VzIGl0IGV4YWN0bHkgbWVhbj8NCj4gDQo+IEl0IG1lYW5z
IGFmdGVyIGEgcGVyaW9kIG9mIHRpbWUgd2UgY2FuIG9ubHkgZGV0ZXJtaW5lIGVtcGlyaWNhbGx5
Lg0KPiANCj4gPiBIb3cgd291bGQgYW4gdXNlciBrbm93IGENCj4gPiBkZXZpY2UgaGFzIGJlZW4g
cXVpZXNjZWQgYmVmb3JlIGhlIGF0dGVtcHRzIHRvIHJlLWFzc2lnbiB0aGUgZGV2aWNlDQo+ID4g
dG8gb3RoZXIgZG9tVSBvciBkb20wPyBieSBndWVzcz8NCj4gDQo+IFllcywgYSBndWVzcywgYnV0
IGFuIGVkdWNhdGVkIG9uZS4NCj4gDQo+ID4gTm90ZSB0aGUgZXhhY3QgYmVoYXZpb3Igb2Ygc3Vj
aA0KPiA+IGRldmljZSwgYWZ0ZXIgZGlmZmVyZW50IGd1ZXN0IGJlaGF2aW9ycyAoaGFuZywga2ls
bCwgYnVnLCBldGMuKSwgaXMgbm90DQo+ID4gZG9jdW1lbnRlZC4gV2hvIGtub3dzIHdoZXRoZXIg
YSBpbi1mbHkgRE1BIG1heSBiZSB0cmlnZ2VyZWQgd2hlbg0KPiA+IHRoZSBuZXcgb3duZXIgc3Rh
cnRzIHRvIGluaXRpYWxpemUgdGhlIGRldmljZSBhZ2Fpbj8gSG93IG1hbnkgc3RhbGUNCj4gPiBz
dGF0ZXMgYXJlIHJlbWFpbmluZyBvbiBzdWNoIGRldmljZSB3aGljaCwgZXZlbiBub3QgdHJpZ2dl
cnJpbmcgaW4tZmx5DQo+ID4gRE1BcywgbWF5IGNoYW5nZSB0aGUgZGVzaXJlZCBiZWhhdmlvciBv
ZiB0aGUgbmV3IG93bmVyPyBlLmcuIGl0J3MNCj4gPiBwb3NzaWJsZSBvbmUgY29udHJvbCByZWdp
c3RlciBjb25maWd1cmVkIGJ5IHRoZSBvbGQgb3duZXIsIGJ1dCBub3QNCj4gPiB0b3VjaGVkIGJ5
IHRoZSBuZXcgb3duZXIuIElmIGl0IGNhbm5vdCBiZSByZXNldCwgd2hhdCdzIHRoZSBwb2ludCBv
Zg0KPiA+IHN1cHBvcnRpbmcgYXNzaWdubWVudCBvZiBzdWNoIGJvZ3VzIGRldmljZT8NCj4gPg0K
PiANCj4gQmVjYXVzZSBJJ20gYWZyYWlkIGl0IGlzIHF1aXRlIHViaXF1aXRvdXMgYW5kIHdlIG5l
ZWQgdG8gZGVhbCB3aXRoIGl0Lg0KDQppdCBzb3VuZHMgdGhlIHdob2xlIHBhc3N0aHJvdWdoIGlz
IGluIGRhbmdlcm91cyBpZiB5b3VyIHN0YXRlbWVudCBpcyB0cnVlLi4uDQoNCj4gDQo+ID4gVGhl
cmVieSBJIGZlZWwgYW55IHN1cHBvcnQgb2Ygc3VjaCBib2d1cyBkZXZpY2Ugc2hvdWxkIGJlIG1h
aW50YWluZWQNCj4gPiBvZmZ0cmVlLCBpbnN0ZWFkIG9mIGluIHVwc3RyZWFtIFhlbi4gVGhvdWdo
dHM/DQo+ID4NCj4gDQo+IEkgZG9uJ3Qgc2VlIHRoZSBoYXJtIGluIHRoZSBjb2RlIGJlaW5nIHVw
c3RyZWFtLiBUaGVyZSBtYXkgd2VsbCBiZSBvdGhlcg0KPiBkZXZpY2VzIHdpdGggc2ltaWxhciBp
c3N1ZXMgYW5kIGl0IHByb3ZpZGVzIGFuIG9wdGlvbiBmb3IgYW4gYWRtaW4gdG8gdHJ5Lg0KPiAN
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

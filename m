Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E535510A902
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 04:12:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZniL-0001XL-Ay; Wed, 27 Nov 2019 03:10:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8oLi=ZT=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1iZniK-0001WW-22
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2019 03:10:00 +0000
X-Inumbo-ID: 63d5b1be-10c3-11ea-b155-bc764e2007e4
Received: from mga01.intel.com (unknown [192.55.52.88])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 63d5b1be-10c3-11ea-b155-bc764e2007e4;
 Wed, 27 Nov 2019 03:09:57 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Nov 2019 19:09:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,247,1571727600"; d="scan'208";a="410196084"
Received: from fmsmsx104.amr.corp.intel.com ([10.18.124.202])
 by fmsmga006.fm.intel.com with ESMTP; 26 Nov 2019 19:09:54 -0800
Received: from fmsmsx157.amr.corp.intel.com (10.18.116.73) by
 fmsmsx104.amr.corp.intel.com (10.18.124.202) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 26 Nov 2019 19:09:54 -0800
Received: from shsmsx152.ccr.corp.intel.com (10.239.6.52) by
 FMSMSX157.amr.corp.intel.com (10.18.116.73) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 26 Nov 2019 19:09:54 -0800
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.127]) by
 SHSMSX152.ccr.corp.intel.com ([169.254.6.2]) with mapi id 14.03.0439.000;
 Wed, 27 Nov 2019 11:09:52 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <jbeulich@suse.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
 <roger.pau@citrix.com>
Thread-Topic: [PATCH for-4.13 v3 1/2] x86/vmx: add ASSERT to prevent syncing
 PIR to IRR...
Thread-Index: AQHVpHrRYd9DRO6bL0eyHq7+lDW7EqeeT5qQ
Date: Wed, 27 Nov 2019 03:09:51 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D6120EF@SHSMSX104.ccr.corp.intel.com>
References: <20191126132648.6917-1-roger.pau@citrix.com>
 <20191126132648.6917-2-roger.pau@citrix.com>
 <cccc439b-9595-1d5e-6969-8094e3a7c562@suse.com>
 <20191126164757.GH980@Air-de-Roger>
 <d44f276b-efce-d3e6-9b92-30c0874c726a@suse.com>
In-Reply-To: <d44f276b-efce-d3e6-9b92-30c0874c726a@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiYzUxOTU3ZGMtNjJkYS00Mjg3LWFlNTMtMjY5MGFiNWUyMjhlIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiZXBZTHZCc1I4eGN2dmFTWGdabkdOc1doR3JJNTl3eWpjM0RVTmd3N3ZVZmlxY0Y0WUN0dDZvd1RmNmNoU04zKyJ9
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH for-4.13 v3 1/2] x86/vmx: add ASSERT to
 prevent syncing PIR to IRR...
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, "Nakajima, Jun" <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFdlZG5lc2Rh
eSwgTm92ZW1iZXIgMjcsIDIwMTkgMTI6NTkgQU0NCj4gDQo+IE9uIDI2LjExLjIwMTkgMTc6NDcs
IFJvZ2VyIFBhdSBNb25uw6kgIHdyb3RlOg0KPiA+IE9uIFR1ZSwgTm92IDI2LCAyMDE5IGF0IDA1
OjMyOjA0UE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiA+PiBPbiAyNi4xMS4yMDE5IDE0
OjI2LCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6DQo+ID4+PiAtLS0gYS94ZW4vYXJjaC94ODYvaHZt
L3ZteC92bXguYw0KPiA+Pj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS92bXgvdm14LmMNCj4gPj4+
IEBAIC0yMDU0LDYgKzIwNTQsMTkgQEAgc3RhdGljIHZvaWQgdm14X3N5bmNfcGlyX3RvX2lycihz
dHJ1Y3QgdmNwdQ0KPiAqdikNCj4gPj4+ICAgICAgdW5zaWduZWQgaW50IGdyb3VwLCBpOw0KPiA+
Pj4gICAgICBERUNMQVJFX0JJVE1BUChwZW5kaW5nX2ludHIsIE5SX1ZFQ1RPUlMpOw0KPiA+Pj4N
Cj4gPj4+ICsgICAgaWYgKCB2ICE9IGN1cnJlbnQgJiYgIWF0b21pY19yZWFkKCZ2LT5wYXVzZV9j
b3VudCkgKQ0KPiA+Pj4gKyAgICB7DQo+ID4+PiArICAgICAgICAvKg0KPiA+Pj4gKyAgICAgICAg
ICogU3luY2luZyBQSVIgdG8gSVJSIG11c3Qgbm90IGJlIGRvbmUgYmVoaW5kIHRoZSBiYWNrIG9m
IHRoZSBDUFUsDQo+ID4+PiArICAgICAgICAgKiBzaW5jZSB0aGUgSVJSIGlzIGNvbnRyb2xsZWQg
YnkgdGhlIGhhcmR3YXJlIHdoZW4gdGhlIHZDUFUgaXMNCj4gPj4+ICsgICAgICAgICAqIGV4ZWN1
dGluZy4gT25seSBhbGxvdyBYZW4gdG8gZG8gc3VjaCBzeW5jIGlmIHRoZSB2Q1BVIGlzIHRoZQ0K
PiBjdXJyZW50DQo+ID4+PiArICAgICAgICAgKiBvbmUgb3IgaWYgaXQncyBwYXVzZWQ6IHRoYXQn
cyByZXF1aXJlZCBpbiBvcmRlciB0byBzeW5jIHRoZSBsYXBpYw0KPiA+Pj4gKyAgICAgICAgICog
c3RhdGUgYmVmb3JlIHNhdmluZyBpdC4NCj4gPj4+ICsgICAgICAgICAqLw0KPiA+Pg0KPiA+PiBJ
cyB0aGlzIHN0YXRlZCB0aGlzIHdheSBieSB0aGUgU0RNIGFueXdoZXJlPw0KPiA+DQo+ID4gTm8s
IEkgdGhpbmsgdGhlIFNETSBpcyBub3QgdmVyeSBjbGVhciBvbiB0aGlzLCB0aGVyZSdzIGEgcGFy
YWdyYXBoDQo+ID4gYWJvdXQgUElSOg0KPiA+DQo+ID4gIlRoZSBsb2dpY2FsIHByb2Nlc3NvciBw
ZXJmb3JtcyBhIGxvZ2ljYWwtT1Igb2YgUElSIGludG8gVklSUiBhbmQNCj4gPiBjbGVhcnMgUElS
LiBObyBvdGhlciBhZ2VudCBjYW4gcmVhZCBvciB3cml0ZSBhIFBJUiBiaXQgKG9yIGdyb3VwIG9m
DQo+ID4gYml0cykgYmV0d2VlbiB0aGUgdGltZSBpdCBpcyByZWFkICh0byBkZXRlcm1pbmUgd2hh
dCB0byBPUiBpbnRvIFZJUlIpDQo+ID4gYW5kIHdoZW4gaXQgaXMgY2xlYXJlZC4iDQo+IA0KPiBX
ZWxsLCB0aGlzIGlzIGFib3V0IFBJUiwgYnV0IG15IHF1ZXN0aW9uIHdhcyByYXRoZXIgdG93YXJk
cyB0aGUNCj4gZWZmZWN0cyBvbiB2SVJSLg0KPiANCj4gPj4gSSBhc2sgYmVjYXVzZSB0aGUNCj4g
Pj4gY29tbWVudCB0aGVuIHJlYWxseSBkb2Vzbid0IGFwcGx5IHRvIGp1c3QgdGhpcyBmdW5jdGlv
biwgYnV0IHRvDQo+ID4+IHZsYXBpY197LHRlc3RfYW5kX317c2V0LGNsZWFyfV92ZWN0b3IoKSBt
b3JlIGdlbmVyYWxseS4gSXQncw0KPiA+PiBub3QgY2xlYXIgdG8gbWUgYXQgYWxsIHdoZXRoZXIg
dGhlIENQVSBjYWNoZXMgKGluIGFuIGluY29oZXJlbnQNCj4gPj4gZmFzaGlvbikgSVJSIChhbmQg
bWF5YmUgb3RoZXIgQVBJQyBwYWdlIGVsZW1lbnRzKSwgcmF0aGVyIHRoYW4NCj4gPj4gaG9ub3Jp
bmcgdGhlIGF0b21pYyB1cGRhdGVzIHRoZXNlIG1hY3JvcyBkby4NCj4gPg0KPiA+IElNTyBzeW5j
aW5nIFBJUiB0byBJUlIgd2hlbiB0aGUgdkNQVSBpcyBydW5uaW5nIG9uIGEgZGlmZmVyZW50IHBD
UFUgaXMNCj4gPiBsaWtlbHkgdG8gYXQgbGVhc3QgZGVmZWF0IHRoZSBwdXJwb3NlIG9mIHBvc3Rl
ZCBpbnRlcnJ1cHRzOg0KPiANCj4gSSBhZ3JlZSBoZXJlLg0KPiANCj4gPiB3aGVuIHRoZQ0KPiA+
IENQVSByZWNlaXZlcyB0aGUgcG9zdGVkIGludGVycnVwdCB2ZWN0b3IgaXQgd29uJ3Qgc2VlIHRo
ZQ0KPiA+IG91dHN0YW5kaW5nLW5vdGlmaWNhdGlvbiBiaXQgaW4gdGhlIHBvc3RlZC1pbnRlcnJ1
cHQgZGVzY3JpcHRvcg0KPiA+IGJlY2F1c2UgdGhlIHN5bmMgZG9uZSBmcm9tIGEgZGlmZmVyZW50
IHBDUFUgd291bGQgaGF2ZSBjbGVhcmVkIGl0LCBhdA0KPiA+IHdoaWNoIHBvaW50IGl0J3Mgbm90
IGNsZWFyIHRvIG1lIHRoYXQgdGhlIHByb2Nlc3NvciB3aWxsIGNoZWNrIHZJUlINCj4gPiBmb3Ig
cGVuZGluZyBpbnRlcnJ1cHRzLiBUaGUgZGVzY3JpcHRpb24gaW4gc2VjdGlvbiAyOS42DQo+ID4g
UE9TVEVELUlOVEVSUlVQVCBQUk9DRVNTSU5HIGRvZXNuJ3QgZXhwbGljaXRseSBtZW50aW9uIHdo
ZXRoZXIgdGhlDQo+ID4gdmFsdWUgb2YgdGhlIG91dHN0YW5kaW5nLW5vdGlmaWNhdGlvbiBiaXQg
YWZmZWN0cyB0aGUgbG9naWMgb2YgcG9zdGVkDQo+ID4gaW50ZXJydXB0IHByb2Nlc3NpbmcuDQoN
CkkgdGhpbmsgdGhlIG91dHN0YW5kaW5nLW5vdGlmaWNhdGlvbiBpcyBvbmUtb2ZmIGNoZWNrZWQg
Zm9yIHRyaWdnZXJpbmcgDQppbnRlcnJ1cHQgcG9zdGluZyBwcm9jZXNzLiBPbmNlIHRoZSBwcm9j
ZXNzIHN0YXJ0cywgdGhlcmUgaXMgbm8gbmVlZCB0byANCmxvb2sgYXQgaXQgYWdhaW4uIFRoZSBz
dGVwIDMgb2YgcG9zdGluZyBwcm9jZXNzIGluIDI5LjYgY2xlYXJseSBzYXlzOg0KDQoiVGhlIHBy
b2Nlc3NvciBjbGVhcnMgdGhlIG91dHN0YW5kaW5nLW5vdGlmaWNhdGlvbiBiaXQgaW4gdGhlIHBv
c3RlZC0NCmludGVycnVwdCBkZXNjcmlwdG9yLiBUaGlzIGlzIGRvbmUgYXRvbWljYWxseSBzbyBh
cyB0byBsZWF2ZSB0aGUgcmVtYWluZGVyIA0Kb2YgdGhlIGRlc2NyaXB0b3IgdW5tb2RpZmllZCAo
ZS5nLiwgd2l0aCBhIGxvY2tlZCBBTkQgb3BlcmF0aW9uKS4iDQoNCkJ1dCByZWdhcmRsZXNzIG9m
IHRoZSBoYXJkd2FyZSBiZWhhdmlvciwgSSB0aGluayBpdCdzIHNhZmUgdG8gcmVzdHJpY3QNCnN5
bmNfcGlyX3RvX2lyciBhcyB0aGlzIHBhdGNoIGRvZXMuDQoNCj4gDQo+IEJ1dCBvdmVyYWxsIHRo
aXMgYWdhaW4gaXMgYWxsIHBvc3RlZCBpbnRlcnJ1cHQgY2VudHJpYyB3aGVuIG15DQo+IHF1ZXN0
aW9uIHdhcyBhYm91dCB2SVJSLCBpbiBwYXJ0aWN1bGFyIHdoZXRoZXIgdGhlIGFzc2VydGluZyB5
b3UNCj4gYWRkIG1heSBuZWVkIHRvIGJlIGV2ZW4gbW9yZSByaWdpZC4NCj4gDQo+IEFueXdheSwg
bGV0J3Mgc2VlIHdoYXQgdGhlIFZNWCBtYWludGFpbmVycyBoYXZlIHRvIHNheS4NCj4gDQoNClRo
ZXJlIGlzIG9uZSBwYXJhZ3JhcGggaW4gMjkuNjoNCg0KIlVzZSBvZiB0aGUgcG9zdGVkLWludGVy
cnVwdCBkZXNjcmlwdG9yIGRpZmZlcnMgZnJvbSB0aGF0IG9mIG90aGVyIGRhdGEgDQpzdHJ1Y3R1
cmVzIHRoYXQgYXJlIHJlZmVyZW5jZWQgYnkgcG9pbnRlcnMgaW4gYSBWTUNTLiBUaGVyZSBpcyBh
IGdlbmVyYWwgDQpyZXF1aXJlbWVudCB0aGF0IHNvZnR3YXJlIGVuc3VyZSB0aGF0IGVhY2ggc3Vj
aCBkYXRhIHN0cnVjdHVyZSBpcyANCm1vZGlmaWVkIG9ubHkgd2hlbiBubyBsb2dpY2FsIHByb2Nl
c3NvciB3aXRoIGEgY3VycmVudCBWTUNTIHRoYXQgDQpyZWZlcmVuY2VzIGl0IGlzIGluIFZNWCBu
b24tcm9vdCBvcGVyYXRpb24uIFRoYXQgcmVxdWlyZW1lbnQgZG9lcw0Kbm90IGFwcGx5IHRvIHRo
ZSBwb3N0ZWQtaW50ZXJydXB0IGRlc2NyaXB0b3IuIFRoZXJlIGlzIGEgcmVxdWlyZW1lbnQsIA0K
aG93ZXZlciwgdGhhdCBzdWNoIG1vZGlmaWNhdGlvbnMgYmUgZG9uZSB1c2luZyBsb2NrZWQgcmVh
ZC1tb2RpZnktd3JpdGUgDQppbnN0cnVjdGlvbnMuIg0KDQp2aXJ0dWFsLUFQSUMgcGFnZSBpcyBw
b2ludGVyLXJlZmVyZW5jZWQgYnkgVk1DUywgdGh1cyBpdCBmYWxscyBpbnRvIGFib3ZlDQpnZW5l
cmFsIHJlcXVpcmVtZW50LiBCdXQgSSBzdXBwb3NlIHRoZXJlIHNob3VsZCBiZSBzb21lIGV4Y2Vw
dGlvbiB3aXRoDQp0aGlzIHBhZ2UgdG9vLCBvdGhlcndpc2UgdGhlIHBvaW50IG9mIHBvc3RlZCBp
bnRlcnJ1cHQgaXMga2lsbGVkIChpZiB3ZSBoYXZlDQp0byBraWNrIHRoZSBkZXN0IHZjcHUgaW50
byByb290IHRvIHVwZGF0ZSB0aGUgdklSUikuIExldCBtZSBjb25maXJtDQppbnRlcm5hbGx5Lg0K
DQpUaGFua3MNCktldmluDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs

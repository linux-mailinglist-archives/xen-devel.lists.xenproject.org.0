Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF66E278E
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2019 03:02:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNRSM-0008Gw-CV; Thu, 24 Oct 2019 00:58:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rs4Q=YR=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1iNRSK-0008Gr-Pe
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2019 00:58:24 +0000
X-Inumbo-ID: 5fdadf24-f5f9-11e9-948f-12813bfff9fa
Received: from mga05.intel.com (unknown [192.55.52.43])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5fdadf24-f5f9-11e9-948f-12813bfff9fa;
 Thu, 24 Oct 2019 00:58:22 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Oct 2019 17:58:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,222,1569308400"; d="scan'208";a="399589289"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by fmsmga006.fm.intel.com with ESMTP; 23 Oct 2019 17:58:20 -0700
Received: from fmsmsx125.amr.corp.intel.com (10.18.125.40) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 23 Oct 2019 17:58:20 -0700
Received: from shsmsx153.ccr.corp.intel.com (10.239.6.53) by
 FMSMSX125.amr.corp.intel.com (10.18.125.40) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 23 Oct 2019 17:58:20 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.166]) by
 SHSMSX153.ccr.corp.intel.com ([10.239.6.53]) with mapi id 14.03.0439.000;
 Thu, 24 Oct 2019 08:58:18 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [PATCH for-4.13] x86/VT-d: Drop unhelpful information in
 diagnostics
Thread-Index: AQHVgEUCnbk+R1zygU6lBsAbFuGEXKdVC+gAgBLB3QCAAT2MgA==
Date: Thu, 24 Oct 2019 00:58:17 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D5CA43B@SHSMSX104.ccr.corp.intel.com>
References: <20191011150253.29457-1-andrew.cooper3@citrix.com>
 <20191011153350.GM1389@Air-de-Roger.citrite.net>
 <725052c7-89a8-7007-376f-2478ce1ff880@suse.com>
In-Reply-To: <725052c7-89a8-7007-376f-2478ce1ff880@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNDY1NDMxODctOWNjZC00NWUzLTg2ZjktY2QzNjcwZGNkYThkIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiTkJtSldtZ0FYQUc4TWI2ZGVXZjQwaTZFYXVwZG9mcnpsV0VyeUE5c200dDlEY0F3d3g4UlJKZU5DR2hiXC9lY3QifQ==
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH for-4.13] x86/VT-d: Drop unhelpful
 information in diagnostics
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
Cc: Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, "Nakajima, Jun" <jun.nakajima@intel.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGcm9tOiBKYW4gQmV1bGljaCBbbWFpbHRvOmpiZXVsaWNoQHN1c2UuY29tXQ0KPiBTZW50OiBX
ZWRuZXNkYXksIE9jdG9iZXIgMjMsIDIwMTkgMTA6MDAgUE0NCj4gDQo+IE9uIDExLjEwLjIwMTkg
MTc6MzMsIFJvZ2VyIFBhdSBNb25uw6kgIHdyb3RlOg0KPiA+IE9uIEZyaSwgT2N0IDExLCAyMDE5
IGF0IDA0OjAyOjUzUE0gKzAxMDAsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+ID4+IFRoZSB2aXJ0
dWFsIGFkZHJlc3Mgb2YgdGhlIGJhc2Ugb2YgdGhlIElPTU1VJ3MgcmVnc3RlcnMgaXMgbm90IHVz
ZWZ1bCBmb3INCj4gPj4gZGlhZ25vc3RpYyBwdXJwb3NlcywgYW5kIGlzIHF1aXRlIHZvbHVtaW5v
dXMuICBUaGUgUENJIGNvb3JkaW5hdGVzIGlzIGJ5DQo+IGZhcg0KPiA+PiB0aGUgbW9zdCB1c2Vm
dWwgcGllY2Ugb2YgaWRlbnRpZnlpbmcgaW5mb3JtYXRpb24uDQo+ID4+DQo+ID4+IFNpZ25lZC1v
ZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQo+ID4+IC0t
LQ0KPiA+PiBDQzogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPg0KPiA+PiBDQzogV2Vp
IExpdSA8d2xAeGVuLm9yZz4NCj4gPj4gQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBj
aXRyaXguY29tPg0KPiA+PiBDQzogSnVuIE5ha2FqaW1hIDxqdW4ubmFrYWppbWFAaW50ZWwuY29t
Pg0KPiA+PiBDQzogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+DQo+ID4+IENDOiBK
dWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQo+ID4+DQo+ID4+IFN1cnJvdW5kaW5nIHBy
aW50aygpcyBhbHNvIGlkZW50aWZ5IHRoZSBJT01NVSBieSBYZW4ncyBpbnRlcm5hbCBJRCwgYnV0
DQo+IHRoYXQNCj4gPj4gaXMgYWxzbyBwcmV0dHkgdXNlbGVzcyBpbmZvcm1hdGlvbiB3aGVuIGRp
YWdub3NpbmcgcHJvYmxlbXMuDQo+ID4+DQo+ID4+IFJGQyBmb3ItNC4xMy4gIFRoaXMgaXMgYSBu
aWNlIHRvIGhhdmUgc3R5bGlzdGljIGltcHJvdmVtZW50Lg0KPiA+DQo+ID4gSSBkb24ndCB0aGlu
ayB0aGUgcmVnaXN0ZXIgaXMgdXNlZnVsIGZvciBkZWJ1Z2dpbmcsIGF0IGxlYXN0IEkgaGF2ZQ0K
PiA+IG5ldmVyIHVzZWQgaXQgbXlzZWxmLCBzbzoNCj4gPg0KPiA+IFJldmlld2VkLWJ5OiBSb2dl
ciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gDQo+IFNlZWluZyB0aGF0IHRo
ZXJlIGhhc24ndCBiZWVuIGFuIGFjayBmcm9tIEtldmluLCBwZXJoYXBzIHRoaXMNCj4gcmF0aGVy
IHNpbXBsZSBjaGFuZ2UgY2FuIGdvIGluIHdpdGhvdXQ/IEp1c3QgaW4gY2FzZQ0KPiBBY2tlZC1i
eTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiANCg0KSSBvdmVybG9va2VkIGF0
IGl0LiBBY2tlZC1ieTogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+DQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

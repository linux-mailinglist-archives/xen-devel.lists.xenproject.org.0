Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E98D2588D3
	for <lists+xen-devel@lfdr.de>; Tue,  1 Sep 2020 09:12:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kD0SF-0002gz-QY; Tue, 01 Sep 2020 07:11:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ghRZ=CK=amazon.co.uk=prvs=506986bfd=pdurrant@srs-us1.protection.inumbo.net>)
 id 1kD0SD-0002gu-LF
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2020 07:11:41 +0000
X-Inumbo-ID: 50dede8b-c5d6-4b10-8225-13d6e829c156
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 50dede8b-c5d6-4b10-8225-13d6e829c156;
 Tue, 01 Sep 2020 07:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1598944301; x=1630480301;
 h=from:to:cc:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version:subject;
 bh=gj1vij9dRiwEJN7RDpAXYAJHUZmEVkr063Cf+QH6hnA=;
 b=QlG04gyafuL62vAPRjxej/Iph/jVFLArIQ0WxyQvk/SuOgMkmZ25PWRv
 yZv5trxkJzgrLYgZNVKZYgZI9NdjAZ0L3BrhzyT2002oLQJX6FFl6QfuX
 TGAoYsUrctBcvea944NJREAdUoUCkO/muaoN8FezgKmJun94+p6MUSLG+ E=;
X-IronPort-AV: E=Sophos;i="5.76,378,1592870400"; d="scan'208";a="51349008"
Subject: RE: [xen-unstable test] 153154: regressions - trouble:
 broken/fail/pass
Thread-Topic: [xen-unstable test] 153154: regressions - trouble:
 broken/fail/pass
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1d-2c665b5d.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 01 Sep 2020 07:11:36 +0000
Received: from EX13D32EUC002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1d-2c665b5d.us-east-1.amazon.com (Postfix) with ESMTPS
 id 302FAA1890; Tue,  1 Sep 2020 07:11:34 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 1 Sep 2020 07:11:33 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1497.006;
 Tue, 1 Sep 2020 07:11:33 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Jan Beulich <jbeulich@suse.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
 <roger.pau@citrix.com>
CC: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, osstest service owner
 <osstest-admin@xenproject.org>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Index: AQHWf1D0FFlCtNDvpUmPOybA1MpI6alSRguAgAAAgYCAARkTUA==
Date: Tue, 1 Sep 2020 07:11:33 +0000
Message-ID: <2e7e904f678d4bbbabe3eb8acb6fca7a@EX13D32EUC003.ant.amazon.com>
References: <osstest-153154-mainreport@xen.org>
 <97b0ec7e-6b74-88f1-ccb0-cc22ea2817c9@suse.com>
 <20200831142347.GC753@Air-de-Roger>
 <722eb6de-66be-99c4-c88d-7ed9a85288fe@suse.com>
In-Reply-To: <722eb6de-66be-99c4-c88d-7ed9a85288fe@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.145]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Precedence: Bulk
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDMxIEF1Z3VzdCAyMDIwIDE1OjI2DQo+IFRvOiBSb2dlciBQ
YXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gQ2M6IErDvHJnZW4gR3Jvw58gPGpn
cm9zc0BzdXNlLmNvbT47IG9zc3Rlc3Qgc2VydmljZSBvd25lciA8b3NzdGVzdC1hZG1pbkB4ZW5w
cm9qZWN0Lm9yZz47IHhlbi0NCj4gZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IER1cnJhbnQs
IFBhdWwgPHBkdXJyYW50QGFtYXpvbi5jby51az4NCj4gU3ViamVjdDogUkU6IFtFWFRFUk5BTF0g
W3hlbi11bnN0YWJsZSB0ZXN0XSAxNTMxNTQ6IHJlZ3Jlc3Npb25zIC0gdHJvdWJsZTogYnJva2Vu
L2ZhaWwvcGFzcw0KPiANCj4gQ0FVVElPTjogVGhpcyBlbWFpbCBvcmlnaW5hdGVkIGZyb20gb3V0
c2lkZSBvZiB0aGUgb3JnYW5pemF0aW9uLiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Blbg0KPiBh
dHRhY2htZW50cyB1bmxlc3MgeW91IGNhbiBjb25maXJtIHRoZSBzZW5kZXIgYW5kIGtub3cgdGhl
IGNvbnRlbnQgaXMgc2FmZS4NCj4gDQo+IA0KPiANCj4gT24gMzEuMDguMjAyMCAxNjoyMywgUm9n
ZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4gPiBPbiBNb24sIEF1ZyAzMSwgMjAyMCBhdCAwNjo0MDo1
NkFNICswMjAwLCBKw7xyZ2VuIEdyb8OfIHdyb3RlOg0KPiA+PiBPbiAzMC4wOC4yMCAxODoxMSwg
b3NzdGVzdCBzZXJ2aWNlIG93bmVyIHdyb3RlOg0KPiA+Pj4gZmxpZ2h0IDE1MzE1NCB4ZW4tdW5z
dGFibGUgcmVhbCBbcmVhbF0NCj4gPj4+IGh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnByb2plY3Qu
b3JnL29zc3Rlc3QvbG9ncy8xNTMxNTQvDQo+ID4+Pg0KPiA+Pj4gUmVncmVzc2lvbnMgOi0oDQo+
ID4+Pg0KPiA+Pj4gVGVzdHMgd2hpY2ggZGlkIG5vdCBzdWNjZWVkIGFuZCBhcmUgYmxvY2tpbmcs
DQo+ID4+PiBpbmNsdWRpbmcgdGVzdHMgd2hpY2ggY291bGQgbm90IGJlIHJ1bjoNCj4gPj4+ICAg
dGVzdC1hbWQ2NC1hbWQ2NC14bC1xZW11dC1kZWJpYW5odm0taTM4Ni14c20gICAgPGpvYiBzdGF0
dXM+ICAgICAgICAgICAgYnJva2VuDQo+ID4+PiAgIHRlc3QtYW1kNjQtYW1kNjQteGwtcWVtdXQt
ZGViaWFuaHZtLWFtZDY0ICAgIDxqb2Igc3RhdHVzPiAgICAgICAgICAgICAgIGJyb2tlbg0KPiA+
Pj4gICB0ZXN0LWFtZDY0LWkzODYteGwtcWVtdXQtd2luNy1hbWQ2NCAgICA8am9iIHN0YXR1cz4g
ICAgICAgICAgICAgICAgIGJyb2tlbg0KPiA+Pj4gICB0ZXN0LWFtZDY0LWkzODYteGwtcWVtdXQt
c3R1YmRvbS1kZWJpYW5odm0tYW1kNjQteHNtIDEwIGRlYmlhbi1odm0taW5zdGFsbCBmYWlsIFJF
R1IuIHZzLiAxNTI4NzcNCj4gPj4+ICAgdGVzdC1hbWQ2NC1hbWQ2NC14bC1xZW11dC1zdHViZG9t
LWRlYmlhbmh2bS1hbWQ2NC14c20gMTAgZGViaWFuLWh2bS1pbnN0YWxsIGZhaWwgUkVHUi4gdnMu
DQo+IDE1Mjg3Nw0KPiA+Pg0KPiA+PiBQYXVsLCBJIHN1c3BlY3Qgc29tZSBmYWxsb3V0IGZyb20g
eW91ciBob3RwbHVnL210dSBzZXJpZXM/DQo+ID4+DQo+ID4+IFRoZSBmYWlsdXJlIGluDQo+ID4+
DQo+ID4+IGh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnByb2plY3Qub3JnL29zc3Rlc3QvbG9ncy8x
NTMxNTQvdGVzdC1hbWQ2NC1hbWQ2NC14bC1xZW11dC1zdHViZG9tLQ0KPiBkZWJpYW5odm0tYW1k
NjQteHNtLzEwLnRzLWRlYmlhbi1odm0taW5zdGFsbC5sb2cNCj4gPj4NCj4gPj4gaXMgcG9pbnRp
bmcgaW4gdGhpcyBkaXJlY3Rpb24gSU1PLg0KPiA+DQo+ID4gVGhlcmUncyBhIHN0dWJkb20gcGFu
aWMgYXQ6DQo+ID4NCj4gPiBodHRwOi8vbG9ncy50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0
ZXN0L2xvZ3MvMTUzMTU0L3Rlc3QtYW1kNjQtYW1kNjQteGwtcWVtdXQtc3R1YmRvbS1kZWJpYW5o
dm0tDQo+IGFtZDY0LXhzbS9nb2RlbGxvMC0tLXZhci1sb2cteGVuLXFlbXUtZG0tZGViaWFuaHZt
Lmd1ZXN0Lm9zc3Rlc3QubG9nDQo+ID4NCj4gPiBObyBpZGVhIGlmIGl0J3MgcmVsYXRlZCB0byB0
aGUgTVRVIHN0dWZmIG9yIG5vdC4gU2VlbXMgdG8gaGFwcGVuIGR1cmluZw0KPiA+IG5ldGZyb250
IGluaXRpYWxpemF0aW9uLCBzbyBtaWdodCBiZSByZWxhdGVkLg0KPiANCj4gTWlnaHQgYWxzbyBi
ZSB0aGUgbmV0ZnJvbnRfaW5pdCgpIGNoYW5nZXMgaW4gLyBmb3IgbWluaS1vcyB0aGVuLg0KPiAN
Cg0KVGhhdCBzb3VuZHMgbW9yZSBsaWtlbHkuIFRoZSBvbmx5IGZ1bmN0aW9uYWwgY2hhbmdlIHRo
YXQgbXkgc2VyaWVzIGludGVuZGVkIHRvIG1ha2Ugd2FzIHRvIGFkZCBhIHhlbnN0b3JlIGVudHJ5
IHRoYXQgQUZBSUsgaGFzIG9ubHkgZXZlciBiZWVuIHVzZWQgYnkgV2luZG93cyBkcml2ZXJzLiBJ
J2xsIGdvIGNoZWNrIHRoZSBsb2dzIHRob3VnaC4NCg0KICBQYXVsDQoNCj4gSmFuDQo=


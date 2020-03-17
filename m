Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C34318799A
	for <lists+xen-devel@lfdr.de>; Tue, 17 Mar 2020 07:25:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jE5d1-0005Nq-VR; Tue, 17 Mar 2020 06:23:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=T/Et=5C=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1jE5d0-0005Nh-MH
 for xen-devel@lists.xenproject.org; Tue, 17 Mar 2020 06:23:02 +0000
X-Inumbo-ID: bf755226-6817-11ea-a6c1-bc764e2007e4
Received: from mga09.intel.com (unknown [134.134.136.24])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bf755226-6817-11ea-a6c1-bc764e2007e4;
 Tue, 17 Mar 2020 06:22:59 +0000 (UTC)
IronPort-SDR: csrZVGcxIoLAq60Bm7p//yvS5phIoSwQN4R9DfHWrXAzY82O6O4t7nnLHaSmpEYchNEYheP9Pu
 ihoEmyW8iSwA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2020 23:22:59 -0700
IronPort-SDR: TGmNeEMtYYQ83QA9cQcEYK23A3jM+mYoU5rmlkWGgwgFXu8htxPabx45+4b0pBR//GopnoKUyX
 Ep0PO/FiA3DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,563,1574150400"; d="scan'208";a="417436836"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
 by orsmga005.jf.intel.com with ESMTP; 16 Mar 2020 23:22:58 -0700
Received: from fmsmsx102.amr.corp.intel.com (10.18.124.200) by
 FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 16 Mar 2020 23:22:58 -0700
Received: from shsmsx108.ccr.corp.intel.com (10.239.4.97) by
 FMSMSX102.amr.corp.intel.com (10.18.124.200) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 16 Mar 2020 23:22:58 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.206]) by
 SHSMSX108.ccr.corp.intel.com ([169.254.8.235]) with mapi id 14.03.0439.000;
 Tue, 17 Mar 2020 14:22:56 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, osstest service owner
 <osstest-admin@xenproject.org>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [linux-linus bisection] complete
 test-amd64-amd64-qemuu-nested-intel
Thread-Index: AQHV+MomXJ6PIhOQXk+J+Cp9oeTSWKhGKiyAgAYs3jA=
Date: Tue, 17 Mar 2020 06:22:55 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D7D5E79@SHSMSX104.ccr.corp.intel.com>
References: <E1jCXgo-0003eI-LY@osstest.test-lab.xenproject.org>
 <7598567f-9aff-2f5f-71c8-6a4352d9eea1@citrix.com>
In-Reply-To: <7598567f-9aff-2f5f-71c8-6a4352d9eea1@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [linux-linus bisection] complete
 test-amd64-amd64-qemuu-nested-intel
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
Cc: Jan Beulich <JBeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGcm9tOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPiBTZW50
OiBTYXR1cmRheSwgTWFyY2ggMTQsIDIwMjAgMTI6MDMgQU0NCj4gDQo+IE9uIDEyLzAzLzIwMjAg
MjM6NTYsIG9zc3Rlc3Qgc2VydmljZSBvd25lciB3cm90ZToNCj4gPiBicmFuY2ggeGVuLXVuc3Rh
YmxlDQo+ID4geGVuYnJhbmNoIHhlbi11bnN0YWJsZQ0KPiA+IGpvYiB0ZXN0LWFtZDY0LWFtZDY0
LXFlbXV1LW5lc3RlZC1pbnRlbA0KPiA+IHRlc3RpZCBkZWJpYW4taHZtLWluc3RhbGwvbDEvbDIN
Cj4gPg0KPiA+IFRyZWU6IGxpbnV4IGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgv
a2VybmVsL2dpdC90b3J2YWxkcy9saW51eC0NCj4gMi42LmdpdA0KPiA+IFRyZWU6IGxpbnV4Zmly
bXdhcmUgZ2l0Oi8veGVuYml0cy54ZW4ub3JnL29zc3Rlc3QvbGludXgtZmlybXdhcmUuZ2l0DQo+
ID4gVHJlZTogb3ZtZiBnaXQ6Ly94ZW5iaXRzLnhlbi5vcmcvb3NzdGVzdC9vdm1mLmdpdA0KPiA+
IFRyZWU6IHFlbXUgZ2l0Oi8veGVuYml0cy54ZW4ub3JnL3FlbXUteGVuLXRyYWRpdGlvbmFsLmdp
dA0KPiA+IFRyZWU6IHFlbXV1IGdpdDovL3hlbmJpdHMueGVuLm9yZy9xZW11LXhlbi5naXQNCj4g
PiBUcmVlOiBzZWFiaW9zIGdpdDovL3hlbmJpdHMueGVuLm9yZy9vc3N0ZXN0L3NlYWJpb3MuZ2l0
DQo+ID4gVHJlZTogeGVuIGdpdDovL3hlbmJpdHMueGVuLm9yZy94ZW4uZ2l0DQo+ID4NCj4gPiAq
KiogRm91bmQgYW5kIHJlcHJvZHVjZWQgcHJvYmxlbSBjaGFuZ2VzZXQgKioqDQo+ID4NCj4gPiAg
IEJ1ZyBpcyBpbiB0cmVlOiAgeGVuIGdpdDovL3hlbmJpdHMueGVuLm9yZy94ZW4uZ2l0DQo+ID4g
ICBCdWcgaW50cm9kdWNlZDogIGY5NmUxNDY5YWQwNmI2MTc5NmM2MDE5M2RhYWViOWY4YTk2ZDc0
NTgNCj4gPiAgIEJ1ZyBub3QgcHJlc2VudDogMDcyOTgzMGNjNDI1YThmZjI3YTMxMzdlODdiOTM3
NjhhZTNjODUzYw0KPiA+ICAgTGFzdCBmYWlsIHJlcHJvOiBodHRwOi8vbG9ncy50ZXN0LWxhYi54
ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTQ4NDk2Lw0KPiA+DQo+ID4NCj4gPiAgIGNvbW1p
dCBmOTZlMTQ2OWFkMDZiNjE3OTZjNjAxOTNkYWFlYjlmOGE5NmQ3NDU4DQo+ID4gICBBdXRob3I6
IFJvZ2VyIFBhdSBNb25uw4PCqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQo+ID4gICBEYXRlOiAg
IFdlZCBGZWIgNSAxMzo0OTowOSAyMDIwICswMTAwDQo+ID4NCj4gPiAgICAgICB4ODYvdnZteDog
Zml4IHZpcnR1YWwgaW50ZXJydXB0IGluamVjdGlvbiB3aGVuIEFjayBvbiBleGl0IGNvbnRyb2wg
aXMgdXNlZA0KPiA+DQo+ID4gICAgICAgV2hlbiBkb2luZyBhIHZpcnR1YWwgdm1leGl0IChpZTog
YSB2bWV4aXQgaGFuZGxlZCBieSB0aGUgTDEgVk1NKQ0KPiA+ICAgICAgIGludGVycnVwdHMgc2hv
dWxkbid0IGJlIGluamVjdGVkIHVzaW5nIHRoZSB2aXJ0dWFsIGludGVycnVwdCBkZWxpdmVyeQ0K
PiA+ICAgICAgIG1lY2hhbmlzbSB1bmxlc3MgdGhlIEFjayBvbiBleGl0IHZtZXhpdCBjb250cm9s
IGJpdCBpc24ndCBzZXQgaW4gdGhlDQo+ID4gICAgICAgbmVzdGVkIHZtY3MuDQo+ID4NCj4gPiAg
ICAgICBHYXRlIHRoZSBjYWxsIHRvIG52bXhfdXBkYXRlX2FwaWN2IGhlbHBlciBvbiB3aGV0aGVy
IHRoZSBuZXN0ZWQgdm1jcw0KPiA+ICAgICAgIGhhcyB0aGUgQWNrIG9uIGV4aXQgYml0IHNldCBp
biB0aGUgdm1leGl0IGNvbnRyb2wgZmllbGQuDQo+ID4NCj4gPiAgICAgICBOb3RlIHRoYXQgdGhp
cyBmaXhlcyB0aGUgdXNhZ2Ugb2YgeDJBUElDIGJ5IHRoZSBMMSBWTU0sIGF0IGxlYXN0IHdoZW4N
Cj4gPiAgICAgICB0aGUgTDEgVk1NIGlzIFhlbi4NCj4gPg0KPiA+ICAgICAgIFNpZ25lZC1vZmYt
Ynk6IFJvZ2VyIFBhdSBNb25uw4PCqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQo+ID4gICAgICAg
UmV2aWV3ZWQtYnk6IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPg0KPiANCj4gTG9v
a3MgbGlrZSB0aGVyZSBhcmUgZnVydGhlciBwcm9ibGVtcyBoZXJlLsKgIEknbSBhZnJhaWQgSSBo
YXZlbid0DQo+IGludmVzdGlnYXRlZCBmdXJ0aGVyLCBidXQgdGhpcyBhbHNvIG1pZ2h0IGJlIHRo
ZSBzb3VyY2Ugb2YgdGhlDQo+IGludGVybWl0dGVudCBwcm9ibGVtcyBpbiBzdGFnaW5nLg0KPiAN
Cg0KYW55IGVycm9yIG1lc3NhZ2Ugb3Igc3RhY2sgZHVtcCBmb3IgdGhpcyBmYWlsdXJlPw0KDQpU
aGFua3MNCktldmluDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

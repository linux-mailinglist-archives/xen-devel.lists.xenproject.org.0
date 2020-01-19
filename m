Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F81141B7A
	for <lists+xen-devel@lfdr.de>; Sun, 19 Jan 2020 04:19:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1it14I-0007R7-5L; Sun, 19 Jan 2020 03:16:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nxl7=3I=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1it14G-0007R2-BY
 for xen-devel@lists.xenproject.org; Sun, 19 Jan 2020 03:16:04 +0000
X-Inumbo-ID: ffc7696c-3a69-11ea-b833-bc764e2007e4
Received: from mga18.intel.com (unknown [134.134.136.126])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ffc7696c-3a69-11ea-b833-bc764e2007e4;
 Sun, 19 Jan 2020 03:15:53 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Jan 2020 19:15:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,336,1574150400"; d="scan'208";a="269408528"
Received: from fmsmsx108.amr.corp.intel.com ([10.18.124.206])
 by fmsmga001.fm.intel.com with ESMTP; 18 Jan 2020 19:15:51 -0800
Received: from fmsmsx156.amr.corp.intel.com (10.18.116.74) by
 FMSMSX108.amr.corp.intel.com (10.18.124.206) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Sat, 18 Jan 2020 19:15:51 -0800
Received: from shsmsx152.ccr.corp.intel.com (10.239.6.52) by
 fmsmsx156.amr.corp.intel.com (10.18.116.74) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Sat, 18 Jan 2020 19:15:50 -0800
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.197]) by
 SHSMSX152.ccr.corp.intel.com ([169.254.6.203]) with mapi id 14.03.0439.000;
 Sun, 19 Jan 2020 11:15:49 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH 1/2] VT-d: don't pass bridge devices to
 domain_context_mapping_one()
Thread-Index: AQHVxS1krZxX467us0eSCo0lyZPj8KfxYlUA
Date: Sun, 19 Jan 2020 03:15:49 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D739B0A@SHSMSX104.ccr.corp.intel.com>
References: <f0fd3167-9702-39f0-0222-03bbcafb3093@suse.com>
 <64149ced-6e88-abf5-2740-a43db6a0a4be@suse.com>
In-Reply-To: <64149ced-6e88-abf5-2740-a43db6a0a4be@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNzA4YTU2NjctMjg4Mi00ZTBlLWI4MTItNjE3ZTA3NzJkYjU1IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiRkxPMU04UnRZdVRpOE5wbGVXeUNWVnV6WDBDZzBKXC9tWEo0T2NXQkZjbktpQU9tZjV5OXlMaFlSMTVRSXpZdnYifQ==
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 1/2] VT-d: don't pass bridge devices to
 domain_context_mapping_one()
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
Cc: Marek Marczykowski <marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFR1ZXNkYXks
IEphbnVhcnkgNywgMjAyMCAzOjM4IFBNDQo+IA0KPiBXaGVuIHBhc3NlZCBhIG5vbi1OVUxMIHBk
ZXYsIHRoZSBmdW5jdGlvbiBkb2VzIGFuIG93bmVyIGNoZWNrIHdoZW4gaXQNCj4gZmluZHMgYW4g
YWxyZWFkeSBleGlzdGluZyBjb250ZXh0IG1hcHBpbmcuIEJyaWRnZXMsIGhvd2V2ZXIsIGRvbid0
IGdldA0KPiBwYXNzZWQgdGhyb3VnaCB0byBndWVzdHMsIGFuZCBoZW5jZSB0aGVpciBvd25lciBp
cyBhbHdheXMgZ29pbmcgdG8gYmUNCj4gRG9tMCwgbGVhZGluZyB0byB0aGUgYXNzaWdtZW50IG9m
IGFsbCBidXQgb25lIG9mIHRoZSBmdW5jdGlvbiBvZiBtdWx0aS0NCj4gZnVuY3Rpb24gUENJIGRl
dmljZXMgYmVoaW5kIGJyaWRnZXMgdG8gZmFpbC4NCj4gDQo+IFJlcG9ydGVkLWJ5OiBNYXJlayBN
YXJjenlrb3dza2ktR8ODwrNyZWNraQ0KPiA8bWFybWFyZWtAaW52aXNpYmxldGhpbmdzbGFiLmNv
bT4NCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiAt
LS0NCj4gTm90ZTogVGhpcyB3YXMgcmVwb3J0ZWQgYXMgYW4gYXBwYXJlbnQgcmVncmVzc2lvbiBm
cm9tIFhTQS0zMDIgLyAtMzA2Lg0KPiAgICAgICBTbyBmYXIgSSBoYXZlbid0IGJlZW4gYWJsZSB0
byBmaWd1cmUgb3V0IGhvdyB0aGUgY29kZSB3b3VsZCBoYXZlDQo+ICAgICAgIHdvcmtlZCBiZWZv
cmUsIGkuZS4gdG8gbWUgaXQgbG9va3MgbGlrZSBhIHByZS1leGlzdGluZyBwcm9ibGVtLg0KPiAg
ICAgICBUaGlzIGxlYXZlcyB0aGUgcmlzayBvZiB0aGUgY2hhbmdlIGhlcmUgcGFwZXJpbmcgb3Zl
ciBhbm90aGVyDQo+ICAgICAgIGlzc3VlLg0KPiANCj4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Ro
cm91Z2gvdnRkL2lvbW11LmMNCj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2lv
bW11LmMNCj4gQEAgLTE0OTksNyArMTQ5OSw3IEBAIHN0YXRpYyBpbnQgZG9tYWluX2NvbnRleHRf
bWFwcGluZyhzdHJ1Y3QNCj4gICAgICAgICAgICAgIGJyZWFrOw0KPiANCj4gICAgICAgICAgcmV0
ID0gZG9tYWluX2NvbnRleHRfbWFwcGluZ19vbmUoZG9tYWluLCBkcmhkLT5pb21tdSwgYnVzLCBk
ZXZmbiwNCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGNpX2dl
dF9wZGV2KHNlZywgYnVzLCBkZXZmbikpOw0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBOVUxMKTsNCg0KdGhlIHJlbGF0aW9uc2hpcCBiZXR3ZWVuIE5VTEwgYW5k
IGEgYnJpZGdlIGRldmljZSBpcyBub3Qgb2J2aW91cw0KYnkganVzdCBsb29raW5nIGF0IHRoZSBj
b2RlLiBDYW4geW91IGF0IGxlYXN0IGFkZCBzb21lIGNvbW1lbnQNCmhlcmUsIG9yIHBvc3NpYmx5
IGJlIGNsZWFyZXIgYnkgaGF2aW5nIGEgbWFwcGluZ19icmlkZ2Ugd3JhcHBlcj8NCg0KPiANCj4g
ICAgICAgICAgLyoNCj4gICAgICAgICAgICogRGV2aWNlcyBiZWhpbmQgUENJZS10by1QQ0kvUENJ
eCBicmlkZ2UgbWF5IGdlbmVyYXRlIGRpZmZlcmVudA0KPiBAQCAtMTUwOSw3ICsxNTA5LDcgQEAg
c3RhdGljIGludCBkb21haW5fY29udGV4dF9tYXBwaW5nKHN0cnVjdA0KPiAgICAgICAgICBpZiAo
ICFyZXQgJiYgcGRldl90eXBlKHNlZywgYnVzLCBkZXZmbikgPT0gREVWX1RZUEVfUENJZTJQQ0lf
QlJJREdFDQo+ICYmDQo+ICAgICAgICAgICAgICAgKHNlY2J1cyAhPSBwZGV2LT5idXMgfHwgcGRl
di0+ZGV2Zm4gIT0gMCkgKQ0KPiAgICAgICAgICAgICAgcmV0ID0gZG9tYWluX2NvbnRleHRfbWFw
cGluZ19vbmUoZG9tYWluLCBkcmhkLT5pb21tdSwgc2VjYnVzLA0KPiAwLA0KPiAtICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGNpX2dldF9wZGV2KHNlZywgc2Vj
YnVzLCAwKSk7DQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBOVUxMKTsNCj4gDQo+ICAgICAgICAgIGJyZWFrOw0KPiANCg0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

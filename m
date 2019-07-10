Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB3464090
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jul 2019 07:21:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hl4zc-0004dy-9J; Wed, 10 Jul 2019 05:18:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=alT5=VH=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1hl4zb-0004dt-8U
 for xen-devel@lists.xenproject.org; Wed, 10 Jul 2019 05:18:11 +0000
X-Inumbo-ID: 183c6978-a2d2-11e9-9d2a-b3561c75f558
Received: from mga06.intel.com (unknown [134.134.136.31])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 183c6978-a2d2-11e9-9d2a-b3561c75f558;
 Wed, 10 Jul 2019 05:18:05 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Jul 2019 22:18:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,473,1557212400"; d="scan'208";a="249357488"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by orsmga001.jf.intel.com with ESMTP; 09 Jul 2019 22:18:03 -0700
Received: from fmsmsx113.amr.corp.intel.com (10.18.116.7) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 9 Jul 2019 22:18:03 -0700
Received: from shsmsx108.ccr.corp.intel.com (10.239.4.97) by
 FMSMSX113.amr.corp.intel.com (10.18.116.7) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 9 Jul 2019 22:18:02 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.110]) by
 SHSMSX108.ccr.corp.intel.com ([169.254.8.174]) with mapi id 14.03.0439.000;
 Wed, 10 Jul 2019 13:18:02 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2] x86/ept: pass correct level to p2m_entry_modify
Thread-Index: AQHVMZM5noptHluN8EuDCNHe08FGcKbDWiiA
Date: Wed, 10 Jul 2019 05:18:01 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19CAC3DC8@SHSMSX104.ccr.corp.intel.com>
References: <20190703113326.2344-1-roger.pau@citrix.com>
In-Reply-To: <20190703113326.2344-1-roger.pau@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNjNjYTgzN2UtZDlkYy00OGU2LWI5NmYtZDVjNjAxNTQ0Nzc4IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoibGlHS0lwMDc2TGtHXC9sUjlYWUkycitCWEVnRnRBSWZOYnN4dmN4cEMxVHlLYVFRQTByaUxEMFdEZWZzK0tXNGUifQ==
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2] x86/ept: pass correct level to
 p2m_entry_modify
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, "Nakajima, Jun" <jun.nakajima@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGcm9tOiBSb2dlciBQYXUgTW9ubmUgW21haWx0bzpyb2dlci5wYXVAY2l0cml4LmNvbV0NCj4g
U2VudDogV2VkbmVzZGF5LCBKdWx5IDMsIDIwMTkgNzozMyBQTQ0KPiANCj4gRVBUIGRpZmZlcnMg
ZnJvbSBOUFQgYW5kIHNoYWRvdyB3aGVuIHRyYW5zbGF0aW5nIHBhZ2Ugb3JkZXJzIHRvIGxldmVs
cw0KPiBpbiB0aGUgcGh5c21hcCBwYWdlIHRhYmxlcy4gRVBUIHBhZ2UgdGFibGVzIGxldmVsIGZv
ciBvcmRlciAwIHBhZ2VzIGlzDQo+IDAsIHdoaWxlIE5QVCBhbmQgc2hhZG93IGluc3RlYWQgdXNl
IDEsIGllOiBFUFQgcGFnZSB0YWJsZXMgbGV2ZWxzDQo+IHN0YXJ0cyBhdCAwIHdoaWxlIE5QVCBh
bmQgc2hhZG93IHN0YXJ0cyBhdCAxLg0KPiANCj4gRml4IHRoZSBwMm1fZW50cnlfbW9kaWZ5IGNh
bGwgaW4gYXRvbWljX3dyaXRlX2VwdF9lbnRyeSB0byBhbHdheXMgYWRkDQo+IG9uZSB0byB0aGUg
bGV2ZWwsIGluIG9yZGVyIHRvIG1hdGNoIE5QVCBhbmQgc2hhZG93IHVzYWdlLg0KPiANCj4gV2hp
bGUgdGhlcmUgYWxzbyBhZGQgYSBjaGVjayB0byBlbnN1cmUgcDJtX2VudHJ5X21vZGlmeSBpcyBu
ZXZlcg0KPiBjYWxsZWQgd2l0aCBsZXZlbCA9PSAwLiBUaGF0IHNob3VsZCBhbGxvdyB0byBjYXRj
aCBmdXR1cmUgZXJyb3JzDQo+IHJlbGF0ZWQgdG8gdGhlIGxldmVsIHBhcmFtZXRlci4NCj4gDQo+
IEZpeGVzOiBjN2E0YzA4OGFkMWMgKCd4ODYvbW06IHNwbGl0IHAybSBpb3JlcSBzZXJ2ZXIgcGFn
ZXMgc3BlY2lhbCBoYW5kbGluZw0KPiBpbnRvIGhlbHBlcicpDQo+IFNpZ25lZC1vZmYtYnk6IFJv
Z2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KDQpSZXZpZXdlZC1ieTogS2V2
aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+DQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs

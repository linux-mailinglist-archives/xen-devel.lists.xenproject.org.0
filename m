Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5C99A5E5
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2019 05:07:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0zsH-0002SI-IM; Fri, 23 Aug 2019 03:04:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VL6j=WT=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1i0zsF-0002S8-UU
 for xen-devel@lists.xenproject.org; Fri, 23 Aug 2019 03:04:23 +0000
X-Inumbo-ID: b50ab4ec-c552-11e9-ade2-12813bfff9fa
Received: from mga14.intel.com (unknown [192.55.52.115])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b50ab4ec-c552-11e9-ade2-12813bfff9fa;
 Fri, 23 Aug 2019 03:04:23 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Aug 2019 20:04:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,419,1559545200"; d="scan'208";a="263061877"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by orsmga001.jf.intel.com with ESMTP; 22 Aug 2019 20:04:21 -0700
Received: from fmsmsx152.amr.corp.intel.com (10.18.125.5) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 22 Aug 2019 20:04:21 -0700
Received: from shsmsx105.ccr.corp.intel.com (10.239.4.158) by
 FMSMSX152.amr.corp.intel.com (10.18.125.5) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 22 Aug 2019 20:04:21 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.112]) by
 SHSMSX105.ccr.corp.intel.com ([169.254.11.15]) with mapi id 14.03.0439.000;
 Fri, 23 Aug 2019 11:04:18 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Paul Durrant <paul.durrant@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v6 07/10] use is_iommu_enabled() where appropriate...
Thread-Index: AQHVVFbe8lDXDXNLSEmA9lEVO315AKcIFh8Q
Date: Fri, 23 Aug 2019 03:04:18 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D5459E7@SHSMSX104.ccr.corp.intel.com>
References: <20190816172001.3905-1-paul.durrant@citrix.com>
 <20190816172001.3905-8-paul.durrant@citrix.com>
In-Reply-To: <20190816172001.3905-8-paul.durrant@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZGM0OTc3NzMtYWRiOC00MmQxLWI1ZDUtMzFhZmNkNmYxNTRkIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiVXpiZmE3RXdVc0ZlVlFyZFVNVjFsT01Kc1E2dHpRMVNlakFHaVdreEJKZ2dudVZaNU14a3VwQjE3Q1ZLVnFaUyJ9
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v6 07/10] use is_iommu_enabled() where
 appropriate...
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, "Nakajima,
 Jun" <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>, George
 Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Brian Woods <brian.woods@amd.com>, Julien Grall <julien.grall@arm.com>, Jan
 Beulich <jbeulich@suse.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGcm9tOiBQYXVsIER1cnJhbnQgW21haWx0bzpwYXVsLmR1cnJhbnRAY2l0cml4LmNvbV0NCj4g
U2VudDogU2F0dXJkYXksIEF1Z3VzdCAxNywgMjAxOSAxOjIwIEFNDQo+IA0KPiAuLi5yYXRoZXIg
dGhhbiB0ZXN0aW5nIHRoZSBnbG9iYWwgaW9tbXVfZW5hYmxlZCBmbGFnIGFuZCBvcHMgcG9pbnRl
ci4NCj4gDQo+IE5vdyB0aGF0IHRoZXJlIGlzIGEgcGVyLWRvbWFpbiBmbGFnIGluZGljYXRpbmcg
d2hldGhlciB0aGUgZG9tYWluIGlzDQo+IHBlcm1pdHRlZCB0byB1c2UgdGhlIElPTU1VICh3aGlj
aCBkZXRlcm1pbmVzIHdoZXRoZXIgdGhlIG9wcyBwb2ludGVyIHdpbGwNCj4gYmUgc2V0KSwgbWFu
eSB0ZXN0cyBvZiB0aGUgZ2xvYmFsIGlvbW11X2VuYWJsZWQgZmxhZyBhbmQgb3BzIHBvaW50ZXIg
Y2FuDQo+IGJlIHRyYW5zbGF0ZWQgaW50byB0ZXN0cyBvZiB0aGUgcGVyLWRvbWFpbiBmbGFnLiBT
b21lIG9mIHRoZSBvdGhlciB0ZXN0cyBvZg0KPiBwdXJlbHkgdGhlIGdsb2JhbCBpb21tdV9lbmFi
bGVkIGZsYWcgY2FuIGFsc28gYmUgdHJhbnNsYXRlZCBpbnRvIHRlc3RzIG9mDQo+IHRoZSBwZXIt
ZG9tYWluIGZsYWcuDQo+IA0KPiBOT1RFOiBUaGUgY29tbWVudCBpbiBpb21tdV9zaGFyZV9wMm1f
dGFibGUoKSBpcyBhbHNvIGZpeGVkOw0KPiBuZWVkX2lvbW11KCkNCj4gICAgICAgZGlzYXBwZWFy
ZWQgc29tZSB0aW1lIGFnby4gQWxzbywgd2hpbHN0IHRoZSBzdHlsZSBvZiB0aGUgJ2lmJyBpbg0K
PiAgICAgICBmbGFza19pb21tdV9yZXNvdXJjZV91c2VfcGVybSgpIGlzIGZpeGVkLCBJIGhhdmUg
bm90IHRyYW5zbGF0ZWQgYW55DQo+ICAgICAgIGluc3RhbmNlcyBvZiB1MzIgaW50byB1aW50MzJf
dCB0byBrZWVwIGNvbnNpc3RlbmN5LiBJTU8gc3VjaCBhDQo+ICAgICAgIHRyYW5zbGF0aW9uIHdv
dWxkIGJlIGJldHRlciBkb25lIGdsb2JhbGx5IGZvciB0aGUgc291cmNlIG1vZHVsZSBpbg0KPiAg
ICAgICBhIHNlcGFyYXRlIHBhdGNoLg0KPiAgICAgICBUaGUgY2hhbmdlIGluIHRoZSBpbml0aWFs
aXphdGlvbiBvZiB0aGUgJ2hkJyB2YXJpYWJsZSBpbiBpb21tdV9tYXAoKQ0KPiAgICAgICBhbmQg
aW9tbXVfdW5tYXAoKSBpcyBkb25lIHRvIGtlZXAgdGhlIFBWIHNoaW0gYnVpbGQgaGFwcHkuIFdp
dGhvdXQNCj4gICAgICAgdGhpcyBjaGFuZ2UgaXQgd2lsbCBmYWlsIHRvIGNvbXBpbGUgd2l0aCBl
cnJvcnMgb2YgdGhlIGZvcm06DQo+IA0KPiBpb21tdS5jOjM2MTozMjogZXJyb3I6IHVudXNlZCB2
YXJpYWJsZSDigJhoZOKAmSBbLVdlcnJvcj11bnVzZWQtdmFyaWFibGVdDQo+ICAgICAgY29uc3Qg
c3RydWN0IGRvbWFpbl9pb21tdSAqaGQgPSBkb21faW9tbXUoZCk7DQo+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBefg0KPiANCj4gU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJy
YW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEtldmluIFRpYW4g
PGtldmluLnRpYW5AaW50ZWwuY29tPg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==

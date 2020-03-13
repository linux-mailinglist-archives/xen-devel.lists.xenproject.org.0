Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B7D183F23
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2020 03:32:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCa4O-0002Ws-IN; Fri, 13 Mar 2020 02:29:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7gA4=46=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1jCa4M-0002Wn-Hm
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2020 02:29:02 +0000
X-Inumbo-ID: 65cb554c-64d2-11ea-b34e-bc764e2007e4
Received: from mga01.intel.com (unknown [192.55.52.88])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 65cb554c-64d2-11ea-b34e-bc764e2007e4;
 Fri, 13 Mar 2020 02:29:00 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Mar 2020 19:28:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,546,1574150400"; d="scan'208";a="266587233"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by fmsmga004.fm.intel.com with ESMTP; 12 Mar 2020 19:28:59 -0700
Received: from shsmsx152.ccr.corp.intel.com (10.239.6.52) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 12 Mar 2020 19:28:59 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.206]) by
 SHSMSX152.ccr.corp.intel.com ([169.254.6.155]) with mapi id 14.03.0439.000;
 Fri, 13 Mar 2020 10:28:56 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>
Thread-Topic: [PATCH v3] IOMMU: make DMA containment of quarantined devices
 optional
Thread-Index: AQHV9gMvA8DkILGx5UOf5iWNvNKXRqhBK2Cg///vUwCABLbNUA==
Date: Fri, 13 Mar 2020 02:28:55 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D7CD9FD@SHSMSX104.ccr.corp.intel.com>
References: <83253657-b3b4-a045-b829-f8f4c4aeae28@suse.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D7C5CDC@SHSMSX104.ccr.corp.intel.com>
 <2999c86a-328f-927e-6b53-895d2fd788f6@suse.com>
In-Reply-To: <2999c86a-328f-927e-6b53-895d2fd788f6@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiOTRhNDI3OGEtZTllYi00NjgwLTk4YzktZjNjNmU1Y2I0ODhkIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiVFwvNEVxKzNha01mbGhWWUdBem96ckEyMEczbFIxOVArcHExYjZ4VFI0U2ZZVG51TlwvWUZXeU9jSmhtc0Q0RlVjIn0=
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
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFR1ZXNkYXks
IE1hcmNoIDEwLCAyMDIwIDY6MjcgUE0NCj4gDQo+IE9uIDEwLjAzLjIwMjAgMDQ6NDMsIFRpYW4s
IEtldmluIHdyb3RlOg0KPiA+PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
DQo+ID4+IFNlbnQ6IE1vbmRheSwgTWFyY2ggOSwgMjAyMCA3OjA5IFBNDQo+ID4+DQo+ID4+IEkn
bSBoYXBweSB0byB0YWtlIGJldHRlciBzdWdnZXN0aW9ucyB0byByZXBsYWNlIHRoZSAiZnVsbCIg
Y29tbWFuZCBsaW5lDQo+ID4+IG9wdGlvbiBhbmQgS2NvbmZpZyBwcm9tcHQgdG9rZW5zLiBJIGRv
bid0IHRoaW5rIHRob3VnaCB0aGF0ICJmYXVsdCIgYW5kDQo+ID4+ICJ3cml0ZS1mYXVsdCIgYXJl
IHJlYWxseSBzdWl0YWJsZSB0aGVyZS4NCj4gPg0KPiA+IEkgdGhpbmsgd2UgbWF5IGp1c3QgYWxs
b3cgYm90aCByL3cgYWNjZXNzIHRvIHNjcmF0Y2ggcGFnZSBmb3Igc3VjaCBib2d1cw0KPiA+IGRl
dmljZSwgd2hpY2ggbWF5IG1ha2UgJ2Z1bGwnIG1vcmUgcmVhc29uYWJsZSBzaW5jZSB3ZSBub3cg
ZnVsbHkNCj4gPiBjb250YWluIGluLWZseSBETUFzLiBJJ20gbm90IHN1cmUgYWJvdXQgdGhlIHZh
bHVlIG9mIGtlZXBpbmcgd3JpdGUtZmF1bHQNCj4gPiBhbG9uZSBmb3Igc3VjaCBkZXZpY2VzIChq
dXN0IGJlY2F1c2Ugb25lIG9ic2VydmVkIGhpcyBzcGVjaWZpYyBkZXZpY2Ugb25seQ0KPiA+IGhh
cyBwcm9ibGVtIHdpdGggcmVhZC1mYXVsdCkuDQo+IA0KPiBXZWxsLCBhIGZ1bmRhbWVudGFsIHBy
b2JsZW0gSSBoYXZlIGhlcmUgaXMgdGhhdCBJIHN0aWxsIGRvbid0IGtub3cNCj4gdGhlIF9leGFj
dF8gY29uZGl0aW9ucyBmb3IgdGhlIG9ic2VydmVkIGhhbmdzLiBJIGNvbnNpZGVyIGl0IHVubGlr
ZWx5DQo+IGZvciBJT01NVSByZWFkIGZhdWx0cyB0byBjYXVzZSBoYW5ncywgYnV0IGZvciB3cml0
ZSBmYXVsdHMgdG8gYmUNCj4gImZpbmUiLiBJdCB3b3VsZCBzZWVtIG1vcmUgbGlrZWx5IHRvIG1l
IHRoYXQgZS5nLiBhIG5vbi1wcmVzZW50DQo+IGNvbnRleHQgZW50cnkgbWlnaHQgY2F1c2UgaXNz
dWVzLiBJZiB0aGF0IHdhcyB0aGUgY2FzZSwgd2Ugd291bGRuJ3QNCj4gbmVlZCB0byBoYW5kbGUg
cmVhZHMgYW5kIHdyaXRlcyBkaWZmZXJlbnRseTsgd2UgY291bGQgaW5zdGVhZCBpbnN0YWxsDQo+
IGFuIGFsbCB6ZXJvIHRvcCBsZXZlbCBwYWdlIHRhYmxlLiBBbmQgd2UnZCBzdGlsbCBnZXQgYWxs
IGZhdWx0cyB0aGF0DQo+IGFyZSBzdXBwb3NlZCB0byBzdXJmYWNlLiBCdXQgcGVyaGFwcyBQYXVs
IGRpZCB0cnkgdGhpcyBiYWNrIHRoZW4sIGFuZA0KPiBpdCB0dXJuZWQgb3V0IHRvIG5vdCBiZSBh
biBvcHRpb24uDQo+IA0KPiBUaGUgY2hvaWNlIG9mIGxldHRpbmcgd3JpdGVzIGNvbnRpbnVlIHRv
IGZhdWx0IHdhcyBiYXNlZCBvbiAoYSkgdGhpcw0KPiBoYXZpbmcgYmVlbiB0ZXN0ZWQgdG8gd29y
ayBvbiB0aGUgYWZmZWN0ZWQgc3lzdGVtKHMpIGFuZCAoYikgYWxzbw0KPiBsZXR0aW5nIHdyaXRl
cyBnbyB0byBhIHNjcmF0Y2ggcGFnZSByZXF1aXJpbmcgYSBwZXItZGV2aWNlIHNjcmF0Y2gNCj4g
cGFnZSAoYW5kIGFzc29jaWF0ZWQgcGFnZSB0YWJsZXMpIHJhdGhlciB0aGFuIGEgc3lzdGVtLXdp
ZGUgb25lLCBhcw0KPiBkZXZpY2VzIGNvbWluZyBmcm9tIGRpZmZlcmVudCBkb21haW5zIHdvdWxk
IG90aGVyd2lzZSBiZSBhYmxlIHRvDQo+IG9ic2VydmUgZGF0YSB3cml0dGVuIHRvIG1lbW9yeSBi
eSByZXNwZWN0aXZlbHkgImZvcmVpZ24iIGRldmljZXMNCj4gKGFuZCBoZW5jZSBkb21haW5zKS4N
Cg0Kb2ssIGl0IGlzIGEgdmFsaWQgcG9pbnQuDQoNCj4gDQo+IEJ1dCB0aGlzIGlzIGFsbCBndWVz
c3dvcmsgd2l0aG91dCB0aGUgZmlybXdhcmUgd3JpdGVycyBvZiBhZmZlY3RlZA0KPiBzeXN0ZW1z
IGdpdmluZyB1cyBhdCBsZWFzdCBzb21lIGhpbnRzLg0KPiANCj4gPiBhbHRlcm5hdGl2ZWx5IEkg
YWxzbyB0aG91Z2h0IGFib3V0IHdoZXRoZXIgd2hpdGVsaXN0aW5nIHRoZSBwcm9ibGVtYXRpYw0K
PiA+IGRldmljZXMgdGhyb3VnaCBhbm90aGVyIG9wdGlvbiAoZS5nLiBub2ZhdWx0PWI6ZDpmKSBj
b3VsZCBwcm92aWRlIG1vcmUNCj4gPiB2YWx1ZS4gSW4gY29uY2VwdCBhbnkgSU9NTVUgcGFnZSB0
YWJsZSAoZG9tMCwgZG9tX2lvIG9yIGRvbVUpDQo+ID4gZm9yIHN1Y2ggYm9ndXMgZGV2aWNlIHNo
b3VsZCBub3QgaW5jbHVkZSBpbnZhbGlkIGVudHJ5LCBldmVuIHdoZW4NCj4gPiBxdWFyYW50aW5l
IGlzIG5vdCBzcGVjaWZpZWQuIEhvd2V2ZXIgSSdtIG5vdCBzdXJlIHdoZXRoZXIgaXQncyB3b3J0
aHkgb2YNCj4gPiBnb2luZyBzbyBmYXIuLi4NCj4gDQo+IEluZGVlZC4gUXVlc3Rpb24gdGhvdWdo
IGlzIHdoZXRoZXIgdGhpcyBiYWQgYmVoYXZpb3IgaXMgZGV2aWNlIHNwZWNpZmljDQo+IChyYXRo
ZXIgdGhhbiBlLmcuIHN5c3RlbSBkZXBlbmRlbnQpLiBQbHVzIC0gYXMgcGVyIGFib3ZlIC0gcXVl
c3Rpb24NCj4gYWxzbyBpcyB3aGV0aGVyIGl0J3MgcmVhbGx5IGxlYWYgKG9yIGludGVybWVkaWF0
ZSkgcGFnZSB0YWJsZSBlbnRyeQ0KPiBwcmVzZW5jZSB3aGljaCBhY3R1YWxseSBtYXR0ZXJzIGhl
cmUuIElmIGl0IHdhcywgSSBhZ3JlZSB3ZSBzaG91bGRuJ3QNCj4gaGF2ZSBhbnkgbm9uLXByZXNl
bnQgZW50cmllcyBhbnl3aGVyZSBpbiB0aGUgcGFnZSB0YWJsZSB0cmVlcy4NCj4gDQo+IEphbg0K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

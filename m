Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1ADBDAE5
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 11:25:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD3VM-0004IX-28; Wed, 25 Sep 2019 09:22:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=R6jh=XU=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1iD3VL-0004IR-Am
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 09:22:35 +0000
X-Inumbo-ID: 01a77f32-df76-11e9-97fb-bc764e2007e4
Received: from mga01.intel.com (unknown [192.55.52.88])
 by localhost (Halon) with ESMTPS
 id 01a77f32-df76-11e9-97fb-bc764e2007e4;
 Wed, 25 Sep 2019 09:22:34 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Sep 2019 02:22:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,547,1559545200"; d="scan'208";a="218926532"
Received: from fmsmsx104.amr.corp.intel.com ([10.18.124.202])
 by fmsmga002.fm.intel.com with ESMTP; 25 Sep 2019 02:22:33 -0700
Received: from shsmsx101.ccr.corp.intel.com (10.239.4.153) by
 fmsmsx104.amr.corp.intel.com (10.18.124.202) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 25 Sep 2019 02:22:33 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.32]) by
 SHSMSX101.ccr.corp.intel.com ([169.254.1.92]) with mapi id 14.03.0439.000;
 Wed, 25 Sep 2019 17:22:31 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul.durrant@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v11.1 3/6] sysctl / libxl: report whether IOMMU/HAP
 page table sharing is supported
Thread-Index: AQHVaiPZygk0OOpfkkKs0SPOiivAK6c8MSXw
Date: Wed, 25 Sep 2019 09:22:30 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D58F8EE@SHSMSX104.ccr.corp.intel.com>
References: <20190913105826.2704-1-paul.durrant@citrix.com>
 <20190913105826.2704-4-paul.durrant@citrix.com>
 <e79beeb5-7288-c8fd-8823-feaf8d4e7e77@suse.com>
In-Reply-To: <e79beeb5-7288-c8fd-8823-feaf8d4e7e77@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNGNiOTIyYjItY2U1ZS00YTJjLWE5NDItNGE3MTg2Njg4ODRlIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiSzI3S0M2dWNNY21IcnBVUENvUk1zMmllbXhKbERDYmtqTFQ2cW5iVTBcL1NGQWh0UG5BSHJpTnFkOFA3bURwNzMifQ==
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v11.1 3/6] sysctl / libxl: report whether
 IOMMU/HAP page table sharing is supported
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Ian
 Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 Christian Lindig <christian.lindig@citrix.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 David Scott <dave@recoil.org>, Anthony PERARD <anthony.perard@citrix.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGcm9tOiBKYW4gQmV1bGljaCBbbWFpbHRvOmpiZXVsaWNoQHN1c2UuY29tXQ0KPiBTZW50OiBG
cmlkYXksIFNlcHRlbWJlciAxMywgMjAxOSA3OjEwIFBNDQo+IA0KPiBUaGlzIHBhdGNoIGRlZmlu
ZXMgYSBuZXcgYml0IHJlcG9ydGVkIGluIHRoZSBod19jYXAgZmllbGQgb2Ygc3RydWN0DQo+IHhl
bl9zeXNjdGxfcGh5c2luZm8gdG8gaW5kaWNhdGUgd2hldGhlciB0aGUgcGxhdGZvcm0gc3VwcG9y
dHMgc2hhcmluZyBvZg0KPiBIQVAgcGFnZSB0YWJsZXMgKGkuZS4gdGhlIFAyTSkgd2l0aCB0aGUg
SU9NTVUuIFRoaXMgaW5mb3JtcyB0aGUgdG9vbHN0YWNrDQo+IHdoZXRoZXIgdGhlIGRvbWFpbiBu
ZWVkcyBleHRyYSBtZW1vcnkgdG8gc3RvcmUgZGlzY3JldGUgSU9NTVUgcGFnZQ0KPiB0YWJsZXMN
Cj4gb3Igbm90Lg0KPiANCj4gTk9URTogVGhpcyBwYXRjaCBtYWtlcyBzdXJlIGlvbW11X2hhcF9w
dF9zaGFyZWQgaXMgY2xlYXIgaWYgSEFQIGlzIG5vdA0KPiAgICAgICBzdXBwb3J0ZWQgb3IgdGhl
IElPTU1VIGlzIGRpc2FibGVkLCBhbmQgZGVmaW5lcyBpdCB0byBmYWxzZSBpZg0KPiAgICAgICAh
Q09ORklHX0hWTS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJy
YW50QGNpdHJpeC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBz
dXNlLmNvbT4NCj4gQWNrZWQtYnk6IENocmlzdGlhbiBMaW5kaWcgPGNocmlzdGlhbi5saW5kaWdA
Y2l0cml4LmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwu
Y29tPg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

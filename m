Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7710717EDF2
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2020 02:21:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBTY4-0002JA-Te; Tue, 10 Mar 2020 01:19:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pT5j=43=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1jBTY3-0002J5-36
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2020 01:19:07 +0000
X-Inumbo-ID: 21d64b9c-626d-11ea-acd6-12813bfff9fa
Received: from mga11.intel.com (unknown [192.55.52.93])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 21d64b9c-626d-11ea-acd6-12813bfff9fa;
 Tue, 10 Mar 2020 01:19:05 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Mar 2020 18:19:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,535,1574150400"; d="scan'208";a="231133742"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by orsmga007.jf.intel.com with ESMTP; 09 Mar 2020 18:19:03 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 9 Mar 2020 18:19:03 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 9 Mar 2020 18:19:03 -0700
Received: from shsmsx101.ccr.corp.intel.com (10.239.4.153) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 9 Mar 2020 18:19:03 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.206]) by
 SHSMSX101.ccr.corp.intel.com ([169.254.1.43]) with mapi id 14.03.0439.000;
 Tue, 10 Mar 2020 09:19:01 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2 0/5] IOMMU: restrict visibility/scope if certain
 variables
Thread-Index: AQHV9f8P+x34fEVLG0yk97oibnw9HahBB5QQ
Date: Tue, 10 Mar 2020 01:19:01 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D7C5A69@SHSMSX104.ccr.corp.intel.com>
References: <a8fc7299-4632-b32a-939d-b2e8354cf296@suse.com>
In-Reply-To: <a8fc7299-4632-b32a-939d-b2e8354cf296@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiOGUzM2NhZTMtMGFkZC00YWI1LTg3MTgtNWM4ZjRiMTNmMzI1IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiYXJDT2IzalNDSlJWOGFEaDZRVUFZYnFZb2FyeVc2NklLV09vM1wvWmFheEJ5NU5wSWF4RzBLb0NmU0lmV1pWaFYifQ==
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 0/5] IOMMU: restrict visibility/scope if
 certain variables
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IE1vbmRheSwg
TWFyY2ggOSwgMjAyMCA2OjQwIFBNDQo+IA0KPiBBIG51bWJlciBvZiB0aGUgY29tbWFuZCBsaW5l
IGNvbnRyb2xsZWQgdmFyaWFibGVzIGFyZSB4ODYtDQo+IG9yIGV2ZW4geDg2LUhWTS1zcGVjaWZp
Yy4gRG9uJ3QgaGF2ZSB0aG9zZSB2YXJpYWJsZXMgZWxzZXdoZXJlDQo+IGluIHRoZSBmaXJzdCBw
bGFjZSAoaW4gc29tZSBjYXNlcyByZXBsYWNlIHRoZW0gYnkgYSAjZGVmaW5lKSwNCj4gYW5kIGFz
IGEgcmVzdWx0IGFsc28gZG9uJ3Qgc2lsZW50bHkgYWNjZXB0IHN1Y2ggImlvbW11PSINCj4gc3Vi
LW9wdGlvbnMgd2hpY2ggaW4gZmFjdCBoYXZlIG5vIGVmZmVjdC4NCj4gDQo+IDE6IGlvbW11X2lu
dHJlbWFwIGlzIHg4Ni1vbmx5DQo+IDI6IGlvbW11X2ludHBvc3QgaXMgeDg2L0hWTS1vbmx5DQo+
IDM6IGlvbW11X2lnZnggaXMgeDg2LW9ubHkNCj4gNDogaW9tbXVfcWludmFsIGlzIHg4Ni1vbmx5
DQo+IDU6IGlvbW11X3Nub29wIGlzIHg4Ni1vbmx5DQo+IA0KPiBUaGUgc2VyaWVzIGNvbnRleHR1
YWxseSBkZXBlbmRzIG9uICJBTUQvSU9NTVU6IHdpdGhvdXQgWFQsDQo+IHgyQVBJQyBuZWVkcyB0
byBiZSBmb3JjZWQgaW50byBwaHlzaWNhbCBtb2RlIg0KPiANCj4gdjIgYWRkcmVzc2VzIHJldmll
dyBjb21tZW50cywgYXQgbGVhc3QgYXMgZmFyIGFzIGFncmVlbWVudCB3YXMNCj4gcmVhY2hlZC4g
U2VlIGluZGl2aWR1YWwgcGF0Y2hlcy4NCj4gDQoNClJldmlld2VkLWJ5OiBLZXZpbiBUaWFuIDxr
ZXZpbi50aWFuQGludGVsLmNvbT4gZm9yIHRoZSB3aG9sZQ0Kc2VyaWVzLiANCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0095A98CE
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2019 05:13:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5iBK-0006Eq-Kj; Thu, 05 Sep 2019 03:11:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/IXJ=XA=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1i5iBI-0006Eg-SC
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 03:11:32 +0000
X-Inumbo-ID: dc0e23d4-cf8a-11e9-abbf-12813bfff9fa
Received: from mga17.intel.com (unknown [192.55.52.151])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dc0e23d4-cf8a-11e9-abbf-12813bfff9fa;
 Thu, 05 Sep 2019 03:11:32 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Sep 2019 20:11:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,469,1559545200"; d="scan'208";a="194945366"
Received: from fmsmsx108.amr.corp.intel.com ([10.18.124.206])
 by orsmga002.jf.intel.com with ESMTP; 04 Sep 2019 20:11:31 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 FMSMSX108.amr.corp.intel.com (10.18.124.206) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 4 Sep 2019 20:11:30 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 4 Sep 2019 20:11:30 -0700
Received: from shsmsx106.ccr.corp.intel.com (10.239.4.159) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 4 Sep 2019 20:11:30 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.32]) by
 SHSMSX106.ccr.corp.intel.com ([169.254.10.86]) with mapi id 14.03.0439.000;
 Thu, 5 Sep 2019 11:11:28 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH 3/3] VT-d/ATS: tidy device_in_domain()
Thread-Index: AQHVYySZ0qY6FqyfMUi47awDnOKUAKccaGsw
Date: Thu, 5 Sep 2019 03:11:28 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D563C13@SHSMSX104.ccr.corp.intel.com>
References: <050de29e-5a10-8b4a-44f1-0241f4b33ee2@suse.com>
 <959e3395-4637-6e9b-74dc-9982acf10dec@suse.com>
In-Reply-To: <959e3395-4637-6e9b-74dc-9982acf10dec@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiODk5ZDE4OWMtZjAxZS00MjAwLTk5NjEtNWFkMmI0NzY4YmY0IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiNmtDU25CYWF5dkdXRlVOQnFObWlROFV5RG5wVk5zTDVTWWZ6VFg2UHUwTWFaS0pJcnFzXC9JQU1kVFcwOXY3VlkifQ==
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 3/3] VT-d/ATS: tidy device_in_domain()
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGcm9tOiBKYW4gQmV1bGljaCBbbWFpbHRvOmpiZXVsaWNoQHN1c2UuY29tXQ0KPiBTZW50OiBX
ZWRuZXNkYXksIFNlcHRlbWJlciA0LCAyMDE5IDk6MjggUE0NCj4gDQo+IFVzZSBhcHByb3ByaWF0
ZSB0eXBlcy4gRHJvcCB1bm5lY2Vzc2FyeSBjYXN0cy4gQ2hlY2sgZm9yIGZhaWx1cmVzIHdoaWNo
DQo+IGNhbiAoYXQgbGVhc3QgaW4gdGhlb3J5IGJlY2F1c2Ugb2Ygbm9uLW9idmlvdXMgYnJlYWth
Z2UgZWxzZXdoZXJlKQ0KPiBvY2N1ciwgaW5zdGVhZCBvZiBvbmVzIHdoaWNoIHJlYWxseSBjYW4n
dCAobWFwX2RvbWFpbl9wYWdlKCkgd29uJ3QNCj4gcmV0dXJuIE5VTEwpLg0KPiANCj4gU2lnbmVk
LW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiANCg0KUmV2aWV3ZWQt
Ynk6IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPg0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

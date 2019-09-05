Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD77A98BE
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2019 05:08:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5i5U-0005Li-Kq; Thu, 05 Sep 2019 03:05:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/IXJ=XA=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1i5i5S-0005LZ-KB
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 03:05:30 +0000
X-Inumbo-ID: 04379972-cf8a-11e9-abbf-12813bfff9fa
Received: from mga09.intel.com (unknown [134.134.136.24])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 04379972-cf8a-11e9-abbf-12813bfff9fa;
 Thu, 05 Sep 2019 03:05:30 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Sep 2019 20:05:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,469,1559545200"; d="scan'208";a="207709173"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by fmsmga004.fm.intel.com with ESMTP; 04 Sep 2019 20:05:28 -0700
Received: from shsmsx107.ccr.corp.intel.com (10.239.4.96) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 4 Sep 2019 20:05:28 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.32]) by
 SHSMSX107.ccr.corp.intel.com ([169.254.9.89]) with mapi id 14.03.0439.000;
 Thu, 5 Sep 2019 11:05:26 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH 1/3] VT-d: tidy <X>_to_<Y>() functions
Thread-Index: AQHVYySFGxPdyLArw0C4k30XY5WUEKccZr7w
Date: Thu, 5 Sep 2019 03:05:26 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D563BCC@SHSMSX104.ccr.corp.intel.com>
References: <050de29e-5a10-8b4a-44f1-0241f4b33ee2@suse.com>
 <ecd1419b-bbf5-9e18-0685-600713cb1617@suse.com>
In-Reply-To: <ecd1419b-bbf5-9e18-0685-600713cb1617@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNDgxZTQxZDQtN2IxZi00NzM5LWIxNDItMzM5YjYzZTY2YWUwIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiVlVzSDhlOGFMVmpScVVUWGVUcTd4Um9OUkRpdkNyRGJHN3BZYlErOXRVU2ZQaFhsUDhTVFwvU2FZbnp3dnZTSTkifQ==
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 1/3] VT-d: tidy <X>_to_<Y>() functions
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
ZWRuZXNkYXksIFNlcHRlbWJlciA0LCAyMDE5IDk6MjcgUE0NCj4gDQo+IERyb3AgaW9tbXVfdG9f
ZHJoZCgpIGFsdG9nZXRoZXIgLSB0aGVyZSdzIG5vIG5lZWQgZm9yIGEgbG9vcCBoZXJlLCB0aGUN
Cj4gY29ycmVzcG9uZGluZyBEUkhEIGlzIGEgZmllbGQgaW4gc3RydWN0IGludGVsX2lvbW11Lg0K
PiANCj4gQ29uc3RpZnkgZHJoZF90b19yaHNhKCkncyBwYXJhbWV0ZXIgYW5kIGFkanVzdCBzdHls
ZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4N
Cj4gDQoNClJldmlld2VkLWJ5OiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4NCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

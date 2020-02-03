Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F379615017E
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 06:38:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyUPI-00056E-Ia; Mon, 03 Feb 2020 05:36:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=l9SF=3X=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1iyUPG-000569-Tp
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 05:36:22 +0000
X-Inumbo-ID: 1c2a81ab-4647-11ea-8e23-12813bfff9fa
Received: from mga09.intel.com (unknown [134.134.136.24])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1c2a81ab-4647-11ea-8e23-12813bfff9fa;
 Mon, 03 Feb 2020 05:36:22 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Feb 2020 21:36:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,396,1574150400"; d="scan'208";a="253947132"
Received: from fmsmsx108.amr.corp.intel.com ([10.18.124.206])
 by fmsmga004.fm.intel.com with ESMTP; 02 Feb 2020 21:36:20 -0800
Received: from fmsmsx156.amr.corp.intel.com (10.18.116.74) by
 FMSMSX108.amr.corp.intel.com (10.18.124.206) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Sun, 2 Feb 2020 21:36:21 -0800
Received: from shsmsx105.ccr.corp.intel.com (10.239.4.158) by
 fmsmsx156.amr.corp.intel.com (10.18.116.74) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Sun, 2 Feb 2020 21:36:20 -0800
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.5]) by
 SHSMSX105.ccr.corp.intel.com ([169.254.11.138]) with mapi id 14.03.0439.000;
 Mon, 3 Feb 2020 13:36:18 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2] x86/EPT: drop redundant ept_p2m_type_to_flags()
 parameters
Thread-Index: AQHV0TH8iCc6rdi3YUuBgYuIICi/76gJBRZQ
Date: Mon, 3 Feb 2020 05:36:17 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D75E5E4@SHSMSX104.ccr.corp.intel.com>
References: <f8a610c6-b128-7d3b-09db-e3b7cfe710ad@suse.com>
In-Reply-To: <f8a610c6-b128-7d3b-09db-e3b7cfe710ad@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMDYwZWRmY2YtYmU2Yy00N2Y0LWEyZDAtY2QzNjk1MDc4OTMxIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiY21pV2diYTYycmNSc1ZoaDE0aDRMR1dQSjMxTWxyRmUxTXRsQXRFMEtEcHNcL2lLa1N2bzVKS1wvZUl5TXlvUHBWIn0=
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2] x86/EPT: drop redundant
 ept_p2m_type_to_flags() parameters
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, "Nakajima,
 Jun" <jun.nakajima@intel.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFdlZG5lc2Rh
eSwgSmFudWFyeSAyMiwgMjAyMCAxMDo0MSBQTQ0KPiANCj4gQWxsIGNhbGxlcnMgc2V0IHRoZSBy
ZXNwZWN0aXZlIGZpZWxkcyBpbiB0aGUgZW50cnkgYmVpbmcgdXBkYXRlZCBiZWZvcmUNCj4gdGhl
IGNhbGwuDQo+IA0KPiBUYWtlIHRoZSBvcHBvcnR1bml0eSBhbmQgYWxzbyBjb25zdGlmeSB0aGUg
Zmlyc3QgcGFyYW1ldGVyIGFzIHdlbGwgYXMNCj4gbWFrZSBhIGZldyBzdHlsZSBhZGp1c3RtZW50
cy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4N
Cg0KUmV2aWV3ZWQtYnk6IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPg0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

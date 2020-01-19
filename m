Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48474141B7E
	for <lists+xen-devel@lfdr.de>; Sun, 19 Jan 2020 04:19:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1it14W-0007SD-Fu; Sun, 19 Jan 2020 03:16:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nxl7=3I=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1it14V-0007S5-6T
 for xen-devel@lists.xenproject.org; Sun, 19 Jan 2020 03:16:19 +0000
X-Inumbo-ID: 0e68608e-3a6a-11ea-9fd7-bc764e2007e4
Received: from mga01.intel.com (unknown [192.55.52.88])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0e68608e-3a6a-11ea-9fd7-bc764e2007e4;
 Sun, 19 Jan 2020 03:16:17 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Jan 2020 19:16:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,336,1574150400"; d="scan'208";a="269409568"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by fmsmga001.fm.intel.com with ESMTP; 18 Jan 2020 19:16:16 -0800
Received: from fmsmsx116.amr.corp.intel.com (10.18.116.20) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Sat, 18 Jan 2020 19:16:16 -0800
Received: from shsmsx107.ccr.corp.intel.com (10.239.4.96) by
 fmsmsx116.amr.corp.intel.com (10.18.116.20) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Sat, 18 Jan 2020 19:16:16 -0800
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.197]) by
 SHSMSX107.ccr.corp.intel.com ([169.254.9.210]) with mapi id 14.03.0439.000;
 Sun, 19 Jan 2020 11:16:13 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH 2/2] VT-d: adjust log messages in
 domain_context_mapping_one()
Thread-Index: AQHVxS1wKNKcVc1HW0ixKROID/LFuafxYy2Q
Date: Sun, 19 Jan 2020 03:16:12 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D739B18@SHSMSX104.ccr.corp.intel.com>
References: <f0fd3167-9702-39f0-0222-03bbcafb3093@suse.com>
 <2fe65299-a651-d645-3b31-58e1527614e2@suse.com>
In-Reply-To: <2fe65299-a651-d645-3b31-58e1527614e2@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMGFlMTdmMzMtNDNiYi00ZTA1LWFmOTktOTdhOTkwMGQ0MTI4IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiQmFJK24xRHZ1N2VETU5VM1VDcDc4R2tuQlwvd00za2pwbWhVSFVkZUFrUnc0ZWYxN2FrdjNqRTNqQUZmbXVQcmUifQ==
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 2/2] VT-d: adjust log messages in
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
IEphbnVhcnkgNywgMjAyMCAzOjM4IFBNDQo+IA0KPiBBZGQgbWlzc2luZyBuZXdsaW5lcywgdXNl
ICVwZCwgYW5kIGRyb3AgZXhjbGFtYXRpb24gbWFya3MuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQoNClJldmlld2VkLWJ5OiBLZXZpbiBUaWFu
IDxrZXZpbi50aWFuQGludGVsLmNvbT4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=

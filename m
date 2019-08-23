Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 600EF9A5AA
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2019 04:41:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0zT8-0007um-Mj; Fri, 23 Aug 2019 02:38:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VL6j=WT=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1i0zT7-0007ue-8w
 for xen-devel@lists.xenproject.org; Fri, 23 Aug 2019 02:38:25 +0000
X-Inumbo-ID: 12ebb0a6-c54f-11e9-8980-bc764e2007e4
Received: from mga18.intel.com (unknown [134.134.136.126])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 12ebb0a6-c54f-11e9-8980-bc764e2007e4;
 Fri, 23 Aug 2019 02:38:22 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Aug 2019 19:38:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,419,1559545200"; d="scan'208";a="378728802"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
 by fmsmga005.fm.intel.com with ESMTP; 22 Aug 2019 19:38:21 -0700
Received: from FMSMSX110.amr.corp.intel.com (10.18.116.10) by
 FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 22 Aug 2019 19:38:21 -0700
Received: from shsmsx151.ccr.corp.intel.com (10.239.6.50) by
 fmsmsx110.amr.corp.intel.com (10.18.116.10) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 22 Aug 2019 19:38:21 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.112]) by
 SHSMSX151.ccr.corp.intel.com ([169.254.3.250]) with mapi id 14.03.0439.000;
 Fri, 23 Aug 2019 10:38:18 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2 1/2] x86: define a few selector values
Thread-Index: AQHVTp6q1hhNuiBAdEe5idRs1T8cX6cIGkgw
Date: Fri, 23 Aug 2019 02:38:17 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D545952@SHSMSX104.ccr.corp.intel.com>
References: <a9651ce7-bdd2-ac6d-6670-0abbe4442b14@suse.com>
 <5c94e6ba-acd0-ac20-bbf0-187a2e3d0988@suse.com>
In-Reply-To: <5c94e6ba-acd0-ac20-bbf0-187a2e3d0988@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiYjMwZDkxZTQtYzM4Ny00MjEwLTk3MGQtM2Q2Y2VmZGQyNGU3IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiKzNSWm5WOFloMTJsbTc2UEJzb0FwYkNJeEdiUzVHNXRaTGk0WkRuNVBMeERtbm1hNENKcEhvTE5zN3BScmRTTCJ9
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 1/2] x86: define a few selector values
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
Cc: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, "Nakajima,
 Jun" <jun.nakajima@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Brian Woods <brian.woods@amd.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGcm9tOiBKYW4gQmV1bGljaCBbbWFpbHRvOmpiZXVsaWNoQHN1c2UuY29tXQ0KPiBTZW50OiBG
cmlkYXksIEF1Z3VzdCA5LCAyMDE5IDY6MzkgUE0NCj4gDQo+IFRTUywgTERULCBhbmQgcGVyLUNQ
VSBlbnRyaWVzIGFsbCBjYW4gYmVuZWZpdCBhIGxpdHRsZSBmcm9tIGFsc28gaGF2aW5nDQo+IHRo
ZWlyIHNlbGVjdG9yIHZhbHVlcyBkZWZpbmVkLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KDQpSZXZpZXdlZC1ieTogS2V2aW4gVGlhbiA8a2V2
aW4udGlhbkBpbnRlbC5jb20+DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8791085FAD
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 12:32:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvffS-0001ER-Vc; Thu, 08 Aug 2019 10:29:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mVC3=WE=intel.com=chen.zhang@srs-us1.protection.inumbo.net>)
 id 1hvffR-0001EG-LS
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 10:29:09 +0000
X-Inumbo-ID: 592d51d4-b9c7-11e9-a4cc-179277089b69
Received: from mga17.intel.com (unknown [192.55.52.151])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 592d51d4-b9c7-11e9-a4cc-179277089b69;
 Thu, 08 Aug 2019 10:29:06 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Aug 2019 03:29:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,360,1559545200"; d="scan'208";a="199003777"
Received: from fmsmsx104.amr.corp.intel.com ([10.18.124.202])
 by fmsmga004.fm.intel.com with ESMTP; 08 Aug 2019 03:29:04 -0700
Received: from FMSMSX110.amr.corp.intel.com (10.18.116.10) by
 fmsmsx104.amr.corp.intel.com (10.18.124.202) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 8 Aug 2019 03:29:04 -0700
Received: from shsmsx104.ccr.corp.intel.com (10.239.4.70) by
 fmsmsx110.amr.corp.intel.com (10.18.116.10) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 8 Aug 2019 03:29:04 -0700
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.19]) by
 SHSMSX104.ccr.corp.intel.com ([169.254.5.112]) with mapi id 14.03.0439.000;
 Thu, 8 Aug 2019 18:29:02 +0800
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Thread-Topic: [PATCH V4] tools/libxl: Add iothread support for COLO
Thread-Index: AQHVQ8++Fob6VCf4FUeUJ+C5B5nFJabwnr/Q///lKACAAJyKEA==
Date: Thu, 8 Aug 2019 10:29:01 +0000
Message-ID: <9CFF81C0F6B98A43A459C9EDAD400D78062106A4@shsmsx102.ccr.corp.intel.com>
References: <20190726162723.7443-1-chen.zhang@intel.com>
 <9CFF81C0F6B98A43A459C9EDAD400D780620FC72@shsmsx102.ccr.corp.intel.com>
 <20190808090818.GP1242@perard.uk.xensource.com>
In-Reply-To: <20190808090818.GP1242@perard.uk.xensource.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiYjg4YmUwOTMtOTU1Mi00ODJjLTkwNWItNWEzNjIxZWRiMzlkIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoid1JUQ01tZ1F6RGYwQkVRclNXZmlrNHdHUVwvTVdIUU5td1U3SzVtaU1zQ20zaUx1QVc2V1wvRmN2NDh4WnJiR0FpIn0=
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH V4] tools/libxl: Add iothread support for
 COLO
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Zhang Chen <zhangckid@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhhbmsgeW91IEFudGhvbnkgUEVSQVJELgoKVGhhbmtzClpoYW5nIENoZW4KCgo+IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tCj4gRnJvbTogQW50aG9ueSBQRVJBUkQgW21haWx0bzphbnRob255
LnBlcmFyZEBjaXRyaXguY29tXQo+IFNlbnQ6IFRodXJzZGF5LCBBdWd1c3QgOCwgMjAxOSA1OjA4
IFBNCj4gVG86IFpoYW5nLCBDaGVuIDxjaGVuLnpoYW5nQGludGVsLmNvbT4KPiBDYzogSWFuIEph
Y2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsg
eGVuLQo+IGRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBaaGFuZyBDaGVuIDx6aGFuZ2NraWRA
Z21haWwuY29tPgo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggVjRdIHRvb2xzL2xpYnhsOiBBZGQgaW90
aHJlYWQgc3VwcG9ydCBmb3IgQ09MTwo+IAo+IE9uIFRodSwgQXVnIDA4LCAyMDE5IGF0IDAyOjQ0
OjQyQU0gKzAwMDAsIFpoYW5nLCBDaGVuIHdyb3RlOgo+ID4gUGluZy4uLgo+ID4gQW55IGNvbW1l
bnRzPwo+IAo+IEZvciB5b3VyIGluZm9ybWF0aW9uLCB0aGF0IHBhdGNoIGhhdmUgYmVlbiBwdXNo
ZWQsIHNlZSBjb21taXQKPiAxNzRkYjI4YmI4MjNlOGM5OGMzMTlmZGJkYzZkNGNiZTEwNTBiYTE0
IDstKQo+IAo+IENoZWVycywKPiAKPiAtLQo+IEFudGhvbnkgUEVSQVJECgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

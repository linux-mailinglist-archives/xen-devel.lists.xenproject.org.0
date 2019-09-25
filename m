Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D5CBDAD8
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 11:23:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD3TU-000487-Hy; Wed, 25 Sep 2019 09:20:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=R6jh=XU=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1iD3TS-00047p-Dv
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 09:20:38 +0000
X-Inumbo-ID: baf2330c-df75-11e9-97fb-bc764e2007e4
Received: from mga09.intel.com (unknown [134.134.136.24])
 by localhost (Halon) with ESMTPS
 id baf2330c-df75-11e9-97fb-bc764e2007e4;
 Wed, 25 Sep 2019 09:20:35 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Sep 2019 02:20:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,547,1559545200"; d="scan'208";a="195952803"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by FMSMGA003.fm.intel.com with ESMTP; 25 Sep 2019 02:20:34 -0700
Received: from fmsmsx119.amr.corp.intel.com (10.18.124.207) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 25 Sep 2019 02:20:34 -0700
Received: from shsmsx101.ccr.corp.intel.com (10.239.4.153) by
 FMSMSX119.amr.corp.intel.com (10.18.124.207) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 25 Sep 2019 02:20:33 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.32]) by
 SHSMSX101.ccr.corp.intel.com ([169.254.1.92]) with mapi id 14.03.0439.000;
 Wed, 25 Sep 2019 17:20:31 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2] print: introduce a format specifier for pci_sbdf_t
Thread-Index: AQHVcvcPtVWeEUo7U0Guw9JDQpe4tKc8Hung
Date: Wed, 25 Sep 2019 09:20:31 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D58F8AA@SHSMSX104.ccr.corp.intel.com>
References: <20190822065132.48200-1-roger.pau@citrix.com>
 <20190924164202.r6hhqlyrbvs5afud@Air-de-Roger>
In-Reply-To: <20190924164202.r6hhqlyrbvs5afud@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMDY4NjRiNDctNzkxZS00YWVlLTllOTktNGY5MmI4ODI0YWE5IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoibDdPSUFPVVlBQW1ITTlVcmgxTHhoZkFyemZTb1U3dVZESmRFdjZCOW9OZGRRakFZQUY3dkhIQ3JIVkRQTEJSTSJ9
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2] print: introduce a format specifier for
 pci_sbdf_t
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan
 Beulich <jbeulich@suse.com>, Brian Woods <brian.woods@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGcm9tOiBSb2dlciBQYXUgTW9ubsOpIFttYWlsdG86cm9nZXIucGF1QGNpdHJpeC5jb21dCj4g
U2VudDogV2VkbmVzZGF5LCBTZXB0ZW1iZXIgMjUsIDIwMTkgMTI6NDIgQU0KPiAKPiBQaW5nPwo+
IAo+IFNpbmNlIEkndmUgZ290IGFuIEFjayBmcm9tIEphbiBhbmQgSnVsaWVuIEkgdGhpbmsgdGhl
IG1pc3NpbmcgQWNrcyBhcmUKPiBmb3IgdGhlIEludGVsIHN0dWZmIGFuZCB4ODYgZ2VuZXJpYyBh
bmQgQU1EIGJ5IEFuZHJldywgc2luY2UgSmFuCj4gZXhwbGljaXRseSBleHByZXNzZWQgaGlzIEFj
ayBpcyBvbmx5IGZvciBwaWVjZXMgd2hlcmUgaGUgaXMgdGhlIG9ubHkKPiBtYWludGFpbmVyLgo+
IAo+IFRoYW5rcy4KPiAKPiBPbiBUaHUsIEF1ZyAyMiwgMjAxOSBhdCAwODo1MTozMkFNICswMjAw
LCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4gPiBUaGUgbmV3IGZvcm1hdCBzcGVjaWZpZXIgaXMg
JyVwcCcsIGFuZCBwcmludHMgYSBwY2lfc2JkZl90IHVzaW5nIHRoZQo+ID4gc2VnOmJ1czpkZXYu
ZnVuYyBmb3JtYXQuIFJlcGxhY2UgYWxsIFNCREZzIHByaW50ZWQgdXNpbmcKPiA+ICclMDR4OiUw
Mng6JTAyeC4ldScgdG8gdXNlIHRoZSBuZXcgZm9ybWF0IHNwZWNpZmllci4KPiA+Cj4gPiBObyBm
dW5jdGlvbmFsIGNoYW5nZSBpbnRlbmRlZC4KClJldmlld2VkLWJ5OiBLZXZpbiBUaWFuIDxrZXZp
bi50aWFuQGludGVsLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=

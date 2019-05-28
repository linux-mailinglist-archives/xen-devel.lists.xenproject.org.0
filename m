Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB5B2BE9C
	for <lists+xen-devel@lfdr.de>; Tue, 28 May 2019 07:33:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVUg0-0004D4-W2; Tue, 28 May 2019 05:29:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3VDd=T4=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1hVUfz-0004Ct-HI
 for xen-devel@lists.xenproject.org; Tue, 28 May 2019 05:29:31 +0000
X-Inumbo-ID: 8e59fb1a-8109-11e9-89f4-cfda987261e1
Received: from mga06.intel.com (unknown [134.134.136.31])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8e59fb1a-8109-11e9-89f4-cfda987261e1;
 Tue, 28 May 2019 05:29:26 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 May 2019 22:29:25 -0700
X-ExtLoop1: 1
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by orsmga001.jf.intel.com with ESMTP; 27 May 2019 22:29:24 -0700
Received: from fmsmsx125.amr.corp.intel.com (10.18.125.40) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Mon, 27 May 2019 22:29:24 -0700
Received: from shsmsx103.ccr.corp.intel.com (10.239.4.69) by
 FMSMSX125.amr.corp.intel.com (10.18.125.40) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Mon, 27 May 2019 22:29:24 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.33]) by
 SHSMSX103.ccr.corp.intel.com ([169.254.4.70]) with mapi id 14.03.0415.000;
 Tue, 28 May 2019 13:29:22 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH] VT-d: change bogus return value of
 intel_iommu_lookup_page()
Thread-Index: AQHVCk00inK55yWqs0KjVs2g8rrN66aAF9aw
Date: Tue, 28 May 2019 05:29:22 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19CA4E69F@SHSMSX104.ccr.corp.intel.com>
References: <5CDAAECA020000780022E947@prv1-mh.provo.novell.com>
In-Reply-To: <5CDAAECA020000780022E947@prv1-mh.provo.novell.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNjBhYjJjNjctZTc4My00MTdiLTk0NzAtZWIxN2M5NDMyYjdiIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiTkhYNFQ4bFwvbUJlQmJXZFZPVUUwMFI2dU1FRFlhVVZPNlV0QlZ2VmFcL0tBaldkZGpYUGpSXC8zalV4dERkZWU0RCJ9
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] VT-d: change bogus return value of
 intel_iommu_lookup_page()
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
Cc: Paul Durrant <paul.durrant@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGcm9tOiBKYW4gQmV1bGljaCBbbWFpbHRvOkpCZXVsaWNoQHN1c2UuY29tXQo+IFNlbnQ6IFR1
ZXNkYXksIE1heSAxNCwgMjAxOSA4OjA0IFBNCj4gCj4gVGhlIGZ1bmN0aW9uIHBhc3NlcyAwIGFz
ICJhbGxvYyIgYXJndW1lbnQgdG8gYWRkcl90b19kbWFfcGFnZV9tYWRkcigpLAo+IHNvIC1FTk9N
RU0gc2ltcGx5IG1ha2VzIG5vIHNlbnNlIChhbmQgaXRzIHVzZSB3YXMgcHJvYmFibHkgc2ltcGx5
IGEKPiBjb3B5LWFuZC1wYXN0ZSBlZmZlY3Qgb3JpZ2luYXRpbmcgYXQgaW50ZWxfaW9tbXVfbWFw
X3BhZ2UoKSkuCj4gCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPgo+IAoKQWNrZWQtYnk6IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6640214371F
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2020 07:32:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itn1N-0001HL-Rf; Tue, 21 Jan 2020 06:28:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=i4GT=3K=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1itn1M-0001HG-8a
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2020 06:28:16 +0000
X-Inumbo-ID: 34128478-3c17-11ea-ba3c-12813bfff9fa
Received: from mga14.intel.com (unknown [192.55.52.115])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 34128478-3c17-11ea-ba3c-12813bfff9fa;
 Tue, 21 Jan 2020 06:28:15 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Jan 2020 22:28:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,344,1574150400"; d="scan'208";a="278326023"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by fmsmga001.fm.intel.com with ESMTP; 20 Jan 2020 22:28:12 -0800
Received: from fmsmsx118.amr.corp.intel.com (10.18.116.18) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 20 Jan 2020 22:28:10 -0800
Received: from shsmsx151.ccr.corp.intel.com (10.239.6.50) by
 fmsmsx118.amr.corp.intel.com (10.18.116.18) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 20 Jan 2020 22:28:10 -0800
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.197]) by
 SHSMSX151.ccr.corp.intel.com ([169.254.3.55]) with mapi id 14.03.0439.000;
 Tue, 21 Jan 2020 14:28:08 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2] VT-d: don't pass bridge devices to
 domain_context_mapping_one()
Thread-Index: AQHVz6g8VTgJ95Ve+Eq2z80HSKb49af0qGJQ
Date: Tue, 21 Jan 2020 06:28:07 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D73E9A2@SHSMSX104.ccr.corp.intel.com>
References: <620f37b6-43f2-030e-b259-84a4e9ceb7fc@suse.com>
In-Reply-To: <620f37b6-43f2-030e-b259-84a4e9ceb7fc@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiYWFjMTk5ZDEtYWU5NS00NDcxLWE1YmMtMmRiMTc3NjY4MWNjIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiSXNmZnhiR3pTaWxxT0JcL2t2a1pDZW92NFlLcVdcL1VWSjNERVBQMEErTnhBaWU3WGkydERuK2gwcU1yUlwvRWNWQyJ9
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2] VT-d: don't pass bridge devices to
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IE1vbmRheSwg
SmFudWFyeSAyMCwgMjAyMCAxMTo0MiBQTQ0KPiANCj4gV2hlbiBwYXNzZWQgYSBub24tTlVMTCBw
ZGV2LCB0aGUgZnVuY3Rpb24gZG9lcyBhbiBvd25lciBjaGVjayB3aGVuIGl0DQo+IGZpbmRzIGFu
IGFscmVhZHkgZXhpc3RpbmcgY29udGV4dCBtYXBwaW5nLiBCcmlkZ2VzLCBob3dldmVyLCBkb24n
dCBnZXQNCj4gcGFzc2VkIHRocm91Z2ggdG8gZ3Vlc3RzLCBhbmQgaGVuY2UgdGhlaXIgb3duZXIg
aXMgYWx3YXlzIGdvaW5nIHRvIGJlDQo+IERvbTAsIGxlYWRpbmcgdG8gdGhlIGFzc2lnbWVudCBv
ZiBhbGwgYnV0IG9uZSBvZiB0aGUgZnVuY3Rpb24gb2YgbXVsdGktDQo+IGZ1bmN0aW9uIFBDSSBk
ZXZpY2VzIGJlaGluZCBicmlkZ2VzIHRvIGZhaWwuDQo+IA0KPiBSZXBvcnRlZC1ieTogTWFyZWsg
TWFyY3p5a293c2tpLUfDs3JlY2tpDQo+IDxtYXJtYXJla0BpbnZpc2libGV0aGluZ3NsYWIuY29t
Pg0KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQoNCg0K
UmV2aWV3ZWQtYnk6IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPg0KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

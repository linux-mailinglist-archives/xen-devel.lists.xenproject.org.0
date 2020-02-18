Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B95162054
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2020 06:25:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j3vLl-0001Xt-4Y; Tue, 18 Feb 2020 05:23:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qq7b=4G=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1j3vLk-0001Xo-7t
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2020 05:23:12 +0000
X-Inumbo-ID: c015dfee-520e-11ea-80f0-12813bfff9fa
Received: from mga03.intel.com (unknown [134.134.136.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c015dfee-520e-11ea-80f0-12813bfff9fa;
 Tue, 18 Feb 2020 05:23:10 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Feb 2020 21:23:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,455,1574150400"; d="scan'208";a="382362074"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
 by orsmga004.jf.intel.com with ESMTP; 17 Feb 2020 21:23:08 -0800
Received: from fmsmsx158.amr.corp.intel.com (10.18.116.75) by
 FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 17 Feb 2020 21:23:08 -0800
Received: from shsmsx108.ccr.corp.intel.com (10.239.4.97) by
 fmsmsx158.amr.corp.intel.com (10.18.116.75) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 17 Feb 2020 21:23:08 -0800
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.5]) by
 SHSMSX108.ccr.corp.intel.com ([169.254.8.98]) with mapi id 14.03.0439.000;
 Tue, 18 Feb 2020 13:23:05 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH 1/2] VT-d: check all of an RMRR for being E820-reserved
Thread-Index: AQHV3PGrzLuoYZemaEyCSunNBd2eqqggfOmA
Date: Tue, 18 Feb 2020 05:23:04 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D78AD14@SHSMSX104.ccr.corp.intel.com>
References: <6ef37772-81da-dfd0-01e7-c83998b2c2c4@suse.com>
 <68fb9767-3104-3f0b-d052-20df7603e1e9@suse.com>
In-Reply-To: <68fb9767-3104-3f0b-d052-20df7603e1e9@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiOWUzMDJkMzAtZWFlYS00MjRmLTk3YmItYWQ4ZjI1MTE5ZTk1IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiOWQyUUp6STQycjlLYlhhQmpKUHpmNTdCdHFTWkVWb0RMNzdnYkE1czY1SEhYNWhoWXNHMndMZUFYNDhuaDV4YyJ9
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 1/2] VT-d: check all of an RMRR for being
 E820-reserved
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

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFRodXJzZGF5
LCBGZWJydWFyeSA2LCAyMDIwIDk6MzEgUE0NCj4gDQo+IENoZWNraW5nIGp1c3QgdGhlIGZpcnN0
IGFuZCBsYXN0IHBhZ2UgaXMgbm90IHN1ZmZpY2llbnQgKGFuZCByZWR1bmRhbnQNCj4gZm9yIHNp
bmdsZS1wYWdlIHJlZ2lvbnMpLiBBcyB3ZSBkb24ndCBuZWVkIHRvIGNhcmUgYWJvdXQgSUE2NCBh
bnltb3JlLA0KPiB1c2UgYW4geDg2LXNwZWNpZmljIGZ1bmN0aW9uIHRvIGdldCB0aGlzIGRvbmUg
d2l0aG91dCBsb29waW5nIG92ZXIgZWFjaA0KPiBpbmRpdmlkdWFsIHBhZ2UuDQo+IA0KPiBTaWdu
ZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQoNClJldmlld2VkLWJ5
OiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4NCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

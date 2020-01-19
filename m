Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C06141B8D
	for <lists+xen-devel@lfdr.de>; Sun, 19 Jan 2020 04:21:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1it16D-0007fI-8j; Sun, 19 Jan 2020 03:18:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nxl7=3I=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1it16C-0007f9-AM
 for xen-devel@lists.xenproject.org; Sun, 19 Jan 2020 03:18:04 +0000
X-Inumbo-ID: 4cf721dc-3a6a-11ea-b802-12813bfff9fa
Received: from mga14.intel.com (unknown [192.55.52.115])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4cf721dc-3a6a-11ea-b802-12813bfff9fa;
 Sun, 19 Jan 2020 03:18:02 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Jan 2020 19:18:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,336,1574150400"; d="scan'208";a="269413940"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by fmsmga001.fm.intel.com with ESMTP; 18 Jan 2020 19:18:01 -0800
Received: from shsmsx153.ccr.corp.intel.com (10.239.6.53) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Sat, 18 Jan 2020 19:18:01 -0800
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.197]) by
 SHSMSX153.ccr.corp.intel.com ([169.254.12.89]) with mapi id 14.03.0439.000;
 Sun, 19 Jan 2020 11:18:00 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH] VT-d: dma_pte_clear_one() can't fail anymore
Thread-Index: AQHVxVGPh7JcKH15FU6nQ+WYGd9dGKfxYv+Q
Date: Sun, 19 Jan 2020 03:17:59 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D739B3A@SHSMSX104.ccr.corp.intel.com>
References: <aa05dd9d-fc17-ac6f-4b39-5816af10dabf@suse.com>
In-Reply-To: <aa05dd9d-fc17-ac6f-4b39-5816af10dabf@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiM2I0Zjk5OGMtZDk2Yy00ZDhkLTg2NWYtZDQ4ZGQ3Njk2Y2E2IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiVWkwenluOVIwQkg1ZloxTDdUXC9Ic1NPTk85VlpybkF6MTNIQlNLdGJyb0hcL2NBaFNBM2w1MjN2ZDA2WGtHUXRpIn0=
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] VT-d: dma_pte_clear_one() can't fail anymore
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

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFR1ZXNkYXks
IEphbnVhcnkgNywgMjAyMCA3OjU2IFBNDQo+IA0KPiBIZW5jZSBpdCdzIHBvaW50bGVzcyBmb3Ig
aXQgdG8gcmV0dXJuIGFuIGVycm9yIGluZGljYXRvciwgYW5kIGl0J3MgZXZlbg0KPiBsZXNzIHVz
ZWZ1bCBmb3IgaXQgdG8gYmUgX19tdXN0X2NoZWNrLiBUaGlzIGlzIGEgcmVzdWx0IG9mIGNvbW1p
dA0KPiBlOGFmZTExMjRjYzEgKCJpb21tdTogZWxpZGUgZmx1c2hpbmcgZm9yIGhpZ2hlciBvcmRl
ciBtYXAvdW5tYXANCj4gb3BlcmF0aW9ucyIpIG1vdmluZyB0aGUgVExCIGZsdXNoaW5nIG91dCBv
ZiB0aGUgZnVuY3Rpb24uDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQoNClJldmlld2VkLWJ5OiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVs
LmNvbT4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

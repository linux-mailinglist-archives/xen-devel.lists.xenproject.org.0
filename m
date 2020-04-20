Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E1E1AFFE9
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2020 04:42:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQMNG-0002HW-T1; Mon, 20 Apr 2020 02:41:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JSG1=6E=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1jQMNF-0002HR-7a
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2020 02:41:29 +0000
X-Inumbo-ID: 6d89d956-82b0-11ea-9016-12813bfff9fa
Received: from mga09.intel.com (unknown [134.134.136.24])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6d89d956-82b0-11ea-9016-12813bfff9fa;
 Mon, 20 Apr 2020 02:41:25 +0000 (UTC)
IronPort-SDR: c+7WvAwjCRhlst9c5+Ne13W0w10FswryWkrR5TyLO+xt26voDYYSE3dQcroKPatOq2WhtxGBzs
 3lpQp4BfrvAw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2020 19:41:24 -0700
IronPort-SDR: T9VNeDHfCIh1jTN5Qen7Qbaz8Mojh7O7X3v+2MB5ZtIm7cZuQw/fCO/R9U+C1c7lHmOVJ859Ky
 er9o7WCbEmOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,405,1580803200"; d="scan'208";a="456235582"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by fmsmga006.fm.intel.com with ESMTP; 19 Apr 2020 19:41:23 -0700
Received: from fmsmsx119.amr.corp.intel.com (10.18.124.207) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Sun, 19 Apr 2020 19:41:19 -0700
Received: from shsmsx103.ccr.corp.intel.com (10.239.4.69) by
 FMSMSX119.amr.corp.intel.com (10.18.124.207) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Sun, 19 Apr 2020 19:41:19 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.225]) by
 SHSMSX103.ccr.corp.intel.com ([169.254.4.146]) with mapi id 14.03.0439.000;
 Mon, 20 Apr 2020 10:41:17 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH] x86/vtd: relax EPT page table sharing check
Thread-Topic: [PATCH] x86/vtd: relax EPT page table sharing check
Thread-Index: AQHWFKuYa2F4ckLYBUip3x2dtyt9faiBUOCw
Date: Mon, 20 Apr 2020 02:41:16 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D84B492@SHSMSX104.ccr.corp.intel.com>
References: <20200417112954.21250-1-roger.pau@citrix.com>
In-Reply-To: <20200417112954.21250-1-roger.pau@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
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
Cc: Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGcm9tOiBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPiBTZW50OiBG
cmlkYXksIEFwcmlsIDE3LCAyMDIwIDc6MzAgUE0NCj4gDQo+IFRoZSBFUFQgcGFnZSB0YWJsZXMg
Y2FuIGJlIHNoYXJlZCB3aXRoIHRoZSBJT01NVSBhcyBsb25nIGFzIHRoZSBwYWdlDQo+IHNpemVz
IHN1cHBvcnRlZCBieSBFUFQgYXJlIGFsc28gc3VwcG9ydGVkIGJ5IHRoZSBJT01NVS4NCj4gDQo+
IEN1cnJlbnQgY29kZSBjaGVja3MgdGhhdCBib3RoIHRoZSBJT01NVSBhbmQgRVBUIHN1cHBvcnQg
dGhlIHNhbWUgcGFnZQ0KPiBzaXplcywgYnV0IHRoaXMgaXMgbm90IHN0cmljdGx5IHJlcXVpcmVk
LCB0aGUgSU9NTVUgc3VwcG9ydGluZyBtb3JlDQo+IHBhZ2Ugc2l6ZXMgdGhhbiBFUFQgaXMgZmlu
ZSBhbmQgc2hvdWxkbid0IGJsb2NrIHBhZ2UgdGFibGUgc2hhcmluZy4NCj4gDQo+IFRoaXMgaXMg
bGlrZWx5IG5vdCBhIGNvbW1vbiBjYXNlIChJT01NVSBzdXBwb3J0aW5nIG1vcmUgcGFnZSBzaXpl
cw0KPiB0aGFuIEVQVCksIGJ1dCBzaG91bGQgc3RpbGwgYmUgZml4ZWQgZm9yIGNvcnJlY3RuZXNz
Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJp
eC5jb20+DQoNClJldmlld2VkLWJ5OiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4N
Cg==


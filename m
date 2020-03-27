Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA28194EE3
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2020 03:27:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHefo-0006BW-0N; Fri, 27 Mar 2020 02:24:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WxMQ=5M=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1jHefm-0006BR-6z
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2020 02:24:38 +0000
X-Inumbo-ID: 198b5354-6fd2-11ea-88dd-12813bfff9fa
Received: from mga18.intel.com (unknown [134.134.136.126])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 198b5354-6fd2-11ea-88dd-12813bfff9fa;
 Fri, 27 Mar 2020 02:24:36 +0000 (UTC)
IronPort-SDR: IBe4NxDuNdO6fvabvCNfK+03QpllBkCTbTnOyT37/Ez8vGppBDtorR06h7pQ1oqOtaL5eUm7aS
 SLVv3Cgi3KpA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2020 19:24:36 -0700
IronPort-SDR: 80rti8cAgGO3M8YoamLO6rTjoZ2TMxyjGHgKBrxDQh6sA1GYQe/aPXUlIHHuVqlFm1w0ANKA+e
 DzoNy+AubkYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,310,1580803200"; d="scan'208";a="326758872"
Received: from fmsmsx108.amr.corp.intel.com ([10.18.124.206])
 by orsmga001.jf.intel.com with ESMTP; 26 Mar 2020 19:24:35 -0700
Received: from fmsmsx116.amr.corp.intel.com (10.18.116.20) by
 FMSMSX108.amr.corp.intel.com (10.18.124.206) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 26 Mar 2020 19:24:35 -0700
Received: from shsmsx108.ccr.corp.intel.com (10.239.4.97) by
 fmsmsx116.amr.corp.intel.com (10.18.116.20) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 26 Mar 2020 19:24:35 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.206]) by
 SHSMSX108.ccr.corp.intel.com ([169.254.8.235]) with mapi id 14.03.0439.000;
 Fri, 27 Mar 2020 10:24:32 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v5 09/10] x86/HVM: don't needlessly intercept
 APERF/MPERF/TSC MSR reads
Thread-Index: AQHWAdj+FZ43WaUny0eRxTi6NHc9OKhbuelg
Date: Fri, 27 Mar 2020 02:24:32 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D7ECA39@SHSMSX104.ccr.corp.intel.com>
References: <6fa81b4d-528d-5c33-50c5-a18396b4383a@suse.com>
 <ca9aa4cc-7164-54bb-fc33-9c049be51352@suse.com>
In-Reply-To: <ca9aa4cc-7164-54bb-fc33-9c049be51352@suse.com>
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
Subject: Re: [Xen-devel] [PATCH v5 09/10] x86/HVM: don't needlessly
 intercept APERF/MPERF/TSC MSR reads
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <Paul.Durrant@citrix.com>, "Nakajima,
 Jun" <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFR1ZXNkYXks
IE1hcmNoIDI0LCAyMDIwIDg6MzcgUE0NCj4gDQo+IElmIHRoZSBoYXJkd2FyZSBjYW4gaGFuZGxl
IGFjY2Vzc2VzLCB3ZSBzaG91bGQgYWxsb3cgaXQgdG8gZG8gc28uIFRoaXMNCj4gd2F5IHdlIGNh
biBleHBvc2UgRUZSTyB0byBIVk0gZ3Vlc3RzLCBhbmQgImFsbCIgdGhhdCdzIGxlZnQgZm9yIGV4
cG9zaW5nDQo+IEFQRVJGL01QRVJGIGlzIHRvIGZpZ3VyZSBvdXQgaG93IHRvIGhhbmRsZSB3cml0
ZXMgdG8gdGhlc2UgTVNScy4gKE5vdGUNCj4gdGhhdCB0aGUgbGVhZiA2IGd1ZXN0IENQVUlEIGNo
ZWNrcyB3aWxsIGV2YWx1YXRlIHRvIGZhbHNlIGZvciBub3csIGFzDQo+IHJlY2FsY3VsYXRlX21p
c2MoKSB6YXBzIHRoZSBlbnRpcmUgbGVhZiBmb3Igbm93LikNCj4gDQo+IEZvciBUU0MgdGhlIGlu
dGVyY2VwdHMgYXJlIG1hZGUgbWlycm9yIHRoZSBSRFRTQyBvbmVzLg0KPiANCj4gU2lnbmVkLW9m
Zi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KDQpSZXZpZXdlZC1ieTogS2V2
aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+DQo=


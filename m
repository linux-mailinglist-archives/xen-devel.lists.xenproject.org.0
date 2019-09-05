Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9D5A98B3
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2019 05:06:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5i3R-0005E6-7C; Thu, 05 Sep 2019 03:03:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/IXJ=XA=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1i5i3P-0005E1-6e
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 03:03:23 +0000
X-Inumbo-ID: b7c3f7d5-cf89-11e9-abbf-12813bfff9fa
Received: from mga14.intel.com (unknown [192.55.52.115])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b7c3f7d5-cf89-11e9-abbf-12813bfff9fa;
 Thu, 05 Sep 2019 03:03:21 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Sep 2019 20:03:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,469,1559545200"; d="scan'208";a="194943495"
Received: from fmsmsx108.amr.corp.intel.com ([10.18.124.206])
 by orsmga002.jf.intel.com with ESMTP; 04 Sep 2019 20:03:20 -0700
Received: from fmsmsx120.amr.corp.intel.com (10.18.124.208) by
 FMSMSX108.amr.corp.intel.com (10.18.124.206) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 4 Sep 2019 20:03:19 -0700
Received: from shsmsx107.ccr.corp.intel.com (10.239.4.96) by
 fmsmsx120.amr.corp.intel.com (10.18.124.208) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 4 Sep 2019 20:03:19 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.32]) by
 SHSMSX107.ccr.corp.intel.com ([169.254.9.89]) with mapi id 14.03.0439.000;
 Thu, 5 Sep 2019 11:03:17 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH] p2m/ept: add _subtree suffix to ept_invalidate_emt
Thread-Index: AQHVYyvtv5GwcSXD1ky6QB9Ag9xjMqccZn3A
Date: Thu, 5 Sep 2019 03:03:16 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D563BB0@SHSMSX104.ccr.corp.intel.com>
References: <20190904142026.9946-1-roger.pau@citrix.com>
In-Reply-To: <20190904142026.9946-1-roger.pau@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiYzE4NWFjM2EtNmViNi00NzBlLTgyZTEtNTllYTUzMDk5ZWNiIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiUXdGU0Naem9RY3Z0ZEdsSkhnMTNyRlZRUTVYancyWXpJQWdlM2c4TTMyV3VpNEl1cTdneWNna0Z5VThmZXNTaiJ9
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] p2m/ept: add _subtree suffix to
 ept_invalidate_emt
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, "Nakajima, Jun" <jun.nakajima@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGcm9tOiBSb2dlciBQYXUgTW9ubmUgW21haWx0bzpyb2dlci5wYXVAY2l0cml4LmNvbV0NCj4g
U2VudDogV2VkbmVzZGF5LCBTZXB0ZW1iZXIgNCwgMjAxOSAxMDoyMCBQTQ0KPiANCj4gU28gdGhh
dCB0aGUgbmFtZSBpbXBsaWVzIHRoZSBmdW5jdGlvbiBpcyB1c2VkIHRvIHdhbGsgdGhlIHBhZ2Ug
dGFibGUNCj4gcG9pbnRlciBwYXNzZWQgYXMgcGFyYW1ldGVyLiBEcm9wIHRoZSBwYXJlbnRfIHBy
ZWZpeCBmcm9tIHRoZSBsZXZlbA0KPiBwYXJhbWV0ZXIsIHNpbmNlIHRoZSBsZXZlbCBwYXNzZWQg
aXMgdGhlIG9uZSBtYXRjaGluZyB0aGUgRVBUIGVudHJ5DQo+IHBhc3NlZCBpbiB0aGUgbWZuIHBh
cmFtZXRlci4NCj4gDQo+IFdoaWxlIHRoZXJlIGFsc28gY2hhbmdlIGJvb2xfdCB0byBib29sIGFu
ZCBhZGQgYW4gYXNzZXJ0IHRvIG1ha2Ugc3VyZQ0KPiBubyBsZXZlbCAwIGVudHJpZXMgKGllOiA0
SyBFUFQgbGVhZiBlbnRyaWVzKSBhcmUgcGFzc2VkIGFzIHBhcmFtZXRlcnMuDQo+IA0KPiBObyBm
dW5jdGlvbmFsIGNoYW5nZSBpbnRlbmRlZC4NCg0KUmV2aWV3ZWQtYnk6IEtldmluIFRpYW4gPGtl
dmluLnRpYW5AaW50ZWwuY29tPg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C35E408A
	for <lists+xen-devel@lfdr.de>; Fri, 25 Oct 2019 02:21:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNnJA-0007JO-KB; Fri, 25 Oct 2019 00:18:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xG8r=YS=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1iNnJ9-0007JJ-5Z
 for xen-devel@lists.xenproject.org; Fri, 25 Oct 2019 00:18:23 +0000
X-Inumbo-ID: f22c1cda-f6bc-11e9-94b3-12813bfff9fa
Received: from mga17.intel.com (unknown [192.55.52.151])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f22c1cda-f6bc-11e9-94b3-12813bfff9fa;
 Fri, 25 Oct 2019 00:18:19 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Oct 2019 17:18:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,226,1569308400"; d="scan'208";a="204399553"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by FMSMGA003.fm.intel.com with ESMTP; 24 Oct 2019 17:18:18 -0700
Received: from shsmsx103.ccr.corp.intel.com (10.239.4.69) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 24 Oct 2019 17:18:18 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.166]) by
 SHSMSX103.ccr.corp.intel.com ([169.254.4.165]) with mapi id 14.03.0439.000;
 Fri, 25 Oct 2019 08:18:15 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH] x86/VT-d: Misc initialisation cleanup
Thread-Index: AQHVipBjYEnCCupa9kOVkP9Az0UWYadqfewQ
Date: Fri, 25 Oct 2019 00:18:15 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D5CC26D@SHSMSX104.ccr.corp.intel.com>
References: <20191024172731.15752-1-andrew.cooper3@citrix.com>
In-Reply-To: <20191024172731.15752-1-andrew.cooper3@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZGM0MTRiYTYtNDU2ZS00NGE2LWE1ZmYtZTM5NGQ2ZWI4NDg2IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoibEtzUStuYnNUWnBDS24wV3MrMDNcL3o3QTFTTlJRd0dSMHZ6SnVzWGVUMjIyVEZtMU5Xd0NENTFoTzE2UytFOUYifQ==
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] x86/VT-d: Misc initialisation cleanup
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
Cc: "Nakajima, Jun" <jun.nakajima@intel.com>, Juergen Gross <jgross@suse.com>,
 Wei Liu <wl@xen.org>, Jan Beulich <JBeulich@suse.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGcm9tOiBBbmRyZXcgQ29vcGVyIFttYWlsdG86YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbV0N
Cj4gU2VudDogRnJpZGF5LCBPY3RvYmVyIDI1LCAyMDE5IDE6MjggQU0NCj4gDQo+ICAqIEluaXRp
YWxpc2UgYWxsIHNwaW5sb2NrIGZpZWxkcyB0b2dldGhlcg0KPiAgKiBObyBuZWVkIGZvciBhbiBh
dG9taWMgc2V0X2JpdCgpIHRvIGluaXRpYWxpc2UgZG9taWRfYml0bWFwDQo+ICAqIEF2b2lkIHVz
aW5nIHBhcnRpYWwtbGluZSBwcmludGsoKSdzLg0KPiAgKiBTdHlsZSBmaXhlcyAodG9vIG1hbnks
IGFuZCB0b28gZmV3IHNwYWNlcykNCj4gDQo+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlLg0KPiANCj4g
U2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4N
Cg0KUmV2aWV3ZWQtYnk6IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPg0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

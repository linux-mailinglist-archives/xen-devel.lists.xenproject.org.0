Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10931162013
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2020 06:09:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j3v5D-00088D-0A; Tue, 18 Feb 2020 05:06:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qq7b=4G=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1j3v5B-000888-V5
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2020 05:06:05 +0000
X-Inumbo-ID: 5b9b3f52-520c-11ea-bc8e-bc764e2007e4
Received: from mga12.intel.com (unknown [192.55.52.136])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5b9b3f52-520c-11ea-bc8e-bc764e2007e4;
 Tue, 18 Feb 2020 05:06:02 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Feb 2020 21:06:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,455,1574150400"; d="scan'208";a="282688938"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by FMSMGA003.fm.intel.com with ESMTP; 17 Feb 2020 21:06:01 -0800
Received: from fmsmsx115.amr.corp.intel.com (10.18.116.19) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 17 Feb 2020 21:06:01 -0800
Received: from shsmsx108.ccr.corp.intel.com (10.239.4.97) by
 fmsmsx115.amr.corp.intel.com (10.18.116.19) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 17 Feb 2020 21:06:00 -0800
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.5]) by
 SHSMSX108.ccr.corp.intel.com ([169.254.8.98]) with mapi id 14.03.0439.000;
 Tue, 18 Feb 2020 13:05:58 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v4 1/7] SVM: drop asm/hvm/emulate.h inclusion from vmcb.h
Thread-Index: AQHV2FVuZy9OGynUokqrcDmVlznwcagggWzQ
Date: Tue, 18 Feb 2020 05:05:57 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D78AC99@SHSMSX104.ccr.corp.intel.com>
References: <d9ac8ea4-9f2a-93d5-7656-48d93930ed2e@suse.com>
 <bfc4d4ad-85a5-2d79-748a-c7b72ba40bce@suse.com>
In-Reply-To: <bfc4d4ad-85a5-2d79-748a-c7b72ba40bce@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNmZjZGFiZmMtYmU1Ni00NWFmLTgyZDMtMWJjYjU5ZWE3NjJmIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiUUVtdG5hdzkzZ3FcL0JWK2pkb2hWN0ZpNmRmamlrcGhXSkhzZVh1cjdONFwvcGVYMGtmXC9sMjZyVWNpUCtQUmlNZiJ9
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v4 1/7] SVM: drop asm/hvm/emulate.h
 inclusion from vmcb.h
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>, Tamas K
 Lengyel <tamas@tklengyel.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, "Nakajima,
 Jun" <jun.nakajima@intel.com>, Alexandru Isaila <aisaila@bitdefender.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFNhdHVyZGF5
LCBGZWJydWFyeSAxLCAyMDIwIDEyOjQyIEFNDQo+IA0KPiBJdCdzIG5vdCBuZWVkZWQgdGhlcmUg
YW5kIGludHJvZHVjZXMgYSBuZWVkbGVzcywgYWxtb3N0IGdsb2JhbA0KPiBkZXBlbmRlbmN5LiBJ
bmNsdWRlIHRoZSBmaWxlIChvciBpbiBzb21lIGNhc2VzIGp1c3QgeGVuL2Vyci5oKSB3aGVyZQ0K
PiBhY3R1YWxseSBuZWVkZWQsIG9yIC0gaW4gb25lIGNhc2UgLSBzaW1wbHkgZm9yd2FyZC1kZWNs
YXJlIGEgc3RydWN0LiBJbg0KPiBtaWNyb2NvZGUqLmMgdGFrZSB0aGUgb3Bwb3J0dW5pdHkgYW5k
IGFsc28gcmUtb3JkZXIgYSBmZXcgb3RoZXINCj4gI2luY2x1ZGUtcy4NCj4gDQo+IFNpZ25lZC1v
ZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEtl
dmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPg0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==

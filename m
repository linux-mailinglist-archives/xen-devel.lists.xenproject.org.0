Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B269E8F76
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2019 19:43:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iPWQM-0006Y2-Kk; Tue, 29 Oct 2019 18:40:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NXOE=YW=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1iPWQL-0006Xq-5F
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2019 18:40:57 +0000
X-Inumbo-ID: a42749fc-fa7b-11e9-9516-12813bfff9fa
Received: from mga09.intel.com (unknown [134.134.136.24])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a42749fc-fa7b-11e9-9516-12813bfff9fa;
 Tue, 29 Oct 2019 18:40:55 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Oct 2019 11:40:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,244,1569308400"; d="scan'208";a="198999503"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by fmsmga007.fm.intel.com with ESMTP; 29 Oct 2019 11:40:54 -0700
Received: from fmsmsx155.amr.corp.intel.com (10.18.116.71) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 29 Oct 2019 11:40:54 -0700
Received: from shsmsx107.ccr.corp.intel.com (10.239.4.96) by
 FMSMSX155.amr.corp.intel.com (10.18.116.71) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 29 Oct 2019 11:40:54 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.127]) by
 SHSMSX107.ccr.corp.intel.com ([169.254.9.63]) with mapi id 14.03.0439.000;
 Wed, 30 Oct 2019 02:40:52 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH 1/2] x86/vtx: Corrections to BFD93 errata workaround
Thread-Index: AQHVjaCwkEe7cZwtJ0ePbRfFtmLv9adx9WUA
Date: Tue, 29 Oct 2019 18:40:51 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D5DEF3B@SHSMSX104.ccr.corp.intel.com>
References: <20191028150152.21179-1-andrew.cooper3@citrix.com>
 <20191028150152.21179-2-andrew.cooper3@citrix.com>
In-Reply-To: <20191028150152.21179-2-andrew.cooper3@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiODUwYzU1NTgtOGRlZS00ZjIxLWEwYjMtNTY3M2ZlMDVjNGQ2IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiV0dFWDNjZFFidlRRajlmNmJ4V1liOHg4Mkp2d3lsajZnYVwvVmZNZldKQ3dieGhIelk4V1VSeWlRbjdXVytjN0UifQ==
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 1/2] x86/vtx: Corrections to BFD93 errata
 workaround
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
Cj4gU2VudDogTW9uZGF5LCBPY3RvYmVyIDI4LCAyMDE5IDExOjAyIFBNDQo+IA0KPiBBdCB0aGUg
dGltZSBvZiBmaXhpbmcgYy9zIDIwZjE5NzZiNDQsIG5vIG9idmlvdXMgZXJyYXRhIGhhZCBiZWVu
IHB1Ymxpc2hlZCwNCj4gYW5kIEJERjE0IGxvb2tlZCBsaWtlIHRoZSBtb3N0IG9idmlvdXMgY2Fu
ZGlkYXRlLiAgU3Vic2VxdWVudGx5LCBCREY5Mw0KPiBoYXMNCj4gYmVlbiBwdWJsaXNoZWQgYW5k
IGl0IGlzIG9idmlvdXNseSB0aGlzLg0KPiANCj4gVGhlIGVycmF0dW0gc3RhdGVzIHRoYXQgTEVS
X1RPX0xJUCBpcyB0aGUgb25seSBhZmZlY3RlZCBNU1IuICBUaGUNCj4gcHJvdmlzaW9uYWwNCj4g
Zml4IGluIFhlbiBhZGp1c3RlZCBMRVJfRlJPTV9MSVAsIGJ1dCB0aGlzIGlzIG5vdCBjb3JyZWN0
LiAgVGhlIEZST00gTVNScw0KPiBhcmUNCj4gaW50ZW5kZWQgdG8gaGF2ZSBUU1ggbWV0YWRhdGEs
IGFuZCBmb3Igc3RlcHBpbmdzIHdpdGggVFNYIGVuYWJsZWQsIGl0IHdpbGwNCj4gY29ycnVwdCB0
aGUgdmFsdWUgdGhlIGd1ZXN0IHNlZXMsIHdoaWxlIGZvciBwYXJ0cyB3aXRoIFRTWCBkaXNhYmxl
ZCwgaXQgaXMNCj4gcmVkdW5kYW50IHdpdGggRklYVVBfVFNYLiAgRHJvcCB0aGUgTEVSX0ZST01f
TElQIGFkanVzdG1lbnQuDQo+IA0KPiBSZXBsYWNlIEJERjE0IHJlZmVyZW5jZXMgd2l0aCBCREY5
MywgZHJvcCB0aGUgcmVkdW5kYW50ICdiZHdfZXJyYXR1bV8nDQo+IHByZWZpeCwNCj4gYW5kIHVz
ZSBhbiBJbnRlbCB2ZW5kb3IgY2hlY2ssIGFzIG90aGVyIHZlbmRvcnMgaW1wbGVtZW50IFZULXgu
DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRy
aXguY29tPg0KDQpSZXZpZXdlZC1ieTogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+
DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

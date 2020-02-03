Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3AF6150259
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 09:12:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyWo8-00029C-Uq; Mon, 03 Feb 2020 08:10:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=l9SF=3X=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1iyWo7-000296-E5
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 08:10:11 +0000
X-Inumbo-ID: 97af99a6-465c-11ea-8e36-12813bfff9fa
Received: from mga06.intel.com (unknown [134.134.136.31])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 97af99a6-465c-11ea-8e36-12813bfff9fa;
 Mon, 03 Feb 2020 08:10:09 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Feb 2020 00:10:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,397,1574150400"; d="scan'208";a="278676938"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by FMSMGA003.fm.intel.com with ESMTP; 03 Feb 2020 00:10:08 -0800
Received: from fmsmsx111.amr.corp.intel.com (10.18.116.5) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 3 Feb 2020 00:10:07 -0800
Received: from shsmsx102.ccr.corp.intel.com (10.239.4.154) by
 fmsmsx111.amr.corp.intel.com (10.18.116.5) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 3 Feb 2020 00:10:07 -0800
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.5]) by
 shsmsx102.ccr.corp.intel.com ([169.254.2.126]) with mapi id 14.03.0439.000;
 Mon, 3 Feb 2020 16:10:05 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Paul Durrant <pdurrant@amazon.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v8 4/4] x86 / vmx: use a MEMF_no_refcount domheap page
 for APIC_DEFAULT_PHYS_BASE
Thread-Index: AQHV132+ne5lZo27Z0ejJUMiefhQG6gJI5jA
Date: Mon, 3 Feb 2020 08:10:05 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D75F8FD@SHSMSX104.ccr.corp.intel.com>
References: <20200130145745.1306-1-pdurrant@amazon.com>
 <20200130145745.1306-5-pdurrant@amazon.com>
In-Reply-To: <20200130145745.1306-5-pdurrant@amazon.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiYTVlYzUxMWEtOTFjMi00NTU3LWI3ZDctYjdkOWEwNDVmYWNlIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiUG5zaFwvMVBWU01DMVVGanJpTkJsQkx3RDFSYkorQjVyb3pxMEZPTVc2OXB5RDVqQnlDejFRZjN1czEycEFLcWYifQ==
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v8 4/4] x86 / vmx: use a MEMF_no_refcount
 domheap page for APIC_DEFAULT_PHYS_BASE
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, "Nakajima,
 Jun" <jun.nakajima@intel.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGcm9tOiBQYXVsIER1cnJhbnQgPHBkdXJyYW50QGFtYXpvbi5jb20+DQo+IFNlbnQ6IFRodXJz
ZGF5LCBKYW51YXJ5IDMwLCAyMDIwIDEwOjU4IFBNDQo+IA0KPiB2bXhfYWxsb2NfdmxhcGljX21h
cHBpbmcoKSBjdXJyZW50bHkgY29udGFpbnMgc29tZSB2ZXJ5IG9kZCBsb29raW5nIGNvZGUNCj4g
dGhhdCBhbGxvY2F0ZXMgYSBNRU1GX25vX293bmVyIGRvbWhlYXAgcGFnZSBhbmQgdGhlbiBzaGFy
ZXMgd2l0aCB0aGUNCj4gZ3Vlc3QNCj4gYXMgaWYgaXQgd2VyZSBhIHhlbmhlYXAgcGFnZS4gVGhp
cyB0aGVuIHJlcXVpcmVzIHZteF9mcmVlX3ZsYXBpY19tYXBwaW5nKCkNCj4gdG8gY2FsbCBhIHNw
ZWNpYWwgZnVuY3Rpb24gaW4gdGhlIG1tIGNvZGU6IGZyZWVfc2hhcmVkX2RvbWhlYXBfcGFnZSgp
Lg0KPiANCj4gQnkgdXNpbmcgYSBNRU1GX25vX3JlZmNvdW50IGRvbWhlYXAgcGFnZSBpbnN0ZWFk
LCB0aGUgb2RkIGxvb2tpbmcgY29kZQ0KPiBpbg0KPiB2bXhfYWxsb2NfdmxhcGljX21hcHBpbmco
KSBjYW4gc2ltcGx5IHVzZSBnZXRfcGFnZV9hbmRfdHlwZSgpIHRvIHNldCB1cCBhDQo+IHdyaXRh
YmxlIG1hcHBpbmcgYmVmb3JlIGluc2VydGlvbiBpbiB0aGUgUDJNIGFuZA0KPiB2bXhfZnJlZV92
bGFwaWNfbWFwcGluZygpDQo+IGNhbiBzaW1wbHkgcmVsZWFzZSB0aGUgcGFnZSB1c2luZyBwdXRf
cGFnZV9hbGxvY19yZWYoKSBmb2xsb3dlZCBieQ0KPiBwdXRfcGFnZV9hbmRfdHlwZSgpLiBUaGlz
IHRoZW4gYWxsb3dzIGZyZWVfc2hhcmVkX2RvbWhlYXBfcGFnZSgpIHRvIGJlDQo+IHB1cmdlZC4N
Cj4gDQo+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4N
Cj4gUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCg0KUmV2aWV3
ZWQtYnk6IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPg0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

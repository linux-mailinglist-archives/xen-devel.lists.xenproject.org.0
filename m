Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 404191C862
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2019 14:19:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQWMd-0007L5-02; Tue, 14 May 2019 12:16:58 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9bz0=TO=citrix.com=prvs=030a53c6a=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hQWMa-0007Kw-M6
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 12:16:56 +0000
X-Inumbo-ID: 29504689-7642-11e9-8980-bc764e045a96
Received: from SMTP.EU.CITRIX.COM (unknown [185.25.65.24])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 29504689-7642-11e9-8980-bc764e045a96;
 Tue, 14 May 2019 12:16:55 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,468,1549929600"; d="scan'208";a="89715923"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Jan Beulich' <JBeulich@suse.com>, xen-devel
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH] VT-d: change bogus return value of
 intel_iommu_lookup_page()
Thread-Index: AQHVCk0xFryF4JGVP02BPQ8eKy4TM6ZqiP9A
Date: Tue, 14 May 2019 12:16:53 +0000
Message-ID: <06d8bf418e6c4f069dcab0f60bb1258c@AMSPEX02CL03.citrite.net>
References: <5CDAAECA020000780022E947@prv1-mh.provo.novell.com>
In-Reply-To: <5CDAAECA020000780022E947@prv1-mh.provo.novell.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] VT-d: change bogus return value of
 intel_iommu_lookup_page()
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
Cc: Kevin Tian <kevin.tian@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEphbiBCZXVsaWNoIFttYWlsdG86
SkJldWxpY2hAc3VzZS5jb21dCj4gU2VudDogMTQgTWF5IDIwMTkgMDU6MDQKPiBUbzogeGVuLWRl
dmVsIDx4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc+Cj4gQ2M6IFBhdWwgRHVycmFudCA8
UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+OyBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNv
bT4KPiBTdWJqZWN0OiBbUEFUQ0hdIFZULWQ6IGNoYW5nZSBib2d1cyByZXR1cm4gdmFsdWUgb2Yg
aW50ZWxfaW9tbXVfbG9va3VwX3BhZ2UoKQo+IAo+IFRoZSBmdW5jdGlvbiBwYXNzZXMgMCBhcyAi
YWxsb2MiIGFyZ3VtZW50IHRvIGFkZHJfdG9fZG1hX3BhZ2VfbWFkZHIoKSwKPiBzbyAtRU5PTUVN
IHNpbXBseSBtYWtlcyBubyBzZW5zZSAoYW5kIGl0cyB1c2Ugd2FzIHByb2JhYmx5IHNpbXBseSBh
Cj4gY29weS1hbmQtcGFzdGUgZWZmZWN0IG9yaWdpbmF0aW5nIGF0IGludGVsX2lvbW11X21hcF9w
YWdlKCkpLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT4KClJldmlld2VkLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgoK
PiAKPiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvaW9tbXUuYwo+ICsrKyBiL3hl
bi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5jCj4gQEAgLTE4NzAsNyArMTg3MCw3IEBA
IHN0YXRpYyBpbnQgaW50ZWxfaW9tbXVfbG9va3VwX3BhZ2Uoc3RydWMKPiAgICAgIGlmICggIXBn
X21hZGRyICkKPiAgICAgIHsKPiAgICAgICAgICBzcGluX3VubG9jaygmaGQtPmFyY2gubWFwcGlu
Z19sb2NrKTsKPiAtICAgICAgICByZXR1cm4gLUVOT01FTTsKPiArICAgICAgICByZXR1cm4gLUVO
T0VOVDsKPiAgICAgIH0KPiAKPiAgICAgIHBhZ2UgPSBtYXBfdnRkX2RvbWFpbl9wYWdlKHBnX21h
ZGRyKTsKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

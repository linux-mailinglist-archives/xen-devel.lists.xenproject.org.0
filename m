Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7F37B379
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 21:45:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsY1s-0001XZ-0v; Tue, 30 Jul 2019 19:43:24 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7c++=V3=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hsY1q-0001XU-Bn
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 19:43:22 +0000
X-Inumbo-ID: 492bbb43-b302-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 492bbb43-b302-11e9-8980-bc764e045a96;
 Tue, 30 Jul 2019 19:43:21 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7784220659;
 Tue, 30 Jul 2019 19:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564515800;
 bh=P4ZUrObn9giS+2LVUbGcxSvTsa8BupoWWwYpWKexv1g=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=2aOidFAuZmGqAzHUxWlWwqSdGz1SxRBijkkBoAFuQRRzBqOUGv+d5DiUVvS0NCSfH
 1zcWn2THv9ysDTKS2DPIi0vS8/J7UoyyP0weAdv/HTVp2wmxYI4beFSMFsxXApE5Zn
 GtA9Me9Idwy5opw802zZj8YwBOcw+zhtCqPP9Bwc=
Date: Tue, 30 Jul 2019 12:43:19 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190722213958.5761-24-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1907301243080.28600@sstabellini-ThinkPad-T480s>
References: <20190722213958.5761-1-julien.grall@arm.com>
 <20190722213958.5761-24-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 23/35] xen/arm32: head: Introduce
 print_reg
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAyMiBKdWwgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEF0IHRoZSBtb21lbnQs
IHRoZSB1c2VyIHNob3VsZCBzYXZlIHIxNC9sciBpZiBpdCBjYXJlcyBhYm91dCBpdC4KPiAKPiBG
b2xsb3ctdXAgcGF0Y2hlcyB3aWxsIGludHJvZHVjZSBtb3JlIHVzZSBvZiBwdXRuIGluIHBsYWNl
IHdoZXJlIGxyCj4gc2hvdWxkIGJlIHByZXNlcnZlZC4KPiAKPiBGdXJ0aGVybW9yZSwgYW55IHVz
ZXIgb2YgcHV0biBzaG91bGQgYWxzbyBtb3ZlIHRoZSB2YWx1ZSB0byByZWdpc3RlciByMAo+IGlm
IGl0IHdhcyBzdG9yZWQgaW4gYSBkaWZmZXJlbnQgcmVnaXN0ZXIuCj4gCj4gRm9yIGNvbnZlbmll
bmNlLCBhIG5ldyBtYWNybyBpcyBpbnRyb2R1Y2VkIHRvIHByaW50IGEgZ2l2ZW4gcmVnaXN0ZXIu
Cj4gVGhlIG1hY3JvIHdpbGwgdGFrZSBjYXJlIGZvciB1cyB0byBtb3ZlIHRoZSB2YWx1ZSB0byBy
MCBhbmQgYWxzbwo+IHByZXNlcnZlIGxyLgo+IAo+IExhc3RseSB0aGUgbmV3IG1hY3JvIGlzIHVz
ZWQgdG8gcmVwbGFjZSBhbGwgdGhlIGNhbGxzaXRlIG9mIHB1dG4uIFRoaXMKPiB3aWxsIHNpbXBs
aWZ5IHJld29yay9yZXZpZXcgbGF0ZXIgb24uCj4gCj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdy
YWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KClJldmlld2VkLWJ5OiBTdGVmYW5vIFN0YWJlbGxp
bmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CgoKPiAtLS0KPiAgICAgQ2hhbmdlcyBpbiB2MjoK
PiAgICAgICAgIC0gUGF0Y2ggYWRkZWQKPiAtLS0KPiAgeGVuL2FyY2gvYXJtL2FybTMyL2hlYWQu
UyB8IDIzICsrKysrKysrKysrKysrKysrKystLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxOSBpbnNl
cnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0v
YXJtMzIvaGVhZC5TIGIveGVuL2FyY2gvYXJtL2FybTMyL2hlYWQuUwo+IGluZGV4IDEzNGMzZGRh
OTIuLmJiY2ZkY2QzNTEgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gvYXJtL2FybTMyL2hlYWQuUwo+
ICsrKyBiL3hlbi9hcmNoL2FybS9hcm0zMi9oZWFkLlMKPiBAQCAtNzksOCArNzksMjUgQEAKPiAg
OTg6ICAgICAuYXNjaXogX3MgICAgICAgICAgO1wKPiAgICAgICAgICAuYWxpZ24gMiAgICAgICAg
ICAgO1wKPiAgOTk6Cj4gKwo+ICsvKgo+ICsgKiBNYWNybyB0byBwcmludCB0aGUgdmFsdWUgb2Yg
cmVnaXN0ZXIgXHJiCj4gKyAqCj4gKyAqIENsb2JiZXJzIHIwIC0gcjQKPiArICovCj4gKy5tYWNy
byBwcmludF9yZWcgcmIKPiArICAgICAgICBtb3YgICByMCwgXHJiCj4gKyAgICAgICAgbW92ICAg
cjQsIGxyCj4gKyAgICAgICAgYmwgICAgcHV0bgo+ICsgICAgICAgIG1vdiAgIGxyLCByNAo+ICsu
ZW5kbQo+ICsKPiAgI2Vsc2UgLyogQ09ORklHX0VBUkxZX1BSSU5USyAqLwo+ICAjZGVmaW5lIFBS
SU5UKHMpCj4gKwo+ICsubWFjcm8gcHJpbnRfcmVnIHJiCj4gKy5lbmRtCj4gKwo+ICAjZW5kaWYg
LyogIUNPTkZJR19FQVJMWV9QUklOVEsgKi8KPiAgCj4gICAgICAgICAgLmFybQo+IEBAIC0xNTks
OCArMTc2LDcgQEAgR0xPQkFMKGluaXRfc2Vjb25kYXJ5KQo+ICAjaWZkZWYgQ09ORklHX0VBUkxZ
X1BSSU5USwo+ICAgICAgICAgIG1vdl93IHIxMSwgRUFSTFlfVUFSVF9CQVNFX0FERFJFU1MgICAv
KiByMTEgOj0gVUFSVCBiYXNlIGFkZHJlc3MgKi8KPiAgICAgICAgICBQUklOVCgiLSBDUFUgIikK
PiAtICAgICAgICBtb3YgICByMCwgcjcKPiAtICAgICAgICBibCAgICBwdXRuCj4gKyAgICAgICAg
cHJpbnRfcmVnIHI3Cj4gICAgICAgICAgUFJJTlQoIiBib290aW5nIC1cclxuIikKPiAgI2VuZGlm
Cj4gIAo+IEBAIC0yMTEsOCArMjI3LDcgQEAgc2tpcF9ic3M6Cj4gICAgICAgICAgYm5lICAgMWYK
PiAgICAgICAgICBtb3YgICByNCwgcjAKPiAgICAgICAgICBQUklOVCgiLSBNaXNzaW5nIHByb2Nl
c3NvciBpbmZvOiAiKQo+IC0gICAgICAgIG1vdiAgIHIwLCByNAo+IC0gICAgICAgIGJsICAgIHB1
dG4KPiArICAgICAgICBwcmludF9yZWcgcjQKPiAgICAgICAgICBQUklOVCgiIC1cclxuIikKPiAg
ICAgICAgICBiICAgICBmYWlsCj4gIDE6Cj4gLS0gCj4gMi4xMS4wCj4gCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

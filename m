Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2BE46B82
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2019 23:06:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbtMB-0001Ud-1U; Fri, 14 Jun 2019 21:03:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PuWx=UN=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hbtM9-0001UM-6V
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2019 21:03:29 +0000
X-Inumbo-ID: db1e1d1e-8ee7-11e9-9f5b-bbbdb671a69a
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id db1e1d1e-8ee7-11e9-9f5b-bbbdb671a69a;
 Fri, 14 Jun 2019 21:03:28 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 299F1217F9;
 Fri, 14 Jun 2019 21:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560546207;
 bh=WwWPo2rMDCIa7kcw2c3REwPA/f0icENOefgmO/uVFOs=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=A6PFWCOCogHYKOOMSJXuPtgEqZNzcpgzMhyM3okkCavR9ptImEWIpJit2a9NF0vWL
 BwYXG8/giF4WNPnGfEHRAPw7A6MlSjQm2Qli7DnBtrlNLeKwfYnETfZ8Pr9XpaPcBw
 RDCtLc8GPTgHUFWmf2gYUkhrsl5UMX/wH3A5446Q=
Date: Fri, 14 Jun 2019 14:03:26 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190614175144.20046-3-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1906141403180.2072@sstabellini-ThinkPad-T480s>
References: <20190614175144.20046-1-julien.grall@arm.com>
 <20190614175144.20046-3-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH MM-PART3 v3 2/9] xen/arm: mm: Introduce
 _PAGE_PRESENT and _PAGE_POPULATE
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
 Andrii Anisov <andrii_anisov@epam.com>, Oleksandr_Tyshchenko@epam.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCAxNCBKdW4gMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEF0IHRoZSBtb21lbnQs
IHRoZSBmbGFncyBhcmUgbm90IGVub3VnaCB0byBkZXNjcmliZSB3aGF0IGtpbmQgb2YgdXBkYXRl
Cj4gd2lsbCBkb25lIG9uIHRoZSBWQSByYW5nZS4gVGhleSBuZWVkIHRvIGJlIHVzZWQgaW4gY29u
anVuY3Rpb24gd2l0aCB0aGUKPiBlbnVtIHhlbm1hcF9vcGVyYXRpb24uCj4gCj4gSXQgd291bGQg
YmUgbW9yZSBjb252ZW5pZW50IHRvIGhhdmUgYWxsIHRoZSBpbmZvcm1hdGlvbiBmb3IgdGhlIHVw
ZGF0ZQo+IGluIGEgc2luZ2xlIHBsYWNlLgo+IAo+IFR3byBuZXcgZmxhZ3MgYXJlIGFkZGVkIHRv
IHJlbW92ZSB0aGUgcmVsaWVuY2Ugb24geGVubWFwX29wZXJhdGlvbjoKPiAgICAgLSBfUEFHRV9Q
UkVTRU5UOiBJbmRpY2F0ZSB3aGV0aGVyIHdlIGFyZSBhZGRpbmcvcmVtb3ZpbmcgdGhlIG1hcHBp
bmcKPiAgICAgLSBfUEFHRV9QT1BVTEFURTogSW5kaWNhdGUgd2hldGhlciB3ZSBvbmx5IHBvcHVs
YXRlIHBhZ2UtdGFibGVzCj4gCj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4u
Z3JhbGxAYXJtLmNvbT4KPiBSZXZpZXdlZC1ieTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNv
dkBlcGFtLmNvbT4KClJldmlld2VkLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5p
QGtlcm5lbC5vcmc+CgoKPiAtLS0KPiAgICAgQ2hhbmdlcyBpbiB2MzoKPiAgICAgICAgIC0gQ2xh
cmlmeSB0aGUgZGVzY3JpcHRpb24gb2YgdGhlIG5ldyBmbGFncwo+IAo+ICAgICBDaGFuZ2VzIGlu
IHYyOgo+ICAgICAgICAgLSBBZGQgQW5kcmlpJ3MgcmV2aWV3ZWQtYnkKPiAtLS0KPiAgeGVuL2Fy
Y2gvYXJtL21tLmMgICAgICAgICAgfCAyICstCj4gIHhlbi9pbmNsdWRlL2FzbS1hcm0vcGFnZS5o
IHwgOSArKysrKysrLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDMgZGVs
ZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9tbS5jIGIveGVuL2FyY2gv
YXJtL21tLmMKPiBpbmRleCAyM2U5NTY1ZGRjLi5iMTNkOWFkZjQwIDEwMDY0NAo+IC0tLSBhL3hl
bi9hcmNoL2FybS9tbS5jCj4gKysrIGIveGVuL2FyY2gvYXJtL21tLmMKPiBAQCAtMTA1Niw3ICsx
MDU2LDcgQEAgaW50IG1hcF9wYWdlc190b194ZW4odW5zaWduZWQgbG9uZyB2aXJ0LAo+ICAKPiAg
aW50IHBvcHVsYXRlX3B0X3JhbmdlKHVuc2lnbmVkIGxvbmcgdmlydCwgdW5zaWduZWQgbG9uZyBu
cl9tZm5zKQo+ICB7Cj4gLSAgICByZXR1cm4geGVuX3B0X3VwZGF0ZShSRVNFUlZFLCB2aXJ0LCBJ
TlZBTElEX01GTiwgbnJfbWZucywgMCk7Cj4gKyAgICByZXR1cm4geGVuX3B0X3VwZGF0ZShSRVNF
UlZFLCB2aXJ0LCBJTlZBTElEX01GTiwgbnJfbWZucywgX1BBR0VfUE9QVUxBVEUpOwo+ICB9Cj4g
IAo+ICBpbnQgZGVzdHJveV94ZW5fbWFwcGluZ3ModW5zaWduZWQgbG9uZyB2LCB1bnNpZ25lZCBs
b25nIGUpCj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vcGFnZS5oIGIveGVuL2lu
Y2x1ZGUvYXNtLWFybS9wYWdlLmgKPiBpbmRleCAyYmNkYjBmMWE1Li4zN2UxZDlhYWRiIDEwMDY0
NAo+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vcGFnZS5oCj4gKysrIGIveGVuL2luY2x1ZGUv
YXNtLWFybS9wYWdlLmgKPiBAQCAtNzYsNiArNzYsOCBAQAo+ICAgKgo+ICAgKiBbMDoyXSBNZW1v
cnkgQXR0cmlidXRlIEluZGV4Cj4gICAqIFszOjRdIFBlcm1pc3Npb24gZmxhZ3MKPiArICogWzVd
ICAgUGFnZSBwcmVzZW50Cj4gKyAqIFs2XSAgIE9ubHkgcG9wdWxhdGUgcGFnZSB0YWJsZXMKPiAg
ICovCj4gICNkZWZpbmUgUEFHRV9BSV9NQVNLKHgpICgoeCkgJiAweDdVKQo+ICAKPiBAQCAtODYs
MTIgKzg4LDE1IEBACj4gICNkZWZpbmUgUEFHRV9YTl9NQVNLKHgpICgoKHgpID4+IF9QQUdFX1hO
X0JJVCkgJiAweDFVKQo+ICAjZGVmaW5lIFBBR0VfUk9fTUFTSyh4KSAoKCh4KSA+PiBfUEFHRV9S
T19CSVQpICYgMHgxVSkKPiAgCj4gKyNkZWZpbmUgX1BBR0VfUFJFU0VOVCAgICAoMVUgPDwgNSkK
PiArI2RlZmluZSBfUEFHRV9QT1BVTEFURSAgICgxVSA8PCA2KQo+ICsKPiAgLyoKPiAgICogX1BB
R0VfREVWSUNFIGFuZCBfUEFHRV9OT1JNQUwgYXJlIGNvbnZlbmllbmNlIGRlZmluZXMuIFRoZXkg
YXJlIG5vdAo+ICAgKiBtZWFudCB0byBiZSB1c2VkIG91dHNpZGUgb2YgdGhpcyBoZWFkZXIuCj4g
ICAqLwo+IC0jZGVmaW5lIF9QQUdFX0RFVklDRSAgICBfUEFHRV9YTgo+IC0jZGVmaW5lIF9QQUdF
X05PUk1BTCAgICBNVF9OT1JNQUwKPiArI2RlZmluZSBfUEFHRV9ERVZJQ0UgICAgKF9QQUdFX1hO
fF9QQUdFX1BSRVNFTlQpCj4gKyNkZWZpbmUgX1BBR0VfTk9STUFMICAgIChNVF9OT1JNQUx8X1BB
R0VfUFJFU0VOVCkKPiAgCj4gICNkZWZpbmUgUEFHRV9IWVBFUlZJU09SX1JPICAgICAgKF9QQUdF
X05PUk1BTHxfUEFHRV9ST3xfUEFHRV9YTikKPiAgI2RlZmluZSBQQUdFX0hZUEVSVklTT1JfUlgg
ICAgICAoX1BBR0VfTk9STUFMfF9QQUdFX1JPKQo+IC0tIAo+IDIuMTEuMAo+IAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

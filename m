Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EBC6131E2
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2019 18:12:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMakt-0001ZB-5j; Fri, 03 May 2019 16:09:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Vigr=TD=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hMakr-0001Z6-7H
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 16:09:45 +0000
X-Inumbo-ID: dbeac42c-6dbd-11e9-8ed7-3357d55a7f04
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id dbeac42c-6dbd-11e9-8ed7-3357d55a7f04;
 Fri, 03 May 2019 16:09:41 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 75D77374;
 Fri,  3 May 2019 09:09:41 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7B2163F557;
 Fri,  3 May 2019 09:09:40 -0700 (PDT)
To: Andrii Anisov <andrii.anisov@gmail.com>, xen-devel@lists.xenproject.org
References: <20190422164937.21350-1-julien.grall@arm.com>
 <20190422164937.21350-4-julien.grall@arm.com>
 <450df8f5-676d-9b1d-814a-1888342bdacf@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <a37467fd-d9b0-f8e4-e211-6e6160df645d@arm.com>
Date: Fri, 3 May 2019 17:09:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <450df8f5-676d-9b1d-814a-1888342bdacf@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 03/20] xen/arm: processor: Use _BITUL
 instead of _AC(1, U) in SCTLR_ defines
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
Cc: Oleksandr_Tyshchenko@epam.com, sstabellini@kernel.org,
 Andrii_Anisov@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAwMy8wNS8yMDE5IDE2OjU2LCBBbmRyaWkgQW5pc292IHdyb3RlOgo+IEhlbGxvIEp1bGll
biwKPiAKPiBPbiAyMi4wNC4xOSAxOTo0OSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBUaGUgbmV3
bHkgaW50cm9kdWNlZCBtYWNybyBfQklUVUwgbWFrZXMgdGhlIGNvZGUgbW9yZSByZWFkYWJsZS4K
Pj4KPj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4K
Pj4gLS0tCj4+IMKgIHhlbi9pbmNsdWRlL2FzbS1hcm0vcHJvY2Vzc29yLmggfCAxOCArKysrKysr
KystLS0tLS0tLS0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgOSBkZWxl
dGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vcHJvY2Vzc29y
LmggYi94ZW4vaW5jbHVkZS9hc20tYXJtL3Byb2Nlc3Nvci5oCj4+IGluZGV4IGM2ZjU2NDkwYjMu
LjFhMTQzZmI2YTMgMTAwNjQ0Cj4+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vcHJvY2Vzc29y
LmgKPj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLWFybS9wcm9jZXNzb3IuaAo+PiBAQCAtMTE1LDIw
ICsxMTUsMjAgQEAKPj4gwqAgLyogQml0cyBzcGVjaWZpYyB0byBTQ1RMUl9FTDEgZm9yIEFybTMy
ICovCj4+IC0jZGVmaW5lIFNDVExSX0EzMl9FTDFfVsKgwqDCoMKgIChfQUMoMSxVKTw8MTMpCj4+
ICsjZGVmaW5lIFNDVExSX0EzMl9FTDFfVsKgwqDCoMKgIF9CSVRVTCgxMykKPj4gwqAgLyogQ29t
bW9uIGJpdHMgZm9yIFNDVExSX0VMeCBmb3IgQXJtMzIgKi8KPj4gLSNkZWZpbmUgU0NUTFJfQTMy
X0VMeF9URcKgwqDCoCAoX0FDKDEsVSk8PDMwKQo+PiAtI2RlZmluZSBTQ1RMUl9BMzJfRUx4X0ZJ
wqDCoMKgIChfQUMoMSxVKTw8MjEpCj4+ICsjZGVmaW5lIFNDVExSX0EzMl9FTHhfVEXCoMKgwqAg
X0JJVFVMKDMwKQo+PiArI2RlZmluZSBTQ1RMUl9BMzJfRUx4X0ZJwqDCoMKgIF9CSVRVTCgyMSkK
Pj4gwqAgLyogQ29tbW9uIGJpdHMgZm9yIFNDVExSX0VMeCBvbiBhbGwgYXJjaGl0ZWN0dXJlcyAq
Lwo+PiAtI2RlZmluZSBTQ1RMUl9BeHhfRUx4X0VFwqDCoMKgIChfQUMoMSxVKTw8MjUpCj4+IC0j
ZGVmaW5lIFNDVExSX0F4eF9FTHhfV1hOwqDCoCAoX0FDKDEsVSk8PDE5KQo+PiAtI2RlZmluZSBT
Q1RMUl9BeHhfRUx4X0nCoMKgwqDCoCAoX0FDKDEsVSk8PDEyKQo+PiAtI2RlZmluZSBTQ1RMUl9B
eHhfRUx4X0PCoMKgwqDCoCAoX0FDKDEsVSk8PDIpCj4+IC0jZGVmaW5lIFNDVExSX0F4eF9FTHhf
QcKgwqDCoMKgIChfQUMoMSxVKTw8MSkKPj4gLSNkZWZpbmUgU0NUTFJfQXh4X0VMeF9NwqDCoMKg
wqAgKF9BQygxLFUpPDwwKQo+PiArI2RlZmluZSBTQ1RMUl9BeHhfRUx4X0VFwqDCoMKgIF9CSVRV
TCgyNSkKPj4gKyNkZWZpbmUgU0NUTFJfQXh4X0VMeF9XWE7CoMKgIF9CSVRVTCgxOSkKPj4gKyNk
ZWZpbmUgU0NUTFJfQXh4X0VMeF9JwqDCoMKgwqAgX0JJVFVMKDEyKQo+PiArI2RlZmluZSBTQ1RM
Ul9BeHhfRUx4X0PCoMKgwqDCoCBfQklUVUwoMikKPj4gKyNkZWZpbmUgU0NUTFJfQXh4X0VMeF9B
wqDCoMKgwqAgX0JJVFVMKDEpCj4+ICsjZGVmaW5lIFNDVExSX0F4eF9FTHhfTcKgwqDCoMKgIF9C
SVRVTCgwKQo+PiDCoCAjZGVmaW5lIEhTQ1RMUl9CQVNFwqDCoMKgwqAgX0FDKDB4MzBjNTE4Nzgs
VSkKPj4KPiAKPiBSZXNvbHV0aW9uIG9mIHRoZSBkaXNwdXRlIHdpdGggSmFuIGFib3V0IFtQQVRD
SCAwMS8yMF0gaXMgcmVxdWlyZWQgZmlyc3QuCgpJIGRvbid0IHVuZGVyc3RhbmQgd2hhdCBpcyB5
b3VyICJzZWNvbmQiLiBEb2VzIGl0IG1lYW4geW91IGFyZSBoYXBweSB3aXRoIHRoZSAKaWRlYSBv
ZiB0aGUgcGF0Y2ggYnV0IHdlIHNob3VsZCBhZ3JlZSBvbiB0aGUgbmFtaW5nIGZpcnN0PwoKQ2hl
ZXJzLAoKPiAKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=

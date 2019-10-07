Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40FAACDEA7
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2019 12:04:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHPpZ-0004IL-Hk; Mon, 07 Oct 2019 10:01:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Xf97=YA=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iHPpX-0004IG-HB
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2019 10:01:27 +0000
X-Inumbo-ID: 6c88bb79-e8e9-11e9-97aa-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 6c88bb79-e8e9-11e9-97aa-12813bfff9fa;
 Mon, 07 Oct 2019 10:01:25 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8A31215BE;
 Mon,  7 Oct 2019 03:01:25 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BAC173F68E;
 Mon,  7 Oct 2019 03:01:24 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.21.1910041601170.30844@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <a65639bc-cae9-85d2-f33c-40dd8e24f6b7@arm.com>
Date: Mon, 7 Oct 2019 11:01:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1910041601170.30844@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13] xen/arm: fix duplicate memory node
 in DT
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
Cc: jgross@suse.com, oleksandr_tyshchenko@epam.com, julien@xen.org,
 Volodymyr_Babchuk@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAwNS8xMC8yMDE5IDAwOjA5LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gV2hl
biByZXNlcnZlZC1tZW1vcnkgcmVnaW9ucyBhcmUgcHJlc2VudCBpbiB0aGUgaG9zdCBkZXZpY2Ug
dHJlZSwgZG9tMAo+IGlzIHN0YXJ0ZWQgd2l0aCBtdWx0aXBsZSBtZW1vcnkgbm9kZXMuIEVhY2gg
bWVtb3J5IG5vZGUgc2hvdWxkIGhhdmUgYQo+IHVuaXF1ZSBuYW1lLCBidXQgdG9kYXkgdGhleSBh
cmUgYWxsIGNhbGxlZCAibWVtb3J5IiBsZWFkaW5nIHRvIExpbnV4Cj4gcHJpbnRpbmcgdGhlIGZv
bGxvd2luZyB3YXJuaW5nIGF0IGJvb3Q6Cj4gCj4gICAgT0Y6IER1cGxpY2F0ZSBuYW1lIGluIGJh
c2UsIHJlbmFtZWQgdG8gIm1lbW9yeSMxIgo+IAo+IFRoaXMgcGF0Y2ggZml4ZXMgdGhlIHByb2Js
ZW0gYnkgYXBwZW5kaW5nIGEgIkA8dW5pdC1hZGRyZXNzPiIgdG8gdGhlCj4gbmFtZSwgYXMgcGVy
IHRoZSBEZXZpY2UgVHJlZSBzcGVjaWZpY2F0aW9uLCB3aGVyZSA8dW5pdC1hZGRyZXNzPiBtYXRj
aGVzCj4gdGhlIGJhc2Ugb2YgYWRkcmVzcyBvZiB0aGUgZmlyc3QgcmVnaW9uLgo+IAo+IFJlcG9y
dGVkLWJ5OiBPbGVrc2FuZHIgVHlzaGNoZW5rbyA8b2xla3NhbmRyX3R5c2hjaGVua29AZXBhbS5j
b20+Cj4gU2lnbmVkLW9mZi1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzdGVmYW5vLnN0YWJlbGxp
bmlAeGlsaW54LmNvbT4KPiAKPiAtLS0KPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2Rv
bWFpbl9idWlsZC5jIGIveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jCj4gaW5kZXggOTIxYjA1
NDUyMC4uYTRjMDdkYjM4MyAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxk
LmMKPiArKysgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMKPiBAQCAtNjQ2LDE2ICs2NDYs
MjIgQEAgc3RhdGljIGludCBfX2luaXQgbWFrZV9tZW1vcnlfbm9kZShjb25zdCBzdHJ1Y3QgZG9t
YWluICpkLAo+ICAgICAgIGludCByZXMsIGk7Cj4gICAgICAgaW50IHJlZ19zaXplID0gYWRkcmNl
bGxzICsgc2l6ZWNlbGxzOwo+ICAgICAgIGludCBucl9jZWxscyA9IHJlZ19zaXplICogbWVtLT5u
cl9iYW5rczsKPiArICAgIC8qIFBsYWNlaG9sZGVyIGZvciBtZW1vcnlAICsgYSAzMi1iaXQgbnVt
YmVyICsgXDAgKi8KPiArICAgIGNoYXIgYnVmWzE4XTsKPiAgICAgICBfX2JlMzIgcmVnW05SX01F
TV9CQU5LUyAqIDQgLyogV29yc3QgY2FzZSBhZGRyY2VsbHMgKyBzaXplY2VsbHMgKi9dOwo+ICAg
ICAgIF9fYmUzMiAqY2VsbHM7Cj4gICAKPiAgICAgICBCVUdfT04obnJfY2VsbHMgPj0gQVJSQVlf
U0laRShyZWcpKTsKPiArICAgIC8qIE5vdGhpbmcgdG8gZG8gKi8KClRoaXMgYSBkZXBhcnR1cmUg
ZnJvbSB0aGUgY3VycmVudCBzb2x1dGlvbiB3aGVyZSBhIG5vZGUgd2lsbCBiZSBjcmVhdGVkIHdp
dGggbm8gCiJyZWciIHByb3BlcnR5LiBJIHRoaW5rIHRoaXMgY2hhbmdlIG9mIGJlaGF2aW9yIHNo
b3VsZCBhdCBsZWFzdCBiZSBkZXNjcmliZWQgaW4gCnRoZSBjb21taXQgbWVzc2FnZSBpZiBub3Qg
aW1wbGVtZW50ZWQgaW4gYSBzZXBhcmF0ZSBwYXRjaC4gQnV0Li4uCgo+ICsgICAgaWYgKCBtZW0t
Pm5yX2JhbmtzID09IDAgKQo+ICsgICAgICAgIHJldHVybiAwOwoKLi4uIEkgZG9uJ3QgdGhpbmsg
d2Ugd2FudCB0byBpZ25vcmUgaXQuIFRoZSBjYWxsZXIgbW9zdCBsaWtlbHkgbWVzc2VkIHVwIHRo
ZSAKYmFua3MgYW5kIHdlIHNob3VsZCBpbnN0ZWFkIHJlcG9ydCBhbiBlcnJvci4KCj4gICAKPiAg
ICAgICBkdF9kcHJpbnRrKCJDcmVhdGUgbWVtb3J5IG5vZGUgKHJlZyBzaXplICVkLCBuciBjZWxs
cyAlZClcbiIsCj4gICAgICAgICAgICAgICAgICByZWdfc2l6ZSwgbnJfY2VsbHMpOwo+ICAgCj4g
ICAgICAgLyogZVBBUFIgMy40ICovCj4gLSAgICByZXMgPSBmZHRfYmVnaW5fbm9kZShmZHQsICJt
ZW1vcnkiKTsKPiArICAgIHNucHJpbnRmKGJ1Ziwgc2l6ZW9mKGJ1ZiksICJtZW1vcnlAJSJQUkl4
NjQsIG1lbS0+YmFua1swXS5zdGFydCk7Cj4gKyAgICByZXMgPSBmZHRfYmVnaW5fbm9kZShmZHQs
IGJ1Zik7Cj4gICAgICAgaWYgKCByZXMgKQo+ICAgICAgICAgICByZXR1cm4gcmVzOwo+ICAgCj4g
CgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs

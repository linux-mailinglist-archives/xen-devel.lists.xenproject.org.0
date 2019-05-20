Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B3F243C8
	for <lists+xen-devel@lfdr.de>; Tue, 21 May 2019 00:58:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hSrCl-0005L4-Er; Mon, 20 May 2019 22:56:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rume=TU=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hSrCj-0005Ks-SN
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 22:56:25 +0000
X-Inumbo-ID: 7df24a46-7b52-11e9-b214-1b98b921fa90
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7df24a46-7b52-11e9-b214-1b98b921fa90;
 Mon, 20 May 2019 22:56:24 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C09E421479;
 Mon, 20 May 2019 22:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558392984;
 bh=WerLf84LCJJjfyKNbAoUy+IPF9cdZhgbhI/cVhViv5M=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=I7R0wZgQ6u1J/gXigCTKylgEd96hPpJ9Ul5XMeXXI0OQBYrqCaj3YQbL0d/C/++6D
 BbxahcavaYSRtZIsxNuQyK7RrPgR5U33OicDSHOe3z8dxFVSqCe+Bvn7NbrOyLXjvY
 yXxreE9dJVMDZU4H5Bxitb7u3SxK1WiawajiIyP0=
Date: Mon, 20 May 2019 15:56:23 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190514122456.28559-7-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1905201527460.16404@sstabellini-ThinkPad-T480s>
References: <20190514122456.28559-1-julien.grall@arm.com>
 <20190514122456.28559-7-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH MM-PART2 RESEND v2 06/19] xen/arm: Rework
 secondary_start prototype
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
 Andrii_Anisov@epam.com, Oleksandr_Tyshchenko@epam.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCAxNCBNYXkgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IE5vbmUgb2YgdGhlIHBh
cmFtZXRlcnMgb2Ygc2Vjb25kYXJ5X3N0YXJ0IGFyZSBhY3R1YWxseSB1c2VkLiBTbyB0dXJuCj4g
c2Vjb25kYXJ5X3N0YXJ0IHRvIGEgZnVuY3Rpb24gd2l0aCBubyBwYXJhbWV0ZXJzLgo+IAo+IEFs
c28gbW9kaWZ5IHRoZSBhc3NlbWJseSBjb2RlIHRvIGF2b2lkIHNldHRpbmctdXAgdGhlIHJlZ2lz
dGVycyBiZWZvcmUKPiBjYWxsaW5nIHNlY29uZGFyeV9zdGFydC4KCkl0IGlzIGNhbGxlZCAic3Rh
cnRfc2Vjb25kYXJ5IiByYXRoZXIgdGhhbiAic2Vjb25kYXJ5X3N0YXJ0Ii4gUGxlYXNlIGZpeAp0
aGUgY29tbWl0IG1lc3NhZ2UuIFRoZW4geW91IGNhbiBhZGQKClJldmlld2VkLWJ5OiBTdGVmYW5v
IFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CgoKPiBTaWduZWQtb2ZmLWJ5OiBK
dWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+IAo+ICAgICAtIFJlLW9yZGVyIHRo
ZSBwYXRjaCB3aXRoICJ4ZW4vYXJtOiBSZW1vdmUgcGFyYW1ldGVyIGNwdWlkIGZyb20KPiAgICAg
c3RhcnRfeGVuIi4KPiAtLS0KPiAgeGVuL2FyY2gvYXJtL2FybTMyL2hlYWQuUyB8IDQgKystLQo+
ICB4ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TIHwgMyArKy0KPiAgeGVuL2FyY2gvYXJtL3NtcGJv
b3QuYyAgICB8IDQgKy0tLQo+ICAzIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNiBk
ZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2FybTMyL2hlYWQuUyBi
L3hlbi9hcmNoL2FybS9hcm0zMi9oZWFkLlMKPiBpbmRleCBjYjhhM2JmODI5Li45ZjQwZmFjZTk4
IDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL2FybS9hcm0zMi9oZWFkLlMKPiArKysgYi94ZW4vYXJj
aC9hcm0vYXJtMzIvaGVhZC5TCj4gQEAgLTQ0NSw5ICs0NDUsOSBAQCBsYXVuY2g6Cj4gICAgICAg
ICAgbGRyICAgc3AsIFtyMF0KPiAgICAgICAgICBhZGQgICBzcCwgI1NUQUNLX1NJWkUgICAgICAg
IC8qICh3aGljaCBncm93cyBkb3duIGZyb20gdGhlIHRvcCkuICovCj4gICAgICAgICAgc3ViICAg
c3AsICNDUFVJTkZPX3NpemVvZiAgICAvKiBNYWtlIHJvb20gZm9yIENQVSBzYXZlIHJlY29yZCAq
Lwo+IC0gICAgICAgIG1vdiAgIHIwLCByMTAgICAgICAgICAgICAgICAgLyogTWFyc2hhbCBhcmdz
OiAtIHBoeXNfb2Zmc2V0ICovCj4gLSAgICAgICAgbW92ICAgcjEsIHI4ICAgICAgICAgICAgICAg
ICAvKiAgICAgICAgICAgICAgIC0gRFRCIGFkZHJlc3MgKi8KPiAgICAgICAgICB0ZXEgICByMTIs
ICMwCj4gKyAgICAgICAgbW92ZXEgcjAsIHIxMCAgICAgICAgICAgICAgICAvKiBNYXJzaGFsIGFy
Z3M6IC0gcGh5c19vZmZzZXQgKi8KPiArICAgICAgICBtb3ZlcSByMSwgcjggICAgICAgICAgICAg
ICAgIC8qICAgICAgICAgICAgICAgLSBEVEIgYWRkcmVzcyAqLwo+ICAgICAgICAgIGJlcSAgIHN0
YXJ0X3hlbiAgICAgICAgICAgICAgLyogYW5kIGRpc2FwcGVhciBpbnRvIHRoZSBsYW5kIG9mIEMg
Ki8KPiAgICAgICAgICBiICAgICBzdGFydF9zZWNvbmRhcnkgICAgICAgIC8qICh0byB0aGUgYXBw
cm9wcmlhdGUgZW50cnkgcG9pbnQpICovCj4gIAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0v
YXJtNjQvaGVhZC5TIGIveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUwo+IGluZGV4IDA3NTAxMzg3
OGUuLmNiMzBkNmYyMmUgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUwo+
ICsrKyBiL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMKPiBAQCAtNTgyLDkgKzU4MiwxMCBAQCBs
YXVuY2g6Cj4gICAgICAgICAgc3ViICAgeDAsIHgwLCAjQ1BVSU5GT19zaXplb2YgLyogTWFrZSBy
b29tIGZvciBDUFUgc2F2ZSByZWNvcmQgKi8KPiAgICAgICAgICBtb3YgICBzcCwgeDAKPiAgCj4g
KyAgICAgICAgY2JueiAgeDIyLCAxZgo+ICsKPiAgICAgICAgICBtb3YgICB4MCwgeDIwICAgICAg
ICAgICAgICAgIC8qIE1hcnNoYWwgYXJnczogLSBwaHlzX29mZnNldCAqLwo+ICAgICAgICAgIG1v
diAgIHgxLCB4MjEgICAgICAgICAgICAgICAgLyogICAgICAgICAgICAgICAtIEZEVCAqLwo+IC0g
ICAgICAgIGNibnogIHgyMiwgMWYKPiAgICAgICAgICBiICAgICBzdGFydF94ZW4gICAgICAgICAg
ICAgIC8qIGFuZCBkaXNhcHBlYXIgaW50byB0aGUgbGFuZCBvZiBDICovCj4gIDE6Cj4gICAgICAg
ICAgYiAgICAgc3RhcnRfc2Vjb25kYXJ5ICAgICAgICAvKiAodG8gdGhlIGFwcHJvcHJpYXRlIGVu
dHJ5IHBvaW50KSAqLwo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vc21wYm9vdC5jIGIveGVu
L2FyY2gvYXJtL3NtcGJvb3QuYwo+IGluZGV4IGY3NTY0NDQzNjIuLjAwYjY0YzMzMjIgMTAwNjQ0
Cj4gLS0tIGEveGVuL2FyY2gvYXJtL3NtcGJvb3QuYwo+ICsrKyBiL3hlbi9hcmNoL2FybS9zbXBi
b290LmMKPiBAQCAtMjk3LDkgKzI5Nyw3IEBAIHNtcF9wcmVwYXJlX2NwdXModm9pZCkKPiAgfQo+
ICAKPiAgLyogQm9vdCB0aGUgY3VycmVudCBDUFUgKi8KPiAtdm9pZCBzdGFydF9zZWNvbmRhcnko
dW5zaWduZWQgbG9uZyBib290X3BoeXNfb2Zmc2V0LAo+IC0gICAgICAgICAgICAgICAgICAgICB1
bnNpZ25lZCBsb25nIGZkdF9wYWRkciwKPiAtICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQg
bG9uZyBod2lkKQo+ICt2b2lkIHN0YXJ0X3NlY29uZGFyeSh2b2lkKQo+ICB7Cj4gICAgICB1bnNp
Z25lZCBpbnQgY3B1aWQgPSBpbml0X2RhdGEuY3B1aWQ7Cj4gIAo+IC0tIAo+IDIuMTEuMAo+IAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

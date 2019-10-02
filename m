Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E00FC9457
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2019 00:29:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFn5R-0001iS-Rd; Wed, 02 Oct 2019 22:27:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7bij=X3=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iFn5Q-0001i3-0H
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 22:27:08 +0000
X-Inumbo-ID: c46bff78-e563-11e9-971d-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by localhost (Halon) with ESMTPS
 id c46bff78-e563-11e9-971d-12813bfff9fa;
 Wed, 02 Oct 2019 22:27:07 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AF98C2133F;
 Wed,  2 Oct 2019 22:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1570055226;
 bh=mqoj3NAOX5lzxTEYLZo5WqBUgjG57I4qjLGF6bGQJjw=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=GSECymUWZLbHxOxw414oH9U+PvygZlWKgr1jrNp6cLZQLLb1inl19mFRLyIilmJOT
 x2MXibmBQHtLtZLs/Du+K1xlk0G74b53YHuFpa3f2MsKwJ21p06URKQpMlZLwN/Dzy
 1WRUHj/+/IicvnI/i2McXeciCfDIAnGxI+Ui6yMY=
Date: Wed, 2 Oct 2019 15:27:06 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190813213237.4819-1-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1910021508370.2691@sstabellini-ThinkPad-T480s>
References: <20190813213237.4819-1-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] xen/docs: arm: Update dom0less binding and
 example
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
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, viktor_mitin@epam.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCAxMyBBdWcgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFRoZSBiaW5kaW5nIGZv
ciB0aGUgZG9tMGxlc3MgbW9kdWxlIGRvZXMgbm90IG1hdGNoIFhlbiBpbXBsZW1lbnRhdGlvbi4K
PiBBbnkgbW9kdWxlIHNob3VsZCBjb250YWluIHRoZSBjb21wYXRpYmxlICJtdWx0aWJvb3QsbW9k
dWxlIiB0byBiZQo+IHJlY29nbml6ZWQuCj4gCj4gVGhpcyB3YXMgY2xlYXJseSBhbiBvdmVyc2ln
aHQgYXMgb3RoZXIgZXhhbXBsZXMgd2l0aCBYZW4gY29kZSBiYXNlCj4gcHJvdmlkZSB0aGUgY29t
cGF0aWJsZSAibXVsdGlib290LG1vZHVsZSIuCj4gCj4gU28gZml4IHRoZSBiaW5kaW5nIGFuZCB0
aGUgZXhhbXBsZSBhc3NvY2lhdGVkIHRvIGl0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBH
cmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgpZZXMhCgpSZXZpZXdlZC1ieTogU3RlZmFubyBT
dGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgoKPiAtLS0KPiAKPiBDYzogdmlrdG9y
X21pdGluQGVwYW0uY29tCj4gCj4gICAgIFdlIHByb2JhYmx5IHdhbnQgdG8gY29uc29saWRhdGUg
YWxsIHRoZSBkb20wbGVzcyBkb2N1bWVudGF0aW9uIGluCj4gICAgIG9uZSBwbGFjZSByYXRoZXIg
dGhhbiBoYXZpbmcgdG8gZml4IGRvY3VtYXRpb24gaXNzdWVzIGluIGEgbXVsdGlwbGUKPiAgICAg
cGxhY2VzIG9uZSBieSBvbmUuCj4gLS0tCj4gIGRvY3MvbWlzYy9hcm0vZGV2aWNlLXRyZWUvYm9v
dGluZy50eHQgfCAxMiArKysrKystLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9u
cygrKSwgNiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZG9jcy9taXNjL2FybS9kZXZp
Y2UtdHJlZS9ib290aW5nLnR4dCBiL2RvY3MvbWlzYy9hcm0vZGV2aWNlLXRyZWUvYm9vdGluZy50
eHQKPiBpbmRleCAzMTdhOWU5NjJhLi4wZmFmYTAxYjVkIDEwMDY0NAo+IC0tLSBhL2RvY3MvbWlz
Yy9hcm0vZGV2aWNlLXRyZWUvYm9vdGluZy50eHQKPiArKysgYi9kb2NzL21pc2MvYXJtL2Rldmlj
ZS10cmVlL2Jvb3RpbmcudHh0Cj4gQEAgLTE2MCw3ICsxNjAsNyBAQCBUaGUga2VybmVsIHN1Yi1u
b2RlIGhhcyB0aGUgZm9sbG93aW5nIHByb3BlcnRpZXM6Cj4gIAo+ICAtIGNvbXBhdGlibGUKPiAg
Cj4gLSAgICAibXVsdGlib290LGtlcm5lbCIKPiArICAgICJtdWx0aWJvb3Qsa2VybmVsIiwgIm11
bHRpYm9vdCxtb2R1bGUiCj4gIAo+ICAtIHJlZwo+ICAKPiBAQCAtMTc1LDcgKzE3NSw3IEBAIFRo
ZSByYW1kaXNrIHN1Yi1ub2RlIGhhcyB0aGUgZm9sbG93aW5nIHByb3BlcnRpZXM6Cj4gIAo+ICAt
IGNvbXBhdGlibGUKPiAgCj4gLSAgICAibXVsdGlib290LHJhbWRpc2siCj4gKyAgICAibXVsdGli
b290LHJhbWRpc2siLCAibXVsdGlib290LG1vZHVsZSIKPiAgCj4gIC0gcmVnCj4gIAo+IEBAIC0x
OTYsMTMgKzE5NiwxMyBAQCBjaG9zZW4gewo+ICAgICAgICAgIHZwbDAxMTsKPiAgCj4gICAgICAg
ICAgbW9kdWxlQDB4NGEwMDAwMDAgewo+IC0gICAgICAgICAgICBjb21wYXRpYmxlID0gIm11bHRp
Ym9vdCxrZXJuZWwiOwo+ICsgICAgICAgICAgICBjb21wYXRpYmxlID0gIm11bHRpYm9vdCxrZXJu
ZWwiLCAibXVsdGlib290LG1vZHVsZSI7Cj4gICAgICAgICAgICAgIHJlZyA9IDwweDAgMHg0YTAw
MDAwMCAweGZmZmZmZj47Cj4gICAgICAgICAgICAgIGJvb3RhcmdzID0gImNvbnNvbGU9dHR5QU1B
MCBpbml0PS9iaW4vc2giOwo+ICAgICAgICAgIH07Cj4gIAo+ICAgICAgICAgIG1vZHVsZUAweDRi
MDAwMDAwIHsKPiAtICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJtdWx0aWJvb3QscmFtZGlzayI7
Cj4gKyAgICAgICAgICAgIGNvbXBhdGlibGUgPSAibXVsdGlib290LHJhbWRpc2siLCAibXVsdGli
b290LG1vZHVsZSI7Cj4gICAgICAgICAgICAgIHJlZyA9IDwweDAgMHg0YjAwMDAwMCAweGZmZmZm
Zj47Cj4gICAgICAgICAgfTsKPiAgICAgIH07Cj4gQEAgLTIxNSwxMyArMjE1LDEzIEBAIGNob3Nl
biB7Cj4gICAgICAgICAgY3B1cyA9IDwxPjsKPiAgCj4gICAgICAgICAgbW9kdWxlQDB4NGMwMDAw
MDAgewo+IC0gICAgICAgICAgICBjb21wYXRpYmxlID0gIm11bHRpYm9vdCxrZXJuZWwiOwo+ICsg
ICAgICAgICAgICBjb21wYXRpYmxlID0gIm11bHRpYm9vdCxrZXJuZWwiLCAibXVsdGlib290LG1v
ZHVsZSI7Cj4gICAgICAgICAgICAgIHJlZyA9IDwweDAgMHg0YzAwMDAwMCAweGZmZmZmZj47Cj4g
ICAgICAgICAgICAgIGJvb3RhcmdzID0gImNvbnNvbGU9dHR5QU1BMCBpbml0PS9iaW4vc2giOwo+
ICAgICAgICAgIH07Cj4gIAo+ICAgICAgICAgIG1vZHVsZUAweDRkMDAwMDAwIHsKPiAtICAgICAg
ICAgICAgY29tcGF0aWJsZSA9ICJtdWx0aWJvb3QscmFtZGlzayI7Cj4gKyAgICAgICAgICAgIGNv
bXBhdGlibGUgPSAibXVsdGlib290LHJhbWRpc2siLCAibXVsdGlib290LG1vZHVsZSI7Cj4gICAg
ICAgICAgICAgIHJlZyA9IDwweDAgMHg0ZDAwMDAwMCAweGZmZmZmZj47Cj4gICAgICAgICAgfTsK
PiAgICAgIH07Cj4gLS0gCj4gMi4xMS4wCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs

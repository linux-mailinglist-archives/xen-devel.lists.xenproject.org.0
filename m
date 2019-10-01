Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F48C3888
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 17:06:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFJhY-0005Nr-6c; Tue, 01 Oct 2019 15:04:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=T/b7=X2=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iFJhW-0005Nd-Nt
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 15:04:30 +0000
X-Inumbo-ID: c470f2ec-e45c-11e9-9702-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id c470f2ec-e45c-11e9-9702-12813bfff9fa;
 Tue, 01 Oct 2019 15:04:29 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 42F5D1000;
 Tue,  1 Oct 2019 08:04:29 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8F3623F71A;
 Tue,  1 Oct 2019 08:04:28 -0700 (PDT)
To: Andrii Anisov <andrii.anisov@gmail.com>, xen-devel@lists.xenproject.org
References: <1548090247-20078-1-git-send-email-andrii.anisov@gmail.com>
 <1548090247-20078-3-git-send-email-andrii.anisov@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <d7ee428b-6010-7f04-c412-d65f657f1518@arm.com>
Date: Tue, 1 Oct 2019 16:04:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1548090247-20078-3-git-send-email-andrii.anisov@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/2] xen/arm: domain_build: Don't expose
 IOMMU specific properties to the guest
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpJIGFtIHJldml2aW5nIHRoZSB0aHJlYWQuIEkgdGhpbmsgd2UgbmVlZCBhIHBhdGNoIHNp
bWlsYXIgdG8gdGhpcyBvbmUgZm9yIFhlbiAKNC4xMy4gVGhpcyBpcyBiZWNhdXNlIGdlbmVyaWMg
YXJlIG5vdyB1c2VkIGJ5IFhlbiBzbyB0aGV5IHNob3VsZCBiZSBoaWRkZW4gZnJvbSAKdGhlIGhh
cmR3YXJlIGRvbWFpbi4KCkFuZHJpaSwgT2xla3NhbmRyLCBjYW4gb25lIG9mIHlvdSBsb29rIGF0
IGl0PwoKQ2hlZXJzLAoKT24gMjEvMDEvMjAxOSAxNzowNCwgQW5kcmlpIEFuaXNvdiB3cm90ZToK
PiBGcm9tOiBPbGVrc2FuZHIgVHlzaGNoZW5rbyA8b2xla3NhbmRyX3R5c2hjaGVua29AZXBhbS5j
b20+Cj4gCj4gV2UgZG9uJ3QgcGFzc3Rocm91Z2ggSU9NTVUgZGV2aWNlIHRvIERPTTAgZXZlbiBp
ZiBpdCBpcyBub3QgdXNlZCBieQo+IFhlbi4gVGhlcmVmb3JlIGV4cG9zaW5nIHRoZSBwcm9wZXJ0
aWVzIHRoYXQgZGVzY3JpYmUgcmVsYXRpb25zaGlwCj4gYmV0d2VlbiBtYXN0ZXIgZGV2aWNlcyBh
bmQgSU9NTVVzIGRvZXMgbm90IG1ha2UgYW55IHNlbnNlLgo+IAo+IEFjY29yZGluZyB0byB0aGU6
Cj4gMS4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lvbW11L2lvbW11LnR4dAo+
IDIuIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wY2kvcGNpLWlvbW11LnR4dAo+
IAo+IFNpZ25lZC1vZmYtYnk6IE9sZWtzYW5kciBUeXNoY2hlbmtvIDxvbGVrc2FuZHJfdHlzaGNo
ZW5rb0BlcGFtLmNvbT4KPiBBY2tlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJt
LmNvbT4KPiAtLS0KPiAgIHhlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYyB8IDEwICsrKysrKysr
KysKPiAgIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBh
L3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQu
Ywo+IGluZGV4IGQyYzYzYTguLjE1YTA4ZDYgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gvYXJtL2Rv
bWFpbl9idWlsZC5jCj4gKysrIGIveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jCj4gQEAgLTU0
MCw2ICs1NDAsMTYgQEAgc3RhdGljIGludCBfX2luaXQgd3JpdGVfcHJvcGVydGllcyhzdHJ1Y3Qg
ZG9tYWluICpkLCBzdHJ1Y3Qga2VybmVsX2luZm8gKmtpbmZvLAo+ICAgICAgICAgICAgICAgY29u
dGludWU7Cj4gICAgICAgICAgIH0KPiAgIAo+ICsgICAgICAgIC8qIERvbid0IGV4cG9zZSBJT01N
VSBzcGVjaWZpYyBwcm9wZXJ0aWVzIHRvIHRoZSBndWVzdCAqLwo+ICsgICAgICAgIGlmICggZHRf
cHJvcGVydHlfbmFtZV9pc19lcXVhbChwcm9wLCAiaW9tbXVzIikgKQo+ICsgICAgICAgICAgICBj
b250aW51ZTsKPiArCj4gKyAgICAgICAgaWYgKCBkdF9wcm9wZXJ0eV9uYW1lX2lzX2VxdWFsKHBy
b3AsICJpb21tdS1tYXAiKSApCj4gKyAgICAgICAgICAgIGNvbnRpbnVlOwo+ICsKPiArICAgICAg
ICBpZiAoIGR0X3Byb3BlcnR5X25hbWVfaXNfZXF1YWwocHJvcCwgImlvbW11LW1hcC1tYXNrIikg
KQo+ICsgICAgICAgICAgICBjb250aW51ZTsKPiArCj4gICAgICAgICAgIHJlcyA9IGZkdF9wcm9w
ZXJ0eShraW5mby0+ZmR0LCBwcm9wLT5uYW1lLCBwcm9wX2RhdGEsIHByb3BfbGVuKTsKPiAgIAo+
ICAgICAgICAgICBpZiAoIHJlcyApCj4gCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

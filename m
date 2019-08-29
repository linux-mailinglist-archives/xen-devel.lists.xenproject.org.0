Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5ACAA29F9
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2019 00:45:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3T7a-000111-BD; Thu, 29 Aug 2019 22:42:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/L5Q=WZ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1i3T7X-00010R-W4
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2019 22:42:24 +0000
X-Inumbo-ID: 44502000-caae-11e9-b95f-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 44502000-caae-11e9-b95f-bc764e2007e4;
 Thu, 29 Aug 2019 22:42:23 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6E98322CF5;
 Thu, 29 Aug 2019 22:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1567118542;
 bh=jsdNyMNS/9pCKUS4waHlGlAetK7kzg37QE3T5eJP7R4=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=sZ3f60S6o/hx1D+PzQj9Usp9jWfLr+K8KaWvP5+V3mJz4L40jUh100neirWk+vVmj
 YKlbuibzZMwhUulE4H2bjLpkf4FOc80VYWYDgzKFyGxmUJuS8zlad8T1Z6ieOmqxJE
 qDNi4a4/0L5kh0AgFCnknxJrA67Oa2Q1AxnuqogU=
Date: Thu, 29 Aug 2019 15:42:21 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Christoph Hellwig <hch@lst.de>
In-Reply-To: <20190826121944.515-6-hch@lst.de>
Message-ID: <alpine.DEB.2.21.1908281459000.8175@sstabellini-ThinkPad-T480s>
References: <20190826121944.515-1-hch@lst.de> <20190826121944.515-6-hch@lst.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 05/11] xen: remove the exports for
 xen_{create, destroy}_contiguous_region
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 xen-devel@lists.xenproject.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAyNiBBdWcgMjAxOSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gVGhlc2Ugcm91
dGluZXMgYXJlIG9ubHkgdXNlZCBieSBzd2lvdGxiLXhlbiwgd2hpY2ggY2Fubm90IGJlIG1vZHVs
YXIuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+CgpS
ZXZpZXdlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgoK
Cj4gLS0tCj4gIGFyY2gvYXJtL3hlbi9tbS5jICAgICB8IDIgLS0KPiAgYXJjaC94ODYveGVuL21t
dV9wdi5jIHwgMiAtLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDQgZGVsZXRpb25zKC0pCj4gCj4gZGlm
ZiAtLWdpdCBhL2FyY2gvYXJtL3hlbi9tbS5jIGIvYXJjaC9hcm0veGVuL21tLmMKPiBpbmRleCA5
YjNhNmMwY2E2ODEuLmI3ZDUzNDE1NTMyYiAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybS94ZW4vbW0u
Ywo+ICsrKyBiL2FyY2gvYXJtL3hlbi9tbS5jCj4gQEAgLTE1NSwxMyArMTU1LDExIEBAIGludCB4
ZW5fY3JlYXRlX2NvbnRpZ3VvdXNfcmVnaW9uKHBoeXNfYWRkcl90IHBzdGFydCwgdW5zaWduZWQg
aW50IG9yZGVyLAo+ICAJKmRtYV9oYW5kbGUgPSBwc3RhcnQ7Cj4gIAlyZXR1cm4gMDsKPiAgfQo+
IC1FWFBPUlRfU1lNQk9MX0dQTCh4ZW5fY3JlYXRlX2NvbnRpZ3VvdXNfcmVnaW9uKTsKPiAgCj4g
IHZvaWQgeGVuX2Rlc3Ryb3lfY29udGlndW91c19yZWdpb24ocGh5c19hZGRyX3QgcHN0YXJ0LCB1
bnNpZ25lZCBpbnQgb3JkZXIpCj4gIHsKPiAgCXJldHVybjsKPiAgfQo+IC1FWFBPUlRfU1lNQk9M
X0dQTCh4ZW5fZGVzdHJveV9jb250aWd1b3VzX3JlZ2lvbik7Cj4gIAo+ICBpbnQgX19pbml0IHhl
bl9tbV9pbml0KHZvaWQpCj4gIHsKPiBkaWZmIC0tZ2l0IGEvYXJjaC94ODYveGVuL21tdV9wdi5j
IGIvYXJjaC94ODYveGVuL21tdV9wdi5jCj4gaW5kZXggMjZlOGIzMjY5NjZkLi5jOGRiZWU2MmVj
MmEgMTAwNjQ0Cj4gLS0tIGEvYXJjaC94ODYveGVuL21tdV9wdi5jCj4gKysrIGIvYXJjaC94ODYv
eGVuL21tdV9wdi5jCj4gQEAgLTI2MjUsNyArMjYyNSw2IEBAIGludCB4ZW5fY3JlYXRlX2NvbnRp
Z3VvdXNfcmVnaW9uKHBoeXNfYWRkcl90IHBzdGFydCwgdW5zaWduZWQgaW50IG9yZGVyLAo+ICAJ
KmRtYV9oYW5kbGUgPSB2aXJ0X3RvX21hY2hpbmUodnN0YXJ0KS5tYWRkcjsKPiAgCXJldHVybiBz
dWNjZXNzID8gMCA6IC1FTk9NRU07Cj4gIH0KPiAtRVhQT1JUX1NZTUJPTF9HUEwoeGVuX2NyZWF0
ZV9jb250aWd1b3VzX3JlZ2lvbik7Cj4gIAo+ICB2b2lkIHhlbl9kZXN0cm95X2NvbnRpZ3VvdXNf
cmVnaW9uKHBoeXNfYWRkcl90IHBzdGFydCwgdW5zaWduZWQgaW50IG9yZGVyKQo+ICB7Cj4gQEAg
LTI2NjAsNyArMjY1OSw2IEBAIHZvaWQgeGVuX2Rlc3Ryb3lfY29udGlndW91c19yZWdpb24ocGh5
c19hZGRyX3QgcHN0YXJ0LCB1bnNpZ25lZCBpbnQgb3JkZXIpCj4gIAo+ICAJc3Bpbl91bmxvY2tf
aXJxcmVzdG9yZSgmeGVuX3Jlc2VydmF0aW9uX2xvY2ssIGZsYWdzKTsKPiAgfQo+IC1FWFBPUlRf
U1lNQk9MX0dQTCh4ZW5fZGVzdHJveV9jb250aWd1b3VzX3JlZ2lvbik7Cj4gIAo+ICBzdGF0aWMg
bm9pbmxpbmUgdm9pZCB4ZW5fZmx1c2hfdGxiX2FsbCh2b2lkKQo+ICB7Cj4gLS0gCj4gMi4yMC4x
Cj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

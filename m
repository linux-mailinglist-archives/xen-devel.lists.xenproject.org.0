Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDD9C456C
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 03:21:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFTIe-0005Hr-CU; Wed, 02 Oct 2019 01:19:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7bij=X3=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iFTId-0005Hi-H7
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 01:19:27 +0000
X-Inumbo-ID: ace06e5e-e4b2-11e9-970b-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by localhost (Halon) with ESMTPS
 id ace06e5e-e4b2-11e9-970b-12813bfff9fa;
 Wed, 02 Oct 2019 01:19:27 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4EA3520818;
 Wed,  2 Oct 2019 01:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569979166;
 bh=lkguUI04KHihAbL66gnYXGSSIuIlnq/VHSVI4fQLm8w=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=jAnht7ZT16pvVHLTtKEw95Ti/3zIao8JT/vC6PxZcT+AbDGJPvIZbK9IPtWINVc3b
 q8UmCnPRyOwDYmgZqci5SsO/jfBKV6vHc6ZdKSU1v60p2EKdCEzvfgF1KZAUXDM3zc
 pd4slDnNjKvlc4g13Io/hCiEfsQ5yaxgvKJZ1MK8=
Date: Tue, 1 Oct 2019 18:19:25 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190815195114.31148-1-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1910011818490.26319@sstabellini-ThinkPad-T480s>
References: <20190815195114.31148-1-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] xen/arm: domain_build: Remove redundant
 check in make_vpl011_uart_node()
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

T24gVGh1LCAxNSBBdWcgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IE5vbmUgb2YgdGhlIGNv
ZGUgc2luY2UgdGhlIGxhc3QgY2hlY2sgb2YgcmVzIG1vZGlmeSB0aGUgdmFsdWUuIFNvIHRoZQo+
IGNoZWNrIGNhbiBiZSByZW1vdmVkLgo+IAo+IENvdmVyaXR5LUlEOiAxNDc2ODI0Cj4gU2lnbmVk
LW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KClJldmlld2VkLWJ5
OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CgoKPiAtLS0KPiAg
eGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jIHwgMyArLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9h
cm0vZG9tYWluX2J1aWxkLmMgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMKPiBpbmRleCBj
ZjlmZmJjMzYwLi4xNzM1NDRkOGM1IDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL2FybS9kb21haW5f
YnVpbGQuYwo+ICsrKyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYwo+IEBAIC0xNjI5LDgg
KzE2MjksNyBAQCBzdGF0aWMgaW50IF9faW5pdCBtYWtlX3ZwbDAxMV91YXJ0X25vZGUoY29uc3Qg
c3RydWN0IGRvbWFpbiAqZCwgdm9pZCAqZmR0KQo+ICAgICAgZHRfY2hpbGRfc2V0X3JhbmdlKCZj
ZWxscywgR1VFU1RfUk9PVF9BRERSRVNTX0NFTExTLAo+ICAgICAgICAgICAgICAgICAgICAgICAg
IEdVRVNUX1JPT1RfU0laRV9DRUxMUywgR1VFU1RfUEwwMTFfQkFTRSwKPiAgICAgICAgICAgICAg
ICAgICAgICAgICBHVUVTVF9QTDAxMV9TSVpFKTsKPiAtICAgIGlmICggcmVzICkKPiAtICAgICAg
ICByZXR1cm4gcmVzOwo+ICsKPiAgICAgIHJlcyA9IGZkdF9wcm9wZXJ0eShmZHQsICJyZWciLCBy
ZWcsIHNpemVvZihyZWcpKTsKPiAgICAgIGlmICggcmVzICkKPiAgICAgICAgICByZXR1cm4gcmVz
Owo+IC0tIAo+IDIuMTEuMAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==

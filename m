Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48121E0A27
	for <lists+xen-devel@lfdr.de>; Tue, 22 Oct 2019 19:11:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iMxda-0004yB-4h; Tue, 22 Oct 2019 17:08:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ffab=YP=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iMxdY-0004xR-Di
 for xen-devel@lists.xenproject.org; Tue, 22 Oct 2019 17:08:00 +0000
X-Inumbo-ID: 7fcf1964-f4ee-11e9-bbab-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7fcf1964-f4ee-11e9-bbab-bc764e2007e4;
 Tue, 22 Oct 2019 17:07:59 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CAEFD20684;
 Tue, 22 Oct 2019 17:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1571764079;
 bh=5UtxmgOZdl9E5i3D/9ZM3y/Y9J4jTJWTIr01NpjT7r8=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=Pvp/AvaXmINfAnzjA5+/mXTD5mU2+oIfqgLLT28pTi70h2FNWFvi25xVQQPhhORoR
 +CdPMDobq7H0FA5Rqzi8K2sigW1uEJwPNyen3UrV6STjHOhe+EV72axWtikC56H7Ur
 qy06j8HaSW+J/THZ7N8gX60nMMDKZead+9fvLAKk=
Date: Tue, 22 Oct 2019 10:07:58 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: "Ben Dooks (Codethink)" <ben.dooks@codethink.co.uk>
In-Reply-To: <20191022125251.4284-1-ben.dooks@codethink.co.uk>
Message-ID: <alpine.DEB.2.21.1910221007430.30080@sstabellini-ThinkPad-T480s>
References: <20191022125251.4284-1-ben.dooks@codethink.co.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] xen: mm: make xen_mm_init static
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
Cc: linux-kernel@lists.codethink.co.uk, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCAyMiBPY3QgMjAxOSwgQmVuIERvb2tzIChDb2RldGhpbmspIHdyb3RlOgo+IFRoZSB4
ZW5fbW1faW5pdCBpcyBub3QgZXhwb3J0ZWQgb3IgdXNlZCBvdXRzaWRlIG9mIHRoZSBmaWxlCj4g
aXQgaXMgZGVjbGFyZWQgaW4sIHNvIG1ha2UgaXQgc3RhdGljLiBUaGlzIGZpeGVzIHRoZSBmb2xs
b3dpbmcKPiBzcGFyc2Ugd2FybmluZzoKPiAKPiBhcmNoL2FybS94ZW4vbW0uYzoxMzY6MTI6IHdh
cm5pbmc6IHN5bWJvbCAneGVuX21tX2luaXQnIHdhcyBub3QgZGVjbGFyZWQuIFNob3VsZCBpdCBi
ZSBzdGF0aWM/Cj4gCj4gU2lnbmVkLW9mZi1ieTogQmVuIERvb2tzIChDb2RldGhpbmspIDxiZW4u
ZG9va3NAY29kZXRoaW5rLmNvLnVrPgoKUmV2aWV3ZWQtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8
c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KCgo+IC0tLQo+IENjOiBTdGVmYW5vIFN0YWJlbGxpbmkg
PHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Cj4gQ2M6IFJ1c3NlbGwgS2luZyA8bGludXhAYXJtbGlu
dXgub3JnLnVrPgo+IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKPiBDYzogbGlu
dXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCj4gLS0tCj4gIGFyY2gvYXJtL3hlbi9t
bS5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0veGVuL21tLmMgYi9hcmNoL2FybS94ZW4vbW0u
Ywo+IGluZGV4IDZmZWI2Yjc4YjEzYy4uM2M3NjQ1ZDdiOWI0IDEwMDY0NAo+IC0tLSBhL2FyY2gv
YXJtL3hlbi9tbS5jCj4gKysrIGIvYXJjaC9hcm0veGVuL21tLmMKPiBAQCAtMTM0LDcgKzEzNCw3
IEBAIHZvaWQgeGVuX2Rlc3Ryb3lfY29udGlndW91c19yZWdpb24ocGh5c19hZGRyX3QgcHN0YXJ0
LCB1bnNpZ25lZCBpbnQgb3JkZXIpCj4gIAlyZXR1cm47Cj4gIH0KPiAgCj4gLWludCBfX2luaXQg
eGVuX21tX2luaXQodm9pZCkKPiArc3RhdGljIGludCBfX2luaXQgeGVuX21tX2luaXQodm9pZCkK
PiAgewo+ICAJc3RydWN0IGdudHRhYl9jYWNoZV9mbHVzaCBjZmx1c2g7Cj4gIAlpZiAoIXhlbl9p
bml0aWFsX2RvbWFpbigpKQo+IC0tIAo+IDIuMjMuMAo+IAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

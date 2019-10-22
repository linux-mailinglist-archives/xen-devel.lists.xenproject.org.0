Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98344E0A31
	for <lists+xen-devel@lfdr.de>; Tue, 22 Oct 2019 19:12:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iMxeJ-00051J-IM; Tue, 22 Oct 2019 17:08:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ffab=YP=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iMxeH-000517-Sp
 for xen-devel@lists.xenproject.org; Tue, 22 Oct 2019 17:08:45 +0000
X-Inumbo-ID: 99fc234f-f4ee-11e9-946f-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 99fc234f-f4ee-11e9-946f-12813bfff9fa;
 Tue, 22 Oct 2019 17:08:45 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5C98020684;
 Tue, 22 Oct 2019 17:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1571764124;
 bh=9k/noH3YOxy5kuHVRuUQJVYYlKN2wSmHjorVoG4apHk=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=GVmnWuA51db96RXU1g67FY22inH+WWQyhnMHsYqe2BJGSxxy+UVFBT34B5p0Xc5s/
 Ab8w8HHi+TlVZxvHfw/puAOKkHwgojS6g41KOsaXB7A89p7MIRKpCaGtb80rFkk7FN
 wVoyY4pLGLXLL2MQsuCp/7zer5oZeL2kxOSVzDbM=
Date: Tue, 22 Oct 2019 10:08:43 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: "Ben Dooks (Codethink)" <ben.dooks@codethink.co.uk>
In-Reply-To: <20191022125006.3746-1-ben.dooks@codethink.co.uk>
Message-ID: <alpine.DEB.2.21.1910221008370.30080@sstabellini-ThinkPad-T480s>
References: <20191022125006.3746-1-ben.dooks@codethink.co.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] xen: mm: include <xen/xen-ops.h> for
 missing declarations
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

T24gVHVlLCAyMiBPY3QgMjAxOSwgQmVuIERvb2tzIChDb2RldGhpbmspIHdyb3RlOgo+IEluY2x1
ZGUgPHhlbi94ZW4tb3BzLmg+IGZvciB4ZW5fe2NyZWF0ZSxkZXN0cm95fV9jb250aWdvdXNfcmVn
aW9uCj4gY2FsbCBkZWNsYXJhdGlvbnMuIEZpeGVzIHRoZSBmb2xsb3dpbmcgc3BhcnNlIHdhcm5p
bmdzOgo+IAo+IGFyY2gvYXJtL3hlbi9tbS5jOjExOTo1OiB3YXJuaW5nOiBzeW1ib2wgJ3hlbl9j
cmVhdGVfY29udGlndW91c19yZWdpb24nIHdhcyBub3QgZGVjbGFyZWQuIFNob3VsZCBpdCBiZSBz
dGF0aWM/Cj4gYXJjaC9hcm0veGVuL21tLmM6MTMxOjY6IHdhcm5pbmc6IHN5bWJvbCAneGVuX2Rl
c3Ryb3lfY29udGlndW91c19yZWdpb24nIHdhcyBub3QgZGVjbGFyZWQuIFNob3VsZCBpdCBiZSBz
dGF0aWM/Cj4gCj4gU2lnbmVkLW9mZi1ieTogQmVuIERvb2tzIChDb2RldGhpbmspIDxiZW4uZG9v
a3NAY29kZXRoaW5rLmNvLnVrPgoKUmV2aWV3ZWQtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0
YWJlbGxpbmlAa2VybmVsLm9yZz4KCgo+IC0tLQo+IENjOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNz
dGFiZWxsaW5pQGtlcm5lbC5vcmc+Cj4gQ2M6IFJ1c3NlbGwgS2luZyA8bGludXhAYXJtbGludXgu
b3JnLnVrPgo+IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKPiBDYzogbGludXgt
YXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCj4gLS0tCj4gIGFyY2gvYXJtL3hlbi9tbS5j
IHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+IAo+IGRpZmYgLS1naXQg
YS9hcmNoL2FybS94ZW4vbW0uYyBiL2FyY2gvYXJtL3hlbi9tbS5jCj4gaW5kZXggMzhmYTkxN2M4
NTg1Li42ZmViNmI3OGIxM2MgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcm0veGVuL21tLmMKPiArKysg
Yi9hcmNoL2FybS94ZW4vbW0uYwo+IEBAIC0xNSw2ICsxNSw3IEBACj4gICNpbmNsdWRlIDx4ZW4v
aW50ZXJmYWNlL2dyYW50X3RhYmxlLmg+Cj4gICNpbmNsdWRlIDx4ZW4vaW50ZXJmYWNlL21lbW9y
eS5oPgo+ICAjaW5jbHVkZSA8eGVuL3BhZ2UuaD4KPiArI2luY2x1ZGUgPHhlbi94ZW4tb3BzLmg+
Cj4gICNpbmNsdWRlIDx4ZW4vc3dpb3RsYi14ZW4uaD4KPiAgCj4gICNpbmNsdWRlIDxhc20vY2Fj
aGVmbHVzaC5oPgo+IC0tIAo+IDIuMjMuMAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==

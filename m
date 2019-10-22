Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA55E0A32
	for <lists+xen-devel@lfdr.de>; Tue, 22 Oct 2019 19:12:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iMxfD-000579-Th; Tue, 22 Oct 2019 17:09:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ffab=YP=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iMxfB-00056u-W9
 for xen-devel@lists.xenproject.org; Tue, 22 Oct 2019 17:09:42 +0000
X-Inumbo-ID: bc77feda-f4ee-11e9-8aca-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bc77feda-f4ee-11e9-8aca-bc764e2007e4;
 Tue, 22 Oct 2019 17:09:41 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B918C20684;
 Tue, 22 Oct 2019 17:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1571764181;
 bh=02dhGh2vX98NwK/ad2U2Vky5hxQGaMIQJLeOukjslBQ=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=BG3NKtXKN1oC8terCwemuoasU1yMSkS/LDipIR+CYH/nKVYCGUZqPIwbITKTBGs6o
 HEWNhD2PL+SX0VXlx2NQHy0Duq0xWms0VqNkQg8dySs2VdIwybv/BSSQko01Sw7t/H
 UFhgwF22YUIJwcq3vWkrPChg94GlWG4SVUCw9Ri4=
Date: Tue, 22 Oct 2019 10:09:40 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: ben.dooks@codethink.co.uk
In-Reply-To: <alpine.DEB.2.21.1910221008370.30080@sstabellini-ThinkPad-T480s>
Message-ID: <alpine.DEB.2.21.1910221009040.30080@sstabellini-ThinkPad-T480s>
References: <20191022125006.3746-1-ben.dooks@codethink.co.uk>
 <alpine.DEB.2.21.1910221008370.30080@sstabellini-ThinkPad-T480s>
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
 sstabellini@kernel.org, Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCAyMiBPY3QgMjAxOSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+IE9uIFR1ZSwg
MjIgT2N0IDIwMTksIEJlbiBEb29rcyAoQ29kZXRoaW5rKSB3cm90ZToKPiA+IEluY2x1ZGUgPHhl
bi94ZW4tb3BzLmg+IGZvciB4ZW5fe2NyZWF0ZSxkZXN0cm95fV9jb250aWdvdXNfcmVnaW9uCj4g
PiBjYWxsIGRlY2xhcmF0aW9ucy4gRml4ZXMgdGhlIGZvbGxvd2luZyBzcGFyc2Ugd2FybmluZ3M6
Cj4gPiAKPiA+IGFyY2gvYXJtL3hlbi9tbS5jOjExOTo1OiB3YXJuaW5nOiBzeW1ib2wgJ3hlbl9j
cmVhdGVfY29udGlndW91c19yZWdpb24nIHdhcyBub3QgZGVjbGFyZWQuIFNob3VsZCBpdCBiZSBz
dGF0aWM/Cj4gPiBhcmNoL2FybS94ZW4vbW0uYzoxMzE6Njogd2FybmluZzogc3ltYm9sICd4ZW5f
ZGVzdHJveV9jb250aWd1b3VzX3JlZ2lvbicgd2FzIG5vdCBkZWNsYXJlZC4gU2hvdWxkIGl0IGJl
IHN0YXRpYz8KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogQmVuIERvb2tzIChDb2RldGhpbmspIDxi
ZW4uZG9va3NAY29kZXRoaW5rLmNvLnVrPgo+IAo+IFJldmlld2VkLWJ5OiBTdGVmYW5vIFN0YWJl
bGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CgpEbyB5b3Ugd2FudCBtZSB0byBwaWNrIHVw
IHRoZXNlIHR3byBwYXRjaGVzIGFuZCBoYXZlIHRoZW0gZ28gdXBzdHJlYW0KdmlhIHRoZSBYZW4g
dHJlZSwgb3IgYXJlIHRoZXkgcGFydCBvZiBhIGJpZ2dlciByZXdvcms/CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

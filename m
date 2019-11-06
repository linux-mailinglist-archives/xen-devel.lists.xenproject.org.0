Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21886F1AE7
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2019 17:13:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iSNta-0001JU-W5; Wed, 06 Nov 2019 16:10:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cNs+=Y6=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iSNtZ-0001JH-4b
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2019 16:10:57 +0000
X-Inumbo-ID: 03970f96-00b0-11ea-a1ae-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 03970f96-00b0-11ea-a1ae-12813bfff9fa;
 Wed, 06 Nov 2019 16:10:56 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B020D2075C;
 Wed,  6 Nov 2019 16:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573056656;
 bh=r3DzIghXJaebn3GP/Hxc/Wqxu/pQXu4Vo2huicBOVIQ=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=ju08JdM+kHL5/jM4vgrGFq4IZcUwJER2hiBo+2o5LyOlXSIcb3O+c1sty+CO0tWwT
 xAP7widby6nowvfQ5JcQJoO4CdtNAfMCGw5Os1a2d1GMENPHYkEwvUmZSG0NE8TYYp
 90SDBqPEn/Hj5l8BERIXn8iwfvEvkuOE6hpoRLRA=
Date: Wed, 6 Nov 2019 08:10:47 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Wei Liu <wl@xen.org>
In-Reply-To: <20191106104521.xm32dkkcj7a3d3ru@debian>
Message-ID: <alpine.DEB.2.21.1911060809060.11262@sstabellini-ThinkPad-T480s>
References: <20191105235113.27469-1-sstabellini@kernel.org>
 <20191106104521.xm32dkkcj7a3d3ru@debian>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] tools: pygrub actually cross-compiles just
 fine
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, ian.jackson@eu.citrix.com,
 Christopher Clark <christopher.w.clark@gmail.com>, anthony.perard@citrix.com,
 Xen Development List <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCA2IE5vdiAyMDE5LCBXZWkgTGl1IHdyb3RlOgo+IE9uIFR1ZSwgTm92IDA1LCAyMDE5
IGF0IDAzOjUxOjEzUE0gLTA4MDAsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiA+IEFjdHVh
bGx5LCBweWdydWIgY3Jvc3MtY29tcGlsZXMgd2l0aG91dCBpc3N1ZXMuIFRoZSBjcm9zcy1jb21w
aWxhdGlvbgo+ID4gd29yay1hcm91bmQgZ29lcyBiYWNrIHRvIDIwMDUgYW5kIGl0IHByb2JhYmx5
IHJlZmVycmVkIHRvIFBvd2VyUEMuCj4gPiAKPiA+IFJlbW92ZSB0aGUgd29yay1hcm91bmQgbm93
Lgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHN0ZWZhbm8uc3Rh
YmVsbGluaUB4aWxpbnguY29tPgo+ID4gQ0M6IENocmlzdG9waGVyIENsYXJrIDxjaHJpc3RvcGhl
ci53LmNsYXJrQGdtYWlsLmNvbT4KPiAKPiBQcmVzdW1hYmx5IHlvdSB0cmllZCB0byBjcm9zcy1j
b21waWxlIGl0IGZvciBBcm0/IEl0IHdvdWxkIGJlIGdvb2QgdG8KPiBtZW50aW9uIHRoYXQgaW4g
dGhlIGNvbW1pdCBtZXNzYWdlLgo+IAo+IEkgdGhpbmsgdGhlIGNvbnRlbnQgb2YgdGhpcyBwYXRj
aCBpcyBmaW5lOgoKSXQgY3Jvc3MtY29tcGlsZXMgZmluZSBmb3IgYWFyY2g2NCBvbiB4ODZfNjQg
d2l0aCBZb2N0by4gIEFsdGhvdWdoIHdlCmRvbid0IGRvIGFueSBjcm9zcy1jb21waWxhdGlvbnMg
aW4gT1NTVGVzdCBhcyBmYXIgYXMgSSBrbm93LCBzbyBhcHBseWluZwp0aGUgcGF0Y2ggd29uJ3Qg
YnJlYWsgT1NTVGVzdCwgZ2l2ZW4gdGhlIHN0YXRlIG9mIHRoZSByZWxlYXNlLCBJIHRoaW5rCml0
IHdvdWxkIGJlIGJlc3QgdG8gd2FpdCBmb3IgdGhlIG5leHQgbWVyZ2Ugd2luZG93LgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

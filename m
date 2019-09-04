Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0D8A7C3C
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2019 09:03:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5PHT-00061q-Pl; Wed, 04 Sep 2019 07:00:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=75sk=W7=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1i5PHR-00061a-OZ
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2019 07:00:37 +0000
X-Inumbo-ID: b1783691-cee1-11e9-abab-12813bfff9fa
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b1783691-cee1-11e9-abab-12813bfff9fa;
 Wed, 04 Sep 2019 07:00:36 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 57523227A8A; Wed,  4 Sep 2019 09:00:33 +0200 (CEST)
Date: Wed, 4 Sep 2019 09:00:33 +0200
From: Christoph Hellwig <hch@lst.de>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <20190904070033.GA11643@lst.de>
References: <20190902130339.23163-1-hch@lst.de>
 <20190902130339.23163-9-hch@lst.de>
 <5799ca4b-7993-b1c5-73fa-396a560f58e8@oracle.com>
 <8a7f9e23-ef26-e83b-8d1e-dcd7d233642a@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8a7f9e23-ef26-e83b-8d1e-dcd7d233642a@oracle.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Xen-devel] [PATCH 08/13] swiotlb-xen: always use dma-direct
 helpers to alloc coherent pages
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 xen-devel@lists.xenproject.org, Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBTZXAgMDMsIDIwMTkgYXQgMDY6MjU6NTRQTSAtMDQwMCwgQm9yaXMgT3N0cm92c2t5
IHdyb3RlOgo+ID4gSWYgSSBhbSByZWFkaW5nIF9fZG1hX2RpcmVjdF9hbGxvY19wYWdlcygpIGNv
cnJlY3RseSB0aGVyZSBpcyBhIHBhdGgKPiA+IHRoYXQgd2lsbCBmb3JjZSB1cyB0byB1c2UgR0ZQ
X0RNQTMyIGFuZCBhcyBKdWVyZ2VuIHBvaW50ZWQgb3V0IGluCj4gPiBhbm90aGVyIG1lc3NhZ2Ug
dGhhdCBtYXkgbm90IGJlIGRlc2lyYWJsZS4KClllcywgaXQgd2lsbCBhZGQgR0ZQX0RNQTMyLiAg
U28gSSBndWVzcyBmb3Igbm93IHdlJ2xsIGp1c3Qga2VlcCB0aGUKZGlyZWN0IHBhZ2UgYWxsb2Nh
dG9yIGNhbGxzIGFuZCByZXNlbmQuICBJIGRvbid0IHRoaW5rIHRoaXMgaXMgdGhlCnJpZ2h0IHRo
aW5nIHRvIGRvIGxvbmcgdGVybSwgYnV0IEknZCByZWFsbHkgbGlrZSB0byBnZXQgdGhpcyBzZXJp
ZXMKZmluaXNoZWQuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

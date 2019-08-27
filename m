Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA869DDA8
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2019 08:24:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2Ur3-0006ZI-Qv; Tue, 27 Aug 2019 06:21:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=v7Gj=WX=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1i2Ur1-0006ZD-Pl
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2019 06:21:19 +0000
X-Inumbo-ID: e0c3a3da-c892-11e9-ae2c-12813bfff9fa
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e0c3a3da-c892-11e9-ae2c-12813bfff9fa;
 Tue, 27 Aug 2019 06:21:17 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 2A12468AFE; Tue, 27 Aug 2019 08:21:14 +0200 (CEST)
Date: Tue, 27 Aug 2019 08:21:13 +0200
From: Christoph Hellwig <hch@lst.de>
To: Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <20190827062113.GA31752@lst.de>
References: <20190816130013.31154-1-hch@lst.de>
 <alpine.DEB.2.21.1908261859490.3428@sstabellini-ThinkPad-T480s>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.1908261859490.3428@sstabellini-ThinkPad-T480s>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Xen-devel] swiotlb-xen cleanups
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
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 xen-devel@lists.xenproject.org, Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBBdWcgMjYsIDIwMTkgYXQgMDc6MDA6NDRQTSAtMDcwMCwgU3RlZmFubyBTdGFiZWxs
aW5pIHdyb3RlOgo+IE9uIEZyaSwgMTYgQXVnIDIwMTksIENocmlzdG9waCBIZWxsd2lnIHdyb3Rl
Ogo+ID4gSGkgWGVuIG1haW50YWluZXJzIGFuZCBmcmllbmRzLAo+ID4gCj4gPiBwbGVhc2UgdGFr
ZSBhIGxvb2sgYXQgdGhpcyBzZXJpZXMgdGhhdCBjbGVhbnMgdXAgdGhlIHBhcnRzIG9mIHN3aW90
bGIteGVuCj4gPiB0aGF0IGRlYWwgd2l0aCBub24tY29oZXJlbnQgY2FjaGVzLgo+IAo+IEhpIENo
cmlzdG9waCwKPiAKPiBJIGp1c3Qgd2FudGVkIHRvIGxldCB5b3Uga25vdyB0aGF0IHlvdXIgc2Vy
aWVzIGlzIG9uIG15IHJhZGFyLCBidXQgSQo+IGhhdmUgYmVlbiBzd2FtcGVkIHRoZSBsYXN0IGZl
dyBkYXlzLiBJIGhvcGUgdG8gZ2V0IHRvIGl0IGJ5IHRoZSBlbmQgb2YKPiB0aGUgd2Vlay4KClRo
YW5rcywgYW5kIG5vIHJ1c2guICBOb3RlIHRoYXQgSSBwb3N0ZWQgYSB2MiB3aXRoIGEgZmV3IHNp
Z25pZmljYW50CmNoYW5nZXMgeWVzdGVyZGF5LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==

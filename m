Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C40A890D87
	for <lists+xen-devel@lfdr.de>; Sat, 17 Aug 2019 08:55:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hysXc-0000QZ-Ju; Sat, 17 Aug 2019 06:50:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ZAGM=WN=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1hysXa-0000QU-LR
 for xen-devel@lists.xenproject.org; Sat, 17 Aug 2019 06:50:18 +0000
X-Inumbo-ID: 44a12e16-c0bb-11e9-8bbf-12813bfff9fa
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 44a12e16-c0bb-11e9-8bbf-12813bfff9fa;
 Sat, 17 Aug 2019 06:50:16 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 70BE768B05; Sat, 17 Aug 2019 08:50:12 +0200 (CEST)
Date: Sat, 17 Aug 2019 08:50:11 +0200
From: Christoph Hellwig <hch@lst.de>
To: Julien Grall <julien.grall@arm.com>
Message-ID: <20190817065011.GA18599@lst.de>
References: <20190816130013.31154-1-hch@lst.de>
 <20190816130013.31154-8-hch@lst.de>
 <9a3261c6-5d92-cf6b-1ae8-3a8e8b5ef0d4@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9a3261c6-5d92-cf6b-1ae8-3a8e8b5ef0d4@arm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Xen-devel] [PATCH 07/11] swiotlb-xen: provide a single
 page-coherent.h header
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
 xen-devel@lists.xenproject.org, Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBBdWcgMTYsIDIwMTkgYXQgMTE6NDA6NDNQTSArMDEwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+IEkgYW0gbm90IHN1cmUgSSBhZ3JlZSB3aXRoIHRoaXMgcmVuYW1lLiBUaGUgaW1wbGVt
ZW50YXRpb24gb2YgdGhlIGhlbHBlcnMgCj4gYXJlIHZlcnkgQXJtIHNwZWNpZmljIGFzIHRoaXMg
aXMgYXNzdW1pbmcgRG9tMCBpcyAxOjEgbWFwcGVkLgo+Cj4gVGhpcyB3YXMgbmVjZXNzYXJ5IGR1
ZSB0byB0aGUgbGFjayBvZiBJT01NVSBvbiBBcm0gcGxhdGZvcm1zIGJhY2sgdGhlbi4KPiBCdXQg
dGhpcyBpcyBub3cgYSBwYWluIHRvIGdldCByaWQgb2YgaXQgb24gbmV3ZXIgcGxhdGZvcm0uLi4K
ClNvIGlmIHlvdSBsb29rIGF0IHRoZSBmaW5hbCB2ZXJzaW9uIG9mIHRoZSBoZWFkZXIgYWZ0ZXIg
dGhlIHdob2xlCnNlcmllcywgd2hhdCBhc3N1bWVzIGEgMToxIG1hcHBpbmc/ICBJdCBhbGwganVz
dCBpcwoKCWlmIChwZm5fdmFsaWQoKSkKCQlsb2NhbCBjYWNoZSBzeW5jOwoJZWxzZQoJCWNhbGwg
aW50byB0aGUgYXJjaCBjb2RlOwoKYXJlIHlvdSBjb25jZXJuZWQgdGhhdCB0aGUgbG9jYWwgY2Fj
aGUgc3luYyBtaWdodCBoYXZlIHRvIGJlIHNwbGl0CnVwIG1vcmUgZm9yIGEgbm9uLTE6MSBtYXAg
aW4gdGhhdCBjYXNlPyAgV2UgY291bGQganVzdCBtb3ZlCnRoZSB4ZW5fZG1hXyogcm91dGluZXMg
aW50byB0aGUgYXJjaCBpbnN0ZWFkIG9mIF9feGVuX2RtYSwgYnV0IGl0CnJlYWxseSBoZWxwcyB0
byBoYXZlIGEgY29tbW9uIGludGVyZmFjZSBoZWFkZXIuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs

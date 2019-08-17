Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF0D91237
	for <lists+xen-devel@lfdr.de>; Sat, 17 Aug 2019 20:25:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hz3Js-00032L-C9; Sat, 17 Aug 2019 18:20:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5QZP=WN=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hz3Jq-00032G-Bq
 for xen-devel@lists.xenproject.org; Sat, 17 Aug 2019 18:20:50 +0000
X-Inumbo-ID: b293b4ec-c11b-11e9-b90c-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id b293b4ec-c11b-11e9-b90c-bc764e2007e4;
 Sat, 17 Aug 2019 18:20:31 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 50DD5337;
 Sat, 17 Aug 2019 11:20:31 -0700 (PDT)
Received: from [10.37.12.25] (unknown [10.37.12.25])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8A66F3F706;
 Sat, 17 Aug 2019 11:20:29 -0700 (PDT)
To: Christoph Hellwig <hch@lst.de>
References: <20190816130013.31154-1-hch@lst.de>
 <20190816130013.31154-8-hch@lst.de>
 <9a3261c6-5d92-cf6b-1ae8-3a8e8b5ef0d4@arm.com>
 <20190817065011.GA18599@lst.de>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <21746bbf-618a-d12b-c767-f9e865f4dd20@arm.com>
Date: Sat, 17 Aug 2019 19:20:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190817065011.GA18599@lst.de>
Content-Language: en-US
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
 xen-devel@lists.xenproject.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgQ2hyaXN0b3BoLAoKT24gOC8xNy8xOSA3OjUwIEFNLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90
ZToKPiBPbiBGcmksIEF1ZyAxNiwgMjAxOSBhdCAxMTo0MDo0M1BNICswMTAwLCBKdWxpZW4gR3Jh
bGwgd3JvdGU6Cj4+IEkgYW0gbm90IHN1cmUgSSBhZ3JlZSB3aXRoIHRoaXMgcmVuYW1lLiBUaGUg
aW1wbGVtZW50YXRpb24gb2YgdGhlIGhlbHBlcnMKPj4gYXJlIHZlcnkgQXJtIHNwZWNpZmljIGFz
IHRoaXMgaXMgYXNzdW1pbmcgRG9tMCBpcyAxOjEgbWFwcGVkLgo+Pgo+PiBUaGlzIHdhcyBuZWNl
c3NhcnkgZHVlIHRvIHRoZSBsYWNrIG9mIElPTU1VIG9uIEFybSBwbGF0Zm9ybXMgYmFjayB0aGVu
Lgo+PiBCdXQgdGhpcyBpcyBub3cgYSBwYWluIHRvIGdldCByaWQgb2YgaXQgb24gbmV3ZXIgcGxh
dGZvcm0uLi4KPiAKPiBTbyBpZiB5b3UgbG9vayBhdCB0aGUgZmluYWwgdmVyc2lvbiBvZiB0aGUg
aGVhZGVyIGFmdGVyIHRoZSB3aG9sZQo+IHNlcmllcywgd2hhdCBhc3N1bWVzIGEgMToxIG1hcHBp
bmc/ICBJdCBhbGwganVzdCBpcwo+IAo+IAlpZiAocGZuX3ZhbGlkKCkpCj4gCQlsb2NhbCBjYWNo
ZSBzeW5jOwo+IAllbHNlCj4gCQljYWxsIGludG8gdGhlIGFyY2ggY29kZTsKCkluIHRoZSBjb250
ZXh0IG9mIFhlbiBBcm0sIHRoZSBkZXZfYWRkciBpcyBhIGhvc3QgcGh5c2ljYWwgYWRkcmVzcy4g
RnJvbSAKbXkgdW5kZXJzdGFuZGluZyBwZm5fdmFsaWQoKSBpcyBkZWFsaW5nIHdpdGggYSBndWVz
dCBwaHlzaWNhbCBmcmFtZS4KClRoZXJlZm9yZSBieSBwYXNzaW5nIFBGTl9ET1dOKGRldl9hZGRy
KSBpbiBhcmd1bWVudCB5b3UgYXNzdW1lIHRoYXQgdGhlIApob3N0IGFuZCBndWVzdCBhZGRyZXNz
IHNwYWNlcyBhcmUgdGhlIHNhbWUuCgo+IAo+IGFyZSB5b3UgY29uY2VybmVkIHRoYXQgdGhlIGxv
Y2FsIGNhY2hlIHN5bmMgbWlnaHQgaGF2ZSB0byBiZSBzcGxpdAo+IHVwIG1vcmUgZm9yIGEgbm9u
LTE6MSBtYXAgaW4gdGhhdCBjYXNlPyAgV2UgY291bGQganVzdCBtb3ZlYQo+IHRoZSB4ZW5fZG1h
Xyogcm91dGluZXMgaW50byB0aGUgYXJjaCBpbnN0ZWFkIG9mIF9feGVuX2RtYSwgYnV0IGl0Cj4g
cmVhbGx5IGhlbHBzIHRvIGhhdmUgYSBjb21tb24gaW50ZXJmYWNlIGhlYWRlci4KTW92aW5nIHhl
bl9kbWFfKiByb3V0aW5lcyBpbnRvIHRoZSBhcmNoIHdvdWxkIGJlIGEgZ29vZCBvcHRpb24uIApB
bHRob3VnaCwgSSB3b3VsZCBzdGlsbCBjb25zaWRlciBhIHN0dWIgdmVyc2lvbiBmb3IgYXJjaCBu
b3QgcmVxdWlyaW5nIApzcGVjaWZpYyBETUEuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

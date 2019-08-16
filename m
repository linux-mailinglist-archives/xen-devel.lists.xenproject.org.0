Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 841B190340
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2019 15:40:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hycQf-0002YH-S2; Fri, 16 Aug 2019 13:38:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UwD7=WM=arm.com=robin.murphy@srs-us1.protection.inumbo.net>)
 id 1hycQd-0002YC-Qe
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2019 13:38:03 +0000
X-Inumbo-ID: 10fd7d98-c02b-11e9-a661-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 10fd7d98-c02b-11e9-a661-bc764e2007e4;
 Fri, 16 Aug 2019 13:38:01 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E95ED344;
 Fri, 16 Aug 2019 06:38:00 -0700 (PDT)
Received: from [10.1.197.57] (e110467-lin.cambridge.arm.com [10.1.197.57])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DEF273F694;
 Fri, 16 Aug 2019 06:37:59 -0700 (PDT)
To: Christoph Hellwig <hch@lst.de>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
References: <20190816130013.31154-1-hch@lst.de>
 <20190816130013.31154-4-hch@lst.de>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <8585fb27-14e0-888c-6749-6862b4e16418@arm.com>
Date: Fri, 16 Aug 2019 14:37:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190816130013.31154-4-hch@lst.de>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH 03/11] xen/arm: pass one less argument to
 dma_cache_maint
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
Cc: xen-devel@lists.xenproject.org, iommu@lists.linux-foundation.org,
 x86@kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYvMDgvMjAxOSAxNDowMCwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gSW5zdGVhZCBv
ZiB0YWtpbmcgYXBhcnQgdGhlIGRtYSBhZGRyZXNzIGluIGJvdGggY2FsbGVycyBkbyBpdCBpbnNp
ZGUKPiBkbWFfY2FjaGVfbWFpbnQgaXRzZWxmLgo+IAo+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9w
aCBIZWxsd2lnIDxoY2hAbHN0LmRlPgo+IC0tLQo+ICAgYXJjaC9hcm0veGVuL21tLmMgfCAxMCAr
KysrKystLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9u
cygtKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL2FybS94ZW4vbW0uYyBiL2FyY2gvYXJtL3hlbi9t
bS5jCj4gaW5kZXggOTA1NzRkODlkMGQ0Li5kOWRhMjRmZGEyZjcgMTAwNjQ0Cj4gLS0tIGEvYXJj
aC9hcm0veGVuL21tLmMKPiArKysgYi9hcmNoL2FybS94ZW4vbW0uYwo+IEBAIC00MywxMyArNDMs
MTUgQEAgc3RhdGljIGJvb2wgaHlwZXJjYWxsX2NmbHVzaCA9IGZhbHNlOwo+ICAgCj4gICAvKiBm
dW5jdGlvbnMgY2FsbGVkIGJ5IFNXSU9UTEIgKi8KPiAgIAo+IC1zdGF0aWMgdm9pZCBkbWFfY2Fj
aGVfbWFpbnQoZG1hX2FkZHJfdCBoYW5kbGUsIHVuc2lnbmVkIGxvbmcgb2Zmc2V0LAo+IC0Jc2l6
ZV90IHNpemUsIGVudW0gZG1hX2RhdGFfZGlyZWN0aW9uIGRpciwgZW51bSBkbWFfY2FjaGVfb3Ag
b3ApCj4gK3N0YXRpYyB2b2lkIGRtYV9jYWNoZV9tYWludChkbWFfYWRkcl90IGhhbmRsZSwgc2l6
ZV90IHNpemUsCj4gKwkJZW51bSBkbWFfZGF0YV9kaXJlY3Rpb24gZGlyLCBlbnVtIGRtYV9jYWNo
ZV9vcCBvcCkKPiAgIHsKPiAgIAlzdHJ1Y3QgZ250dGFiX2NhY2hlX2ZsdXNoIGNmbHVzaDsKPiAg
IAl1bnNpZ25lZCBsb25nIHhlbl9wZm47Cj4gKwl1bnNpZ25lZCBsb25nIG9mZnNldCA9IGhhbmRs
ZSAmIH5QQUdFX01BU0s7Cj4gICAJc2l6ZV90IGxlZnQgPSBzaXplOwo+ICAgCj4gKwlvZmZzZXQg
Jj0gUEFHRV9NQVNLOwoKQWhlbS4uLiBwcmVzdW1hYmx5IHRoYXQgc2hvdWxkIGJlIGhhbmRsZSwg
bm90IG9mZnNldC4KClJvYmluLgoKPiAgIAl4ZW5fcGZuID0gKGhhbmRsZSA+PiBYRU5fUEFHRV9T
SElGVCkgKyBvZmZzZXQgLyBYRU5fUEFHRV9TSVpFOwo+ICAgCW9mZnNldCAlPSBYRU5fUEFHRV9T
SVpFOwo+ICAgCj4gQEAgLTg2LDEzICs4OCwxMyBAQCBzdGF0aWMgdm9pZCBkbWFfY2FjaGVfbWFp
bnQoZG1hX2FkZHJfdCBoYW5kbGUsIHVuc2lnbmVkIGxvbmcgb2Zmc2V0LAo+ICAgc3RhdGljIHZv
aWQgX194ZW5fZG1hX3BhZ2VfZGV2X3RvX2NwdShzdHJ1Y3QgZGV2aWNlICpod2RldiwgZG1hX2Fk
ZHJfdCBoYW5kbGUsCj4gICAJCXNpemVfdCBzaXplLCBlbnVtIGRtYV9kYXRhX2RpcmVjdGlvbiBk
aXIpCj4gICB7Cj4gLQlkbWFfY2FjaGVfbWFpbnQoaGFuZGxlICYgUEFHRV9NQVNLLCBoYW5kbGUg
JiB+UEFHRV9NQVNLLCBzaXplLCBkaXIsIERNQV9VTk1BUCk7Cj4gKwlkbWFfY2FjaGVfbWFpbnQo
aGFuZGxlLCBzaXplLCBkaXIsIERNQV9VTk1BUCk7Cj4gICB9Cj4gICAKPiAgIHN0YXRpYyB2b2lk
IF9feGVuX2RtYV9wYWdlX2NwdV90b19kZXYoc3RydWN0IGRldmljZSAqaHdkZXYsIGRtYV9hZGRy
X3QgaGFuZGxlLAo+ICAgCQlzaXplX3Qgc2l6ZSwgZW51bSBkbWFfZGF0YV9kaXJlY3Rpb24gZGly
KQo+ICAgewo+IC0JZG1hX2NhY2hlX21haW50KGhhbmRsZSAmIFBBR0VfTUFTSywgaGFuZGxlICYg
flBBR0VfTUFTSywgc2l6ZSwgZGlyLCBETUFfTUFQKTsKPiArCWRtYV9jYWNoZV9tYWludChoYW5k
bGUsIHNpemUsIGRpciwgRE1BX01BUCk7Cj4gICB9Cj4gICAKPiAgIHZvaWQgX194ZW5fZG1hX21h
cF9wYWdlKHN0cnVjdCBkZXZpY2UgKmh3ZGV2LCBzdHJ1Y3QgcGFnZSAqcGFnZSwKPiAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

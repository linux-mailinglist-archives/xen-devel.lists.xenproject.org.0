Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A62C783DE8
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 01:41:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hv92A-0000Tk-39; Tue, 06 Aug 2019 23:38:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/mMd=WC=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hv928-0000Tf-Fj
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2019 23:38:24 +0000
X-Inumbo-ID: 4789eb74-b8a3-11e9-b4fe-7341ce2af99e
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4789eb74-b8a3-11e9-b4fe-7341ce2af99e;
 Tue, 06 Aug 2019 23:38:23 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 89667208C3;
 Tue,  6 Aug 2019 23:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565134702;
 bh=rggSB+QBH9KwJZnJkYATp94CMZCFjvHy1BnRfFUcdH4=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=XphuWpKLnp59aQz/msCSq6ekVJPL3apf+6SIvEqrCV47q6ef9b8j6N7mWll2Kf81P
 i5TEtytEwQdhUaubE0zIyMm+ZPDsM11NJ/ldyCtA4N28/vBZ1DNz/zRgeVaJGdxIrt
 YpVTZH/WG6M+yCWdebGOPXvdW0LW3e0K8JBPgqt8=
Date: Tue, 6 Aug 2019 16:38:21 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <5d5749e2-883d-70f5-b953-7381d9207b0b@arm.com>
Message-ID: <alpine.DEB.2.21.1908061637390.2451@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1906181618130.2072@sstabellini-ThinkPad-T480s>
 <20190618232019.26425-1-sstabellini@kernel.org>
 <5d5749e2-883d-70f5-b953-7381d9207b0b@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v3 1/5] xen: add a p2mt parameter to
 map_mmio_regions
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
 andrew.cooper3@citrix.com, JBeulich@suse.com,
 Stefano Stabellini <stefanos@xilinx.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCAxMCBKdWwgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpIFN0ZWZhbm8sCj4g
Cj4gVGhlIEFybSBjb2RlIGxvb2tzIGdvb2QgdG8gbWUuIE9uZSBjb21tZW50IGJlbG93LgoKU2hv
dWxkIEkgdGFrZSBpdCBhcyBhIGFja2VkLWJ5PwoKCj4gT24gNi8xOS8xOSAxMjoyMCBBTSwgU3Rl
ZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9wMm0u
YyBiL3hlbi9hcmNoL2FybS9wMm0uYwo+ID4gaW5kZXggZTI4ZWExYzg1YS4uZDg4ZGYxMWUwOSAx
MDA2NDQKPiA+IC0tLSBhL3hlbi9hcmNoL2FybS9wMm0uYwo+ID4gKysrIGIveGVuL2FyY2gvYXJt
L3AybS5jCj4gPiBAQCAtMTMxMCwzMSArMTMxMCwxOCBAQCBzdGF0aWMgaW5saW5lIGludCBwMm1f
cmVtb3ZlX21hcHBpbmcoc3RydWN0IGRvbWFpbgo+ID4gKmQsCj4gPiAgICAgICByZXR1cm4gcmM7
Cj4gPiAgIH0KPiA+ICAgLWludCBtYXBfcmVnaW9uc19wMm10KHN0cnVjdCBkb21haW4gKmQsCj4g
PiAraW50IG1hcF9tbWlvX3JlZ2lvbnMoc3RydWN0IGRvbWFpbiAqZCwKPiA+ICAgICAgICAgICAg
ICAgICAgICAgICAgZ2ZuX3QgZ2ZuLAo+ID4gICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25l
ZCBsb25nIG5yLAo+ID4gICAgICAgICAgICAgICAgICAgICAgICBtZm5fdCBtZm4sCj4gPiAgICAg
ICAgICAgICAgICAgICAgICAgIHAybV90eXBlX3QgcDJtdCkKPiA+ICAgewo+ID4gKyAgICBBU1NF
UlQoIHAybXQgPT0gcDJtX21taW9fZGlyZWN0X2RldiB8fAo+ID4gKyAgICAgICAgICAgIHAybXQg
PT0gcDJtX21taW9fZGlyZWN0X25jIHx8Cj4gPiArICAgICAgICAgICAgcDJtdCA9PSBwMm1fbW1p
b19kaXJlY3RfYyApOwo+IAo+IENvdWxkIHlvdSBpbnRyb2R1Y2UgcDJtX2lzX21taW8oLi4uKSBp
biBwMm0uaD8KCkdvb2QgaWRlYSwgSSdsbCBkbyB0aGF0IGluIGEgcHJpb3IgcGF0Y2ggYW5kIHVz
ZSBpdCBoZXJlLgoKCj4gPiAgICAgICByZXR1cm4gcDJtX2luc2VydF9tYXBwaW5nKGQsIGdmbiwg
bnIsIG1mbiwgcDJtdCk7Cj4gPiAgIH0KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs

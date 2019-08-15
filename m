Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B898E84A
	for <lists+xen-devel@lfdr.de>; Thu, 15 Aug 2019 11:31:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyC4B-0003hV-Hb; Thu, 15 Aug 2019 09:29:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=y4W9=WL=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hyC4A-0003hP-5A
 for xen-devel@lists.xenproject.org; Thu, 15 Aug 2019 09:29:06 +0000
X-Inumbo-ID: 1ed3a8ee-bf3f-11e9-8524-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 1ed3a8ee-bf3f-11e9-8524-bc764e2007e4;
 Thu, 15 Aug 2019 09:29:03 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0820528;
 Thu, 15 Aug 2019 02:29:03 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 705673F706;
 Thu, 15 Aug 2019 02:29:02 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <1564763985-20312-1-git-send-email-olekstysh@gmail.com>
 <1564763985-20312-3-git-send-email-olekstysh@gmail.com>
 <3c6d54f2-06ad-6bd1-447b-0e4cbef3d391@arm.com>
 <8626bea6-cec3-128a-3b7a-b4c1542a659a@gmail.com>
 <7101e744-784b-9b89-3a90-e748ff03a02d@arm.com>
 <6119cff5-b39a-3782-18d9-f6e51c57ac37@gmail.com>
 <74e0b656-a6a1-d0c6-3cb2-e32d552d42c8@arm.com>
 <alpine.DEB.2.21.1908141208300.8737@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <becf5395-56cd-ccc6-4931-0e3854532ac8@arm.com>
Date: Thu, 15 Aug 2019 10:29:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1908141208300.8737@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V2 2/6] iommu/arm: Add ability to handle
 deferred probing request
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
Cc: Oleksandr <olekstysh@gmail.com>, xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCk9uIDE0LzA4LzIwMTkgMjA6MjUsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToKPiBPbiBXZWQsIDE0IEF1ZyAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSSBhZ3JlZSB0
aGF0IHdlIHNob3VsZCBlbmFibGUgYWxsIElPTU1VcyBvciBub25lLiBJIGRvbid0IHRoaW5rIHdl
IHdhbnQKPiB0byBkZWFsIHdpdGggcGFydGlhbGx5IGluaXRpYWxpemVkIElPTU1VcyBzeXN0ZW1z
Lgo+IAo+IEZhaWx1cmUgdG8gZW5hYmxlIGFsbCBJT01NVXMgc2hvdWxkIGxlYWQgdG8gcmV0dXJu
aW5nIGFuIGVycm9yIGZyb20gdGhlCj4gcmVsZXZhbnQgZnVuY3Rpb24gKGFyY2hfaW9tbXVfcG9w
dWxhdGVfcGFnZV90YWJsZT8pIHdoaWNoIHNob3VsZAoKVGhlIHBhdGNoIGlzOgoKfD4gc3RhcnRf
eGVuKCkKfD4gICBpb21tdV9zZXR1cCgpCnw+ICAgICBpb21tdV9oYXJkd2FyZV9zZXR1cCgpCgo+
IHRyYW5zbGF0ZSBpbnRvIFhlbiBmYWlsaW5nIHRvIGJvb3QgYW5kIGNyYXNoaW5nLiBXaGljaCBJ
IHRoaW5rIGl0IGlzCj4gd2hhdCB5b3UgYXJlIHN1Z2dlc3RpbmcsIHJpZ2h0PwoKVGhhdCdzIGNv
cnJlY3QuIEF0IHRoZSBtb21lbnQgdGhlIHJldHVybiB2YWx1ZSBvZiBpb21tdV9zZXR1cCgpIGlz
IGlnbm9yZWQuIFdoYXQgCkkgd291bGQgbGlrZSB0byBzdWdnZXN0IGlzIHNvbWV0aGluZyBhbG9u
ZyB0aGUgZm9sbG93aW5nIGxpbmVzOgoKcmMgPSBpb21tdV9zZXR1cCgpOwppZiAoIGlvbW11X2Vu
YWJsZSAmJiByYyAhPSAtRU5PREVWICkKICAgcGFuaWMoIlVuYWJsZSB0byBzZXR1cCBJT01NVXMi
KTsKCj4gCj4gKEkgd291bGRuJ3QgY2FsbCBwYW5pYygpIGluc2lkZSB0aGUgSU9NTVUgc3BlY2lm
aWMgaW5pdGlhbGl6ZXIsIGJlY2F1c2UKPiB0aGVyZSBtaWdodCBiZSBpb21tdT0gY29tbWFuZCBs
aW5lIG9wdGlvbnMgZm9yIFhlbiB0aGF0IHNwZWNpZnkgYQo+IGRpZmZlcmVudCBkZXNpcmVkIG91
dGNvbWUuIEkgd291bGQgZGVhbCB3aXRoIHRoaXMgY2FzZSB0aGUgc2FtZSB3YXkgd2UKPiB3b3Vs
ZCBkZWFsIHdpdGggYW4gZXJyb3IgZHVyaW5nIGluaXRpYWxpemF0aW9uIG9mIGEgc2luZ2xlIElP
TU1VLikKCkkgYW0gbm90IHN1cmUgdG8gdW5kZXJzdGFuZCB0aGlzLiBJZiB5b3UgaGF2ZSBhbiBo
YWxmIGluaXRpYWxpemVkIElPTU1VIChub3RlIAp0aGUgInNpbmdsZSIgaGVyZSEpLCB0aGVuIGNv
bnRpbnVpbmcgaXMgbGlrZWx5IHRvIG1ha2UgdGhpbmdzIG11Y2ggd29yc3QuCgpJIGRvbid0IGFk
dm9jYXRlIHRvIHB1dCB0aGUgcGFuaWMoKSBpbnNpZGUgdGhlIElPTU1VIHNwZWNpZmljIGluaXRp
YWxpemVyIChzZWUgCmFib3ZlKS4gQnV0IGNsZWFybHksIHdlIHNob3VsZCByZXR1cm4gYW4gZXJy
b3Igbm8gbWF0dGVyIHRoZSBjb250ZW50IG9mICdpb21tdScgCmNvbW1hbmQgbGluZSBpZiB0aGUg
dXNlciByZXF1ZXN0ZWQgdG8gZW5hYmxlIHRoZSBJT01NVXMgKGlmIGFueSkuIEl0IHdvdWxkbid0
IGJlIApyaWdodCBpZiB0aGUgdXNlciBjYW4gc2F5ICJpZ25vcmUgSU9NTVUgZXJyb3IiIGFzIG1v
c3QgbGlrZWx5IHlvdSB3aWxsIGhhdmUgCnVuZXhwZWN0ZWQgZXJyb3IgYWZ0ZXJ3YXJkcy4KCkNo
ZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=

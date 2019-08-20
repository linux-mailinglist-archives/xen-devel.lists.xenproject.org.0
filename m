Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F6B95C60
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2019 12:38:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i01SP-0004Lf-CU; Tue, 20 Aug 2019 10:33:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aYQB=WQ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1i01SO-0004La-7r
 for xen-devel@lists.xen.org; Tue, 20 Aug 2019 10:33:40 +0000
X-Inumbo-ID: f874c412-c335-11e9-b90c-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id f874c412-c335-11e9-b90c-bc764e2007e4;
 Tue, 20 Aug 2019 10:33:38 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A3985344;
 Tue, 20 Aug 2019 03:33:37 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F13F43F706;
 Tue, 20 Aug 2019 03:33:36 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.21.1908081609510.22196@sstabellini-ThinkPad-T480s>
 <20190808231242.26424-2-sstabellini@kernel.org>
 <d68be6b4-1b09-03b3-6797-fa0e8fcdbb69@arm.com>
 <alpine.DEB.2.21.1908191538000.20094@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <5e22818e-7c96-e5b1-427e-1a5bc39147c4@arm.com>
Date: Tue, 20 Aug 2019 11:33:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1908191538000.20094@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 2/6] xen/arm: copy dtb fragment to guest
 dtb
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
Cc: Volodymyr_Babchuk@epam.com, Achin.Gupta@arm.com, andrii_anisov@epam.com,
 xen-devel@lists.xen.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAxOS8wOC8yMDE5IDIzOjQ3LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gT24g
RnJpLCA5IEF1ZyAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IE9uIDgvOS8xOSAxMjoxMiBB
TSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+PiBJdCBpcyBhbHNvIG5vdCBlbnRpcmVseSBj
bGVhciBmcm9tIHRoZXJlIHZhcmlhYmxlIG5hbWUgd2hhdCBpcyB0aGUgZGlmZmVyZW5jZQo+PiBi
ZXR3ZWVuIGZkdCBhbmQgcGZkdC4KPiAKPiBJIGhhdmUgY2xhcmlmaWVkIGFuZCByZWR1Y2VkIHRo
ZSBsaXN0IG9mIHBhcmFtZXRlcnMgYnkgcGFzc2luZyBhIGtpbmZvCj4gaW5zdGVhZCBvZiBkb21h
aW4gYW5kIGZkdCBzZXBhcmF0ZWx5Lgo+IAo+IAo+PiBBbHNvLCBubyBtb3JlIHUzMiBpbiB0aGUg
Y29kZSBwbGVhc2UuIFRoaXMgaXMgbm93IHBhcnQgb2YgdGhlIENPRElOR19TVFlMRS4KPiAKPiBJ
bnRlcmVzdGluZywgSSBoYXZlbid0IGJlZW4gZm9sbG93aW5nLiBTaG91bGQgSSB1c2UgdWludDMy
X3Q/IFdoYXQncyB0aGUKPiByZWNvbW1lbmRlZCBwcmFjdGljZSBmb3IgZml4ZWQgc2l6ZWQgaW50
ZWdlcnMgbm93PwoKQ09ESU5HX1NUWUxFIHN0YXRlczoKCiJVc2UgYmFzaWMgQyB0eXBlcyBhbmQg
QyBzdGFuZGFyZCBtYW5kYXRlZCB0eXBlZGVmLXMgd2hlcmUgcG9zc2libGUgKGFuZAp3aXRoIHBy
ZWZlcmVuY2UgaW4gdGhpcyBvcmRlcikuIgoKU28gdGhpcyB3b3VsZCBiZSB1aW50Tl90LgoKQ2hl
ZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==

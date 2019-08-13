Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0018BF7E
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 19:16:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxaMf-0002jj-Qq; Tue, 13 Aug 2019 17:13:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WWvF=WJ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hxaMe-0002je-Co
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 17:13:40 +0000
X-Inumbo-ID: b10e0af4-bded-11e9-ac59-f3ac782ee935
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id b10e0af4-bded-11e9-ac59-f3ac782ee935;
 Tue, 13 Aug 2019 17:13:38 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 54CEF337;
 Tue, 13 Aug 2019 10:13:38 -0700 (PDT)
Received: from [10.37.8.112] (unknown [10.37.8.112])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 62A443F706;
 Tue, 13 Aug 2019 10:13:37 -0700 (PDT)
To: Oleksandr <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
References: <1564763985-20312-1-git-send-email-olekstysh@gmail.com>
 <1564763985-20312-6-git-send-email-olekstysh@gmail.com>
 <90352292-9218-e682-dd8a-4cf66c0d5c60@arm.com>
 <4b802df9-abc8-d918-eb39-5ef6a426cb43@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <1048a36b-e3d5-c3ca-e0b4-8f79f4ce9c19@arm.com>
Date: Tue, 13 Aug 2019 18:13:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <4b802df9-abc8-d918-eb39-5ef6a426cb43@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V2 5/6] iommu/arm: Introduce
 iommu_add_dt_device API
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 sstabellini@kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiA4LzEzLzE5IDU6MDUgUE0sIE9sZWtzYW5kciB3cm90ZToKPiBPbiAxMy4wOC4xOSAx
Njo0OSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBPbiA4LzIvMTkgNTozOSBQTSwgT2xla3NhbmRy
IFR5c2hjaGVua28gd3JvdGU6Cj4gSG1tLCBJIHdhcyB0aGlua2luZyBob3cgdG8gZW5kIHVwIHdp
dGggb25seSBvbmUgY2FsbGJhY2sgcmUtdXNlZCAKPiAoYWRkX2RldmljZSksIHJlYWxseSBkaWRu
J3Qgd2FudCB0byBhZGQgYSBuZXcgb25lIChvZl94bGF0ZSkuIEJ1dCwgSSAKPiBkaWRuJ3QgdGFr
ZSBpbnRvIHRoZSBhY2NvdW50IHRoYXQgdGhpcyBzdHVmZiBpcyBhIHJlYWxseSAKPiBkcml2ZXIt
ZGVwZW5kZWQuIFNvLCBsaWtlbHkgeWVzLCB3ZSBuZWVkIHRvIHByb3ZpZGUgb2ZfeGxhdGUgY2Fs
bGJhY2suCj4gCj4gCj4gTWF5IEkgYXNrIHNvbWUgcXVlc3Rpb25zIHRvIGNsYXJpZnk6Cj4gCj4g
MS4gRG8geW91IHdhbnQgbWUgdG8gaW50cm9kdWNlIG9mX3hsYXRlIGNhbGxiYWNrIGluIGEgc2Vw
YXJhdGUgcGF0Y2ggCj4gKHVuZGVyIENPTkZJR19BUk0/KT8KClByZWZlcmFibHkgeWVzLiBJIHRo
aW5rIHRoaXMgd2FudHMgdG8gYmUgdW5kZXIgQ09ORklHX0hBU19ERVZJQ0VfVFJFRSAKcmF0aGVy
IHRoYW4gQ09ORklHX0FSTS4KCj4gMi4gQ2FuIHdlIGF2b2lkIGludHJvZHVjaW5nIG5ldyBBUEkg
Zm9yIHRoYXQgY2FsbGJhY2s/CgpEbyB5b3UgbWVhbiBhIHdyYXBwZXIgZm9yIHRoZSBjYWxsYmFj
az8gSWYgc28sIHllcy4KCj4gaW9tbXVfYWRkX2R0X2RldmljZSB3aWxsIGJlIGFibGUgdG8gY2Fs
bCBpdCBkaXJlY3RseS4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

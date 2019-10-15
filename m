Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D94AD743E
	for <lists+xen-devel@lfdr.de>; Tue, 15 Oct 2019 13:10:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKKgw-0000bM-Ij; Tue, 15 Oct 2019 11:08:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dEpp=YI=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iKKgu-0000bH-Od
 for xen-devel@lists.xenproject.org; Tue, 15 Oct 2019 11:08:36 +0000
X-Inumbo-ID: 21693c2d-ef3c-11e9-9392-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 21693c2d-ef3c-11e9-9392-12813bfff9fa;
 Tue, 15 Oct 2019 11:08:35 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8D04F28;
 Tue, 15 Oct 2019 04:08:34 -0700 (PDT)
Received: from [10.37.8.6] (unknown [10.37.8.6])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 389A03F68E;
 Tue, 15 Oct 2019 04:08:33 -0700 (PDT)
To: Andrii Anisov <andrii.anisov@gmail.com>, xen-devel@lists.xenproject.org
References: <1571133668-5875-1-git-send-email-andrii.anisov@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <3392506d-aa99-0f71-8780-0b9fc3cce29d@arm.com>
Date: Tue, 15 Oct 2019 12:08:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1571133668-5875-1-git-send-email-andrii.anisov@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] arm/gic: Make sense of assertions
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
Cc: Andrii Anisov <andrii_anisov@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAxMC8xNS8xOSAxMTowMSBBTSwgQW5kcmlpIEFuaXNvdiB3cm90ZToKPiBGcm9tOiBB
bmRyaWkgQW5pc292IDxhbmRyaWlfYW5pc292QGVwYW0uY29tPgo+IAo+IEFSTSBDb21waWxlciBj
b21wbGFpbnMgYWJvdXQgYXNzZXJ0aW9uIGNvbmRpdGlvbnMgYmVpbmcgYWx3YXlzIHRydWUsCj4g
YmVjYXVzZSBzZ2kgaXMgb2YgZW51bSB0eXBlIHdoYXQgaGFzIGFsbCBpdHMgdmFsdWVzIHVuZGVy
IDE2Lgo+IEluIG9yZGVyIHRvIHByZXNlcnZlIHRob3NlIGFzc2VydHMsIHNwZWNpZnkgdGhlIGF2
YWlsYWJsZSBTR0kgbnVtYmVyCj4gcmlnaHQgaW4gdGhlIGVudW0gYW5kIHVzZSBpdCBmb3IgdGhl
IGFzc2VydGlvbnMuIFRoaXMgYWxzbyBlbGltaW5hdGVzCj4gbmFzdHkgaGFyZGNvZGVkIHZhbHVl
cy4KClRvIGJlIGhvbmVzdCwgdGhvc2UgQVNTRVJUSU9OcyBhcmUgcG9pbnRsZXNzLiBJZiB3ZSBh
cmUgcmVhbGx5IHdvcnJ5IG9mIAplbnVtIGdpY19zZ2kgdG8gaGF2ZSBtb3JlIHRoYW4gMTYgdmFs
dWVzLCB0aGVuIGl0IHdvdWxkIGJlIGJlc3QgdG8gdXNlIGEgCkJVSUxEX0JVR19PTigpLiBTbyB5
b3UgY2FuIGdldCBhIGJ1aWxkIGZhaWx1cmUgaWYgdGhhdCdzIGV2ZXJ5IGhhcHBlbmluZy4KClNv
bWV0aGluZyBsaWtlOgoKc3RhdGljIHZvaWQgX19pbml0IF9fbWF5YmVfdW51c2VkIGJ1aWxkX2Fz
c2VydGlvbnModm9pZCkKewogICAgICAgQlVJTERfQlVHX09OKEdJQ19TR0lfTUFYID4gTlJfR0lD
X1NHSSk7Cn0KCmVudW0KewogICAgICAvKiBVc2UgZm9yIHNhbml0eSBjaGVjayBvbiB0aGUgc2l6
ZSBvZiB0aGUgZW51bSAqLwogICAgICBHSUNfTUFYX1NHSTsKfQoKQ2hlZXJzLAoKLS0gCkp1bGll
biBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

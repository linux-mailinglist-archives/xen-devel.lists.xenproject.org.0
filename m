Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD35E131E3
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2019 18:12:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMalz-0002Cc-Gz; Fri, 03 May 2019 16:10:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Vigr=TD=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hMaly-0002CW-N0
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 16:10:54 +0000
X-Inumbo-ID: 0567db0a-6dbe-11e9-b212-03d2ae0169fc
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 0567db0a-6dbe-11e9-b212-03d2ae0169fc;
 Fri, 03 May 2019 16:10:51 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 05C85374;
 Fri,  3 May 2019 09:10:51 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0D6C83F557;
 Fri,  3 May 2019 09:10:49 -0700 (PDT)
To: Andrii Anisov <andrii.anisov@gmail.com>, xen-devel@lists.xenproject.org
References: <20190422164937.21350-1-julien.grall@arm.com>
 <20190422164937.21350-5-julien.grall@arm.com>
 <baf59ec5-cc0a-5ffc-f637-6bbfd29dd589@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <f3491a70-c5c4-024f-235e-e00a842b81d7@arm.com>
Date: Fri, 3 May 2019 17:10:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <baf59ec5-cc0a-5ffc-f637-6bbfd29dd589@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 04/20] xen/arm: Rework HSCTLR_BASE
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
Cc: Oleksandr_Tyshchenko@epam.com, sstabellini@kernel.org,
 Andrii_Anisov@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAwMy8wNS8yMDE5IDE2OjU2LCBBbmRyaWkgQW5pc292IHdyb3RlOgo+IE9uIDIyLjA0
LjE5IDE5OjQ5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IMKgIC8qIEhDUiBIeXAgQ29uZmlndXJh
dGlvbiBSZWdpc3RlciAqLwo+PiDCoCAjZGVmaW5lIEhDUl9SV8KgwqDCoMKgwqDCoMKgwqDCoCAo
X0FDKDEsVUwpPDwzMSkgLyogUmVnaXN0ZXIgV2lkdGgsIEFSTTY0IG9ubHkgKi8KPj4KPiAKPiBS
ZXNvbHV0aW9uIG9mIHRoZSBkaXNwdXRlIHdpdGggSmFuIGFib3V0IFtQQVRDSCAwMS8yMF0gaXMg
cmVxdWlyZWQgZmlyc3QuCgpJIGRvbid0IHVuZGVyc3RhbmQgd2hhdCBpcyB5b3VyICJzZWNvbmQi
LiBEb2VzIGl0IG1lYW4geW91IGFyZSBoYXBweSB3aXRoIHRoZSAKaWRlYSBvZiB0aGUgcGF0Y2gg
YnV0IHdlIHNob3VsZCBhZ3JlZSBvbiB0aGUgbmFtaW5nIGZpcnN0PwoKQ2hlZXJzLAoKLS0gCkp1
bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

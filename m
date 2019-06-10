Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 324E03BDDE
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2019 22:54:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1haRHb-0008Cz-MG; Mon, 10 Jun 2019 20:52:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=j7+2=UJ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1haRHa-0008Ct-7L
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2019 20:52:46 +0000
X-Inumbo-ID: b0d9a6dc-8bc1-11e9-b059-2b1e1090423c
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id b0d9a6dc-8bc1-11e9-b059-2b1e1090423c;
 Mon, 10 Jun 2019 20:52:42 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 345F4344;
 Mon, 10 Jun 2019 13:52:42 -0700 (PDT)
Received: from [10.37.10.2] (unknown [10.37.10.2])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2C8523F73C;
 Mon, 10 Jun 2019 13:52:41 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20190514121132.26732-1-julien.grall@arm.com>
 <20190514121132.26732-2-julien.grall@arm.com>
 <alpine.DEB.2.21.1905201143390.16404@sstabellini-ThinkPad-T480s>
 <42c29444-01b0-cb6a-a8e7-3642175402f7@arm.com>
 <0172ad95-1a78-8f2f-9f11-a74089829fb9@arm.com>
 <c2e73bc5-4390-7436-21f7-deff8d85db1d@arm.com>
 <alpine.DEB.2.21.1906101337160.8691@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <65f29654-ab95-f011-69f1-0d26a09d80b6@arm.com>
Date: Mon, 10 Jun 2019 21:52:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1906101337160.8691@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH MM-PART1 v3 1/8] xen/arm: Don't boot Xen on
 platform using AIVIVT instruction caches
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
Cc: "committers@xenproject.org" <committers@xenproject.org>,
 xen-devel@lists.xenproject.org, nd@arm.com, Andrii_Anisov@epam.com,
 Oleksandr_Tyshchenko@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiA2LzEwLzE5IDk6NDAgUE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiBIaSBKdWxp
ZW4sCgpIaSBTdGVmYW5vLAoKPiAKPiBJIGV4cHJlc3NlZCBteSBwcmVmZXJlbmNlIGJlbG93LiBX
ZSBkb24ndCBhZ3JlZS4gSXMgdGhlcmUgYW55dGhpbmcgZWxzZQo+IHlvdSB3b3VsZCBsaWtlIG1l
IHRvIGFkZCB0byB0aGlzIHRocmVhZD8gRG8geW91IGhhdmUgYSBzcGVjaWZpYwo+IHF1ZXN0aW9u
PyBUaGUgb25seSBxdWVzdGlvbiBJIHNlZSBiZWxvdyBpcyAiVXNlcnMgb2Ygd2hhdD8iIGJ1dCBJ
IHRha2UKPiBpdCB3YXMganVzdCByaGV0b3JpY2FsLgoKTm8gaXQgd2Fzbid0IHJoZXRvcmljYWwu
IEl0IHdhcyBhIGdlbnVpbmUgcXVlc3Rpb24sIGJlY2F1c2UgeW91IGFyZSAKaW1wbHlpbmcgdGhh
dDoKCTEpIEl0IGlzIHBvc3NpYmxlIHRvIGhhdmUgdXNlciB0aGF0IGFyZSB1c2luZyBBSVZJVlQK
CTIpIFdlIGhhdmUgdG8gc3VwcG9ydCBvdXQgb2YgdHJlZSB1c2VycwoKVGhlIGxhdHRlciBpcyBw
YXJ0aWN1bGFybHkgY3JpdGljYWwgYXMgdGhpcyBpbXBsaWVzIHRoYXQgYW55IGNoYW5nZSBpbiAK
WGVuIHNob3VsZCBiZSBkb25lIHdpdGgga2VlcGluZyBpbiBtaW5kIGFueSBwYXRjaGVzIHRoYXQg
Y291bGQgYmUgCmFwcGxpZWQgb24gdG9wIG9mIFhlbi4KClNvIEkgYW0gYWxsIGhlYXIgb2YgeW91
ciBhcmd1bWVudHMgaGVyZS4uLiBBdCB0aGUgZW5kLCB3ZSBuZWVkIHRvIGNvbWUgCnRvIGFuIGFn
cmVlbWVudCBoZXJlIGFzIGF0IHRoZSBtb21lbnQgbXkgcGF0Y2ggY2FuJ3QgZ28gd2l0aG91dCB5
b3VyIGFjay4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

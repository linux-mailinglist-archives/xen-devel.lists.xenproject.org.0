Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC7C7C0B3
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2019 14:06:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsnKY-0005UP-M8; Wed, 31 Jul 2019 12:03:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8Zog=V4=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hsnKW-0005UK-LU
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2019 12:03:40 +0000
X-Inumbo-ID: 3b181c52-b38b-11e9-a6e3-a7072e898eb1
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 3b181c52-b38b-11e9-a6e3-a7072e898eb1;
 Wed, 31 Jul 2019 12:03:38 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2B3C8344;
 Wed, 31 Jul 2019 05:03:38 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 78BFD3F71F;
 Wed, 31 Jul 2019 05:03:37 -0700 (PDT)
To: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>,
 xen-devel@lists.xenproject.org
References: <cover.1564371527.git.stewart.hildebrand@dornerworks.com>
 <2473fc46a8229bb2434a90a510136202e7479177.1564371527.git.stewart.hildebrand@dornerworks.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <bca49f6e-7e01-f2d0-b309-9f0dccd70860@arm.com>
Date: Wed, 31 Jul 2019 13:03:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <2473fc46a8229bb2434a90a510136202e7479177.1564371527.git.stewart.hildebrand@dornerworks.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 2/2] xen/arm: platform: Add Raspberry Pi
 platform
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
Cc: Andre Przywara <andre.przywara@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3Rld2FydCwKCk9uIDI5LzA3LzIwMTkgMTQ6MTksIFN0ZXdhcnQgSGlsZGVicmFuZCB3cm90
ZToKPiBUaGUgYXV4IHBlcmlwaGVyYWxzICh1YXJ0MSwgc3BpMSwgYW5kIHNwaTIpIHNoYXJlIGFu
IElSUSBhbmQgYSBwYWdlIG9mCj4gbWVtb3J5LiBGb3IgZGVidWdnaW5nLCBpdCBpcyBoZWxwZnVs
IHRvIHVzZSB0aGUgYXV4IFVBUlQgaW4gWGVuLiBJbgo+IHRoaXMgY2FzZSwgWGVuIHdvdWxkIHRy
eSB0byBhc3NpZ24gc3BpMSBhbmQgc3BpMiB0byBkb20wLCBidXQgdGhpcwo+IHJlc3VsdHMgaW4g
YW4gZXJyb3Igc2luY2UgdGhlIHNoYXJlZCBJUlEgd2FzIGFscmVhZHkgYXNzaWduZWQgdG8gWGVu
Lgo+IEJsYWNrbGlzdCBhdXggZGV2aWNlcyBvdGhlciB0aGFuIHRoZSBVQVJUIHRvIHByZXZlbnQg
bWFwcGluZyB0aGUgc2hhcmVkCj4gSVJRIGFuZCBtZW1vcnkgcmFuZ2UgdG8gZG9tMC4KClJlYWRp
bmcgdGhlIGNvbW1pdCBtZXNzYWdlLCBpdCBpcyB1bmNsZWFyIHdoYXQncyB0aGUgaW1wYWN0IG9u
IGJsYWNrbGlzdCBzcGkxIAphbmQgc3BpMi4gQ291bGQgeW91IGV4cGFuZCBpdD8KClRoZSByZXN0
IG9mIHRoZSBwYXRjaCBsb29rcyBnb29kLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

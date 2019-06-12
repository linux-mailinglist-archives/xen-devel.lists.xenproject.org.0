Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E97542050
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2019 11:11:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hazFE-00028X-1g; Wed, 12 Jun 2019 09:08:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uepN=UL=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hazFC-00028S-6n
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2019 09:08:34 +0000
X-Inumbo-ID: a4a745aa-8cf1-11e9-885f-7394aa5e79c3
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id a4a745aa-8cf1-11e9-885f-7394aa5e79c3;
 Wed, 12 Jun 2019 09:08:28 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B4C582B;
 Wed, 12 Jun 2019 02:08:28 -0700 (PDT)
Received: from [10.37.12.233] (unknown [10.37.12.233])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EB5BB3F246;
 Wed, 12 Jun 2019 02:08:27 -0700 (PDT)
To: Baodong Chen <chenbaodong@mxnavi.com>, xen-devel@lists.xenproject.org
References: <1560318154-19095-1-git-send-email-chenbaodong@mxnavi.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <af3fe48d-afaa-3184-e142-9a1e2b8574f4@arm.com>
Date: Wed, 12 Jun 2019 10:08:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1560318154-19095-1-git-send-email-chenbaodong@mxnavi.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/arm: io: add function
 swap_mmio_handler()
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
Cc: Stefano Stabellini <sstabellini@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiA2LzEyLzE5IDY6NDIgQU0sIEJhb2RvbmcgQ2hlbiB3cm90ZToKPiBTd2FwIGZ1bmN0
aW9uIGNhbiBiZSB1c2VkIHdoZW4gY2FsbGluZyBzb3J0KCkuCj4gb3IgZWxzZSwgdGhlIGRlZmF1
bHQgc3dhcCBmdW5jdGlvbiBnZW5lcmljX3N3YXAoKSBpcyB1c2VkLAo+IHdoaWNoIGlzIGEgbGl0
dGxlIGluZWZmaWNpZW50LgoKSSBhbSBub3QgZW50aXJlbHkgY29udmluY2UgdGhpcyB3aWxsIGJl
IG1vcmUgZWZmaWNpZW50LiBtbWlvX2hhbmRsZXIgCmRvZXMgbm90IGZpdCBpbiA2NCBiaXQsIHNv
IHRoZSBjb21waWxlciBtYXkgZGVjaWRlIHRvIGRvIGVpdGhlciBtdWx0aXBsZSAKbG9hZCBvciBy
ZXBsYWNlIHdpdGggYSBtZW1jcHkuCgpTbyBhdCBiZXN0IHRoaXMgZmVlbHMgc29tZSBtaWNyby1v
cHRpbWl6YXRpb24uIEJ1dCB0aGVuLCB0aGlzIGlzIG9ubHkgCmNhbGwgYSBsaW1pdGVkIG51bWJl
ciBvZiB0aW1lIGF0IGVhY2ggZG9tYWluIGJ1aWxkLiBJcyBpdCByZWFsbHkgd29ydGggaXQ/CgpP
biBhIHNpZGUgbm90ZSwgSSBoYXZlIG5vdGljZWQgeW91IGFyZSBzZW5kaW5nIGEgbG90IG9mIApv
cHRpbWl6YXRpb24vY2xlYW4tdXAgcGF0Y2guIFdoYXQgaXMgeW91ciBlbmQgZ29hbCBoZXJlPwoK
SWYgaXQgaXMgdG8gaW1wcm92ZSB0aGUgcGVyZm9ybWFuY2UsIHRoZW4gdGhlcmUgYXJlIG11Y2gg
YmlnZ2VyIGZpc2ggdG8gCmZyeSB3aXRoaW4gWGVuIGNvZGUgYmFzZS4gSSBhbSBoYXBweSB0byBw
b2ludCBzb21lIG9mIHRoZW0gYmFzZWQgb24gCndoZXJlIHlvdSBhcmUgbG9va2luZyB0byBpbXBy
b3ZlLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==

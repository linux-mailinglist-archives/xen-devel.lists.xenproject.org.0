Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D81A410C044
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 23:39:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ia5vV-0005Bf-78; Wed, 27 Nov 2019 22:36:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jeri=ZT=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1ia5vS-0005Ba-SU
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2019 22:36:46 +0000
X-Inumbo-ID: 64b43c4c-1166-11ea-83b8-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 64b43c4c-1166-11ea-83b8-bc764e2007e4;
 Wed, 27 Nov 2019 22:36:46 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8BE7F206E0;
 Wed, 27 Nov 2019 22:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574894206;
 bh=F2p7p8S8OG3IbWdkwHlay7VQ6q05eF8ooPOmnFTUcT4=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=tMRUnAUWhpr4f3XdvKOjWl2vraM8DC4Pqy9WOBpED7ynQPssh5HtwvdSzwNqu0Z/m
 WfftZpdo5oHD9sq5XeMHSoVsUZksWhChqZ7jEJK5Z9aw6NEe5B7Sjd75qnQ0PeVPLh
 bbo6mAoZ2Qh9e/CuOsWNII2gtDqnkZLzWCSGaPxA=
Date: Wed, 27 Nov 2019 14:36:44 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
In-Reply-To: <a7cb8e84-b557-fa95-5796-5537b6ae46ae@xen.org>
Message-ID: <alpine.DEB.2.21.1911271436290.27669@sstabellini-ThinkPad-T480s>
References: <cfc89f03-ba62-975e-afe2-2fb85fd5bb4c@suse.com>
 <a7cb8e84-b557-fa95-5796-5537b6ae46ae@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] getting 4.12.2 ready
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
Cc: Lars Kurth <lars.kurth@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCAyNyBOb3YgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IE9uIDI1LzExLzIwMTkg
MTU6MTAsIEphbiBCZXVsaWNoIHdyb3RlOgo+ID4gQWxsLAo+IAo+IEhpLAo+IAo+ID4gCj4gPiB0
aGUgNC4xMi4yIHN0YWJsZSByZWxlYXNlIGlzIGR1ZSBpbiBhYm91dCAyIHdlZWtzIHRpbWUuIFBs
ZWFzZSBwb2ludAo+ID4gb3V0IGJhY2twb3J0aW5nIGNhbmRpZGF0ZXMgdGhhdCB5b3UgZmluZCBt
aXNzaW5nIGZyb20gdGhlIHJlc3BlY3RpdmUKPiA+IHN0YWJsZSB0cmVlcy4KPiAKPiBNb3N0IG9m
IHRoZSBzZXJpZXMgInhlbi9hcm06IFhTQS0yMDEgYW5kIFhTQS0yNjMgZml4ZXMiIFsxXSBzaG91
bGQgYmUKPiBiYWNrcG9ydGVkIHRvIGF0IGxlYXN0IFhlbiA0LjEyICh0aGlzIGlzIGFscmVhZHkg
aW4gc3RhZ2luZykuCj4gCj4gVGhpcyB3b3VsZCBlcnJvciBpc3N1ZXMgd2l0aCBTRXJyb3IgYW5k
IFNTQkQuIEJ1dCBJIGhhdmVuJ3QgaGFkIHRoZSBjaGFuY2UgdG8KPiBjaGVjayB0aGlzIGlzIGFw
cGx5aW5nIGNsZWFubHkgdG8gWGVuIDQuMTIuIE1heWJlIFN0ZWZhbm8gY2FuIHRha2UgYSBsb29r
Pwo+IAo+IENoZWVycwo+IAo+IFsxXSBodHRwczovL3d3dy5tYWlsLWFyY2hpdmUuY29tL3hlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZy9tc2c1OTI4My5odG1sCgpJdCBhcHBsaWVkIHdpdGhv
dXQgYW55IGlzc3VlcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==

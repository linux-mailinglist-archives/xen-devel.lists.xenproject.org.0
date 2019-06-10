Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFD13BF36
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2019 00:09:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1haSQI-0005mb-1x; Mon, 10 Jun 2019 22:05:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=O/RI=UJ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1haSQG-0005mW-Dz
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2019 22:05:48 +0000
X-Inumbo-ID: e61c0056-8bcb-11e9-bbbb-bfa6b65b76be
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e61c0056-8bcb-11e9-bbbb-bfa6b65b76be;
 Mon, 10 Jun 2019 22:05:47 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0626120820;
 Mon, 10 Jun 2019 22:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560204346;
 bh=EFDD5wa3tmVWqLIQH//cV3UvXXYrum8HQYrQKV249Ac=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=GPoxL+0GxhtSTm0tO800+0DP9tim6kn/VRX813zJiFreGaY2/AZl6g+TUJRm80fTn
 lb9/HXK4o/EC9lO4zZhTKRzJ659+fGy8vEjdm11VBQAn0gmO+jqJ0n4CtjwnIGszrc
 ODxjF2USJlOnsozBwS2UGgnUjs2GIUgxpFxbbqhE=
Date: Mon, 10 Jun 2019 15:05:45 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <65f29654-ab95-f011-69f1-0d26a09d80b6@arm.com>
Message-ID: <alpine.DEB.2.21.1906101355120.8691@sstabellini-ThinkPad-T480s>
References: <20190514121132.26732-1-julien.grall@arm.com>
 <20190514121132.26732-2-julien.grall@arm.com>
 <alpine.DEB.2.21.1905201143390.16404@sstabellini-ThinkPad-T480s>
 <42c29444-01b0-cb6a-a8e7-3642175402f7@arm.com>
 <0172ad95-1a78-8f2f-9f11-a74089829fb9@arm.com>
 <c2e73bc5-4390-7436-21f7-deff8d85db1d@arm.com>
 <alpine.DEB.2.21.1906101337160.8691@sstabellini-ThinkPad-T480s>
 <65f29654-ab95-f011-69f1-0d26a09d80b6@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Andrii_Anisov@epam.com,
 Oleksandr_Tyshchenko@epam.com,
 "committers@xenproject.org" <committers@xenproject.org>,
 xen-devel@lists.xenproject.org, nd@arm.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAxMCBKdW4gMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IE9uIDYvMTAvMTkgOTo0
MCBQTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+ID4gSGkgSnVsaWVuLAo+IAo+IEhpIFN0
ZWZhbm8sCj4gCj4gPiAKPiA+IEkgZXhwcmVzc2VkIG15IHByZWZlcmVuY2UgYmVsb3cuIFdlIGRv
bid0IGFncmVlLiBJcyB0aGVyZSBhbnl0aGluZyBlbHNlCj4gPiB5b3Ugd291bGQgbGlrZSBtZSB0
byBhZGQgdG8gdGhpcyB0aHJlYWQ/IERvIHlvdSBoYXZlIGEgc3BlY2lmaWMKPiA+IHF1ZXN0aW9u
PyBUaGUgb25seSBxdWVzdGlvbiBJIHNlZSBiZWxvdyBpcyAiVXNlcnMgb2Ygd2hhdD8iIGJ1dCBJ
IHRha2UKPiA+IGl0IHdhcyBqdXN0IHJoZXRvcmljYWwuCj4gCj4gTm8gaXQgd2Fzbid0IHJoZXRv
cmljYWwuIEl0IHdhcyBhIGdlbnVpbmUgcXVlc3Rpb24sIGJlY2F1c2UgeW91IGFyZSBpbXBseWlu
Zwo+IHRoYXQ6Cj4gCTEpIEl0IGlzIHBvc3NpYmxlIHRvIGhhdmUgdXNlciB0aGF0IGFyZSB1c2lu
ZyBBSVZJVlQKPiAJMikgV2UgaGF2ZSB0byBzdXBwb3J0IG91dCBvZiB0cmVlIHVzZXJzCj4gCj4g
VGhlIGxhdHRlciBpcyBwYXJ0aWN1bGFybHkgY3JpdGljYWwgYXMgdGhpcyBpbXBsaWVzIHRoYXQg
YW55IGNoYW5nZSBpbiBYZW4KPiBzaG91bGQgYmUgZG9uZSB3aXRoIGtlZXBpbmcgaW4gbWluZCBh
bnkgcGF0Y2hlcyB0aGF0IGNvdWxkIGJlIGFwcGxpZWQgb24gdG9wCj4gb2YgWGVuLgo+IAo+IFNv
IEkgYW0gYWxsIGhlYXIgb2YgeW91ciBhcmd1bWVudHMgaGVyZS4uLiBBdCB0aGUgZW5kLCB3ZSBu
ZWVkIHRvIGNvbWUgdG8gYW4KPiBhZ3JlZW1lbnQgaGVyZSBhcyBhdCB0aGUgbW9tZW50IG15IHBh
dGNoIGNhbid0IGdvIHdpdGhvdXQgeW91ciBhY2suCgpObywgd2UgZG9uJ3QgaGF2ZSB0byBzdXBw
b3J0IG91dCBvZiB0cmVlIHVzZXJzLiBJIGRpZG4ndCBtZWFuIHRvIGltcGx5Cml0LiBCdXQgaXQg
Y29zdHMgdXMgdmVyeSBsaXR0bGUgdG8gYmUgY291cnRlb3VzIGFuZCBwb2xpdGUgaW4gY2FzZXMg
bGlrZQp0aGlzLCBzZW5kaW5nIGEgbW9yZSBvYnZpb3VzIFtBTk5PVU5DRV0gZW1haWwgc2F5aW5n
ICJ3ZSBhcmUgZHJvcHBpbmcKQUlWSVZUIGFzIG5vYm9keSBzaG91bGQgYmUgdXNpbmcgaXQiLgoK
Q2FuIHRoaXMgcGF0Y2ggZ28gaW4gcmVnYXJkbGVzcz8gSSB3b3VsZG4ndCBiZSBoYXBweSBhYm91
dCBpdCwgYnV0IGlmCnRoaXMgd2FzIGEgdm90ZSBpdCB3b3VsZCBiZSBhIC0xLCBub3QgYSAtMi4g
SXQgaXMgZGlmZmljdWx0IHRvIGdpdmUgYW4KYWNrIGZvciBhIHRoaW5nIEkgZG9uJ3QgbGlrZSwg
YnV0IEkgd291bGRuJ3QgZ28gYXMgZmFyIGFzIG5hY2tpbmcgaXQuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5433A42F75
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2019 21:03:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hb8T9-0005UR-UQ; Wed, 12 Jun 2019 18:59:35 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uepN=UL=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hb8T7-0005UM-N7
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2019 18:59:33 +0000
X-Inumbo-ID: 360f809f-8d44-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 360f809f-8d44-11e9-8980-bc764e045a96;
 Wed, 12 Jun 2019 18:59:31 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 744EC28;
 Wed, 12 Jun 2019 11:59:31 -0700 (PDT)
Received: from [10.37.12.233] (unknown [10.37.12.233])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CEC3E3F246;
 Wed, 12 Jun 2019 11:59:30 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.10.1905011628310.23881@sstabellini-ThinkPad-X260>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <e6a6ed7e-8085-4b29-a102-6d4ddf1f578f@arm.com>
Date: Wed, 12 Jun 2019 19:59:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.10.1905011628310.23881@sstabellini-ThinkPad-X260>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/arm: improve dom0less documentation
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
Cc: xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCk9uIDUvMi8xOSAxMjozMCBBTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3Rl
Ogo+IEltcHJvdmUgRG9tMC1sZXNzIGRvY3VtZW50YXRpb246IGluY2x1ZGUgYSBjb21wbGV0ZSBj
b25maWd1cmF0aW9uCj4gZXhhbXBsZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBTdGVmYW5vIFN0YWJl
bGxpbmkgPHN0ZWZhbm9zQHhpbGlueC5jb20+Cj4gCj4gZGlmZiAtLWdpdCBhL2RvY3MvZmVhdHVy
ZXMvZG9tMGxlc3MucGFuZG9jIGIvZG9jcy9mZWF0dXJlcy9kb20wbGVzcy5wYW5kb2MKPiBpbmRl
eCA0ZTM0MmI3Li5lMDc2ZTM3IDEwMDY0NAo+IC0tLSBhL2RvY3MvZmVhdHVyZXMvZG9tMGxlc3Mu
cGFuZG9jCj4gKysrIGIvZG9jcy9mZWF0dXJlcy9kb20wbGVzcy5wYW5kb2MKClRoZSBjb250ZW50
IGlzIHByb2JhYmx5IG9rIGZlYXR1cmVzLCBhbHRob3VnaCBJIGFtIHdvcnJ5IG9mIGR1cGxpY2F0
aW9uIAp3aXRoIGRvY3MvbWlzYy9hcm0vZGV2aWNlLXRyZWUvYm9vdGluZy50eHQuCgpIb3dldmVy
LCB3aGVuIGxvb2tpbmcgaG93IG90aGVyIGZlYXR1cmVzIGRlYWwgd2l0aCBzaW1pbGFyIGRlc2Ny
aXB0aW9uLApJIG5vdGljZWQgdGhhdCB3ZSBkb24ndCBmb2xsb3cgdGhlIHRlbXBsYXRlIChzZWUg
dGVtcGxhdGVzLnBhbmRvYykuCgpJIGFtIGF3YXJlIHRoaXMgaXMgYSBzdWdnZXN0aW9uLCBidXQg
aXQgd291bGQgYmUgZ29vZCB0byBmb2xsb3cgaXQgYXMgYSAKdXNlciB3b3VsZCBiZSBhYmxlIHRv
IGZpbmQgaGlzIHdheSB0aHJvdWdoIGl0IG1vcmUgZWFzaWx5IGFuZCB3b3VsZCBoZWxwIAp0byBr
bm93IHRoaXMgaXMgQXJtIG9ubHkgKHRoaXMgaXMgbm90IGNsZWFybHkgc3BlbGwgb3V0KS4KCkNv
dWxkIHlvdSBoYXZlIGEgbG9vayBhdCBpdD8KClRoaXMgY291bGQgYmUgYSBmb2xsb3ctdXAgc286
CgpBY2tlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCkNoZWVycywK
Ci0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=

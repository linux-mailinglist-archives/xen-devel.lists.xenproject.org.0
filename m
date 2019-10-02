Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA3AC945B
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2019 00:29:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFn52-0001aj-Jj; Wed, 02 Oct 2019 22:26:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7bij=X3=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iFn51-0001aW-3k
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 22:26:43 +0000
X-Inumbo-ID: b587a944-e563-11e9-bf31-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by localhost (Halon) with ESMTPS
 id b587a944-e563-11e9-bf31-bc764e2007e4;
 Wed, 02 Oct 2019 22:26:42 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A9D2C2133F;
 Wed,  2 Oct 2019 22:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1570055201;
 bh=CvanqAH7JxTOKrp1HRBsqV/XGnYdGC09PX/aZp7Yvag=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=ImDr4eTegmL9CDdUO/l5xZF6LLLhFzcTL+AS68bCJPZYy0yiW0mPWz/59XS4D3pXO
 lMROllRmuf575l5lQQDippOycI24qbKWSvlPUC1Q2cHouXud9KNkEovUQJ5QBZWMGa
 Gc8PlgIGO5YyhaRVrbbUueNtVXfh34kN9+wF4Yzs=
Date: Wed, 2 Oct 2019 15:26:41 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20191002180047.17144-7-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1910021452280.2691@sstabellini-ThinkPad-T480s>
References: <20191002180047.17144-1-julien.grall@arm.com>
 <20191002180047.17144-7-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH for-4.13 6/6] xen/arm: traps: Mark
 check_stack_alignment_constraints as unused
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
Cc: Artem_Mygaiev@epam.com, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCAyIE9jdCAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gQ2xhbmcgd2lsbCB0aHJv
dyBhbiBlcnJvciBpZiBhIGZ1bmN0aW9uIGlzIHVudXNlZCB1bmxlc3MgeW91IHRlbGwKPiB0byBp
Z25vcmUgaXQuIFRoaXMgY2FuIGJlIGRvbmUgdXNpbmcgX19tYXliZV91bnVzZWQuCj4gCj4gV2hp
bGUgbW9kaWZ5aW5nIHRoZSBkZWNsYXJhdGlvbiwgdXBkYXRlIGl0IHRvIG1hdGNoIHByb3RvdHlw
ZSBvZiBzaW1pbGFyCj4gZnVuY3Rpb25zIChzZWUgYnVpbGRfYXNzZXJ0aW9ucykuIFRoaXMgaGVs
cHMgdG8gdW5kZXJzdGFuZCB0aGF0IHRoZSBzb2xlCj4gcHVycG9zZSBvZiB0aGUgZnVuY3Rpb24g
aXMgdG8gaG9sZCBCVUlMRF9CVUdfT04oKS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3Jh
bGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgoKU2FtZSBzbWFsbCBub3RlIGFib3V0IGJ1aWxkX2Fz
c2VydGlvbnMgYmVjb21pbmcgX19pbml0LgoKQWNrZWQtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8
c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KCgo+IC0tLQo+ICAgICBDaGFuZ2VzIGluIHYyOgo+ICAg
ICAgICAgLSBVcGRhdGUgdGhlIHByb3RvdHlwZSB0byBtYXRjaCBzdHlsZSBvZiBvdGhlciBmdW5j
dGlvbnMgaG9sZGluZwo+ICAgICAgICAgb24gYnVpbGQgYXNzZXJ0aW9ucy4KPiAtLS0KPiAgeGVu
L2FyY2gvYXJtL3RyYXBzLmMgfCAzICsrLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS90cmFwcy5j
IGIveGVuL2FyY2gvYXJtL3RyYXBzLmMKPiBpbmRleCBhM2I5NjFiZDA2Li5hM2RlYjU5MzcyIDEw
MDY0NAo+IC0tLSBhL3hlbi9hcmNoL2FybS90cmFwcy5jCj4gKysrIGIveGVuL2FyY2gvYXJtL3Ry
YXBzLmMKPiBAQCAtNTQsNyArNTQsOCBAQAo+ICAgKiB0aGF0IGJvdGggdGhlIGtlcm5lbCBoYWxm
IG9mIHN0cnVjdCBjcHVfdXNlcl9yZWdzICh3aGljaCBpcyBwdXNoZWQgaW4KPiAgICogZW50cnku
UykgYW5kIHN0cnVjdCBjcHVfaW5mbyAod2hpY2ggbGl2ZXMgYXQgdGhlIGJvdHRvbSBvZiBhIFhl
bgo+ICAgKiBzdGFjaykgbXVzdCBiZSBkb3VibGV3b3JkLWFsaWduZWQgaW4gc2l6ZS4gICovCj4g
LXN0YXRpYyBpbmxpbmUgdm9pZCBjaGVja19zdGFja19hbGlnbm1lbnRfY29uc3RyYWludHModm9p
ZCkgewo+ICtzdGF0aWMgdm9pZCBfX2luaXQgX19tYXliZV91bnVzZWQgYnVpbGRfYXNzZXJ0aW9u
cyh2b2lkKQo+ICt7Cj4gICNpZmRlZiBDT05GSUdfQVJNXzY0Cj4gICAgICBCVUlMRF9CVUdfT04o
KHNpemVvZiAoc3RydWN0IGNwdV91c2VyX3JlZ3MpKSAmIDB4Zik7Cj4gICAgICBCVUlMRF9CVUdf
T04oKG9mZnNldG9mKHN0cnVjdCBjcHVfdXNlcl9yZWdzLCBzcHNyX2VsMSkpICYgMHhmKTsKPiAt
LSAKPiAyLjExLjAKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6281144624
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2020 21:58:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iu0XI-0004xQ-H4; Tue, 21 Jan 2020 20:54:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+5rg=3K=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iu0XG-0004xK-MA
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2020 20:54:06 +0000
X-Inumbo-ID: 2983b3d2-3c90-11ea-9fd7-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2983b3d2-3c90-11ea-9fd7-bc764e2007e4;
 Tue, 21 Jan 2020 20:54:06 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4572321734;
 Tue, 21 Jan 2020 20:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579640045;
 bh=Km/kYdhbMv3FHkm+l/HcfenQszs2bLGG602u5C5Naiw=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=i4YpDvfEnythaz5XeCjMkoEY+mLURcisDfrYwrYXBH9px3OUq6il88qWfKZ9WsQyI
 ZkdyhXKVushq+E5vhCvRdBTu4ZUvb9ClWB1FBu0ACVtqJid1690aMzK3gTprQUbMid
 LCGoVi++zMSjYEHI9NTTM77T9eDh4nDp4AHEvxK4=
Date: Tue, 21 Jan 2020 12:53:59 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
In-Reply-To: <20200116215136.17597-1-julien@xen.org>
Message-ID: <alpine.DEB.2.21.2001211253490.16648@sstabellini-ThinkPad-T480s>
References: <20200116215136.17597-1-julien@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] Revert "xen/arm32: setup: Give a xenheap
 page to the boot allocator"
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCAxNiBKYW4gMjAyMCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFNpbmNlIGNvbW1pdCBj
NjFjMWI0OTQzICJ4ZW4vcGFnZV9hbGxvYzogc3RhdGljYWxseSBhbGxvY2F0ZQo+IGJvb3RtZW1f
cmVnaW9uX2xpc3QiLCB0aGUgYm9vdCBhbGxvY2F0b3IgZG9lcyBub3QgdXNlIHRoZSBmaXJzdCBw
YWdlIG9mCj4gdGhlIGZpcnN0IHJlZ2lvbiBwYXNzZWQgZm9yIGl0cyBvd24gcHVycG9zZS4KPiAK
PiBUaGlzIHJldmVydHMgY29tbWl0IGFlODRmNTUzNTM0NzVmNTY5ZGFkZGI5YTgxYWMwYTZiYzc3
NzJjOTAuCj4gCj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4K
CkFja2VkLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Cgo+
IC0tLQo+ICB4ZW4vYXJjaC9hcm0vc2V0dXAuYyB8IDggKy0tLS0tLS0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCA3IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4v
YXJjaC9hcm0vc2V0dXAuYyBiL3hlbi9hcmNoL2FybS9zZXR1cC5jCj4gaW5kZXggOWRkMzczOGQ0
NC4uNDk0ZjcwNTQ2YiAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC9hcm0vc2V0dXAuYwo+ICsrKyBi
L3hlbi9hcmNoL2FybS9zZXR1cC5jCj4gQEAgLTU5NCw3ICs1OTQsNiBAQCBzdGF0aWMgdm9pZCBf
X2luaXQgc2V0dXBfbW0odm9pZCkKPiAgICAgIHVuc2lnbmVkIGxvbmcgaGVhcF9wYWdlcywgeGVu
aGVhcF9wYWdlcywgZG9taGVhcF9wYWdlczsKPiAgICAgIGludCBpOwo+ICAgICAgY29uc3QgdWlu
dDMyX3QgY3RyID0gUkVBRF9DUDMyKENUUik7Cj4gLSAgICBtZm5fdCBib290X21mbl9zdGFydCwg
Ym9vdF9tZm5fZW5kOwo+ICAKPiAgICAgIGlmICggIWJvb3RpbmZvLm1lbS5ucl9iYW5rcyApCj4g
ICAgICAgICAgcGFuaWMoIk5vIG1lbW9yeSBiYW5rXG4iKTsKPiBAQCAtNjY3LDExICs2NjYsNiBA
QCBzdGF0aWMgdm9pZCBfX2luaXQgc2V0dXBfbW0odm9pZCkKPiAgCj4gICAgICBzZXR1cF94ZW5o
ZWFwX21hcHBpbmdzKChlID4+IFBBR0VfU0hJRlQpIC0geGVuaGVhcF9wYWdlcywgeGVuaGVhcF9w
YWdlcyk7Cj4gIAo+IC0gICAgLyogV2UgbmVlZCBhIHNpbmdsZSBtYXBwZWQgcGFnZSBmb3IgcG9w
dWxhdGluZyBib290bWVtX3JlZ2lvbl9saXN0LiAqLwo+IC0gICAgYm9vdF9tZm5fc3RhcnQgPSBt
Zm5fYWRkKHhlbmhlYXBfbWZuX2VuZCwgLTEpOwo+IC0gICAgYm9vdF9tZm5fZW5kID0geGVuaGVh
cF9tZm5fZW5kOwo+IC0gICAgaW5pdF9ib290X3BhZ2VzKG1mbl90b19tYWRkcihib290X21mbl9z
dGFydCksIG1mbl90b19tYWRkcihib290X21mbl9lbmQpKTsKPiAtCj4gICAgICAvKiBBZGQgbm9u
LXhlbmhlYXAgbWVtb3J5ICovCj4gICAgICBmb3IgKCBpID0gMDsgaSA8IGJvb3RpbmZvLm1lbS5u
cl9iYW5rczsgaSsrICkKPiAgICAgIHsKPiBAQCAtNzE3LDcgKzcxMSw3IEBAIHN0YXRpYyB2b2lk
IF9faW5pdCBzZXR1cF9tbSh2b2lkKQo+ICAKPiAgICAgIC8qIEFkZCB4ZW5oZWFwIG1lbW9yeSB0
aGF0IHdhcyBub3QgYWxyZWFkeSBhZGRlZCB0byB0aGUgYm9vdCBhbGxvY2F0b3IuICovCj4gICAg
ICBpbml0X3hlbmhlYXBfcGFnZXMobWZuX3RvX21hZGRyKHhlbmhlYXBfbWZuX3N0YXJ0KSwKPiAt
ICAgICAgICAgICAgICAgICAgICAgICBtZm5fdG9fbWFkZHIoYm9vdF9tZm5fc3RhcnQpKTsKPiAr
ICAgICAgICAgICAgICAgICAgICAgICBtZm5fdG9fbWFkZHIoeGVuaGVhcF9tZm5fZW5kKSk7Cj4g
IH0KPiAgI2Vsc2UgLyogQ09ORklHX0FSTV82NCAqLwo+ICBzdGF0aWMgdm9pZCBfX2luaXQgc2V0
dXBfbW0odm9pZCkKPiAtLSAKPiAyLjE3LjEKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=

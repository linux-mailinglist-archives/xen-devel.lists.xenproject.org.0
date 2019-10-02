Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E68C9455
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2019 00:29:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFn4w-0001Yp-9V; Wed, 02 Oct 2019 22:26:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7bij=X3=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iFn4v-0001Yh-B4
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 22:26:37 +0000
X-Inumbo-ID: b2291530-e563-11e9-971d-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by localhost (Halon) with ESMTPS
 id b2291530-e563-11e9-971d-12813bfff9fa;
 Wed, 02 Oct 2019 22:26:36 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0488E2133F;
 Wed,  2 Oct 2019 22:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1570055196;
 bh=4vPkhju4m3GuqGI0Gpbli6wVi/2A6LGXfnoc9DS3Tug=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=KEcf/V14CMhGe/FtCd8Ge7bBpmAxf3DqHh6FJzPnhiA0qu9EyYZyOqtG8u+rQqLeF
 EaDMWLknkiim62gahU9lLbivIcKjy1ii/mRwGdSspBacot9T1mE6I8LRYN9rCprZkv
 90g0abH1O/Yoqguq4/ZUnpiwSW0dmbTxqFDXzRKE=
Date: Wed, 2 Oct 2019 15:26:35 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20191002180047.17144-6-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1910021451120.2691@sstabellini-ThinkPad-T480s>
References: <20191002180047.17144-1-julien.grall@arm.com>
 <20191002180047.17144-6-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH for-4.13 5/6] xen/arm: mm: Mark
 check_memory_layout_alignment_constraints as unused
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
aXMgdG8gaG9sZCBCVUlMRF9CVUdfT04oKS4KPgo+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFs
bCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgpJJ2QgbGlrZSBzb21ldGhpbmcgbGlrZSAiTm90ZSB0
aGF0IHRoZSBmdW5jdGlvbiBpcyBub3cgbWFya2VkIGFzIF9faW5pdCIKdG8gdGhlIGNvbW1pdCBt
ZXNzYWdlLCBidXQgaW4gYW55IGNhc2U6CgpBY2tlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxz
c3RhYmVsbGluaUBrZXJuZWwub3JnPgoKCj4gLS0tCj4gICAgIENoYW5nZXMgaW4gdjI6Cj4gICAg
ICAgICAtIFVwZGF0ZSB0aGUgcHJvdG90eXBlIHRvIG1hdGNoIHN0eWxlIG9mIG90aGVyIGZ1bmN0
aW9ucyBob2xkaW5nCj4gICAgICAgICBvbiBidWlsZCBhc3NlcnRpb25zLgo+IC0tLQo+ICB4ZW4v
YXJjaC9hcm0vbW0uYyB8IDMgKystCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL21tLmMgYi94ZW4v
YXJjaC9hcm0vbW0uYwo+IGluZGV4IDllMGZkYzM5ZjkuLmJlMjNhY2ZlMjYgMTAwNjQ0Cj4gLS0t
IGEveGVuL2FyY2gvYXJtL21tLmMKPiArKysgYi94ZW4vYXJjaC9hcm0vbW0uYwo+IEBAIC0xOTAs
NyArMTkwLDggQEAgdW5zaWduZWQgbG9uZyB0b3RhbF9wYWdlczsKPiAgZXh0ZXJuIGNoYXIgX19p
bml0X2JlZ2luW10sIF9faW5pdF9lbmRbXTsKPiAgCj4gIC8qIENoZWNraW5nIFZBIG1lbW9yeSBs
YXlvdXQgYWxpZ25tZW50LiAqLwo+IC1zdGF0aWMgaW5saW5lIHZvaWQgY2hlY2tfbWVtb3J5X2xh
eW91dF9hbGlnbm1lbnRfY29uc3RyYWludHModm9pZCkgewo+ICtzdGF0aWMgdm9pZCBfX2luaXQg
X19tYXliZV91bnVzZWQgYnVpbGRfYXNzZXJ0aW9ucyh2b2lkKQo+ICt7Cj4gICAgICAvKiAyTUIg
YWxpZ25lZCByZWdpb25zICovCj4gICAgICBCVUlMRF9CVUdfT04oWEVOX1ZJUlRfU1RBUlQgJiB+
U0VDT05EX01BU0spOwo+ICAgICAgQlVJTERfQlVHX09OKEZJWE1BUF9BRERSKDApICYgflNFQ09O
RF9NQVNLKTsKPiAtLSAKPiAyLjExLjAKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=

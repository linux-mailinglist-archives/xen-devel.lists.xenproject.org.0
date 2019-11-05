Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90EEEF0A7E
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2019 00:55:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iS8cq-0003Dq-St; Tue, 05 Nov 2019 23:52:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SRxw=Y5=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iS8cp-0003Dh-3L
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2019 23:52:39 +0000
X-Inumbo-ID: 58e2b7cc-0027-11ea-9631-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 58e2b7cc-0027-11ea-9631-bc764e2007e4;
 Tue, 05 Nov 2019 23:52:38 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 85D1D214B2;
 Tue,  5 Nov 2019 23:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1572997957;
 bh=UmREWRgzZjdNYMUsKE5XmT4biewUfDp1PwJrd4if/pE=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=y/uy4nbkD/zPQ+OAxUnpZOVFWCvtbCl08h1Yw/FDT8eh1A5z/kXHMh7FaTi4Dh5no
 cnMTVUg/XiAgt3geQ8Z9i3lMtnS4vnjz41UGLLpJbJMS6Em4tHdsDN0UBorPBncc3r
 IU9Qi5Tz5RGNR9TBuxNwfjvlkoEExXi0JPXfx08I=
Date: Tue, 5 Nov 2019 15:52:28 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Stefano Stabellini <sstabellini@kernel.org>
In-Reply-To: <20191105235113.27469-1-sstabellini@kernel.org>
Message-ID: <alpine.DEB.2.21.1911051551551.13405@sstabellini-ThinkPad-T480s>
References: <20191105235113.27469-1-sstabellini@kernel.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] tools: pygrub actually cross-compiles just
 fine
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
Cc: wl@xen.org, ian.jackson@eu.citrix.com,
 Christopher Clark <christopher.w.clark@gmail.com>, anthony.perard@citrix.com,
 xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

KyB4ZW4tZGV2ZWwKCk9uIFR1ZSwgNSBOb3YgMjAxOSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3Rl
Ogo+IEFjdHVhbGx5LCBweWdydWIgY3Jvc3MtY29tcGlsZXMgd2l0aG91dCBpc3N1ZXMuIFRoZSBj
cm9zcy1jb21waWxhdGlvbgo+IHdvcmstYXJvdW5kIGdvZXMgYmFjayB0byAyMDA1IGFuZCBpdCBw
cm9iYWJseSByZWZlcnJlZCB0byBQb3dlclBDLgo+IAo+IFJlbW92ZSB0aGUgd29yay1hcm91bmQg
bm93Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3RlZmFuby5zdGFi
ZWxsaW5pQHhpbGlueC5jb20+Cj4gQ0M6IENocmlzdG9waGVyIENsYXJrIDxjaHJpc3RvcGhlci53
LmNsYXJrQGdtYWlsLmNvbT4KPiAtLS0KPiAgdG9vbHMvTWFrZWZpbGUgfCA0ICsrLS0KPiAgMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0t
Z2l0IGEvdG9vbHMvTWFrZWZpbGUgYi90b29scy9NYWtlZmlsZQo+IGluZGV4IDdiMWY2YzRkMjgu
LjBhMjkzYjRhMzAgMTAwNjQ0Cj4gLS0tIGEvdG9vbHMvTWFrZWZpbGUKPiArKysgYi90b29scy9N
YWtlZmlsZQo+IEBAIC0zOSwxMSArMzksMTEgQEAgU1VCRElSUy0kKENPTkZJR19YODYpICs9IHhl
bnBhZ2luZwo+ICBTVUJESVJTLSQoQ09ORklHX1g4NikgKz0gZGVidWdnZXIvZ2Ric3gKPiAgU1VC
RElSUy0kKENPTkZJR19YODYpICs9IGRlYnVnZ2VyL2tkZAo+ICBTVUJESVJTLSQoQ09ORklHX1RF
U1RTKSArPSB0ZXN0cwo+ICtTVUJESVJTLXkgKz0gcHl0aG9uCj4gK1NVQkRJUlMteSArPSBweWdy
dWIKPiAgCj4gICMgVGhlc2UgZG9uJ3QgY3Jvc3MtY29tcGlsZQo+ICBpZmVxICgkKFhFTl9DT01Q
SUxFX0FSQ0gpLCQoWEVOX1RBUkdFVF9BUkNIKSkKPiAtU1VCRElSUy15ICs9IHB5dGhvbgo+IC1T
VUJESVJTLXkgKz0gcHlncnViCj4gIFNVQkRJUlMtJChPQ0FNTF9UT09MUykgKz0gb2NhbWwKPiAg
ZW5kaWYKPiAgCj4gLS0gCj4gMi4xNy4xCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs

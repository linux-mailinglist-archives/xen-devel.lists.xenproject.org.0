Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E67C2B82
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 03:07:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iF6bx-0005FO-RU; Tue, 01 Oct 2019 01:05:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JHuc=X2=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iF6bw-0005FA-82
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 01:05:52 +0000
X-Inumbo-ID: 9c7cd3f2-e3e7-11e9-bf31-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by localhost (Halon) with ESMTPS
 id 9c7cd3f2-e3e7-11e9-bf31-bc764e2007e4;
 Tue, 01 Oct 2019 01:05:51 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F0B902075C;
 Tue,  1 Oct 2019 01:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569891951;
 bh=1spxBqZ4IxUJ136KG2b79rKTt9mRR3yxJoJ7eVmcrF8=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=B4c+f8AGMmZL3kgDvPsLbnGtV/1gnMRZHXAyhhaNYjCcdpayMo1MhdBo4hHq1Ineb
 Q31AJTcdWfCUN9LhPzkZUz/+ScFn/EHsP2/0VZRPABvQf3CxevTTYY/2zzYSWgMFLK
 tw8Z4PoopVFFuDggUXkq0+N9MsPyeOHdTxEQR6Fg=
Date: Mon, 30 Sep 2019 18:05:50 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190929155627.23493-3-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1909301805390.2594@sstabellini-ThinkPad-T480s>
References: <20190929155627.23493-1-julien.grall@arm.com>
 <20190929155627.23493-3-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH for-4.13 2/2] xen/arm: domain_build: Indent
 correctly parameters of alloc_bank_memory()
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

T24gU3VuLCAyOSBTZXAgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFNpZ25lZC1vZmYtYnk6
IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgpBY2tlZC1ieTogU3RlZmFubyBT
dGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgoKCj4gLS0tCj4gIHhlbi9hcmNoL2Fy
bS9kb21haW5fYnVpbGQuYyB8IDYgKysrLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlv
bnMoKyksIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9kb21h
aW5fYnVpbGQuYyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYwo+IGluZGV4IGI3OTFlNGI1
MTIuLjI2OGUwNzRhZjcgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5j
Cj4gKysrIGIveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jCj4gQEAgLTM3NSw5ICszNzUsOSBA
QCBzdGF0aWMgdm9pZCBfX2luaXQgYWxsb2NhdGVfbWVtb3J5XzExKHN0cnVjdCBkb21haW4gKmQs
Cj4gIH0KPiAgCj4gIHN0YXRpYyBib29sIF9faW5pdCBhbGxvY2F0ZV9iYW5rX21lbW9yeShzdHJ1
Y3QgZG9tYWluICpkLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBz
dHJ1Y3Qga2VybmVsX2luZm8gKmtpbmZvLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBnZm5fdCBzZ2ZuLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBwYWRkcl90IHRvdF9zaXplKQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgc3RydWN0IGtlcm5lbF9pbmZvICpraW5mbywKPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGdmbl90IHNnZm4sCj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBwYWRkcl90IHRvdF9zaXplKQo+ICB7Cj4gICAgICBpbnQg
cmVzOwo+ICAgICAgc3RydWN0IHBhZ2VfaW5mbyAqcGc7Cj4gLS0gCj4gMi4xMS4wCj4gCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

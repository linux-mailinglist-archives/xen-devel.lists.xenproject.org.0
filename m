Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB6F55C47
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2019 01:27:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfumy-0003YE-5h; Tue, 25 Jun 2019 23:23:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qEdm=UY=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hfumw-0003Y5-I7
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2019 23:23:46 +0000
X-Inumbo-ID: 467a0a08-97a0-11e9-b225-b7acd695c88f
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 467a0a08-97a0-11e9-b225-b7acd695c88f;
 Tue, 25 Jun 2019 23:23:44 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E864220657;
 Tue, 25 Jun 2019 23:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561505024;
 bh=m89kLG00S2DJh2OCEhtyIF6ZI0TgJUnRHFg6hNTLVRM=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=D/Y+ekv5m/Qjxsyn9ZNDOolVYxt2nvogBf69AAK7tD18j+GIhsCZ0aE5KyF1dRE7y
 BIPT21Or/SkAX6UR3FV0EAqXjdhGPQt8CW4Ybz29X+AP70I2FYW2rpzn0Tzb0Dthyb
 laj3apZwGJnKty0JEQjwQctCnC5UdrmEK77vE+0E=
Date: Tue, 25 Jun 2019 16:23:43 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190610193215.23704-2-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1906251623310.5851@sstabellini-ThinkPad-T480s>
References: <20190610193215.23704-1-julien.grall@arm.com>
 <20190610193215.23704-2-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 01/17] xen/arm64: head Mark the end of
 subroutines with ENDPROC
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
Cc: xen-devel@lists.xenproject.org, Oleksandr_Tyshchenko@epam.com,
 Stefano Stabellini <sstabellini@kernel.org>, andrii_anisov@epam.com,
 andre.przywara@arm.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAxMCBKdW4gMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IHB1dG4oKSBhbmQgcHV0
cygpIGFyZSB0d28gc3Vicm91dGluZXMuIEFkZCBFTkRQUk9DIGZvciB0aGUgYmVuZWZpdHMgb2YK
PiBzdGF0aWMgYW5hbHlzaXMgdG9vbHMgYW5kIHRoZSByZWFkZXIuCj4gCj4gU2lnbmVkLW9mZi1i
eTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KClJldmlld2VkLWJ5OiBTdGVm
YW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CgoKPiAtLS0KPiAgeGVuL2Fy
Y2gvYXJtL2FybTY0L2hlYWQuUyB8IDIgKysKPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TIGIveGVuL2Fy
Y2gvYXJtL2FybTY0L2hlYWQuUwo+IGluZGV4IGRkZDNhMzMxMDguLmM4YmJkZjA1YTYgMTAwNjQ0
Cj4gLS0tIGEveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUwo+ICsrKyBiL3hlbi9hcmNoL2FybS9h
cm02NC9oZWFkLlMKPiBAQCAtNjQ2LDYgKzY0Niw3IEBAIHB1dHM6Cj4gICAgICAgICAgYiAgICAg
cHV0cwo+ICAxOgo+ICAgICAgICAgIHJldAo+ICtFTkRQUk9DKHB1dHMpCj4gIAo+ICAvKiBQcmlu
dCBhIDMyLWJpdCBudW1iZXIgaW4gaGV4LiAgU3BlY2lmaWMgdG8gdGhlIFBMMDExIFVBUlQuCj4g
ICAqIHgwOiBOdW1iZXIgdG8gcHJpbnQuCj4gQEAgLTY2NCw2ICs2NjUsNyBAQCBwdXRuOgo+ICAg
ICAgICAgIHN1YnMgIHgzLCB4MywgIzEKPiAgICAgICAgICBiLm5lICAxYgo+ICAgICAgICAgIHJl
dAo+ICtFTkRQUk9DKHB1dG4pCj4gIAo+ICBoZXg6ICAgIC5hc2NpaSAiMDEyMzQ1Njc4OWFiY2Rl
ZiIKPiAgICAgICAgICAuYWxpZ24gMgo+IC0tIAo+IDIuMTEuMAo+IAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

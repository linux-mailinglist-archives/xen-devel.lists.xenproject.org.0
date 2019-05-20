Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5695A243CE
	for <lists+xen-devel@lfdr.de>; Tue, 21 May 2019 00:59:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hSrCr-0005MZ-QO; Mon, 20 May 2019 22:56:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rume=TU=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hSrCq-0005MG-3U
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 22:56:32 +0000
X-Inumbo-ID: 81c6a4be-7b52-11e9-ad8e-8b16d75e0053
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 81c6a4be-7b52-11e9-ad8e-8b16d75e0053;
 Mon, 20 May 2019 22:56:31 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2A7AC21479;
 Mon, 20 May 2019 22:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558392990;
 bh=8irn2p2V7a6fSxyjxNaVxE/168khsIhEItf1Am4cx2U=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=ShvFB1ewVz+5560cSKMtv7j4Wf64BiX7jnIgKht0kLnCGI6aJTPqd9CvyjjTJgxWB
 DWyQGoaQJdxuttKz6qb7WUBiUwqqGu8hUNJopVJpP4VsZgbyjZCgEzYGz1ymJ2l6B5
 QM57n58xCuaWBliXbZ+IO/UST4KjXISixqt3hYPU=
Date: Mon, 20 May 2019 15:56:29 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190514122456.28559-8-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1905201533110.16404@sstabellini-ThinkPad-T480s>
References: <20190514122456.28559-1-julien.grall@arm.com>
 <20190514122456.28559-8-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH MM-PART2 RESEND v2 07/19] xen/arm64: head:
 Remove unnecessary comment
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
 Andrii Anisov <andrii_anisov@epam.com>, Oleksandr_Tyshchenko@epam.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCAxNCBNYXkgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFNvIGZhciwgd2UgZG9u
J3QgaGF2ZSBzcGVjaWZpYyBjb3JlIGluaXRpYWxpemF0aW9uIGF0IGJvb3QuIFNvIHJlbW92ZQo+
IHRoZSBjb21tZW50Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdy
YWxsQGFybS5jb20+Cj4gUmV2aWV3ZWQtYnk6IEFuZHJpaSBBbmlzb3YgPGFuZHJpaV9hbmlzb3ZA
ZXBhbS5jb20+CgpBY2tlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJu
ZWwub3JnPgoKCj4gLS0tCj4gICAgIENoYW5nZXMgaW4gdjI6Cj4gICAgICAgICAtIEZpeCB0eXBv
IGluIHRoZSBjb21taXQgbWVzc2FnZQo+ICAgICAgICAgLSBBZGQgQW5kcmlpJ3MgcmV2aWV3ZWQt
YnkKPiAtLS0KPiAgeGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUyB8IDIgLS0KPiAgMSBmaWxlIGNo
YW5nZWQsIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9hcm02
NC9oZWFkLlMgYi94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TCj4gaW5kZXggY2IzMGQ2ZjIyZS4u
YWQ0NDZlNzM0NSAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TCj4gKysr
IGIveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUwo+IEBAIC0zNDQsOCArMzQ0LDYgQEAgZWwyOiAg
ICBQUklOVCgiLSBYZW4gc3RhcnRpbmcgYXQgRUwyIC1cclxuIikKPiAgc2tpcF9ic3M6Cj4gICAg
ICAgICAgUFJJTlQoIi0gU2V0dGluZyB1cCBjb250cm9sIHJlZ2lzdGVycyAtXHJcbiIpCj4gIAo+
IC0gICAgICAgIC8qIFhYWFggY2FsbCBQUk9DSU5GT19jcHVfaW5pdCBoZXJlICovCj4gLQo+ICAg
ICAgICAgIC8qIFNldCB1cCBtZW1vcnkgYXR0cmlidXRlIHR5cGUgdGFibGVzICovCj4gICAgICAg
ICAgbGRyICAgeDAsID1NQUlSVkFMCj4gICAgICAgICAgbXNyICAgbWFpcl9lbDIsIHgwCj4gLS0g
Cj4gMi4xMS4wCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

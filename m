Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E14FB1341
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 19:09:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8SXm-00028a-2b; Thu, 12 Sep 2019 17:06:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nRXx=XH=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1i8SXk-00028V-KH
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 17:06:04 +0000
X-Inumbo-ID: 9a244854-d57f-11e9-95a1-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9a244854-d57f-11e9-95a1-12813bfff9fa;
 Thu, 12 Sep 2019 17:06:03 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0F4D820644;
 Thu, 12 Sep 2019 17:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1568307963;
 bh=qw5nItZpWxJVKlPoe4wTcKIzsByWcxX5rdfJT/M18Sg=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=PPALqrV1iFPnnrcAUWYTv8dYZOc8SSfnr7S6YZM837x9O2Wd51lan+nPFdt6b21XP
 cypkmG0qSztCv9nQnq3Nt5Ih1PjkkwV4IEkSBOI/46MfNPZnFGYJ46of8WwlPd2pPI
 0aXgEZu+x95Ylpf27EISFY/+zkypOHFS4Oqx5+LY=
Date: Thu, 12 Sep 2019 10:06:01 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
In-Reply-To: <87r24mg2kr.fsf@epam.com>
Message-ID: <alpine.DEB.2.21.1909121005550.6288@sstabellini-ThinkPad-T480s>
References: <20190911151942.28459-1-julien.grall@arm.com>
 <87r24mg2kr.fsf@epam.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] xen/arm: bootfd: Fix indentation in
 process_multiboot_node()
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCAxMSBTZXAgMjAxOSwgVm9sb2R5bXlyIEJhYmNodWsgd3JvdGU6Cj4gCj4gSnVsaWVu
IEdyYWxsIHdyaXRlczoKPiAKPiA+IE9uZSBsaW5lIGluIHByb2Nlc3NfbXVsdGlib290X25vZGUo
KSBpcyB1c2luZyBoYXJkIHRhYiByYXRoZXIgdGhhbiBzb2Z0Cj4gPiB0YWIuIFNvIGZpeCBpdCEK
PiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29t
Pgo+IFJldmlld2VkLWJ5OiBWb2xvZHlteXIgQmFiY2h1ayA8dm9sb2R5bXlyX2JhYmNodWtAZXBh
bS5jb20+CgpBY2tlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwu
b3JnPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

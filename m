Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED028C9656
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2019 03:41:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFq4m-0004O9-KU; Thu, 03 Oct 2019 01:38:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KLgg=X4=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iFq4k-0004Nw-UY
 for xen-devel@lists.xen.org; Thu, 03 Oct 2019 01:38:38 +0000
X-Inumbo-ID: 85934a3e-e57e-11e9-b588-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by localhost (Halon) with ESMTPS
 id 85934a3e-e57e-11e9-b588-bc764e2007e4;
 Thu, 03 Oct 2019 01:38:38 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9C8E2222C2;
 Thu,  3 Oct 2019 01:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1570066717;
 bh=TCWXHHUIRepKOM4DB7EPObRDCc1FiXPhDg1O8O2GccI=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=L8xyIAxT+W2Y4zbPo1e+Q77I7rMkqSEhGpJYCj/h3wB7PEIVUIL5EkATEhlB/sqjV
 qBhQLrCfq3UIlVbSjaEoGag6a1ZdsjuLYoR0s+gbdNTWcwOkVzFLvulpLtYu9lqBIC
 syuEF1ULjdeUoTt6Q0yty+Qn9e4O5e4uO6Amk5LY=
Date: Wed, 2 Oct 2019 18:38:30 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Stefano Stabellini <sstabellini@kernel.org>
In-Reply-To: <alpine.DEB.2.21.1910021547140.2691@sstabellini-ThinkPad-T480s>
Message-ID: <alpine.DEB.2.21.1910021836400.30844@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1909301628540.2594@sstabellini-ThinkPad-T480s>
 <20190930233032.2120-5-sstabellini@kernel.org>
 <b3424309-d315-7ff8-7bd7-66782db279cd@arm.com>
 <alpine.DEB.2.21.1910021512400.2691@sstabellini-ThinkPad-T480s>
 <alpine.DEB.2.21.1910021547140.2691@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v7b 5/8] xen/arm: assign devices to boot
 domains
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
Cc: Stefano Stabellini <stefanos@xilinx.com>, andrii_anisov@epam.com,
 Achin.Gupta@arm.com, xen-devel@lists.xen.org,
 Julien Grall <julien.grall@arm.com>, Volodymyr_Babchuk@epam.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCAyIE9jdCAyMDE5LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gPiA+IENvZGlu
ZyBzdHlsZSBhZ2Fpbi4gSSB3YXMga2luZCBvZiBleHBlY3RpbmcgeW91IGNvbmZpZ3VyZWQgeW91
ciBlZGl0b3IKPiA+ID4gcHJvcGVybHkgYWZ0ZXIgdGhlIGxhc3QgZGlzY3Vzc2lvbi4uLgo+ID4g
Cj4gPiBBY3R1YWxseSBJIGZhaWwgdG8gc2VlIHRoZSBjb2Rpbmcgc3R5bGUgaXNzdWUgb24gdGhp
cyBvbmUuIElzIGl0IHN0aWxsCj4gPiBhbiBhbGlnbm1lbnQgaXNzdWUgeW91IGFyZSB0YWxraW5n
IGFib3V0Pwo+IAo+IElzIGl0IGJlY2F1c2UgeW91IHdvdWxkIGxpa2UgaXQgdG8gbG9vayBsaWtl
IHRoaXM/Cj4gCj4gICAgIGxlbiA9IGZkdDMyX3RvX2NwdSh4ZW5fcmVnLT5sZW4pIC8gKChhZGRy
ZXNzX2NlbGxzICogMiArIHNpemVfY2VsbHMpICoKPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgc2l6ZW9mKHVpbnQzMl90KSk7CgpJIHdlbnQgd2l0aCB0aGlzLCBhbHRo
b3VnaCBJIHdhc24ndCBzdXJlIGl0IGlzIHdoYXQgeW91IG1lYW50LiBTb3JyeQphYm91dCBpbmZs
YXRpbmcgdGhlIHZlcnNpb24gbnVtYmVyIG9mIHRoZSBzZXJpZXMsIGJ1dCBJIHRob3VnaHQgaXQg
d291bGQKYmUgZ29vZCB0byBnZXQgaXQgb3V0IGlmIHRoZSB3YXksIGVzcGVjaWFsbHkgZHVlIHRv
IG91ciB0aW1lem9uZQpkaWZmZXJlbmNlLgoKSWYgdGhpcyBpcyB0aGUgb25seSBpc3N1ZSBsZWZ0
IGFuZCBJIGRpZG4ndCBnZXQgaXQgcmlnaHQsIG1heWJlIHlvdQpjb3VsZCBhbHNvIGZpeCBpdCBv
biBjb21taXQuLi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

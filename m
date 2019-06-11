Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F3B3D08B
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2019 17:16:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1haiS9-0003nI-Kh; Tue, 11 Jun 2019 15:12:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SowN=UK=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1haiS8-0003nD-3A
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2019 15:12:48 +0000
X-Inumbo-ID: 5d3f6256-8c5b-11e9-9898-5b19e89f5722
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 5d3f6256-8c5b-11e9-9898-5b19e89f5722;
 Tue, 11 Jun 2019 15:12:45 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6DE02337;
 Tue, 11 Jun 2019 08:12:44 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BACE63F246;
 Tue, 11 Jun 2019 08:12:43 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: Andrii Anisov <andrii.anisov@gmail.com>, xen-devel@lists.xenproject.org
References: <1559217748-25426-1-git-send-email-andrii.anisov@gmail.com>
 <98f2248a-1053-5c41-0242-6707fa2d1a7d@arm.com>
Message-ID: <c94b88a1-ff72-4c61-d690-05ed28df780e@arm.com>
Date: Tue, 11 Jun 2019 16:12:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <98f2248a-1053-5c41-0242-6707fa2d1a7d@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] iommu/arm: add missing return
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxMS8wNi8yMDE5IDE1OjM3LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGkgQW5kcmlpLAo+
IAo+IFNvcnJ5IGZvciB0aGUgbGF0ZSBhbnN3ZXIuCj4gCj4gT24gNS8zMC8xOSAxOjAyIFBNLCBB
bmRyaWkgQW5pc292IHdyb3RlOgo+PiBGcm9tOiBPbGVrc2FuZHIgVHlzaGNoZW5rbyA8b2xla3Nh
bmRyX3R5c2hjaGVua29AZXBhbS5jb20+Cj4+Cj4+IEluIGNhc2UgaW9tbXVfb3BzIGhhdmUgYmVl
biBhbHJlYWR5IHNldCwgd2Ugc2hvdWxkIG5vdCB1cGRhdGUgaXQuCj4+Cj4+IFNpZ25lZC1vZmYt
Ynk6IE9sZWtzYW5kciBUeXNoY2hlbmtvIDxvbGVrc2FuZHJfdHlzaGNoZW5rb0BlcGFtLmNvbT4K
Pj4gU2lnbmVkLW9mZi1ieTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4K
PiAKPiBBY2tlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCk5vdyBj
b21taXR0ZWQsIHRoYW5rIHlvdSEKCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

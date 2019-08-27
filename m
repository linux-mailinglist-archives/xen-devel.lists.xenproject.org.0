Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0D19EC1E
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2019 17:14:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2d80-0005Fo-AJ; Tue, 27 Aug 2019 15:11:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=72vU=WX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i2d7y-0005Fi-Vi
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2019 15:11:23 +0000
X-Inumbo-ID: ed879bb8-c8dc-11e9-8980-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ed879bb8-c8dc-11e9-8980-bc764e2007e4;
 Tue, 27 Aug 2019 15:11:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3DE26AFBB;
 Tue, 27 Aug 2019 15:11:21 +0000 (UTC)
To: Oleksandr <olekstysh@gmail.com>
References: <1566324587-3442-1-git-send-email-olekstysh@gmail.com>
 <1566324587-3442-7-git-send-email-olekstysh@gmail.com>
 <20f3a150-3619-deea-d0cd-fefe7f062a4f@suse.com>
 <d38bc9d3-1e34-66d4-8eea-baa1ebe0f195@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3a2d392f-a976-8a0f-af5f-041b2904325c@suse.com>
Date: Tue, 27 Aug 2019 17:11:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <d38bc9d3-1e34-66d4-8eea-baa1ebe0f195@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V3 6/8] iommu: Add of_xlate callback
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, julien.grall@arm.com,
 sstabellini@kernel.org, Volodymyr_Babchuk@epam.com,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcuMDguMjAxOSAxNjo1OSwgT2xla3NhbmRyIHdyb3RlOgo+IFRoZXJlIHdhcyBhIHByZWZl
cmVuY2UgdG8gaW50cm9kdWNlIGNhbGxiYWNrIGluIGEgc2VwYXJhdGUgcGF0Y2ggWzJdLiBBbnl3
YXksIHNoYWxsIEkgZm9sZCBpdD8KCkhtbSwgSSBkaXNhZ3JlZSB3aXRoIEp1bGllbiBoZXJlLiBJ
IGRvbid0IHRoaW5rIHdlIHNob3VsZCBoYXZlIHVudXNlZApob29rcyBpbiB0aGUgdHJlZSwgbm90
IGV2ZW4gaW50ZXJtZWRpYXRlbHkuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=

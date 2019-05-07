Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5521675B
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2019 18:03:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hO2Ws-0005hO-5D; Tue, 07 May 2019 16:01:18 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qCYz=TH=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hO2Wr-0005hJ-CV
 for xen-devel@lists.xenproject.org; Tue, 07 May 2019 16:01:17 +0000
X-Inumbo-ID: 586e58e2-70e1-11e9-843c-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 586e58e2-70e1-11e9-843c-bc764e045a96;
 Tue, 07 May 2019 16:01:16 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3F0EA374;
 Tue,  7 May 2019 09:01:16 -0700 (PDT)
Received: from [10.37.8.6] (unknown [10.37.8.6])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 59E0B3F5AF;
 Tue,  7 May 2019 09:01:15 -0700 (PDT)
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
References: <1556816422-25185-1-git-send-email-olekstysh@gmail.com>
 <1556816422-25185-5-git-send-email-olekstysh@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <6eacd43d-81e2-8711-ee6a-007a999fcee4@arm.com>
Date: Tue, 7 May 2019 17:01:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1556816422-25185-5-git-send-email-olekstysh@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V5 4/4] xen/arm: Add early printk support
 for SCIFA compatible UARTs
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
 sstabellini@kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgT2xla3NhbmRyLAoKT24gNS8yLzE5IDY6MDAgUE0sIE9sZWtzYW5kciBUeXNoY2hlbmtvIHdy
b3RlOgo+IEZyb206IE9sZWtzYW5kciBUeXNoY2hlbmtvIDxvbGVrc2FuZHJfdHlzaGNoZW5rb0Bl
cGFtLmNvbT4KPiAKPiBUaGlzIHBhdGNoIG1ha2VzIHBvc3NpYmxlIHRvIHVzZSBleGlzdGluZyBl
YXJseSBwcmluayBjb2RlCj4gZm9yIFJlbmVzYXMgIlN0b3V0IiBib2FyZCBiYXNlZCBvbiBSLUNh
ciBIMiBTb0MgKFNDSUZBKS4KPiAKPiBUaGUgIkVBUkxZX1BSSU5US19WRVJTSU9OIiBmb3IgdGhh
dCBib2FyZCBzaG91bGQgYmUgJ0EnOgo+IENPTkZJR19FQVJMWV9QUklOVEs9c2NpZiwweGU2YzQw
MDAwLEEKPiAKPiBTaWduZWQtb2ZmLWJ5OiBPbGVrc2FuZHIgVHlzaGNoZW5rbyA8b2xla3NhbmRy
X3R5c2hjaGVua29AZXBhbS5jb20+Cj4gQ0M6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFy
bS5jb20+CgpBY2tlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCkNo
ZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=

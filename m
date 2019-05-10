Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E75541A076
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2019 17:49:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hP7ih-0001b7-3f; Fri, 10 May 2019 15:45:59 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=thpN=TK=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hP7if-0001b2-Hd
 for xen-devel@lists.xenproject.org; Fri, 10 May 2019 15:45:57 +0000
X-Inumbo-ID: b35b18b6-733a-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id b35b18b6-733a-11e9-8980-bc764e045a96;
 Fri, 10 May 2019 15:45:56 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 69784A78;
 Fri, 10 May 2019 08:45:56 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9F98D3F73C;
 Fri, 10 May 2019 08:45:55 -0700 (PDT)
To: Oleksandr <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
References: <1556806436-26283-1-git-send-email-olekstysh@gmail.com>
 <1a6c10cd-0d85-9db9-1f98-602fefb40db8@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <dd61adad-7f15-d340-19f7-39f663496991@arm.com>
Date: Fri, 10 May 2019 16:45:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1a6c10cd-0d85-9db9-1f98-602fefb40db8@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC PATCH 0/2] Add ability to handle nodes with
 interrupts-extended property
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

CgpPbiAxMC8wNS8yMDE5IDE2OjI5LCBPbGVrc2FuZHIgd3JvdGU6Cj4gCj4gSGVsbG8sIGFsbAo+
IAo+IAo+IGdlbnRsZSByZW1pbmRlci4uLgoKVGhpcyBpcyBvbiBteSBsb25nIHF1ZXVlIG9mIHBh
dGNoZXMgdG8gcmV2aWV3LiBBbnkgaGVscCByZXZpZXdpbmcgdGhlIG9uLWdvaW5nIApzZXJpZXMg
d2lsbCBoZWxwLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

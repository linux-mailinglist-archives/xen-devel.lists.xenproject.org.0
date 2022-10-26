Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D10CC60DECD
	for <lists+xen-devel@lfdr.de>; Wed, 26 Oct 2022 12:21:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430426.682147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ondWs-0006Y4-0x; Wed, 26 Oct 2022 10:20:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430426.682147; Wed, 26 Oct 2022 10:20:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ondWr-0006W4-Sb; Wed, 26 Oct 2022 10:20:57 +0000
Received: by outflank-mailman (input) for mailman id 430426;
 Wed, 26 Oct 2022 10:20:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JODj=23=citrix.com=prvs=291bfe38a=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ondWq-0004c6-EW
 for xen-devel@lists.xenproject.org; Wed, 26 Oct 2022 10:20:56 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e0276613-5517-11ed-91b5-6bf2151ebd3b;
 Wed, 26 Oct 2022 12:20:55 +0200 (CEST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: e0276613-5517-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1666779655;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=t5KooTTb63GFPiYoUuuSBv6eBVEQmvOiWx0QPIN98xg=;
  b=DIPP8RbpyuAdb8a800d1bbpOHvVoEFfreEv7uGA7b+wDR3TMQhHtH4Ng
   IPTHrqiR1nhZpvt58IwrzRtk7BstTMGrKkr9Q/y3N4Sym1x8orZYGFt4L
   CtdC1ivOTZONq3LXixZEePa9PpJoBU/SlT7ExDgK0GhQQc4bSZNPxT/TZ
   A=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 83149673
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:3OoMwa0wGqWOlsj0/vbD5UNxkn2cJEfYwER7XKvMYLTBsI5bpzcGy
 WUeXmiPO6mCYGXwc91yaoS3/UJS75KGx9FjSQRtpC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefSAOKU5NfsYkhZXRVjRDoqlSVtkus4hp8AqdWiCkaGt
 MiaT/f3YTdJ4BYpdDNJg06/gEk35q6r4GlG5gVWic1j5zcyqVFEVPrzGonpR5fIatE8NvK3Q
 e/F0Ia48gvxl/v6Ior4+lpTWhRiro/6ZWBiuFIPM0SRqkEqShgJ+rQ6LJIhhXJ/0F1lqTzTJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXWV+ACQqflO1q8iCAn3aMqUVyr1tOToQz
 8caOSEvTUyEuN3v5LCkH7wEasQLdKEHPasas3BkizrYEewnUdbIRKCiCd1whWlqwJoURLCHO
 pRfOWEHgBfoOnWjPn8+Dp4kkfjurX74azBC83qepLYt4niVxwt0uFToGIqOI4DbG5oO9qqej
 lmd8VjUHBQ2CMeWkQu+1k/2usCSlzyuDer+E5Xnr6U30TV/3Fc7NhoSUleqpOijvWS3UdlfN
 k889zInqO4580nDZtvgWxy1plaUsxhaXMBfe8Ua5QeX2+zr6gCWLmEeS3hKb9lOnMU7XyAw3
 1mF2dbgHyVysaa9QGiYsLyTqFuaIjMJJGUPYSsFSwot4NT5pow3yBXVQb5LC6O+k8f0BSDY0
 z2M6i8kiN07ncMNkqm2413DqzatvYTSCB444B3NWWCo5R8/Y5SqD6S37XDL4PAGK5yWJnGjl
 nUZn8mV7MgVEIqA0ieKRY0w8KqBvqjfdmeG2Bg2Qsdnp2/FF2OfkZ547QElPn8ybPw/ey74Q
 myPvjxuvbtRIy7/BUNoWL6ZB8MvxKnmMN3qUPHIc9ZDCqRMmB+7EDJGPhDJgT20+KQ4ueRmY
 MrAL57wZZoPIf4/pAdaUdvxxlPCKsoW4WrIDa72wB28uVZ1TC7EEOxVWLdigw1Q0U9lnOk32
 4wBXydp408FOAEbXsUw2ddKRW3m1VBhWfjLRzV/L4Zv2DZOFmA7EOP2yrg8YYFjlKk9vr6Wo
 C/iABUJkQOl3SCvxeC2hpdLMe2HYHqChShjYXxE0aiAhxDPnrpDHI9ALsBqLNHLBcRozOJuT
 ultRilzKq0nd9gzwBxENcOVhNU7LHyD3FveVxdJlRBiJvaMsSSSoYS6FuYunQFTZheKWTwW+
 eb5h16FHMdSL+mgZe6PAM+SI5qKlSB1sIpPs4HgebG/pG2EHFBWFhHM
IronPort-HdrOrdr: A9a23:V8FBpqGjbxka7YOKpLqE7seALOsnbusQ8zAXP0AYc3Nom6uj5q
 aTdZUgpHjJYVkqOU3I9ersBEDEewK/yXcX2/h0AV7BZmnbUQKTRekIh7cKgQeQfhEWntQtrJ
 uIGJIRNDSfNzRHZL7BkWqFL+o=
X-IronPort-AV: E=Sophos;i="5.95,214,1661832000"; 
   d="scan'208";a="83149673"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Xen Security Team
	<security@xen.org>, Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, Henry Wang <Henry.Wang@arm.com>,
	"Anthony PERARD" <anthony.perard@citrix.com>
Subject: [PATCH 4/4] xen/arm: Correct the p2m pool size calculations
Date: Wed, 26 Oct 2022 11:20:18 +0100
Message-ID: <20221026102018.4144-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20221026102018.4144-1-andrew.cooper3@citrix.com>
References: <20221026102018.4144-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Allocating or freeing p2m pages doesn't alter the size of the mempool; only
the split between free and used pages.

Right now, the hypercalls operate on the free subset of the pool, meaning that
XEN_DOMCTL_get_p2m_mempool_size varies with time as the guest shuffles its
physmap, and XEN_DOMCTL_set_p2m_mempool_size ignores the used subset of the
pool and lets the guest grow unbounded.

This fixes test-p2m-pool on ARM so that the behaviour matches x86.

This is part of XSA-409 / CVE-2022-33747.

Fixes: cbea5a1149ca ("xen/arm: Allocate and free P2M pages from the P2M pool")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Xen Security Team <security@xen.org>
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Henry Wang <Henry.Wang@arm.com>
CC: Anthony PERARD <anthony.perard@citrix.com>
---
 xen/arch/arm/p2m.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index 92b678cf0d09..dd9696c48312 100644
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -72,7 +72,6 @@ static struct page_info *p2m_alloc_page(struct domain *d)
             spin_unlock(&d->arch.paging.lock);
             return NULL;
         }
-        d->arch.paging.p2m_total_pages--;
     }
     spin_unlock(&d->arch.paging.lock);
 
@@ -85,10 +84,7 @@ static void p2m_free_page(struct domain *d, struct page_info *pg)
     if ( is_hardware_domain(d) )
         free_domheap_page(pg);
     else
-    {
-        d->arch.paging.p2m_total_pages++;
         page_list_add_tail(pg, &d->arch.paging.p2m_freelist);
-    }
     spin_unlock(&d->arch.paging.lock);
 }
 
-- 
2.11.0



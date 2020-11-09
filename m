Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A2F2AB89A
	for <lists+xen-devel@lfdr.de>; Mon,  9 Nov 2020 13:51:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.22480.48858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kc6dd-0004R4-Lk; Mon, 09 Nov 2020 12:51:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 22480.48858; Mon, 09 Nov 2020 12:51:13 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kc6dd-0004QF-G5; Mon, 09 Nov 2020 12:51:13 +0000
Received: by outflank-mailman (input) for mailman id 22480;
 Mon, 09 Nov 2020 12:51:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zl3J=EP=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1kc6db-0003tf-H3
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 12:51:11 +0000
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dc348a48-5985-497a-b14c-cb2c93794339;
 Mon, 09 Nov 2020 12:50:43 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id 23so10119541ljv.7
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2020 04:50:42 -0800 (PST)
Received: from a2klaptop.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id i1sm1736447lfr.176.2020.11.09.04.50.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 04:50:41 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=zl3J=EP=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
	id 1kc6db-0003tf-H3
	for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 12:51:11 +0000
X-Inumbo-ID: dc348a48-5985-497a-b14c-cb2c93794339
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id dc348a48-5985-497a-b14c-cb2c93794339;
	Mon, 09 Nov 2020 12:50:43 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id 23so10119541ljv.7
        for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2020 04:50:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=eTzgC8wjlZZ5dW1kDk0Apl54Fj76f3KrpZyQEpkVwKo=;
        b=Q+1kyGk5oARHjB8whVHpRnlcQGZvtUwLqYbMqdS2JgNepCo6HOCtrkgLU4lRbnd8Yh
         HiwTsu7E+ujayTEFUS5+o8cbaTGs5LrUWHtG8VOtipdlzsAgSrFWEGZTqySzl6Xpr82Q
         ILuyttgBKhz0I8XuKJgP0/RHWouG8xbM/KEMucYHrWTmTpk3XLk0oxxKJfjqSZ3MsOaP
         w1F2b3JLfnFvA8OdZObmhzlJfBUkmeIyQciEUQaNYChFd7vCou/T1NEBFjGUNiRItvT7
         sAjBFf/ixmlga0rH4j6IGQCEKR8S43/jU9w9FSDawd0FME2xd9VysITBFGikF6FrXXKH
         OJfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=eTzgC8wjlZZ5dW1kDk0Apl54Fj76f3KrpZyQEpkVwKo=;
        b=FwAEvUhu6vBOIcoF8r9MpUnpLFiyM3W6u0GDQMZvU39JAPHIifQlcmkHXnUslyQu+I
         08jCxlV8YDbxeiwtvaCmxkbOiCEjbUjkYPGVdEqHdfQJgyFlBSH8//Olj0KE3e5XcVxz
         FTZs7ZkA5LemYgjzi+Xpn6mfyuPQb0quQHal9BcCNoRnVpeyb4g7YeXKFLR27DDAfJpR
         ZpkE8XJYB1IirGKx+amHYdyjT/2GsSi5RCiJADuY29fp+bbzqf3c4T4mU4By/sP2fxl9
         ZW88nxNvXI6iRvX9TPxsd6Yp+JZ7o838J5hsNKP/S8v/9tzkuZBvlACYhgJBm2NAgV6e
         6KlQ==
X-Gm-Message-State: AOAM533eFebnC6GcK4evJ7WnGOfagamGOQnIFc25IuJ60BsIljpJnZ5G
	LuKljgnzfAwYBGbEYSnGMjBe1r3DpfZdD5c7
X-Google-Smtp-Source: ABdhPJwcPThVD8W/eKCaLs5uWrQq++GkIkgz3jehLAFccyEViZGB673ffnnnOCit0z69w08y6AN6Vg==
X-Received: by 2002:a2e:b701:: with SMTP id j1mr6333703ljo.242.1604926241939;
        Mon, 09 Nov 2020 04:50:41 -0800 (PST)
Received: from a2klaptop.localdomain ([185.199.97.5])
        by smtp.gmail.com with ESMTPSA id i1sm1736447lfr.176.2020.11.09.04.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 04:50:41 -0800 (PST)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: Rahul.Singh@arm.com,
	Bertrand.Marquis@arm.com,
	julien.grall@arm.com,
	jbeulich@suse.com,
	roger.pau@citrix.com,
	sstabellini@kernel.org,
	xen-devel@lists.xenproject.org
Cc: iwj@xenproject.org,
	wl@xen.org,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH 07/10] xen/arm: Do not hardcode phycial PCI device addresses
Date: Mon,  9 Nov 2020 14:50:28 +0200
Message-Id: <20201109125031.26409-8-andr2000@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201109125031.26409-1-andr2000@gmail.com>
References: <20201109125031.26409-1-andr2000@gmail.com>

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

As vPCI now takes care of the proper p2m mappings for PCI devices there
is no more need to hardcode anything.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
 xen/include/public/arch-arm.h | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index 2411ac9f7b0a..59baf1014fe3 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -444,15 +444,8 @@ typedef uint64_t xen_callback_t;
 #define GUEST_VPCI_MEM_CPU_ADDR           xen_mk_ullong(0x04020000)
 #define GUEST_VPCI_IO_CPU_ADDR            xen_mk_ullong(0xC0200800)
 
-/*
- * This is hardcoded values for the real PCI physical addresses.
- * This will be removed once we read the real PCI-PCIe physical
- * addresses form the config space and map to the guest memory map
- * when assigning the device to guest via VPCI.
- *
- */
 #define GUEST_VPCI_PREFETCH_MEM_PCI_ADDR  xen_mk_ullong(0x4000000000)
-#define GUEST_VPCI_MEM_PCI_ADDR           xen_mk_ullong(0x50000000)
+#define GUEST_VPCI_MEM_PCI_ADDR           xen_mk_ullong(0x04020000)
 #define GUEST_VPCI_IO_PCI_ADDR            xen_mk_ullong(0x00000000)
 
 #define GUEST_VPCI_PREFETCH_MEM_SIZE      xen_mk_ullong(0x100000000)
-- 
2.17.1


